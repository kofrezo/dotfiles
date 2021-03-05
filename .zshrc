test -r ~/.dir_colors && eval $(dircolors ~/.dir_colors)

alias ls='ls --color=auto'

source $HOME/.antigen.zsh

antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply

