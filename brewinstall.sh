#!/bin/sh
xcode-select --install

if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update
mas upgrade
brew tap homebrew/bundle
brew bundle --file=$HOME/dotfiles/Brewfile
#remove old version
brew cleanup
brew cask cleanup

[ ! -f $HOME/.gitconfig ] && ln -bns $HOME/dotfiles/.gitconfig $HOME/.gitconfig
[ ! -f $HOME/.gitignore_global ] && ln -bns $HOME/dotfiles/.gitignore_global $HOME/.gitignore_global

