#!/bin/sh

SCRIPT=$(readlink -f "$0")
DIR=$(dirname "$SCRIPT")
. $DIR/../utils.sh

confirm "$HOME/.gitconfig"
cp $DIR/.gitconfig ~/.gitconfig

git config --global core.editor vim

read -p "Please enter your full name: " -r
git config --global user.name "$REPLY"

read -p "Please enter your email address: " -r
git config --global user.email "$REPLY"

echo "Finished setting up Git"
