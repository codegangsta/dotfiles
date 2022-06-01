bootstrap::
	ln -vsfn ${PWD}/config ${HOME}/.config
	ln -vsfn ${PWD}/git/.gitconfig ${HOME}/.gitconfig
	ln -vsfn ${PWD}/git/.gitignore_global ${HOME}/.gitignore_global
	ln -vsfn ${PWD}/tmux/.tmux.conf ${HOME}/.tmux.conf
	ln -vsfn ${PWD}/tmux/plugins ${HOME}/.tmux/plugins
	brew bundle --cleanup
