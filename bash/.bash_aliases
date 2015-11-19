# Meta
alias aliae="gvim ~/.bash_aliases"
alias functae="gvim ~/.bash_functions"
alias bashrc="gvim ~/.bashrc"
alias reload='source ~/.bashrc'

# Internal
alias ls='ls -FAXh --group-directories-first --color=auto'
alias l='ls -FAXh --group-directories-first --color=auto'
alias sl='ls'
alias f.='find . | grep'
alias lsf='ls -a | grep'
alias cp='cp -i'
alias di='di -f TM1ub -n' # disk-info, -format[fsType, Mountpoint, %(1), Used, Blocks(total)], -noheaders

# Misc
alias cmdstats='cut -f1 -d" " ~/.bash_history | sort | uniq -c | sort -nr | head -n 30'

alias wine='/home/markus/.PlayOnLinux/wine/linux-x86/1.7.53-steam_crossoverhack/bin/wine'
alias xfsettings='xfce4-settings-manager'
alias ycmconfig='/home/markus/.vim/bundle/YCM-Generator/config_gen.py'

# IHaskell and IPython
nb='source /home/markus/code/envs/ihaskell/pyth/bin/activate && ipython notebook --profile=ihaskell'
alias nb=$nb
alias notebook=$nb
