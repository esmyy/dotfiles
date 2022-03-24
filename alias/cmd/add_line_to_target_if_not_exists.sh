#!/usr/bin/env bash

add_line_to_target_file() {
  if [ `grep -c "$1" "$2"` -eq '0' ];
    then
      if [[ $1 =~ "/Applications/" ]]; then
        prev=$(echo "$1" | awk -F"/Applications/" '{print $1}')
        next=$(echo "$1" | awk -F"/Applications/" '{print $2}' | sed 's/[ ]/\\ /g')
        echo "$prev/Applications/$next" >> $2
      else
        echo "$1" >> "$2"
      fi
  fi
}

