bootstrap::
	@if [ "$$(uname)" = "Darwin" ]; then \
		$(MAKE) bootstrap-macos; \
	else \
		$(MAKE) bootstrap-linux; \
	fi

bootstrap-common::
	ln -vsfn ${PWD}/git/.gitconfig ${HOME}/.gitconfig
	ln -vsfn ${PWD}/git/.gitignore_global ${HOME}/.gitignore_global
	ln -vsfn ${PWD}/zsh/.zshrc ${HOME}/.zshrc
	ln -vsfn ${PWD}/config/nvim ${HOME}/.config/nvim
	ln -vsfn ${PWD}/config/kitty ${HOME}/.config/kitty
	ln -vsfn ${PWD}/config/ghostty ${HOME}/.config/ghostty
	ln -vsfn ${PWD}/config/lazygit ${HOME}/.config/lazygit
	ln -vsfn ${PWD}/config/lazybeads ${HOME}/.config/lazybeads
	ln -vsfn ${PWD}/config/starship.toml ${HOME}/.config/starship.toml
	ln -vsfn ${PWD}/config/htop ${HOME}/.config/htop
	ln -vsfn ${PWD}/config/k9s ${HOME}/.config/k9s
	ln -vsfn ${PWD}/config/rg ${HOME}/.config/rg
	ln -vsfn ${PWD}/config/tmux/tmux.conf ${HOME}/.tmux.conf
	mkdir -p ${HOME}/.claude
	ln -vsfn ${PWD}/config/claude/commands ${HOME}/.claude/commands
	ln -vsfn ${PWD}/config/claude/skills ${HOME}/.claude/skills
	ln -vsfn ${PWD}/config/claude/settings.json ${HOME}/.claude/settings.json

bootstrap-macos:: bootstrap-common
	brew bundle --cleanup

bootstrap-linux:: bootstrap-common
	@echo "Linux bootstrap complete"

# Run this on macOS to migrate from the old "symlink entire config dir" approach
migrate::
	@if [ -L "${HOME}/.config" ]; then \
		echo "Removing ~/.config symlink..."; \
		rm "${HOME}/.config"; \
		echo "Creating real ~/.config directory..."; \
		mkdir -p "${HOME}/.config"; \
		echo "Migration complete. Now run 'make bootstrap'"; \
	else \
		echo "~/.config is not a symlink, nothing to migrate"; \
	fi
