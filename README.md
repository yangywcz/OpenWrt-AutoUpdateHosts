# OpenWrt-AutoUpdateHosts  

## 脚本功能
在 OpenWrt 下实现一键合并广告拦截规则以及其他加速规则至 hosts 文件，并自动重启 OpenClash 和 Dnsmasq，无需套娃其他插件即可利用 Dnsmasq 实现去广告以及 DNS 加速功能  
可配合系统计划任务实现每日自动更新  
目前脚本采用[秋风广告规则](https://github.com/TG-Twilight/AWAvenue-Ads-Rule)以及 [GitHub520](https://github.com/TG-Twilight/AWAvenue-Ads-Rule) 加速规则  
脚本可以自动清除旧规则再合并新规则，不会出现重复添加的情况，请放心食用  

## 使用方法  
1.一键安装  
SSH 登录 OpenWrt，运行以下命令  
```bash
curl -sSL https://raw.githubusercontent.com/Aethersailor/OpenWrt-AutoUpdateHosts/main/install.sh | sh
```
脚本会自动下载至/etc目录下，并立即更新一次 hosts 文件，且会在计划任务中设置每日凌晨 4:30 分自动更新合并hosts文件  

2.手动安装  
下载本项目的脚本，下载地址：  
https://raw.githubusercontent.com/Aethersailor/OpenWrt-AutoUpdateHosts/main/files/autoupdatehosts  
下载本项目的脚本文件，放置于你想放置的目录，如/etc目录下  
赋予脚本相应的权限，运行即可。可在计划任务中自行添加定时循环运行  


## 感谢  
- [TG-Twilight/AWAvenue-Ads-Rule](https://github.com/TG-Twilight/AWAvenue-Ads-Rule)  
- [521xueweihan/GitHub520](521xueweihan/GitHub520)  
