#!/usr/bin/env bash

if [ "x$DEV_HOST" != "x" ]; then
  url=$DEV_HOST
else
  url="http://localhost"
fi

if [ "x$1" != "x" ];then
  url="$url:$1"
fi

open /Applications/Google\ Chrome.app "$url"
