## Install git

### Install git on Windows

1. Download the [Git for Windows][wingit] installer.
1. Run the installer and follow the steps bellow:
    1. Click on `Next` until you get to the step below.
    1. Select `Use Git from the Windows Command Prompt` and click on `Next`.
    1. Click on `Next`. Keep `Checkout Windows-style, commit Unix-style line endings` selected.
    1. Select `Use Windows' default console window` and click on `Next`.
    1. Click on `Next` then `Finish`.
1. [Video Tutorial][wingit-video]

This will provide you with both Git and Bash in the Git Bash program.
If you make a mistake you may rerun the installer and select the appropriate options.

[wingit-video]: https://www.youtube.com/watch?v=339AEqk9c-8
[wingit]: https://git-for-windows.github.io/

---

### Install git on Mac OSX

To fully set up your Mac for bioinformatics
we recommend the [Biostar Handbook][handbook] website.

Alternatively to set up just git alone see:

1. [Git downloads][gitdownload]
1. [Video Tutorial][macgit-video]

[gitdownload]: https://git-scm.com/downloads
[handbook]: https://www.biostarhandbook.com/book/computer/get-ready.html

For OS X 10.9 and higher, install Git for Mac by downloading and running the most
recent `mavericks` installer from this list.

After installing Git,
there will not be anything in your /Applications folder, as Git is a command line program.
For older versions of OS X (10.5-10.8) use the most recent available installer
labelled `snow-leopard` available here.

[macgit-video]: https://www.youtube.com/watch?v=9LQhwETCdwY

---

### Install git on Linux

If Git is not already available on your machine you can try to install it via
your distro's package manager. For Debian/Ubuntu run `sudo apt-get install git`
and for Fedora run `sudo yum install git`.

---

## Create a GitHub account

Git is a version control system that lets you track who made changes
to what when and has options for easily updating a shared or public version of your
code on [github.com][github].
You will need a supported web browser (current versions of Chrome, Firefox or Safari,
or Internet Explorer version 9 or above).

You will need an account at [github.com][github] for parts of the Git lesson.
Basic GitHub accounts are free. We encourage you to create a GitHub account
if you don't have one already. Please consider what personal information
you'd like to reveal. For example, you may want to review these instructions
for keeping your email address private provided at GitHub.

### Set up SSH passwords

	ssh-keygen

This will generate a password in `~/.ssh/id_rsa.pub`

	cat ~/.ssh/id_rsa.pub

Copy and paste the key into the `Github -> Account -> Settings -> Add SSH key`

### Common git commands

Command we typically do once:

* `git clone <uri>` - clones a remote repository
* `git add <filepath>` - adds a file to git tracking

Commands we use all the time:

* `git status` - what is the current status of the repository
* `git diff` - what has changed since the last commit
* `git push <uri>` - push the changes to remote
* `git pull <uri>` - pull and merge remote

Further information:

* [Git related lessons on Software Carpentry][lessons]

[lessons]:http://software-carpentry.org/lessons/

[github]: https://www.github.com
