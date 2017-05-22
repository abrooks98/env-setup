#!/bin/sh

confirm() {
  if [ -f "$1" ]
  then
    read -p "File '$1' already exists. Do you want to continue? " -n 1 -r
    if [[ ! $REPLY =~ ^[Yy]$ ]]
    then
      exit 1
    fi
  fi
}

print_help() {
  echo -e "Usage: setup.sh [OPTION]\n"
  echo "Options:"
  echo "  -h, --help   Print this help"
  echo "  -a, --all    Run all setups"
  echo "  -c, --ctags  Run Ctags setup"
  echo "  -g, --git    Run Git setup"
  echo "  -v, --vim    Run Vim setup"
}
