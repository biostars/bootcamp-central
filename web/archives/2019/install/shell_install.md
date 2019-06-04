## Install Bash terminals
(install instructions copied from [Software Carpentry][swcsetup])

[swcsetup]: http://swcarpentry.github.io/shell-novice/setup.html

### Mac OS
For a Mac computer, the default Unix Shell is Bash, and it is available via the Terminal Utilities program within your Applications folder.
To open Terminal, try one or both of the following:
1. Go to your Applications. Within Applications, open the Utilities folder. Locate Terminal in the Utilities folder and open it.
1. Use the Mac ‘Spotlight’ computer search function. Search for: Terminal and press Return.

[How to Use Terminal on a Mac][macterm]

[macterm]: http://www.macworld.co.uk/feature/mac-software/how-use-terminal-on-mac-3608274]


### Windows
Computers with Windows operating systems do not automatically have a Unix Shell program installed. In this lesson, we encourage you to turn on [Developer Mode in Windows](https://www.windowscentral.com/how-install-bash-shell-command-line-windows-10) such that you can access a command line interface to use bash on Ubuntu on Windows. An alternative is to use the shell emulator included in Git for Windows, which gives you access to both Bash shell commands and Git. If you are attending a Software Carpentry workshop session, it is likely you have already received instructions on how to install Git for Windows. Once installed, you can open a terminal by running the program Git Bash from the Windows start menu.

[How to Install Bash shell command-line tool on Windows 10][win10bashinstall]
[Install and Use the Linux Bash Shell on Windows 10][win10bashuse]

[win10bashinstall]: https://www.windowscentral.com/how-install-bash-shell-command-line-windows-10
[win10bashuse]: https://www.howtogeek.com/249966/how-to-install-and-use-the-linux-bash-shell-on-windows-10

You could also [install PuTTY][putty] for accessing remote servers, but this is not required in the 2019 workshop. 

[putty]: https://www.putty.org/

### Note for navigating directories in Bash on Mac vs. Windows
When navigating file directories in Bash you will use the command `cd` however, the input is slightly different between Mac and Windows. For example, to access my desktop from the CLI on Mac, I will type `cd /Users/mollyrathbun/Desktop/`. On Windows, the command is the same, but the directory structure is slightly different: `cd mnt/c/Users/mollyrathbun/Desktop/`.
