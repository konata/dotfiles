# Dotfiles

My opinionated Dotfiles, targets on macOS & mobile development

## Makefile

providing tasks to setup a new mac, ranging from download application to configuration file link

### bin

utilities for env detects, you may also put your path independent little scripts here,
for path dependent ones, put them under $HOME/exec would be a better choice, which is also added to $PATH in `system/path.rc`, but not tracked by git

### config

including files which should be directly linked to `$HOME` via `link` task

### install

here goes your scripts for package manager (brew / cask / npm / conda / cargo) to restore all your global packages via `package` task

### macos

macos preference setting , run it directly on your own interests

### system

shell configurations sort by category
