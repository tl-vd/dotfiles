# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PS1="\[\033[38;5;3m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;2m\]|\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;1m\]>\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

export VISUAL=emacs

# Sources
#source ~/code/scripts/humanism.sh 'cd'
source ~/.bash_aliases
source ~/.bash_functions

#export VENV_PATH="$HOME/envs"
#export VENV_DEFAULT="$VENV_PATH/tst/bin/activate"
#export VENV="none"
#alias vreset="deactivate && VENV='none'"

#export GOPATH="$HOME/develop/gocode"
#export PATH="$PATH:$HOME/.gem/ruby/2.2.0/bin:$HOME/.scripts:$GOPATH/bin"
export PATH="$PATH:$HOME/bin"

# if on windows
if [[ "$MSYSTEM" ]]; then
    export NODE_PATH="/msys64/mingw64/lib/node_modules"
fi
# Automatically cd if input is a directory
shopt -s autocd

# Dircolors
# eval `dircolors ~/.dircolors`
