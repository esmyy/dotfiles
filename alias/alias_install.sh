#!/usr/bin/env bash

current_dir=$(cd "$(dirname "$0")" || exit;pwd)
source_alias_dir=$current_dir/alias
target_profile=$HOME/.bashrc

if [ ! -e "$target_profile" ]; then
  touch "$target_profile"
fi

{
  printf "\n# ------------------------\n"
  echo "# AUTO INSTALL ALIAS START"
  echo "# $(date "+%Y-%m-%d %H:%M:%S")"
  printf "# ------------------------\n"
} >> "$target_profile"

source "$current_dir/cmd/add_line_to_target_file.sh"
for file in "$source_alias_dir"/*
do
    while IFS= read -r line;
    do
      if add_line_to_target_file "$line" "$target_profile";then
        echo "\033[32m $line \033[0m"
      else
        echo "\033[31m $line \033[0m"
      fi
    done < "$file"
done

{
  printf "# ------------------------\n"
  echo "# AUTO INSTALL ALIAS END"
  printf "# ------------------------\n"
} >> "$target_profile"

# shellcheck source=$HOME/.bashrc
source "$HOME"/.bashrc
