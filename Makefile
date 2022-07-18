bootstrap::
	ln -vsfn ${PWD}/config ${HOME}/.config
	ln -vsfn ${PWD}/git/.gitconfig ${HOME}/.gitconfig
	ln -vsfn ${PWD}/git/.gitignore_global ${HOME}/.gitignore_global
	ln -vsfn ${PWD}/config/lazygit/config.yml ${HOME}/Library/Application\ Support/lazygit/config.yml
	brew bundle --cleanup
