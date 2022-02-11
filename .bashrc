#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Pedram, Custom scripts
alias l="ls -ltrha"
alias ls='ls --color=auto'
alias scrcpy='scrcpy -b 3M'
alias grep="grep --color=always"
alias pacman='pacman --color=auto'

# Inspired from Mohammad's gitlab
#
# Add the Git branch information to the command prompt only when Git
# is present. Also set the command-prompt color to purple for normal
# users and red when the root is running it.
if git --version &> /dev/null; then
    parse_git_branch() {
        git branch 2> /dev/null | awk '$1=="*" { print " ("$2")"}'
    }
else
    parse_git_branch() { echo &> /dev/null; }
fi
if [ x$(whoami) = xroot ]; then
    export PS1="\[\033[01;31m\]\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\]# "
else
    export PS1="\[\033[01;35m\]\u@\h:\W\[\033[32m\]\$(parse_git_branch)\[\033[00m\]$ "
fi

source /usr/share/nvm/init-nvm.sh
export PATH=$PATH:$HOME/.local/bin
export INFOPATH=$INFOPATH:/usr/share/info:$HOME/.local/lib
