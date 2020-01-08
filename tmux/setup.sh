#!/bin/sh

SCRIPT=$(readlink -f "$0")
DIR=$(dirname "$SCRIPT")
. $DIR/../utils.sh

confirm "$HOME/.tmux.conf"
cp $DIR/.tmux.conf ~/.tmux.conf

# Install TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Finished setting up tmux"
