# Path
export GOPATH="$HOME/go"
export PATH="$PATH:$HOME/.cabal/bin:$HOME/go/bin:$HOME/code/envs/elm/Elm-Platform/0.15/bin"
export GOBIN="$HOME/go/bin"

# Prompt
PROMPT="%F{yellow}%{${fg[gray]}%}%3~%(0?. . ${fg[red]}%? )%{${reset_color}%}%F{white}| %(?.%F{magenta}.%F{red})>%f "

# Options
setopt extended_glob
setopt autocd
setopt correct
setopt globdots
setopt histignoredups
setopt noclobber    # Bang overrides.

# Variables
export EDITOR='vim'
export VISUAL='gvim'

# Modules
extpath="$HOME/code/dotfiles/zsh"
source $extpath/misc/aliases.zsh
source $extpath/misc/functions.zsh

source $extpath/archlinux.zsh

source $extpath/syntax/zsh-syntax-highlighting.zsh
source $extpath/history-search/zsh-history-substring-search.zsh

# Keybindings
for keycode in '[' '0'; do
    bindkey "^[${keycode}A" history-substring-search-up
    bindkey "^[${keycode}B" history-substring-search-down
done
unset keycode

# Fasd
eval "$(fasd --init auto)"
