#!/bin/sh

SCRIPT=$(readlink -f "$0")
DIR=$(dirname "$SCRIPT")
. $DIR/utils.sh

help_msg="no"
options=""


while [[ $# -gt 0 ]]
do
  arg="$1"
  case $arg in
    -a|--all)
      options="cgv"
      shift
      ;;
    -c|--ctags)
      options="${options}c"
      shift
      ;;
    -g|--git)
      options="${options}g"
      shift
      ;;
    -v|--vim)
      options="${options}v"
      shift
      ;;
    -h|--help)
      help_msg="yes"
      shift
      ;;
    *)
      echo "Unknown argument '$1'"
      print_help
      exit
      ;;
  esac
done

if [[ "$options" = "" ]]
then
  help_msg="yes"
fi

if [[ "$help_msg" = "no" ]]
then
  for i in $(seq 1 ${#options})
  do
    option=${options:i-1:1}
    case $option in
      v)
        vim/setup.sh
        ;;
      g)
        git/setup.sh
        ;;
      c)
        ctags/setup.sh
        ;;
    esac
  done
else
  print_help
fi
