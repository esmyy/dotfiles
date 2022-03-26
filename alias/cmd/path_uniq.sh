#!/usr/bin/env bash

PATH=$(echo "$PATH" | sed 's/:/\n/g' | sort | uniq | tr -s '\n' ':' | sed 's/:$//g')
