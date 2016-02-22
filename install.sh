#!/bin/bash

## SETUP VIM ##################################################################

if [ -d ~/.vim ]; then
  echo "creating backup for old vim config to ~/.vim.bak"
  mv ~/.vim ~/.vim.bak
  ln -s $(pwd)/.vim ~/.vim
fi

if [ -f ~/.vimrc ]; then
  echo "creating backup for old vim config to ~/.vimrc.bak"
  mv ~/.vimrc ~/.vimrc.bak
  ln -s $(pwd)/.vimrc ~/.vimrc
fi

###############################################################################
