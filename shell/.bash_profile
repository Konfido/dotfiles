# -----------------
# Diverse scenarios
# -----------------

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
        alias stat="stat -f 'Type: %HT%SY%n  Size: %z%n  Mode: (%Lp/%Sp)%nAccess: %Sa%nModify: %Sm%nChange: %Sc%n Birth: %SB' -t '%F %T'"
        function vc {
            if [ -e $1 ]; then open -a Visual\ Studio\ Code $@;
            else touch $@ && open -a Visual\ Studio\ Code $@; fi }
        ;;
    *) ;;
esac

### if running bash
if [ -n "$BASE_VERSION" ]; then
    [[ -f $HOME/.bashrc ]] && . $HOME/.bashrc
fi

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# ---------
# Functions
# ---------
# help() { "$@" --help 2>&1 | bat --plain -l help; }
cs() { cd "$@" && ls ; }
du() { /usr/bin/du -ch -d1 "$@" | sort -hr; }
size() { du -k "$@"; }
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
fzf() { "$HOME/.fzf/bin/fzf" --preview '(highlight -O ansi -l {} \
                        || bat -f --style=plain --line-range :500 {} \
                        || coderay {} \
                        || cat {}) 2> /dev/null | head -500'; }
hdi(){ howdoi $* -c -n 3 ; }
where() { type -a "$@"; }

# ---------
#  Aliases
# ---------

alias ..="\cd .."
alias ...="\cd ..; \cd .."
alias ls="exa"
alias lh="ls -a"
alias ll="exa -laFm --git --time-style iso --group-directories-first"
alias lm="ll --sort=modified"
alias lt="ll --tree --level=2 --icons"
alias la="ll -lFhHigUam"
#alias du="du -ach | sort -h"
alias duu="dust -r"
alias dff="duf --only local"
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
alias gau="git add -u"
alias gc="git commit -v"
alias gca="git commit -v --amend --no-edit"
alias gco="git checkout"
alias gd="git diff"
alias gdc="git diff --cached"
alias gds="git diff --staged"
glist(){ git ls-tree -r --name-only "${1:-HEAD}" \
        | tree --fromfile -aC --dirsfirst; }
glist2(){ git ls-tree -r --name-only "${1:-HEAD}" \
        | tree --fromfile -aC --dirsfirst -L 2; };
alias glog="git log --oneline --decorate --graph"
alias gloga="$glog --all"
alias glol="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --stat"
alias gst="git status --short"


# -------------
#  Environment
# -------------
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export HISTSIZE=100000
export SAVEHIST=10000
export HISTIGNORE='pwd:exit:fg:bg:top:clear:history:ls:uptime:df'
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# fzf
export FZF_DEFAULT_COMMAND="fd --hidden --exclude={.git,.idea,.vscode,.sass-cache,node_modules,build}"
export FZF_DEFAULT_OPTS="--height 60% --layout=reverse --preview '(highlight -O ansi {} || cat {}) 2> /dev/null | head -500'"

# custom executive bins
export PATH=~/.local/bin:~/.local/script:$PATH

# Local variables
[[ -r ~/.local_env ]] && source ~/.local_env

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
CONDA_HOME=${CONDA_HOME:-$HOME/anaconda3}
__conda_setup="$($CONDA_HOME'/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$CONDA_HOME/etc/profile.d/conda.sh" ]; then
        . "$CONDA_HOME/etc/profile.d/conda.sh"
    else
        export PATH="$CONDA_HOME/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<