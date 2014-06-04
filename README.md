# Simple Install
1. Turn on Full Disk Encryption
2. Install Xcode
3. Install Xcode Developer Tools
4. Go to https://poetic-boxen.herokuapp.com/ and follow the directions

# Manual Install
1. Turn on Full Disk Encryption
2. Install Xcode
3. Install Xcode Developer Tools
4. Setup Bitbucket SSH Key
5. Get access to poetic/poetic-boxen
6. Get access to poetic/base_boxen_dotfiles
7. Fork poetic/base_boxen_dotfiles
8. `sudo mkdir -p /opt/boxen`
9. `sudo chown ${USER}:staff /opt/boxen`
10. `git clone git@bitbucket.org:poetic/poetic-boxen.git /opt/boxen/repo`
11. `cd /opt/boxen/repo`
12. Copy /modules/people/manifest/githubusuername.pp and change the gh username
   for the class, the bb username, and the filename to your gh username
13. Push these changes up to poetic/poetic-boxen
14. `script/boxen`

## Getting Started

To give you a brief overview, we're going to:

* Install dependencies (basically Xcode)
* Bootstrap a boxen for your self/team/org/company
* Then convert your local copy of that boxen to the post-bootstrapped version

There are a few potential conflicts to keep in mind.
Boxen does its best not to get in the way of a dirty system,
but you should check into the following before attempting to install your
boxen on any machine (we do some checks before every Boxen run to try
and detect most of these and tell you anyway):

* Boxen __requires__ at least the Xcode Command Line Tools installed.
* Boxen __will not__ work with an existing rvm install.
* Boxen __may not__ play nice with a GitHub username that includes dash(-)
* Boxen __may not__ play nice with an existing rbenv install.
* Boxen __may not__ play nice with an existing chruby install.
* Boxen __may not__ play nice with an existing homebrew install.
* Boxen __may not__ play nice with an existing nvm install.
* Boxen __recommends__ installing the full Xcode.

### Dependencies

**Install the Xcode Command Lines Tools and/or full Xcode.**
This will grant you the most predictable behavior in building apps like
MacVim.

How do you do it?

#### OS X 10.9 (Mavericks)

If you are using [`b26abd0` of boxen-web](https://github.com/boxen/boxen-web/commit/b26abd0d681129eba0b5f46ed43110d873d8fdc2)
or newer, it will be automatically installed as part of Boxen.
Otherwise, follow instructions below.

#### OS X < 10.9

1. Install Xcode from the Mac App Store.
1. Open Xcode.
1. Open the Preferences window (`Cmd-,`).
1. Go to the Downloads tab.
1. Install the Command Line Tools.


## More information?
See the original [boxen/out-boxen](https://github.com/boxen/our-boxen) repo
