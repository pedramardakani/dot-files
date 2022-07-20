#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

PATH="${PATH}:/home/pedram/.local/bin"
INFOPATH="${INFOPATH}:/usr/local/share/info:/usr/share/info"
MANPATH="${MANPATH}:/usr/local/texlive/2021/texmf-dist/doc/man:/usr/local/share/man"

# Export texlive environment variables
PATH="${PATH}:${HOME}/.local/texlive/2022/bin/x86_64-linux"
MANPATH="${MANPATH}:${HOME}/.local/texlive/2022/texmf-dist/doc/man"
INFOPATH="${INFOPATH}:${HOME}/.local/texlive/2022/texmf-dist/doc/info"

# Export gnuastro environment variables
INFOPATH="${INFOPATH}:${HOME}/.local/share/info"
