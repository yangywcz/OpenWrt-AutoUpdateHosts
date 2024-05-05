# OpenWrt-AutoUpdateHosts  

## 脚本功能
在 OpenWrt 下实现一键合并广告拦截规则以及其他加速规则至 hosts 文件，并自动重启 OpenClash 和 Dnsmasq，无需套娃其他插件即可利用 Dnsmasq 实现去广告以及 DNS 加速功能  
可配合系统计划任务实现每日自动更新  
目前脚本采用[秋风广告规则](https://github.com/TG-Twilight/AWAvenue-Ads-Rule)以及 [GitHub520](https://github.com/TG-Twilight/AWAvenue-Ads-Rule) 加速规则  

## 使用方法  
1.手动安装  
下载本项目的脚本，下载地址：  
https://raw.githubusercontent.com/Aethersailor/OpenWrt-AutoUpdateHosts/main/files/autoupdatehosts  
下载本项目的脚本文件，放置于你想放置的目录，如/etc目录下  
赋予脚本相应的权限，运行即可。可在计划任务中自行添加定时循环运行  

2.一键安装  
SSH 登录 OpenWrt  
curl -sSL https://raw.githubusercontent.com/Aethersailor/OpenWrt-AutoUpdateHosts/main/install.sh | sh
  
每日自动更新时间默认为凌晨4时30分  
## 感谢  
- [TG-Twilight/AWAvenue-Ads-Rule](https://github.com/TG-Twilight/AWAvenue-Ads-Rule)  
- [521xueweihan/GitHub520](521xueweihan/GitHub520)  
