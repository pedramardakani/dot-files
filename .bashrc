#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# Custom scripts
alias ls="ls --color=auto"
alias l="ls -htr --color=auto"
alias ll="ls -hltra --color=auto"

alias clear="clear -x"
alias scrcpy="scrcpy -b 3M"
alias grep="grep --color=always"
alias pacman="pacman --color=auto"
alias dsw="ds9 -grid yes -zoom to 0.05 -tile column -lock frame wcs -lock colorbar yes"


# Inspired from Mohammad's gitlab
#
# Add the Git branch information to the command prompt only when Git
# is present. Also set the command-prompt color to purple for normal
# users and red when the root is running it.
#
# https://gitlab.com/makhlaghi/operating-system-customization/-/tree/master/
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

# Set unlimited bash history and remove duplications
HISTSIZE=
HISTFILESIZE=
HISTCONTROL=ignoreboth:erasedups

# Gnuastro environment variables
INFOPATH="${INFOPATH}:${HOME}/.local/share/info"

# Initial environment variables
PATH="${PATH}:${HOME}/.local/bin"
MANPATH="/usr/local/share/man:${MANPATH}"
INFOPATH="/usr/local/share/info:/usr/share/info:${INFOPATH}"

# TeXLive environment variables
PATH="${PATH}:${HOME}/.local/texlive/2022/bin/x86_64-linux"
MANPATH="${MANPATH}:${HOME}/.local/texlive/2022/texmf-dist/doc/man"
INFOPATH=":${INFOPATH}:${HOME}/.local/texlive/2022/texmf-dist/doc/info"

# Sort path variables and make sure there are no duplicates and also there
# is no trailing ':' at the end (which would add the current directory to
# PATH!)
#
# Reference: https://unix.stackexchange.com/a/40755/359712
deduplicate_path_variable () {
    printf %s "$1" | \
           awk -v RS=: '{ if (!arr[$0]++) {printf("%s%s",!ln++?"":":",$0)}}'
}


# Clean variables
export PATH="$(deduplicate_path_variable $PATH)"
export MANPATH="$(deduplicate_path_variable $MANPATH)"
export INFOPATH="$(deduplicate_path_variable $INFOPATH)"

# Source NodeJS Version Manager
if [ -f /usr/share/nvm/init-nvm.sh ]; then
    source /usr/share/nvm/init-nvm.sh
fi
