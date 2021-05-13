export XDG_CONFIG_HOME=$HOME/.config
export EDITOR=vim
export PATH="$PATH:$HOME/.local/bin"

# Java applications such as PyCharm are broken without this.
export _JAVA_AWT_WM_NONREPARENTING=1

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

