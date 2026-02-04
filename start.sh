#!/bin/bash

# 修复：切换到脚本所在目录，确保路径基准正确
SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
cd "$SCRIPT_DIR" || (echo "cd error" && exit 1)

# 获取当前日期时间的不同组成部分
current_year=$(date +%Y)
current_month=$(date +%m)
current_day=$(date +%d)
current_time=$(date +%H%M%S)

# 构建完整的目录路径（基于脚本位置）
target_dir="./data/${current_year}/${current_month}/${current_day}/${current_time}"

# 创建多级目录（如果不存在）
mkdir -p "$target_dir"

# 创建空的crops.txt文件
touch "${target_dir}/crops.txt"
git add .
git commit -m "auto commit $(date)" # 在提交信息中加入时间戳更好区分
git push github master