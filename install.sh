#!/bin/bash

## ENSURE VIM #################################################################

echo '* installing vim'
sudo apt-get install vim

## ENSURE GIT #################################################################

echo '* installing git'
sudo apt-get install git

## UPDATE SUBMODULES ##########################################################

echo '* updating submodules'
git submodule init
git submodule update --recursive

## INSTALL REQUIRMENTS ########################################################

echo '* installing pip dependencies'
pip install -r requirements.txt

## SETUP VIM ##################################################################

if [[ -d ~/.vim ]]; then
    if [[ -L ~/.vim ]]; then
        echo '* deleting old symlink'
        unlink ~/.vim
    else
        echo '* creating backup of existing .vim folder'
        mv ~/.vim ~/.vim.bak
    fi

    echo '* linking new .vim folder'
    ln -s $(pwd)/.vim ~/.vim
fi

if [[ -f ~/.vimrc  ]]; then
    if [[ -L ~/.vimrc ]]; then
        echo '* deleting old symlink'
        unlink ~/.vimrc
    else
        echo '* creating backup of exiting .vimrc'
        mv ~/.vimrc ~/.vimrc.bak
    fi

    echo '* linking new .vimrc'
    ln -s $(pwd)/.vimrc ~/.vimrc
fi

## SETUP BASH #################################################################

if [[ -f ~/.bashrc ]]; then
    if [[ -L ~/.bashrc ]]; then
        echo '* deleting old symlink'
        unlink ~/.bashrc
    else
        echo '* creating backup of existing .bashrc'
        mv ~/.bashrc ~/.bashrc.bak
    fi

    echo '* linking .bashrc'
    ln -s $(pwd)/.bashrc ~/.bashrc
fi

## SETUP TERMINATOR ###########################################################

echo '* installing terminator if not yet done'
sudo apt-get install terminator

if [[ -d ~/.config/terminator ]]; then
    if [[ -L ~/.config/terminator ]]; then
        echo '* deleting old symlink'
        unlink ~/.config/terminator
    else
        echo '* creating backup of existing terminator'
        mv ~/.config/terminator ~/.config/terminator.bak
    fi

    echo '* installing terminator config'
    ln -s $(pwd)/.config/terminator ~/.config/terminator
fi
