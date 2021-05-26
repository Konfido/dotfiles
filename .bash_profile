### Get os name via uname ###
_myos="$(uname)"

### add alias as per os using $_myos ###
case $_myos in
    Linux)
        alias apt-get='sudo apt-get'
        alias ls='ls --group-directories-first'
        alias supdate='sudo apt-get update; sudo apt-get upgrade';;
    Darwin)
        alias vim='mvim'
        alias ls='lsd --group-dirs first';;
    *) ;;
esac

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# ---------
# Functions
# ---------
cs() 	{ cd "$@" && ls ; }
duu() 	{ du -ach "$@"| sort -h ; }
where() { type -a "$@" ; }
fzfp()  { fzf --preview '(highlight -O ansi -l {} || coderay {} || cat {}) 2> /dev/null | head -500' }

# ---------
#  Aliases
# ---------
alias ..="cd .."
alias ...="cd ..; cd .."
alias la="ls -A"
alias ll="ls -lah"
#alias du="du -ach | sort -h"
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"
alias mkdir="mkdir -pv"
alias ip="ifconfig | grep 'inet ';curl https://ipinfo.io; echo"

alias jk="jupyter notebook"
alias condac="conda activate"
alias condad="conda deactivate"
alias condan="conda create -n"
alias scp='noglob scp'

# git alias
alias ga="git add"
alias gc="git commit"
alias gco="git checkout"
alias glog="git log --oneline --decorate --graph"
alias glol="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --stat"
alias gst="git status --short"

# custom
alias hw="cd /Users/dhh/Documents/Sync/Blog/;hexo --config _config_wiki.yml"
alias hws="cd /Users/dhh/Documents/Sync/Blog/;hw clean;hw g --debug;rm db.json;hw s --debug"

# -------------
#  BindKeys
# -------------

bindkey '^ ' autosuggest-accept
# bindkey '^ ' autosuggest-toggle

# -------------
#  Environment
# -------------
## language
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
## path
export PATH="/usr/local/opt/ruby/bin:$PATH"
export JAVA_HOME=$(/usr/libexec/java_home)
# global npm, for hexo
export PATH=~/.npm-global/bin:$PATH
# for latex
export PATH=/Library/TeX/texbin/:$PATH
# commands history size
export HISTSIZE=1000000
# use bat as colorizing pager for `man`
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
# in order to make goku
# export PATH=/usr/local/lib/graalvm/bin:$PATH


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
