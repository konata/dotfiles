# Dotfiles

## My opinionated Dotfiles, targets macOS & mobile development

- Makefile
  provide all tasks to setup a new mac, ranging download application to software configuration link
- bin
  utilities for env detects, you may also put your env independent little scripts here,
  for env dependent ones, put them under $HOME/exec would be a better choice, which is also added to $PATH in `system/path.rc`
- config
  all things in this folder should be linked directly to $HOME via `link` task
- install
  your brew / cask / npm / conda / cargo packages should go here via `packages` task
- macos
  macos defaults, run it directly on your own interests
- system
  configurations sort by purpose,
