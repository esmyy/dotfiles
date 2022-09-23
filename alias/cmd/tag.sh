#!/usr/bin/env zsh

if [ "x$1" != "x" ];then
  tag="v$(date +%Y%m%d%H%M%S)-$1"
else
  tag="v$(date +%Y%m%d%H%M%S)"
fi

echo $tag
