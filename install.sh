#!/bin/ash

# 定义远程脚本文件的 URL
SCRIPT_URL="https://raw.githubusercontent.com/Aethersailor/OpenWrt-AutoUpdateHosts/main/files/autoupdatehosts"
# 定义本地脚本文件的目标路径
SCRIPT_PATH="/etc/autoupdatehosts"
# 定义计划任务的时间（每天凌晨4点30分）
CRON_TIME="30 4 * * *"
# 定义 dnsmasq 配置文件路径
DNSMASQ_CONF="/etc/config/dhcp"

echo "开始安装 AutoUpdateHosts 脚本..."

# 下载远程脚本文件到本地，并显示下载进度
echo "下载 AutoUpdateHosts 脚本文件..."
curl -# -o "$SCRIPT_PATH" "$SCRIPT_URL"

# 赋予脚本文件相应的权限
echo "赋予脚本文件权限..."
chmod +x "$SCRIPT_PATH"

# 修改 dnsmasq 配置文件取消忽略 hosts 文件的设置，删除包含 "option nohosts" 的行
echo "修改 dnsmasq 配置文件，取消忽略 hosts 文件"
sed -i '/option nohosts/d' "$DNSMASQ_CONF"

# 添加定时任务
echo "添加定时任务，默认更新时间为每天4:30..."
echo "$CRON_TIME $SCRIPT_PATH" >> /etc/crontabs/root
echo "AutoUpdateHosts 脚本安装完成！"

# 运行脚本文件一次
echo "运行 AutoUpdateHosts 脚本文件..."
"$SCRIPT_PATH"
