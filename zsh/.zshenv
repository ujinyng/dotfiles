#!/bin/zsh

export ZSH="/Users/ujinyoung/.oh-my-zsh"
export MYVIMRC="/Users/ujinyoung/.vimrc"
export VIMINIT=":set runtimepath^=/Users/ujinyoung/.vim|:source $MYVIMRC"

export EDITOR="/usr/local/bin/nvim"
export VIM="/usr/local/Cellar/neovim/0.4.3/share/nvim"

export PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"

export FZF_BASE="/Users/ujinyoung/.fzf.zsh"
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --preview '(highlight -O ansi {} || cat {}) 2> /dev/null | head -500'"

export FZF_DEFAULT_COMMAND='ag -l --path-to-ignore ~/.ignore --nocolor --hidden -g'
export FZF_TMUX=1

export PATH="/Users/ujinyoung/.pyenv/shims:${PATH}"
export PYENV_SHELL=zsh

export PYENV_ROOT='/Users/ujinyoung/.pyenv'
export PYENV_VERSION=3.7.6
export PYENV_VERSION='system'

