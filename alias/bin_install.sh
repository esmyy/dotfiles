#!/usr/bin/env bash

current_dir=$(cd "$(dirname "$0")" || exit;pwd)
source_cmd_dir=$current_dir/cmd
target_cmd_dir=/usr/local/bin # maybe not in PATH

if [ ! -d "$target_cmd_dir" ]; then
  echo "do it"
  mkdir "$target_cmd_dir"
fi

# copy to $PATH bin dir
for file in "$source_cmd_dir"/*
do
    chmod 755 "$file"
    name=$(basename "$file" | cut -d . -f1)
    cp "$file" "$target_cmd_dir/$name"
done

source "$current_dir/cmd/add_line_to_target_file.sh"

# shellcheck source=$HOME/.bashrc
source "$HOME"/.bashrc

