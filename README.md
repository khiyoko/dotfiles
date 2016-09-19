# dotfiles

## HOW TO SETUP NEW ENVIRONMENT

### Prerequisites
Install apps below
* Xcode and Command Line Tools
* X11
* java JDK

### Steps
Clone this repository
```
$ cd ~/
$ git clone git@github.com:khiyoko/dotfiles.git
```
Run homebrewInstall.sh and dotfilesLink.sh  
Note: After run dotfilesLink.sh, you need to replace sample@domein with your real Email in .gitconfig.local copied into your $HOME.
```
$ cd ~/dotfiles
$ chmod +x ./homebrewInstall.sh
$ ./homebrewInstall.sh
```
```
$ chmod +x ./dotfilesLink.sh
$ ./dotfiles/dotfilesLink.sh
```
Install anaconda (x.x.x means the latest version)
```
$ pyenv install -l | grep ana
$ pyenv install anaconda3-x.x.x
$ pyenv rehash
$ pyenv global anaconda3-x.x.x
```
Then run pythonInstall.sh to install additional packages
```
$ chmod +x ./pythonInstall.sh
$ ./pythonInstall.sh
```

