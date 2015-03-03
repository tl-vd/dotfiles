# Path
export PATH="$PATH:$HOME/.cabal/bin"

# Prompt
PROMPT="%F{yellow}%{${fg[gray]}%}%3~%(0?. . ${fg[red]}%? )%{${reset_color}%}%F{white}| %(?.%F{magenta}.%F{red})>%f "

# Variables
export MEDIA='/chest/media'
export DOWNLOADS='/chest/downloads'

# Modules
extpath="$HOME/code/dotfiles/zsh"
source $extpath/misc/aliases.zsh
source $extpath/misc/functions.zsh

source $extpath/archlinux.zsh

source $extpath/syntax/zsh-syntax-highlighting.zsh
source $extpath/history-search/zsh-history-substring-search.zsh

# bind UP and DOWN arrow keys
for keycode in '[' '0'; do
    bindkey "^[${keycode}A" history-substring-search-up
    bindkey "^[${keycode}B" history-substring-search-down
done
unset keycode

# Fasd
eval "$(fasd --init auto)"
