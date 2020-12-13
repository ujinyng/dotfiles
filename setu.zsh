#!/usr/bin/env zsh

help(){
  echo "setu _p
    Install brew, zsh, vim, tmux, git, fzf, gdb, nodejs(yarn), py, etc
    etc contains .docker, .yarnrc, .notable.json"  #.skhdrc, .yabairc 
}

(){
  help
}

_p(){

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

mackup backup

[ ! -f $HOME/.gitconfig ] && ln -bns $HOME/dotfiles/.gitconfig $HOME/.gitconfig
[ ! -f $HOME/.gitignore_global ] && ln -bns $HOME/dotfiles/.gitignore_global $HOME/.gitignore_global

#oh-my-zsh 
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#nvm 
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | zsh

nvm install --lts

npm install --global yarn
  
}

$@
