#!/bin/sh

SCRIPT=$(readlink -f "$0")
DIR=$(dirname "$SCRIPT")

git config --global init.templatedir '~/git_template'

mkdir -p ~/.git_template/hooks

cp $DIR/ctags ~/.git_template/hooks/ctags
cp $DIR/post-* ~/.git_template/hooks/.

echo "Finished setting up Ctags"
