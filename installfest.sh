# Installfest Script for: Amazon Linux image
# To figure out what Extra Amazon Linux packages has for us
# use command: $ amazon-linux-extras | grep -i <package>

NODE_VERSION=14
PYTHON_VERSION=3.8
PGCLIENT_VERSION=11

echo "Installing/updating packages into environment (git, psql)"

# Install missing packages and update existing.
sudo yum -y update git \
&& sudo amazon-linux-extras install postgresql${PGCLIENT_VERSION} -y \
&& sudo yum -y install postgresql-devel \
&& git config --global alias.lola "log --graph --decorate --pretty=oneline --abbrev-commit --all"

echo "Updating Python and Node"

sudo amazon-linux-extras install -y python${PYTHON_VERSION} \
&& sudo rm /usr/bin/python3 && sudo ln -s python${PYTHON_VERSION} /usr/bin/python3

# make nvm available
source ~/.nvm/nvm.sh
nvm install ${NODE_VERSION} \
&& npm install -g c9

# Install and setup Postgres for this user.
echo "Installing and setting up Postgresql"
sudo yum install -y postgresql postgresql-server postgresql-devel postgresql-contrib postgresql-docs \
&& sudo /usr/bin/postgresql-setup --initdb --unit postgresql \
&& sudo service postgresql start

sudo -u postgres createuser -s $USER \
&& sudo -u postgres createdb $USER -O $USER


echo "Installing additional Python packages (global)"
# Install User global third party packages needed (before virtual envs are used)
pip3 install --user \
    virtualenv \
    virtualenvwrapper \
    pylint \
    flake8 \
    autopep8 \
    pytest \
    green

echo -e "\033[0;32mInstallfest Environment packages updated!\033[0m"

echo "Attempting to update ~/.bash_profile"

if ! grep -q '# --- CODEPLATOON ADDITIONS ---' "$HOME/.bash_profile"; then
# If line doesn't already exist. Append these contents into ~/.bash_profile
cat <<'EOT' >> $HOME/.bash_profile

# --- CODEPLATOON ADDITIONS ---
# DO NOT remove comment above if running script multiple times
# It will continuously append duplicate lines.

# Executable versions
alias allversions="git --version && echo -n 'node: '; echo $(node --version) && echo -n 'npm: '; echo $(npm --version) && python --version && psql --version"

# Python aliases
alias python=python3
alias pip=pip3
alias activate="source ./venv/bin/activate"

# Django aliases
alias pyrs="python manage.py runserver 127.0.0.1:8080"
alias pymk="python manage.py makemigrations"
alias pymg="python manage.py migrate"


parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]codeplatoon:\[\033[33;1m\]\w\[\033[m\]\$(parse_git_branch) \[\033[00m\]$\[\033[00m\] "
export PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007"'
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Load virtualenvwrapper env + scripts
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$USER_HOME
export VIRTUALENVWRAPPER_PYTHON=$(which python3)
export VIRTUALENVWRAPPER_VIRTUALENV=$(which virtualenv)
export VIRTUALENVWRAPPER_SCRIPT=$(which virtualenvwrapper.sh)
export VIRTUALENVWRAPPER_HOOK_DIR=$WORKON_HOME/hooks
source $(which virtualenvwrapper.sh) > /dev/null 2>&1

# Hack around cloud9 hibernating which stops postgresql service.

if ! pg_isready -q;
then
  sudo service postgresql start
fi
# --- END OF CODEPLATOON ADDITIONS ---
EOT

echo -e "\033[0;36mInstallfest script finished running!\033[0m"

else
    echo -e "\033[1;31m~/.bash_profile has been updated already."
    echo -e "You must remove all lines in ~/.bash_profile between CODEPLATOON ADDITIONS including the comments to re-run this script\033[0m"
fi
