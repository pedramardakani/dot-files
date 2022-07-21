#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Use no-window emacs when 'C-x e' is pressed
EDITOR="emacs -nw"

# Initial environment variables
PATH="${HOME}/.local/bin:${PATH}"
MANPATH="/usr/local/share/man:${MANPATH}"
INFOPATH="/usr/local/share/info:/usr/share/info:${INFOPATH}"

# TeXLive environment variables
PATH="${HOME}/.local/texlive/2022/bin/x86_64-linux:${PATH}"
MANPATH="${HOME}/.local/texlive/2022/texmf-dist/doc/man:${MANPATH}"
INFOPATH="${HOME}/.local/texlive/2022/texmf-dist/doc/info:${INFOPATH}"

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
