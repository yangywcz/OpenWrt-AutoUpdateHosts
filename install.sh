#!/bin/ash

# 定义远程脚本文件的 URL
SCRIPT_URL="https://raw.githubusercontent.com/Aethersailor/OpenWrt-AutoUpdateHosts/main/files/autoupdatehosts"
# 定义本地脚本文件的目标路径
SCRIPT_PATH="/etc/autoupdatehosts"
# 定义计划任务的时间（每天凌晨4点30分）
CRON_TIME="30 4 * * *"

echo "开始安装 AutoUpdateHosts 脚本..."

# 下载远程脚本文件到本地
echo "下载 AutoUpdateHosts 脚本文件..."
curl -o "$SCRIPT_PATH" "$SCRIPT_URL"

# 赋予脚本文件相应的权限
echo "赋予脚本文件权限..."
chmod +x "$SCRIPT_PATH"

# 添加定时任务
echo "添加定时任务..."
echo "$CRON_TIME /etc/autoupdatehosts" >> /etc/crontabs/root

echo "AutoUpdateHosts 脚本安装完成！"
