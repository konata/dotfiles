SHELL = /bin/zsh
DOTFILES_DIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
PATH := $(DOTFILES_DIR)/bin:$(PATH)
HOMEBREW_PREFIX := $(shell bin/is-supported bin/is-arm64 /opt/homebrew /usr/local)
export STOW_DIR = $(DOTFILES_DIR)
export ACCEPT_EULA=Y

all: macos
macos: sudo core-macos packages link
core-macos: brew git npm 
stow-macos: brew
	is-executable stow || brew install stow
sudo:
	sudo -v
	while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
packages: brew-packages cask-apps
link: stow-$(OS)
	for FILE in $$(\ls -A config); do if [ -f $(HOME)/$$FILE -a ! -h $(HOME)/$$FILE ]; then \
		mv -v $(HOME)/$$FILE{,.bak}; fi; done
	stow -t $(HOME) config
unlink: stow-$(OS)
	stow --delete -t $(HOME) config
	for FILE in $$(\ls -A config); do if [ -f $(HOME)/$$FILE.bak ]; then \
		mv -v $(HOME)/$$FILE.bak $(HOME)/$${FILE%%.bak}; fi; done
brew:
	is-executable brew || curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh | bash
git: brew
	brew install git git-extras
brew-packages: brew
	brew bundle --file=$(DOTFILES_DIR)/install/Brewfile || true
cask-apps: brew
	brew bundle --file=$(DOTFILES_DIR)/install/Caskfile || true
	xattr -d -r com.apple.quarantine ~/Library/QuickLook
