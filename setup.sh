#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS EC2 instance
# for headless setup. 

# Install nvm: node-version manager
# https://github.com/creationix/nvm
sudo apt-get install -y git-core
curl https://raw.github.com/creationix/nvm/master/install.sh | sh

# Load nvm and install latest production node
source $HOME/.nvm/nvm.sh
nvm install v0.10.12
nvm use v0.10.12

# Install jshint to allow checking of JS code within emacs
# http://jshint.com/
npm install -g jshint

# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
sudo apt-get install -y rlwrap

# Install emacs24
# https://launchpad.net/~cassou/+archive/emacs
sudo apt-add-repository -y ppa:cassou/emacs
sudo apt-get update
sudo apt-get install -y emacs24 emacs24-el emacs24-common-non-dfsg

# Install vim and vorax preparation
sudo apt-get install -y vim-nox
sudo apt-get install libssl-dev libxslt-dev libxml2-dev gcc make ncurses-dev ruby1.9 ruby-dev mercurial rubygems1.9 ruby-odbc-dbg ruby-odbc libgdal1-1.7.0 odbcinst1debian2

# Install tmux
sudo apt-get install -y tmux

# Install rlwrap. Required for node in tmux
sudo apt-get install -y rlwrap

# Install node
sudo apt-get install -y nodejs

# Install gnome desktop
sudo apt-get install -y gnome-session-fallback

# git pull and install dotfiles as well
cd $HOME
if [ -d ./dotfiles/ ]; then
    mv dotfiles dotfiles.old
fi
if [ -d .emacs.d/ ]; then
    mv .emacs.d .emacs.d~
fi

# Install the dotfiles folder
git clone git@github.com:wokumura/dotfiles.git

# Create the symlinks
ln -sb dotfiles/.screenrc .
ln -sb dotfiles/.bash_profile .
ln -sb dotfiles/.bashrc .
ln -sb dotfiles/.bashrc_custom .
ln -sf dotfiles/.emacs.d .
ln -sf ~/dotfiles/vim ~/.vim
ln -sf ~/dotfiles/vim/vimrc ~/.vimrc
ln -sb dotfiles/.tmux.conf ~
ln -sb dotfiles/.gitconfig ~
ln -s /usr/bin/ruby1.9 /usr/bin/ruby
