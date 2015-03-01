
# Prompt
PROMPT="%F{yellow}%{${fg[gray]}%}%3~%(0?. . ${fg[red]}%? )%{${reset_color}%}%F{white}| %(?.%F{magenta}.%F{red})>%f "

# Variables
export MEDIA='/chest/media'
export DOWNLOADS='/chest/downloads'

# Modules
source $HOME/.zsh_modules/misc/aliases.zsh
source $HOME/.zsh_modules/misc/functions.zsh
source $HOME/.zsh_modules/*.zsh
