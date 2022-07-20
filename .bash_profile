#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Use no-window emacs when 'C-x e' is pressed
EDITOR="emacs -nw"

# Initial environment variables
PATH="${PATH}:${HOME}/.local/bin"
MANPATH="${MANPATH}:/usr/local/share/man"
INFOPATH="${INFOPATH}:/usr/local/share/info:/usr/share/info"

# TeXLive environment variables
PATH="${PATH}:${HOME}/.local/texlive/2022/bin/x86_64-linux"
MANPATH="${MANPATH}:${HOME}/.local/texlive/2022/texmf-dist/doc/man"
INFOPATH="${INFOPATH}:${HOME}/.local/texlive/2022/texmf-dist/doc/info"

# Gnuastro environment variables
INFOPATH="${INFOPATH}:${HOME}/.local/share/info"


# Sort path variables and make sure there are no duplicates and also there
# is no trailing ':' at the end (which would add the current directory to
# PATH!)
#
# Reference: https://unix.stackexchange.com/a/40755/359712
deduplicate_path_variable () {
    printf %s "$1" | sort | \
           awk -v RS=: '{ if (!arr[$0]++) {printf("%s%s",!ln++?"":":",$0)}}'
}


# Clean variables
PATH="$(deduplicate_path_variable $PATH)"
MANPATH="$(deduplicate_path_variable $MANPATH)"
INFOPATH="$(deduplicate_path_variable $INFOPATH)"
