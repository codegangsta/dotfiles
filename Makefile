bootstrap::
	ln -vsfn ${PWD}/config ${HOME}/.config
	ln -vsfn ${PWD}/config/cursor ${HOME}/Library/Application\ Support/Cursor/User
	ln -vsfn ${PWD}/git/.gitconfig ${HOME}/.gitconfig
	ln -vsfn ${PWD}/git/.gitignore_global ${HOME}/.gitignore_global
	brew bundle --cleanup
