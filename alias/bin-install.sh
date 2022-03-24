#!/usr/bin/env bash

current_dir=$(cd "$(dirname "$0")" || exit;pwd)
source_cmd_dir=$current_dir/cmd
target_profile=$HOME/.bashrc
target_cmd_dir=$current_dir/.self_cmd

if [ ! -e "$target_cmd_dir" ]; then
  mkdir "$target_cmd_dir"
fi

cp "$source_cmd_dir"/* target_cmd_dir

source_cmd="source $target_cmd_dir/*.sh"
grep -q "$source_cmd" "$target_profile" &&
if [`grep -c "$source_cmd" $target_profile` -ne '0' ];then
  echo "\033[32m $line \033[0m"
else
  echo "\033[31m $line \033[0m"
fi
