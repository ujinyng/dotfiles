
#if you receive "zsh compinit: insecure directories" warnings when attempting to load these completions, you may need to run this:
#  chmod go-w '/usr/local/share'


# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
# export ZSH=$HOME/dotfiles/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	fzf #brew
	fasd #brew
	# zsh-syntax-highlighting #brew
	# zsh-autosuggestions #brew
	pyenv #brew
	nvm 
	osx #brew
)

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

fpath=(
  /usr/local/share/zsh-completions 
  ~/dotfiles/**/*
  $fpath
)
autoload -Uz ~/dotfiles/**/*

# zsh-syntax-highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# zsh-autosuggestions
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh-completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
  autoload -Uz compinit
  compinit
fi
# You may also need to force rebuild `zcompdump`:
#   rm -f ~/.zcompdump; compinit

# Additionally, if you receive "zsh compinit: insecure directories" warnings when attempting
# to load these completions, you may need to run this:
#   chmod go-w '/usr/local/share'

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=ko_KR.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# prompt show just name
# prompt_context() {
#   if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
#     prompt_segment #061326 default "%(!.%{%F{yellow}%}.)" 
#   fi
# } 
# prompt don't show name
#

prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    emojis=("😎" "😃" "😆" "😙" "😋" "🤪" "👻" "👀" "✌️ " "🧠" "🦄" "🐶" "🐱" "🌼" "🌈" "🔥" "⚡️" "⭐️" "💎" "🔮" "🖤" "❄️ " "☀️ " "💡" "🎸" "🧶" "👑" "🧚" "🐾" "🍭" "🚀" "💜")
    RAND_EMOJI_N=$(( $RANDOM % ${#emojis[@]} + 1))
    prompt_segment 235 default "%(!.%{%F{yellow}%}.) ${emojis[$RAND_EMOJI_N]}"
  fi
 }

alias vim="nvim"
alias vi="nvim"
alias vimdiff="nvim -d"

#fasd default alias
#alias a='fasd -a'        # any 이동
#alias s='fasd -si'       # interactive + select
#alias d='fasd -d'        # 디렉터리찾기
#alias f='fasd -f'        # 파일찾기
#alias sd='fasd -sid'     # 디렉터리 선택
#alias z='fasd_cd -d'     # 디렉터리 이동
#alias zz='fasd_cd -d -i' # 디렉터리 선택 후 이동

# for vim cursor
zle-keymap-select zle-line-init() {
    # change cursor shape in iTerm2
    case $KEYMAP in
        vicmd)      print -n -- "\E]50;CursorShape=0\C-G";;  # block cursor
        viins|main) print -n -- "\E]50;CursorShape=1\C-G";;  # line cursor
    esac

    zle reset-prompt
    zle -R
}

zle-line-finish() {
    print -n -- "\E]50;CursorShape=0\C-G"  # block cursor
}

zle -N zle-keymap-select
zle -N zle-line-init
zle -N zle-line-finish



# set -o vi
#set -o emacs
bindkey -e
# bindkey -v

# fkill - kill processes - list only the ones you can kill. Modified the earlier script.
fk() {
    local pid 
    if [ "$UID" != "0" ]; then
        pid=$(ps -f -u $UID | sed 1d | fzf -m | awk '{print $2}')
    else
        pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
    fi  

    if [ "x$pid" != "x" ]
    then
        echo $pid | xargs kill -${1:-9}
    fi  
}

#chrome history
ch() {
  local cols sep google_history open
  cols=$(( COLUMNS / 3 ))
  sep='{::}'

  if [ "$(uname)" = "Darwin" ]; then
    google_history="$HOME/Library/Application Support/Google/Chrome/Default/History"
    open=open
  else
    google_history="$HOME/.config/google-chrome/Default/History"
    open=xdg-open
  fi
  cp -f "$google_history" /tmp/h
  sqlite3 -separator $sep /tmp/h \
    "select substr(title, 1, $cols), url
     from urls order by last_visit_time desc" |
  awk -F $sep '{printf "%-'$cols's  \x1b[36m%s\x1b[m\n", $1, $2}' |
  fzf --ansi --multi | sed 's#.*\(https*://\)#\1#' | xargs $open > /dev/null 2> /dev/null
}

## FZF & Docker
# Select a docker container to start and attach to
dka() {
  local cid
  cid=$(docker ps -a | sed 1d | fzf -1 -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker start "$cid" && docker attach "$cid"
}
# Select a running docker container to stop
dks() {
  local cid
  cid=$(docker ps | sed 1d | fzf -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker stop "$cid"
}
# Select a docker container to remove
dkrm() {
  local cid
  cid=$(docker ps -a | sed 1d | fzf -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker rm "$cid"
}
# python behave BDD
# fbehave() {
#     behave "$@" -d -f steps 2> /dev/null | \
#     awk -F " *# " '/\s*(Given|When|Then|\*)/ {print $1"\t"$2}' | \
#     fzf -d "\t" --with-nth=1 \
#         --bind 'enter:execute(echo {} | cut -f2 | pbcopy )' \
#         --bind 'tab:execute(echo {} | cut -f1 | awk "{\$1=\$1};1" | pbcopy )'
# }


tm() {
  [[ -n "$TMUX" ]] && change="switch-client" || change="attach-session"
  if [ $1 ]; then
    tmux $change -t "$1" 2>/dev/null || (tmux new-session -d -s $1 && tmux $change -t "$1"); return
  fi
  session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf --exit-0) &&  tmux $change -t "$session" || echo "No sessions found."
}

tkill() { 
  tmux kill-server 
}


export FZF_BASE="/Users/ujinyoung/.fzf.zsh:/usr/local/bin/fzf"

alias tmux='TERM=xterm-256color tmux -2'
alias tsource='tmux source-fil'
alias so='source'
alias tso='tsource'

gpp(){
  g++ ${1%.*}.cc --std=c++14 -pthread -O3 -o $1
}
c(){
  gcc ${1%.*}.c -pthread -lm -O3 -o $1
}
alias cpp=gpp
gpg(){
  g++ -g ${1%.*}.cc -std=c++14 -pthread -O3 -o $1
}

# rsync: alternative to cp 
alias rsync="/usr/local/bin/rsync"
alias rs=/usr/local/bin/rsync -azvhrubR
##-L/-l: transform symlink into referent file,dir / copy symlink as symlink

export PATH="/usr/local/sbin:$PATH"

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
# source $HOME/.pyenv/versions/miniconda-3.8.3/etc/fish/conf.d/conda.fish #etc/profile.d/conda.sh

# yarn global
export PATH="$(yarn global bin):$PATH"
[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)
