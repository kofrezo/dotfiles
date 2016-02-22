#!/bin/bash

## UPDATE SUBMODULES ##########################################################

echo "* updating submodules"
git submodule update

## SETUP VIM ##################################################################

if [ -d ~/.vim ] || [ ! -x ~/.vim ]; then
    if [ -d ~/.vim ]; then
        echo "* creating backup of existing .vim folder"
        mv ~/.vim ~/.vim.bak
    fi
    echo "* installing new .vim folder"
    ln -s $(pwd)/.vim ~/.vim
fi

if [ -f ~/.vimrc ] || [ ! -x ~/.vimrc ]; then
    if [ -f ~/.vimrc ]; then
        echo "* creating backup of exiting .vimrc"
        mv ~/.vimrc ~/.vimrc.bak
    fi
    echo "* installing new .vimrc"
    ln -s $(pwd)/.vimrc ~/.vimrc
fi

echo "* Installing powerline fonts for vim airline plugin"
sh $(pwd)/fonts/install.sh

## SETUP BASH #################################################################

if [ -f ~/.bashrc ]; then
    echo "* creating backup of existing .bashrc"
    mv ~/.bashrc ~/.bashrc.bak
    echo "* installing new .bashrc"
    ln -s $(pwd)/.bashrc ~/.bashrc
fi
