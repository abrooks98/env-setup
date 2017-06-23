#!/bin/sh

SCRIPT=$(readlink -f "$0")
DIR=$(dirname "$SCRIPT")
. $DIR/../utils.sh

confirm "$HOME/.tmux.conf"
cp $DIR/.tmux.conf ~/.tmux.conf

echo "Finished setting up tmux"
