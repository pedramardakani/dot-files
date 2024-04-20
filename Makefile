all: final

.SECONDEXPANSION:

apps := nvim rofi i3 i3status-rs git
at-home := .bashrc .zshrc .tmux.conf

# Config files to get
final: ${apps} ${at-home}

${at-home}: ${HOME}/$$@
${apps}: ${HOME}/.config/$$@
	rsync --recursive --exclude=".git" $</ $@/ 

