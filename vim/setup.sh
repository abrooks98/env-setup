#!/bin/sh

SCRIPT=$(readlink -f "$0")
DIR=$(dirname "$SCRIPT")
. $DIR/../utils.sh

confirm "~/.vimrc"
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
cp $DIR/.vimrc ~/.vimrc

echo "Finished setting up Vim"
