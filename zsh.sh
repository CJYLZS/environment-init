sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions
git clone --depth=1 https://github.com/marlonrichert/zsh-autocomplete.git
mv zsh-* ~/.oh-my-zsh/custom/plugins/
rm -rf zsh-*

cp zshrc ~/.zshrc
cp ylzs.zsh-theme ~/.oh-my-zsh/theme/
cp -f dirhistory.plugin.zsh ~/.oh-my-zsh/plugin/dirhistory/
source ~/.zshrc
# cp ylzsalias.sh ~/.ylzsalias.sh