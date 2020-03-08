#!/bin/zsh
#zsh-highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#fzf
/usr/local/opt/fzf/install

#zsh-completions
rm -f ~/.zcompdump; 
compinit
#chmod go-w '/usr/local/share'


