# Oh-my-zsh
export ZSH=$HOME/.oh-my-zsh
plugins=(archlinux history-substring-search)
source $ZSH/oh-my-zsh.sh
source ~/code/scripts/humanism.sh 'cd'
# Test
#source $HOME/code/scripts/humanism.sh
# Path
   cabal_p="$HOME/.cabal/bin"
     elm_p="$HOME/code/envs/elm/Elm-Platform/0.15/bin"
   idris_p="$HOME/code/envs/idris-cbal/.cabal-sandbox/bin"
    agda_p="$HOME/code/envs/agda-cbal/.cabal-sandbox/bin"
cutables_p="$HOME/.cutables"
export PATH="$PATH:$cabal_p:$elm_p:$idris_p:$cutables_p:$agda_p"

# Python's path.
py_libraries="$HOME/code/libraries/python"
export PYTHONPATH="$PYTHONPATH:$py_libraries"

# Options
#setopt extended_glob
#setopt autocd
#setopt correct
# globdots:
# Lets hidden files ('.filename')
# be matched by globs.
#setopt globdots
#setopt histignoredups
# noclobber:
# Disallows piping into an existing file,
# eg; ls > file.txt, will fail if file.txt exists.
# To override use '>!', this will also be what is
# stored in the history, so using '!!' will run;
# ls >! file.txt
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
