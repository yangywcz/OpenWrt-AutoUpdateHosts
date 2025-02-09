# OpenWrt-AutoUpdateHosts  

## 脚本功能
在 OpenWrt 下实现一键合并广告拦截规则以及其他加速规则至 hosts 文件，无需套娃其他插件即可利用 Dnsmasq 实现去广告以及 DNS 加速功能，可配合系统计划任务实现每日自动合并上游规则至本地 hosts 文件中    
目前脚本采用的上游规则为[秋风广告规则](https://github.com/TG-Twilight/AWAvenue-Ads-Rule)以及 [GitHub520](https://github.com/521xueweihan/GitHub520) 加速规则  

已在 OpenWrt SNAPSHOT 和 ImmortalWrt SNAPSHOT 下通过测试

如果你是新手小白，不会配置各种 DNS 插件以及广告屏蔽插件，那么本项目可以让你一键实现自动化更新的广告屏蔽功能。

如搭配 OpenClash 推荐配合本人另一个仓库的 OpenClash 订阅模板使用：  
[Custom_OpenClash_Rules](https://github.com/Aethersailor/Custom_OpenClash_Rules)  
只需要 OpenClash 一个插件，无需套娃任何其他插件，即可实现效果完美的科学上网分流，且 DNS 解析无污染无泄漏泄露，国内域名自动绕过内核，可与本项目搭配一起使用 

## 使用方法  
### 一键安装  
SSH 登录 OpenWrt，运行以下命令即可执行一键安装脚本（脚本下载链接已经过 GitHub Proxy 代理加速）  
```bash
curl -sSL https://github.moeyy.xyz/https://raw.githubusercontent.com/yangywcz/OpenWrt-AutoUpdateHosts/main/install.sh | sh
```
一键安装脚本运行时会依次执行以下功能：  
1. 改写 dnsmasq 设置，取消忽略 hosts 的选项  
2. 下载更新脚本 autoupdatehosts 至 /etc/autoupdatehosts 并赋予相应的权限  
3. 在计划任务中设置每日凌晨 4:30 分运行更新脚本  
4. 运行一次更新脚本。  

更新脚本运行时会依次执行以下功能：  
1. 检查 hosts 文件中是否存在过去由此脚本添加的规则并清除  
2. 下载最新的[秋风广告规则](https://github.com/TG-Twilight/AWAvenue-Ads-Rule)以及 [GitHub520](https://github.com/521xueweihan/GitHub520) 加速规则并合并至 /etc/hosts 文件
3. 重启 Dnsmasq 使 hosts 文件生效  

**如果 curl 命令执行不成功，可以自行下载 install.sh 文件到 root 目录下，然后执行 ./install.sh **  

**脚本不会破坏 hosts 文件内的原始内容以及人为手动添加的其他内容，不会重复添加内容，请放心食用**  
**如果需要人为添加其他 hosts 条目，请直接添加在 hosts 文件内容的尾部，不要添加在 start 与 end 注释之间**  

更新脚本每次运行完后，若检测到安装了 OpenClash 会自动重启 OpenClash（OpenClash 会重启 Dnsmasq），若未安装 OpenClash 则会直接重启 Dnsmasq。  

## 感谢  
以下排名不分先后  
- [TG-Twilight/AWAvenue-Ads-Rule](https://github.com/TG-Twilight/AWAvenue-Ads-Rule)  
- [521xueweihan/GitHub520](https://github.com/521xueweihan/GitHub520)  

# License		
[![](https://licensebuttons.net/l/by-sa/4.0/88x31.png)](https://creativecommons.org/licenses/by-sa/4.0/deed.zh)
* CC-BY-SA-4.0  

## Star History

<a href="https://star-history.com/#Aethersailor/OpenWrt-AutoUpdateHosts&Date">
 <picture>
   <source media="(prefers-color-scheme: dark)" srcset="https://api.star-history.com/svg?repos=Aethersailor/OpenWrt-AutoUpdateHosts&type=Date&theme=dark" />
   <source media="(prefers-color-scheme: light)" srcset="https://api.star-history.com/svg?repos=Aethersailor/OpenWrt-AutoUpdateHosts&type=Date" />
   <img alt="Star History Chart" src="https://api.star-history.com/svg?repos=Aethersailor/OpenWrt-AutoUpdateHosts&type=Date" />
 </picture>
</a>
