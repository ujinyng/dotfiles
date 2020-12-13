#!/usr/bin/env zsh
#
usage(){
 echo "Usage:
      yab -h     Display this help message.
      yab -i     Install yabai
      yab -c     Installl continue after disable SIP
      yab -u     Update yabai
      yab -r     Remove(Uninstall) yabai"
 }
yab(){
    while getopts ":hicur" opt; do
    case ${opt} in
      h) h=$OPTARG 
         # usage 
         ;;
      i) i=$OPTARG 
         # install
         ;;
      c) c=$OPTARG
         install_continue;;
      u) u=$OPTARG
           read "yn?## Update yabai?"
           case $yn in
             [Yy]*) update
                    break;;
             [Nn]*) break;; 
           esac
           ;;
      r) r=$OPTARG
           read "yn?## Uninstall yabai?"
           case $yn in
             [Yy]*) uninstall
                    break;;
             [Nn]*)  
                    break;; 
           esac
           ;;
      \?) echo "Invalid Option: -$OPTARG" 2>&1
          break;;
    esac
  done
  printf "$OPTIND"
  if [[ "$OPTIND" -gt 2 ]]
    then
    echo "Only one option is required"
  elif [[ "$OPTIND" -eq 1 ]]
    then
    echo "No options were passed"
    usage
  fi

  shift "$((OPTIND -1))"
}

update(){
  brew services stop yabai
  brew upgrade yabai
  brew services start yabai
  #codesign -fs "${YABAI_CERT:-yabai-cert}" "$(brew --prefix yabai)/bin/yabai"

  sudo yabai --uninstall-sa
  sudo yabai --install-sa

  # load the scripting addition
  killall Dock

}

install(){
  # Disable System Intergirty Protection
  echo "## 1. Please reboot recovery mode and run, \n
  ## 2. In the menue bar, choose Utilities, then Terminal \n
  ## 3. If you're on macOS 10.14 and above \n
        csrutil enable --without debug \n
  ## **or** if you're on macOS 10.13 \n
        csrutil enable --without debug --without fs \n
        ## 4. Reboot and run 'yab -c' \n"
  while true; do
    read "yn?## Reboot now?"
    case $yn in
      [Yy]*) sudo nvram "recovery-boot-mode=unused" && sudo shutdown -r now;;
      [Nn]*) echo "When booting, hold down command+R for recovery boot" 
             break;; 
    esac
  done
} 
install_continue(){
  crsutil status
  echo "## If you want to re-enable all SIP after uninstall yabai, \n
  ##    crsutil enable \n"
  sudo nvram -d recovery-boot-mode
  
  brew install koekeishiya/formulae/yabai  
  
  ## if not codesigned binary release, must create yabai-cert before \n"
  ## codesign -fs 'yabai-cert' $(which yabai)

  sudo yabai --install-sa
  brew services start yabai
  #pkill Dock
  killall Dock
  
  YABAIRC=/usr/local/opt/yabai/share/yabai/examples/yabairc
  SKHDRC=/usr/local/opt/yabai/share/yabai/examples/skhdrc
  [[ -f $YABAIRC ]] || cp /usr/local/opt/yabai/share/yabai/examples/yabairc ~/.yabairc
  [[ -f $SKHDRC ]] || cp /usr/local/opt/yabai/share/yabai/examples/skhdrc ~/.skhdrc
  echo "## Logs will be found in \n
      #/usr/local/var/log/yabai/yabai.[out|err].log \n" 
}

uninstall(){
  brew services stop yabai
  sudo yabai --uninstall-sa
  brew uninstall yabai

  rm -rf /usr/local/var/log/yabai
  rm ~/.yabairc
  rm /tmp/yabai_$USER.lock
  rm /tmp/yabai_$USER.socket
  rm /tmp/yabai-sa_$USER.socket

  killall Dock
  echo "## If you want to re-enable all SIP after uninstall yabai, \n
  ##    crsutil enable \n"
}

yab 
