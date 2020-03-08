#!/usr/bin/env zsh

git submodule init
git submodule update

#for root 
#run with sudo
base=(
 vim
 zsh
 config
 term
)

 #
useronly=(
)

stowit(){
 usr=$1
 app=$2
 # -v verbose
    # -R recursive
    # -t target
    stow -v -R -t ${usr} ${app}
}


# install apps available to local users and root
echo "##### Stowing base app"
echo ""

for app in ${base[@]}; do
	echo "Stowing $app done."
	stowit "${HOME}" $app
done

# install only user space folders
echo ""
echo "##### Stowing apps for user only: $(whoami)"
echo ""
for app in ${useronly[@]}; do
  if [[ $USER != "root" ]]; then				
	echo "Stowing $app done."
        stowit "${HOME}" $app
  fi 
done

echo ""
echo "##### ALL DONE"
