test -r ~/.dir_colors && eval $(dircolors ~/.dir_colors)

alias ls='ls --color=auto'

source $HOME/.antigen.zsh

# Load the oh-my-zsh library
antigen use oh-my-zsh

antigen bundle direnv
antigen bundle autojump
antigen bundle git
antigen bundle sudo
antigen bundle thefuck
antigen bundle timer
antigen bundle zsh-users/zsh-syntax-highlighting
antigen apply

# Manage multiple Python versions
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Python packaging and dependency management tool
if [[ -d $HOME/.poetry ]]; then
    export PATH="$HOME/.poetry/bin:$PATH"
fi

PROMPT=$'\n(%!)-(%/)-(@%y)\n(%F{cyan}%n%f@%F{cyan}%M%f)-(%(?.%F{green}%?%f.%F{red}%?%f))-(%*)-(🐧) '

