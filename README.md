# AWS Cloud9 Instructions

If you haven't already done so you will need to [Create an AWS Account](https://portal.aws.amazon.com/billing/signup#/start) or go ahead an [Sign In to the Console](https://signin.aws.amazon.com) by clicking the button in the top right corner of the navigation bar.

1. After successfully creating your account or signing in you want to Sign in to the [AWS Console](https://aws.amazon.com/console/). This is your dashboard to access any of the AWS Services.

<a href="images/c9-1-auth.png" target="_blank"><img src="images/c9-1-auth.png" width="400" height="auto" alt="Console Dashboard"/></a>


2. From here you can either use the search bar in the navigation or you can use the **All Services** listing to look for: `Cloud9`. In the search bar you can simply type: `cloud9` or you can use the **All Listings** dropdown looking for a **Development Tools** category which `Cloud9` will be nested within. Click on the name of the service: `Cloud9`.

Method 1: Use the Search by to find the Service in question.

<a href="images/c9-2a-search.png" target="_blank"><img src="images/c9-2a-search.png" width="400" height="auto" alt="Services Search Bar"/></a>

Method 2: Use the All Services listing

<a href="images/c9-2b-category.png" target="_blank"><img src="images/c9-2b-category.png" width="400" height="auto" alt="All Services Categories" /></a>

3. You immediately see a page with a button that says **Create environment**. Click this button.

<a href="images/c9-3-create.png" target="_blank"><img src="images/c9-3-create.png" width="400" height="auto" alt="Cloud9 Service page" /></a>

4. Fill out the two fields with the following:
- For the **Name** field: `codeplatoon-<cohort-name>` where `<cohort-name>` for example would be something like `mikeplatoon`
- For the **Description** field: `Development environment for the CodePlatoon curriculum`

<a href="images/c9-4-nameinstance.png" target="_blank"><img src="images/c9-4-nameinstance.png" width="400" height="auto" alt="Cloud9 environment create" /></a>

5. For Environment settings, **DO NOT** change. Leave them as is - they should look like the settings in the image below.

<a href="images/c9-5a-configuration.png" target="_blank"><img src="images/c9-5a-configuration.png" width="400" height="auto" alt="Cloud9 environment settings part 1" /></a>

6. Click the **Next Step** at the bottom leaving all the defaults in place.

> Ensure you leave **Cost-saving Settings** set to the (default) of 30 minutes. This is Amazon trying to help you protect your Cloud environment and put it to a sleeping state in case you forget to close or stop it from running. You wont be charged any money while your environment is not in use (running).

<a href="images/c9-5b-configuration.png" target="_blank"><img src="images/c9-5b-configuration.png" width="400" height="auto" alt="Cloud9 environment settings part 2" /></a>


7. Review this page, ensure your settings look correct and match besides the **Name** and **Description** that should match with what you entered. If everything looks correct, click the **Create Environment** button at the bottom.

<a href="images/c9-6-review.png" target="_blank"><img src="images/c9-6-review.png" width="400" height="auto" alt="Cloud9 review settings" /></a>

8. Our environment is now being setup and configured. This may take a few minutes to complete.

<a href="images/c9-7-setup.png" target="_blank"><img src="images/c9-7-setup.png" width="400" height="auto" alt="Cloud9 review settings" /></a>

9. Once ready our Cloud Environment and IDE will look like this.

<a href="images/c9-8-baseenv.png" target="_blank"><img src="images/c9-8-baseenv.png" width="400" height="auto" alt="Cloud9 review settings" /></a>

## Next Steps
We now have a base cloud IDE environment to work from, but we still need to prepare this base environment for all the things we are going to do during class. Much of this we have automated into something called a shell script. We need to get this shell script into our environment to be able to run it.

Inside your running Cloud9 IDE Window

1. Create a file named `installfest.sh` using the sidebar or console.
   - Sidebar: You can "right click" -> Create New File
   - Alternatively, a console command: `touch installfest.sh`
2. Make this file executable using this command: `chmod +x installfest.sh`
3. In your sidebar click and open `installfest.sh`, you should see an empty file open in the editor view.
4. Go to [Cloud9-Setup Installfest Script](https://github.com/novemberplatoon/cloud9-setup/blob/main/installfest.sh). Find and Click the **Raw** button.
5. Highlight and copy ALL the contents on this page. 
6. Open your Cloud9 IDE window where we should still have our `installfest.sh` file open in Editor view. Paste ALL the contents your copied into this blank file and Save it.

7. Run command: `./installfest.sh` (this will take a few minutes)

8. When the script finishes you should see `Installfest script finished running!` output to the screen as the very last line. If you do not see this message, reach out to a TA or Instructor.

