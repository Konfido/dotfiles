### Get os name via uname ###
_myos="$(uname)"

### add alias as per os using $_myos ###
case $_myos in
    Linux)
        alias apt-get='sudo apt-get'
        alias supdate='sudo apt-get update; sudo apt-get upgrade'
        alias ..="cd .."
        alias ...="cd ..; cd ..";;
    Darwin)
        alias ..="cd ..";;
    *) ;;
esac

###########
# Functions
###########
where() { type -a "$@" ; }


#########
# Aliases
#########
alias du="du -ach | sort -h"
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"
alias mkdir="mkdir -pv"
alias ip="ifconfig | grep 'inet ';curl https://ipinfo.io; echo"

alias jk="jupyter notebook"


export JAVA_HOME=$(/usr/libexec/java_home)
# global npm, for hexo
export PATH=~/.npm-global/bin:$PATH

# In order to make sure the colour theme in iterm2 appears,
# not sure whether this taking effect...
# export CLICOLOR=1

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/dhh/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/dhh/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/dhh/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/dhh/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
