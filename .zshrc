test -r ~/.dir_colors && eval $(dircolors ~/.dir_colors)

alias ls='ls --color=auto'

source $HOME/.antigen.zsh

# Load the oh-my-zsh library
antigen use oh-my-zsh

antigen bundle direnv
antigen bundle autojump
antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply

