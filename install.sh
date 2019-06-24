#!/bin/zsh

# backup old file

if [ -d $HOME/.vim.backup ] 
then
	rm -f $HOME/.vim.backup
fi

mv -f $HOME/.vim $HOME/.vim.backup
mv -f $HOME/.vimrc $HOME/.vimrc.backup
mv -f $HOME/.zshrc $HOME/.zshrc.backup
mv -f $HOME/.hyper.js $HOME/.hyper.js.backup

# link new file
ln -s $HOME/dotfiles/.vim $HOME/.vim
ln -s $HOME/dotfiles/.vimrc $HOME/.vimrc
ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc
ln -s $HOME/dotfiles/.hyper.js $HOME/.hyper.js

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install package by homebrew
brew bundle

# install vim plugin
rm -rf .vim/bundle
mkdir -p .vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git .vim/bundle/Vundle.vim
vim +PluginInstall +qall

# install command use gem
sudo gem install bropages
sudo gem install cocoapods
