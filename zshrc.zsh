# Path
export PATH="$PATH:$HOME/.cabal/bin"

# Prompt
PROMPT="%F{yellow}%{${fg[gray]}%}%3~%(0?. . ${fg[red]}%? )%{${reset_color}%}%F{white}| %(?.%F{magenta}.%F{red})>%f "

# Variables
export MEDIA='/chest/media'
export DOWNLOADS='/chest/downloads'

# Modules
source $HOME/code/dotfiles/zsh/misc/aliases.zsh
source $HOME/code/dotfiles/zsh/misc/functions.zsh
source $HOME/code/dotfiles/zsh/archlinux.zsh
