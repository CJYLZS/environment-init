sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
git clone https://github.com/zsh-users/zsh-autosuggestions
mv zsh-* ~/.oh-my-zsh/custom/plugins/
rm -rf zsh-*

cp zshrc ~/.zshrc
cp ylzsalias.sh ~/.ylzsalias.sh