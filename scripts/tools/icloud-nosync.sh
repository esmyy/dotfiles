#!/bin/bash

######
# 遍历目录，查找其中不需要备份到iCloud的文件，处理成不备份方式
#####

function nosync {
  echo "set $1 nosync"
  mv $1 $1.nosync
  ln -s $1.nosync $1
}

# 不要备份到iCloud的目录
nosync_list=(
  'node_modules'
  '.git'
)

# 不用遍历的文件夹，因为这些显然不会存在node_modules等不需要备份的文件夹
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

root=${1:-pwd}
max_deep=${2:-1}

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
      nosync "$1"
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
