# Oh-my-zsh
export ZSH=$HOME/.oh-my-zsh
plugins=(archlinux history-substring-search)
source $ZSH/oh-my-zsh.sh

# Path
cabal="$HOME/.cabal/bin"
elm="$HOME/code/envs/elm/Elm-Platform/0.15/bin"
idris="$HOME/code/envs/idris-cbal/.cabal-sandbox/bin"
cutables="$HOME/.cutables"
export PATH="$PATH:$cabal:$elm:$idris:$cutables"

# Python's path.
py_libraries="$HOME/code/libraries/python"
export PYTHONPATH="$PYTHONPATH:$py_libraries"

# Options
#setopt extended_glob
setopt autocd
setopt correct
#setopt globdots
setopt histignoredups
#setopt noclobber    # Bang overrides.

#    # Tests;
#setopt auto_pushd
#setopt pushd_ignore_dups
#setopt pushdminus

# Variables
export EDITOR='vim'
export VISUAL='gvim'

# Modules
extpath="$HOME/code/dotfiles/zsh"
#source $extpath/misc/aliases.zsh
#source $extpath/misc/functions.zsh
#source $extpath/archlinux.zsh
source $extpath/syntax/zsh-syntax-highlighting.zsh
#source $extpath/history-search/zsh-history-substring-search.zsh

# Prompt
PROMPT="%F{yellow}%{${fg[yellow]}%}%3~%(0?. . ${fg[red]}%? )%{${reset_color}%}%F{green}| %(?.%F{magenta}.%F{red})>%f "

# Dircolors
eval `dircolors ~/.dircolors`
