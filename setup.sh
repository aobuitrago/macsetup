#!/bin/bash
# Simple setup.sh for configuring Mac OS X
# for headless setup.
# By Ossian Buitrago

#Make sure you have
# - git
# - curl
# - heroku toolbelt
# installed on your system

# Install nvm: node-version manager
# https://github.com/creationix/nvm
curl https://raw.github.com/creationix/nvm/master/install.sh | sh

# Load nvm and install latest production node
source $HOME/.nvm/nvm.sh
nvm install v0.10.12
nvm use v0.10.12

# Install jshint to allow checking of JS code within emacs and vim
# http://jshint.com/
npm install -g jshint

# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
#sudo apt-get install -y rlwrap

# git pull and install dotfiles as well
cd $HOME
if [ -d ./dotfiles/ ]; then
    mv dotfiles dotfiles.old
fi
if [ -d .emacs.d/ ]; then
    mv .emacs.d .emacs.d.old
fi
if [ -d .vim/ ]; then
    mv .vim .vim.old
fi
git clone https://github.com/aobuitrago/dotfiles.git
mv .screenrc .screenrc.old
ln -s dotfiles/.screenrc .
mv .bash_profile .bash_profile.old
ln -s dotfiles/.bash_profile .
mv .bashrc .bashrc.old
ln -s dotfiles/.bashrc .
mv .bashrc_custom .bashrc_custom.old
ln -s dotfiles/.bashrc_custom .
mv .vimrc .vimrc.old
ln -s dotfiles/.vimrc .
ln -sf dotfiles/.emacs.d .
ln -sf dotfiles/.vim .

#Get vundle, a vim plugin manager
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
