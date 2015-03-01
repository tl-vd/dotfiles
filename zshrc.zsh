# Set prompt

PROMPT="%F{yellow}%{${fg[gray]}%}%3~%(0?. . ${fg[red]}%? )%{${reset_color}%}%F{white}| %(?.%F{magenta}.%F{red})>%f " # Display a red prompt char on failure
# ❯❯

# Variables
export MEDIA='/chest/media'
export DOWNLOADS='/chest/downloads'

# Load modules
source /home/markus/.zsh_modules/misc/aliases.zsh
source /home/markus/.zsh_modules/misc/functions.zsh
source /home/markus/.zsh_modules/*.zsh
