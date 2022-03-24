#!/usr/bin/env bash

current_dir=$(cd "$(dirname "$0")" || exit;pwd)
export target_profile=$HOME/.bashrc
export target_cmd_dir=$current_dir
export source_alias_dir=$current_dir/alias
