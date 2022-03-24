#!/usr/bin/env bash

dist_file="./temp/app-alias"
if test -f $dist_file
then
  rm $dist_file
fi

echo "# auto generate applications list" >> $dist_file
for file in /Applications/*
do
  name=$(basename "$file")
  app_name=$(echo "$name" | cut -d . -f1 | sed 's/[ -]//g' | awk '{print tolower($0)}')
  app_escape_full_name=$(echo "$name" | sed 's/[ ]/\\ /g')
  echo "alias $app_name=\"open /Applications/$app_escape_full_name\"" >> $dist_file
done
