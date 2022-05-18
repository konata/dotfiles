$DOTFILE = $HOME/dotfiles
for file in  "env" "alias" "adb" "ns" "conda" "sdkman" do 
	source "$DOTFILES/$file.rc"
done

