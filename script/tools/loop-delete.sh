#!/bin/bash

#####
# sh ./delete.sh [根目录] [最大深度]
# sh ./delete.sh . 1
# 根目录默认为., 深度默认为1表示遍历当前目录
#####

# 遍历时忽略的文件夹
ignore_list=(
  'test'
  'lib'
  'logs'
  'run'
  '.idea'
  'example'
  'examples'
  '.github'
  'build'
  'dist'
  'types'
  '.'
  '..'
)

# 要删除的文件
delete_list=(
  'node_modules'
  '.git'
)

root=${1:-pwd}
max_deep=${2:-1}

# 尚未做“带空格文件名”文件的处理
#####
# loop 根目录
#####
function loop {
  for file in `ls -a "$1"`
  do
    # 忽略的文件检查
    file_path="$1/$file"
    is_ignore=`echo "${ignore_list[*]}" | grep -wo "$file"` # 不用遍历的文件夹，类似.gitignore
    if [ "$is_ignore" != "" ]; then
      continue
    fi

    # 删除文件
    is_delete=`echo "${delete_list[*]}" | grep -wo "$file"`;
    if [ "$is_delete" != "" ]; then
      rm -rf "$file_path"
      echo "delete: $file_path"
    fi

    # 最大深度检查
    sub_dir=`echo "$file_path" | awk -F"$root" '{ print $2 }'`
    deep=`echo $sub_dir | grep -o / | grep -c /`
    if [ "$deep" -gt "$max_deep" ]; then
      break
    fi

    # 继续遍历
    if [ -d "$file_path" ]; then
      loop $file_path
    fi
  done
}

loop $root
