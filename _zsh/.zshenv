#!/bin/zsh

export ZSH="/Users/ujinyoung/.oh-my-zsh"
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters

export MYVIMRC="/Users/ujinyoung/.vimrc"
export VIMINIT=":set runtimepath^=/Users/ujinyoung/.vim|:source $MYVIMRC"

export EDITOR="/usr/local/bin/nvim"
export VIM="/usr/local/Cellar/neovim/0.4.4/share/nvim"

export PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"

export FZF_BASE="/Users/ujinyoung/.fzf.zsh:/usr/local/bin/fzf:/usr/local/opt/fzf/install:/usr/local/opt/fzf/bin"

# export FZF_DEFAULT_COMMAND='fd --type f'
# -f : follow symlink 
export FZF_DEFAULT_COMMAND='ag --hidden -p ~/.gitignore_global -g "" 2> /dev/null'

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


export HL_CONFIG_DIR='/usr/local/etc/highlight'
export HL_DATA_DIR='/usr/local/Cellar/highlight/3.55/share/highlight'
PATH=${PATH}:~/Downloads

export VIMWIKI='~/Dropbox/vimwiki'
export PATH="/usr/local/opt/llvm/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/llvm/lib -Wl,-rpath,/usr/local/opt/llvm/lib:$LDFLAGS"
export CPPFLAGS="-I/usr/local/opt/llvm/include:$CPPFLAGS"
# CPPFLAGS += -I/usr/local/opt/llvm/include/c++/v1/

# nvm yarn
#export PATH="/usr/local/Cellar/node/v12.16.2/bin:$PATH"
export PATH="$HOME/.nvm/versions/node/v14.15.3/bin:$PATH"
export NODE_PATH="/usr/local/lib/node_modules"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="$(yarn global bin):$PATH"

#libffi
export CPPFLAGS="-I/usr/local/opt/libffi/include:$CPPFLAGS"
export LDFLAGS="-L/usr/local/opt/libffi/lib:$LDFLAGS"
export PKG_CONFIG_PATH="/usr/local/opt/libffi/lib/pkgconfig:$PKG_CONFIG_PATH"

#icu4c
# If you need to have icu4c first in your PATH run:
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"

# For compilers to find icu4c you may need to set:
export LDFLAGS="-L/usr/local/opt/icu4c/lib:$LDFLAGS"
export CPPFLAGS="-I/usr/local/opt/icu4c/include:$CPPFLAGS"

# For pkg-config to find icu4c you may need to set:
export PKG_CONFIG_PATH="/usr/local/opt/icu4c/lib/pkgconfig:$PKG_CONFIG_PATH"

# python pyenv conda
export CPPFLAGS="-I/usr/local/opt/zlib/include:$LDFLAGS"
export PKG_CONFIG_PATH="/usr/local/opt/zlib/lib/pkgconfig:$PKG_CONFIG_PATH"
export LDFLAGS="-L/usr/local/opt/zlib/lib:$LDFLAGS"
export PATH="/Users/ujinyoung/.pyenv/shims:${PATH}"

export PYENV_ROOT="$HOME/.pyenv"
export PYENV_VERSION=3.8.7 #=anaconda3-5.3.1 #3.6.0
export PATH="$PYENV_ROOT/bin:$PATH"

# selenium chromedriver
export PATH="/Users/ujinyoung/selenium:$PATH"

#openssl@1.1
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib:$LDFLAGS"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include:$CPPFLAGS"
export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig:$PKG_CONFIG_PATH"

#readline
export LDFLAGS="-L/usr/local/opt/readline/lib:$LDFLAGS"
export CPPFLAGS="-I/usr/local/opt/readline/include:$CPPFLAGS"
export PKG_CONFIG_PATH="/usr/local/opt/readline/lib/pkgconfig:$PKG_CONFIG_PATH"

#sqlite
export PATH="/usr/local/opt/sqlite/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/sqlite/lib:$LDFLAGS"
export CPPFLAGS="-I/usr/local/opt/sqlite/include:$CPPFLAGS"
export PKG_CONFIG_PATH="/usr/local/opt/sqlite/lib/pkgconfig:$PKG_CONFIG_PATH"

#tcl-tk
#export PATH="/usr/local/opt/tcl-tk/bin:$PATH"
#   export LDFLAGS="-L/usr/local/opt/tcl-tk/lib"
#  export CPPFLAGS="-I/usr/local/opt/tcl-tk/include"
# export PKG_CONFIG_PATH="/usr/local/opt/tcl-tk/lib/pkgconfig"

# libxml2
#export PATH="/usr/local/opt/libxml2/bin:$PATH"
# export LDFLAGS="-L/usr/local/opt/libxml2/lib"
# export CPPFLAGS="-I/usr/local/opt/libxml2/include"
# export PKG_CONFIG_PATH="/usr/local/opt/libxml2/lib/pkgconfig"

#libffi
#  export LDFLAGS="-L/usr/local/opt/libffi/lib"
#  export CPPFLAGS="-I/usr/local/opt/libffi/include"
#  export PKG_CONFIG_PATH="/usr/local/opt/libffi/lib/pkgconfig"

#guile
#export GUILE_LOAD_PATH="/usr/local/share/guile/site/3.0"
#export GUILE_LOAD_COMPILED_PATH="/usr/local/lib/guile/3.0/site-ccache"
#export GUILE_SYSTEM_EXTENSIONS_PATH="/usr/local/lib/guile/3.0/extensions"

#gnu-getopt
# export PATH="/usr/local/opt/gnu-getopt/bin:$PATH"

#sphinx-doc
#export PATH="/usr/local/opt/sphinx-doc/bin:$PATH"

#mono
#To use the assemblies from other formulae you need to set:
#export MONO_GAC_PREFIX="/usr/local"

#openblas
#For compilers to find openblas you may need to set:
#export LDFLAGS="-L/usr/local/opt/openblas/lib"
#export CPPFLAGS="-I/usr/local/opt/openblas/include"

#For pkg-config to find openblas you may need to set:
# export PKG_CONFIG_PATH="/usr/local/opt/openblas/lib/pkgconfig"

#qt
export PATH="/usr/local/opt/qt/bin:$PATH"

# export LDFLAGS="-L/usr/local/opt/qt/lib"
# export CPPFLAGS="-I/usr/local/opt/qt/include"
# export PKG_CONFIG_PATH="/usr/local/opt/qt/lib/pkgconfig"

#mozjpeg
#export PATH="/usr/local/opt/mozjpeg/bin:$PATH"
#export LDFLAGS="-L/usr/local/opt/mozjpeg/lib"
# export CPPFLAGS="-I/usr/local/opt/mozjpeg/include"
#export PKG_CONFIG_PATH="/usr/local/opt/mozjpeg/lib/pkgconfig:$PKG_CONFIG_PATH"

#python@3.8
export PATH="/usr/local/opt/python@3.8/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/python@3.8/lib:$LDFLAGS"
export PKG_CONFIG_PATH="/usr/local/opt/python@3.8/lib/pkgconfig:$PKG_CONFIG_PATH"
export TERM=xterm-256color
