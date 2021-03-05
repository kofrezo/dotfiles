test -r ~/.dir_colors && eval $(dircolors ~/.dir_colors)

alias ls='ls --color=auto'

source $HOME/.antigen.zsh

# Load the oh-my-zsh library
antigen use oh-my-zsh

antigen bundle ssh-agent
antigen bundle direnv
antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply

