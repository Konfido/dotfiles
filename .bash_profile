### Get os name via uname ###
_myos="$(uname)"

### add alias as per os using $_myos ###
case $_myos in
    Linux)
        # alias apt-get='sudo apt-get'
        #alias ls='ls --group-directories-first'
        alias supdate='sudo apt-get update; sudo apt-get upgrade'
        # brew env:
        eval "$($HOME/.linuxbrew/bin/brew shellenv)";;
    Darwin)
        # alias vim='mvim'
        # alias ls='lsd --group-dirs first'
        # alias stat="stat -x -t '%F %T'"
        alias stat="stat -f 'Type: %HT%SY%n  Size: %z%n  Mode: (%Lp/%Sp)%nAccess: %Sa%nModify: %Sm%nChange: %Sc%n Birth: %SB' -t '%F %T'";;
    *) ;;
esac

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# ---------
# Functions
# ---------
cs() { cd "$@" && ls ; }
# duu() 	{ du -ach "$@"| sort -h }
extract() {
    if [ -z "$1" ]; then
        # display usage if no parameters given
        echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
        echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
    else
        for n in "$@"
        do
        if [ -f "$n" ] ; then
            case "${n%,}" in
                *.cbt|*.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar)
                             tar xvf "$n"       ;;
                *.lzma)      unlzma ./"$n"      ;;
                *.bz2)       bunzip2 ./"$n"     ;;
                *.cbr|*.rar) unrar x -ad ./"$n" ;;
                *.gz)        gunzip ./"$n"      ;;
                *.cbz|*.epub|*.zip) unzip ./"$n"       ;;
                *.z)         uncompress ./"$n"  ;;
                *.7z|*.apk|*.arj|*.cab|*.cb7|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.pkg|*.rpm|*.udf|*.wim|*.xar)
                             7z x ./"$n"        ;;
                *.xz)        unxz ./"$n"        ;;
                *.exe)       cabextract ./"$n"  ;;
                *.cpio)      cpio -id < ./"$n"  ;;
                *.cba|*.ace) unace x ./"$n"     ;;
                *.zpaq)      zpaq x ./"$n"      ;;
                *.arc)       arc e ./"$n"       ;;
                *.cso)       ciso 0 ./"$n" ./"$n.iso" && \
                                extract $n.iso && \rm -f $n ;;
                *)
                            echo "extract: '$n' - unknown archive method"
                            return 1
                            ;;
            esac
        else
            echo "'$n' - file does not exist"
            return 1
        fi
        done
    fi
}
iterm2_print_user_vars() { iterm2_set_user_var badge $ITERM2_BADGE; }
fzfp() { fzf --preview '(highlight -O ansi -l {} || coderay {} || cat {}) 2> /dev/null | head -500'; }
hdi(){ howdoi $* -c -n 3 ; }
where() { type -a "$@"; }

# ---------
#  Aliases
# ---------

alias ..="cd .."
alias ...="cd ..; cd .."
alias ls="exa"
alias lh="ls -a"
alias ll="exa -laFm --git --time-style iso --group-directories-first"
alias lm="ll --sort=modified"
alias lt="ll --tree --level=2 --icons"
alias la="ll -lFhHigUam"
#alias du="du -ach | sort -h"
alias duu="dust -r"
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"
alias psc="ps aux | sort -nr -k 3 | head -5"
alias psm="ps aux | sort -nr -k 4 | head -5"
alias mkdir="mkdir -pv"
alias how="cht.sh"
alias ip='echo private: $(ifconfig | grep "broadcast"| cut -d" " -f2); echo public:; curl https://ipinfo.io; echo'
alias tree='tree -aC --dirsfirst'
alias tree2='tree -L 2'
alias tree3='tree -L 3'

# cli apps
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
# list tracked files
alias gl='ls --group-directories-first --color=auto -d $(git ls-tree $(git branch | grep \* | cut -d " " -f2) --name-only)'
alias glr='git ls-tree --full-tree HEAD --name-only -r | tree --fromfile | less'
alias glr2='git ls-tree --full-tree HEAD --name-only -r | tree --fromfile -L 2 | less'
alias glr3='git ls-tree --full-tree HEAD --name-only -r | tree --fromfile -L 3 | less'

alias dot="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
alias da="dot add"
alias dst="dot status --short"

# -------------
#  Environment
# -------------
## language
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
## path
# global npm, for hexo
export PATH=~/.npm-global/bin:$PATH
# commands history size
export HISTSIZE=1000000
# export HISTFILESIZE=2000
export HISTIGNORE='pwd:exit:fg:bg:top:clear:history:ls:uptime:df'
# use bat as colorizing pager for `man`
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
# in order to make goku
# export PATH=/usr/local/lib/graalvm/bin:$PATH
