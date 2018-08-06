#!/bin/zsh

# backup old file
mv -f $HOME/.vim $HOME/.vim.backup
mv -f $HOME/.vimrc $HOME/.vimrc.backup
mv -f $HOME/.zshrc $HOME/.zshrc.backup
mv -f $HOME/.gitconfig $HOME/.gitconfig.backup
mv -f $HOME/dotfiles/.hyper.js $HOME/.hyper.js

# link new file
ln -s $HOME/dotfiles/.vim $HOME/.vim
ln -s $HOME/dotfiles/.vimrc $HOME/.vimrc
ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc
ln -s $HOME/dotfiles/.gitconfig $HOME/.gitconfig
ln -s $HOME/dotfiles/.hyper.js $HOME/.hyper.js

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install thefuck
brew install thefuck

# install zplug
brew install zplug

# use zplug install stuff
zplug install

# install fzf
brew install fzf

# install vim plugin
rm -rf .vim/bundle
mkdir -p .vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git .vim/bundle/Vundle.vim
vim +PluginInstall +qall

brew tig
brew git
brew ncdu
brew python
brew wget
brew yarn