#!/bin/zsh

export ZSH="/Users/ujinyoung/.oh-my-zsh"
export MYVIMRC="/Users/ujinyoung/.vimrc"
export VIMINIT=":set runtimepath^=/Users/ujinyoung/.vim|:source $MYVIMRC"

export EDITOR="/usr/local/bin/nvim"
export VIM="/usr/local/Cellar/neovim/0.4.3/share/nvim"

export PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"

export FZF_BASE="/Users/ujinyoung/.fzf.zsh"

# export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_DEFAULT_COMMAND='ag -f --hidden -p ~/.ignore -g "" 2> /dev/null'

# export FZF_PREVIEW_COMMAND="'(highlight -O ansi --style --base16 dracula -l {} || cat {} || tree -CalA {}) 2> /dev/null'"

# export FZF_HIGHLIGHT_PREVIEW_OPTS="--height 40% --layout=reverse --preview '(highlight -O ansi {} || cat {}) 2> /dev/null | head -500"
# WARNING: depends on `brew install highlight`
export FZF_HIGHLIGHT_PREVIEW_OPTS="--height 40% --layout=reverse --preview-window=right:60% --preview '(highlight -O ansi --style neon -l {} || cat {} || tree -CalA {}) 2> /dev/null'"
# export FZF_DEFAULT_OPTS="--layout=reverse --inline-info"
export FZF_DEFAULT_OPTS="--layout=reverse --inline-info --color=dark 
--color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f,info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7"

export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
export FZF_CTRL_T_OPTS=$FZF_HIGHLIGHT_PREVIEW_OPTS" --delimiter '/' --nth=-1"

# always-visible preview window that shows full command
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:2"
# hidden by default, made visible on `?`
# export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
#dracula theme fzf

export FZF_ALT_C_OPTS=$FZF_HIGHLIGHT_PREVIEW_OPTS

export FZF_COMPLETION_TRIGGER=''
export FZF_COMPLETION_OPTS=$FZF_HIGHLIGHT_PREVIEW_OPTS
export FZF_PATH_COMPLETION_OPTS=$FZF_HIGHLIGHT_PREVIEW_OPTS

export FZF_TMUX=1

export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters

export PATH="/Users/ujinyoung/.pyenv/shims:${PATH}"
export PYENV_SHELL=zsh

export PYENV_ROOT='/Users/ujinyoung/.pyenv'
export PYENV_VERSION=3.7.6
export PYENV_VERSION='system'

export HL_CONFIG_DIR='/usr/local/etc/highlight'
export HL_DATA_DIR='/usr/local/Cellar/highlight/3.55/share/highlight'
