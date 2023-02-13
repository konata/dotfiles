source ~/.zplug/init.zsh
zplug "modules/history",    from:prezto
zplug "modules/utility",    from:prezto
zplug "modules/terminal",   from:prezto
zplug "modules/editor",     from:prezto
zplug "modules/directory",  from:prezto
zplug "modules/completion", from:prezto
zplug "plugins/git",   from:oh-my-zsh
zplug "zsh-users/zsh-completions",              defer:0
zplug "zsh-users/zsh-autosuggestions",          defer:2, on:"zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting",      defer:3, on:"zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search", defer:3, on:"zsh-users/zsh-syntax-highlighting"
zplug 'dracula/zsh', as:theme
if ! zplug check; then
   zplug install
fi
zplug load


DOTFILES=$HOME/dotfiles
for file in "exports" "path" "alias" "brew" "adb" "ns" "rust" "conda" "sdkman" "fzf" "go" "ghc" "bs" "gcloud"
do
	source "$DOTFILES/system/$file.rc"
done

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "/$HOME/.sdkman/bin/sdkman-init.sh"
