#!/bin/bash

# print info
dirName="$(pwd | rev | cut -d'/' -f1 | rev)"

echo "Shellrc will be installed into following directory: $HOME/$dirName"
echo "If you want to change the directory's name, you should exit this script now and run it again after you change the name. Note that the shellrc directory must be directly in your home directory."
echo "Continue? [Y/n]"

# exit or continue
read choice
if [[ "$choice" = 'n' ]] ||  [[ "$choice" = 'N' ]]
then
	echo 'Operation aborted.'
	exit
fi

# install
if [ -e .shellrc-path ]
then
	echo 'Operation aborted - the .shellrc-path file already exists.'
	exit
fi

touch .shellrc-path
echo 'SHELLRCDIR="$HOME/'"$dirName"'"' >> .shellrc-path
echo 'BASHDOTDIR="$SHELLRCDIR/bash"' >> .shellrc-path
echo 'ZDOTDIR="$SHELLRCDIR/zsh"' >> .shellrc-path

cd ..

ln -s "$dirName"/.shellrc-path .shellrc-path
ln -s "$dirName"/zsh/.zshenv .zshenv
ln -s "$dirName"/bash/.bashrc .bashrc
