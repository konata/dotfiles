SHELL = /bin/zsh
DOTFILES_DIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
PATH := $(DOTFILES_DIR)/bin:$(PATH)
export ACCEPT_EULA=Y

all: macos
macos: sudo core-macos packages link
core-macos: brew git
sudo:
	sudo -v
	while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
packages: brew-packages cask-apps
link: 
	ln -s $(DOTFILES_DIR)/bin $$HOME/
	for FILE in $$(\ls -A config); do if [ -f $(HOME)/$$FILE -a ! -h $(HOME)/$$FILE ]; then \
		mv -v $(HOME)/$$FILE{,.bak}; fi; done
	for FILE in $$(\ls -A config); do \
		ln -s $(DOTFILES_DIR)/config/$$FILE $$HOME/; done
unlink:
	for FILE in $$(\ls -A config); do if [ -f $(HOME)/$$FILE -a ! -h $(HOME)/$$FILE ]; then \
		rm -rf $(HOME)/$$FILE; fi; done
brew:
	is-executable brew || curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh | bash
git: brew
	brew install git git-extras
brew-packages: brew
	brew bundle --file=$(DOTFILES_DIR)/install/Brewfile || true
cask-apps: brew
	brew bundle --file=$(DOTFILES_DIR)/install/Caskfile || true
