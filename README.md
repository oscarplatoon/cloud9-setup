# AWS Cloud9 Instructions

For our students on Windows, we have a separate setup for you using AWS's Cloud9. Instead of enabling virtualization, messing with Bios, and going through Docker, our IDE will be fully browser based with AWS's Cloud9. We estimate that your usage of AWS for Code Platoon will amount to around $20/month- you are responsible for the cost. Let's get started.

0. Sign in or sign up for an [AWS Account](https://portal.aws.amazon.com/billing/signup#/start). 

1. After successfully creating your account or signing in you want to Sign in to the [AWS Console](https://aws.amazon.com/console/). This is your dashboard to access any of the AWS Services.

  <a href="images/c9-1-auth.png" target="_blank"><img src="images/c9-1-auth.png" width="400" height="auto" alt="Console Dashboard"/></a>

2. From here you can either use the search bar in the navigation or you can use the **All Services** listing to look for: `Cloud9`. In the search bar you can simply type: `Cloud9` or you can use the **All Listings** dropdown looking for a **Development Tools** category which `Cloud9` will be nested within.

  Method 1: Use the Search by to find the Service in question.

  <a href="images/c9-2a-search.png" target="_blank"><img src="images/c9-2a-search.png" width="400" height="auto" alt="Services Search Bar"/></a>

  Method 2: Use the All Services listing

  <a href="images/c9-2b-category.png" target="_blank"><img src="images/c9-2b-category.png" width="400" height="auto" alt="All Services Categories" /></a>

3. You'll see a page with a button that says **Create environment**. Click the **Create environment** button.

  <a href="images/c9-3-create.png" target="_blank"><img src="images/c9-3-create.png" width="400" height="auto" alt="Cloud9 Service page" /></a>

4. Fill out the two fields with the following:
- For the **Name** field: `codeplatoon-<cohort-name>` where `<cohort-name>` is the name of your cohort
- For the **Description** field: `Development environment for the Code Platoon curriculum`

  <a href="images/c9-4-nameinstance.png" target="_blank"><img src="images/c9-4-nameinstance.png" width="400" height="auto" alt="Cloud9 environment create" /></a>

5. For Environment settings, **leave them as is** - they should look like the settings in the image below.

  <a href="images/c9-5a-configuration.png" target="_blank"><img src="images/c9-5a-configuration.png" width="400" height="auto" alt="Cloud9 environment settings part 1" /></a>

6. Click the **Next Step** at the bottom, leaving all the defaults in place. Ensure **Cost-saving Settings** is set to the (default) of 30 minutes. Amazon is trying to help you protect your Cloud environment and put it to a sleeping state in case you forget to close or stop it from running. You wont be charged any money while your environment is not in use.

  <a href="images/c9-5b-configuration.png" target="_blank"><img src="images/c9-5b-configuration.png" width="400" height="auto" alt="Cloud9 environment settings part 2" /></a>

7. Review this page, ensure your settings look correct and match besides the **Name** and **Description** that should match with what you entered. If everything looks correct, click the **Create Environment** button at the bottom.

  <a href="images/c9-6-review.png" target="_blank"><img src="images/c9-6-review.png" width="400" height="auto" alt="Cloud9 review settings" /></a>

8. Our environment is now being setup and configured. This may take a few minutes to complete.

  <a href="images/c9-7-setup.png" target="_blank"><img src="images/c9-7-setup.png" width="400" height="auto" alt="Cloud9 review settings" /></a>

9. Once ready, our Cloud Environment and IDE will look like this.

  <a href="images/c9-8-baseenv.png" target="_blank"><img src="images/c9-8-baseenv.png" width="400" height="auto" alt="Cloud9 review settings" /></a>

## Installing Software
We've created a base cloud IDE environment to work from and need to install the necessary software for our class. In this section, we're going to execute a shell script. Inside your running Cloud9 IDE Window:

1. Create a file named `installfest.sh` using the sidebar or console.
   - Sidebar: You can "right click" -> Create New File
   - Alternatively, a console command: `touch installfest.sh`
2. Make this file executable using this command: `chmod +x installfest.sh`
3. In your sidebar click and open `installfest.sh`, you should see an empty file open in the editor view.
4. Go to Code Platoon's [Cloud9-Setup Installfest Script](https://github.com/oscarplatoon/cloud9-setup/blob/main/installfest.sh). Find and Click the **Raw** button.
5. Highlight and **COPY** ALL the contents on this page. 
6. Open your Cloud9 IDE window where we should still have our `installfest.sh` file open in Editor view. **PASTE** ALL the contents you copied into this `installfest.sh` file and ensure you **SAVE** before continuing.
7. Run the command: `./installfest.sh` (this will take a few minutes)
8. When the script finishes you should see `Installfest script finished running!` output to the screen as the very last line. If you do not see this message, reach out to a TA or Instructor.
9. Finally lets run: `source ~/.bash_profile` which should make our current console aware of all these new updates without having to close the console. You should see the console colors subtly change. You shouldn't need to run this again unless you later decide to edit your own `~/.bash_profile`.

### Configuring Git
Let's configure Git so that we can clone/push (download/upload) the code for Code Platoon.
1. Create a [Create A Personal Access Token](https://docs.github.com/en/github/authenticating-to-github/creating-a-personal-access-token) within your GitHub account. 
  - When you get to **Scopes** (permissions for this token), just enable the permissions listed within: **repo**. Scoping your token's permission to only what it needs is a **GOOD security practice**.
  - **SAVE THIS TOKEN** on your machine or preferrably, a password manager. Your access token acts as your **password** when you get prompted in the console by the `git` client in a few steps
2. In your Cloud9 IDE Console, run...
  - `git config --global credential.helper cache` -- this will enable caching of your credentials within the `git` client so that you don't have to keep entering your username/password repeatedly. 
  - `git config --global user.name "Your Name"`
  - `git config --global user.email "<username>@users.noreply.github.com"` -- Replace `<username>` with your GitHub username.
