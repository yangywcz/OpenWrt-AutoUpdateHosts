# OpenWrt-AutoUpdateHosts  

## 脚本功能
在 OpenWrt 下实现一键合并广告拦截规则以及其他加速规则至 hosts 文件，无需套娃其他插件即可利用 Dnsmasq 实现去广告以及 DNS 加速功能，可配合系统计划任务实现每日自动合并上游规则至本地 hosts 文件中    
目前脚本采用[秋风广告规则](https://github.com/TG-Twilight/AWAvenue-Ads-Rule)以及 [GitHub520](https://github.com/521xueweihan/GitHub520) 加速规则  

已在 ImmortalWrt 和 LEDE 下通过测试，再也不用操心 OpenClash 与各种插件套娃的问题了！这个劫持那个劫持的统统见鬼去吧！彻底告别广告屏蔽插件！
建议配合本人另一个仓库的 OpenClash 订阅模板使用：  
[Custom_OpenClash_Rules](https://github.com/Aethersailor/Custom_OpenClash_Rules)  
只需要 OpenClash 一个插件，无需套娃任何其他插件，即可实现效果完美的科学上网分流，且 DNS 解析无污染无泄漏泄露，国内域名自动绕过内核，可与本项目一起使用 

## 使用方法  
### 一键安装  
SSH 登录 OpenWrt，运行以下命令  
```bash
curl -sSL https://raw.githubusercontent.com/Aethersailor/OpenWrt-AutoUpdateHosts/main/install.sh | sh
```
一键安装脚本会依次执行以下功能：  
1. 改写 dnsmasq 设置，取消忽略 hosts 的选项；  
2. 下载更新脚本 autoupdatehosts 至 /etc 目录下；  
3. 在计划任务中设置每日凌晨 4:30 分运行更新脚本；  
4. 运行一次更新脚本。  

更新脚本每次运行时，会先清除 hosts 文件内上次添加的规则，再合并新规则，不会破坏 hosts文件内的原始内容以及人为手动添加的其他内容，请放心食用

更新脚本每次运行完后，会自动重启 Dnsmasq，若检测到安装了 OpenClash 则会自动重启 OpenClash（OpenClash 会重启 Dnsmasq），若未安装 OpenClash 则会直接重启 Dnsmasq 使 hosts 文件生效。  
## 感谢  
- [TG-Twilight/AWAvenue-Ads-Rule](https://github.com/TG-Twilight/AWAvenue-Ads-Rule)  
- [521xueweihan/GitHub520](https://github.com/521xueweihan/GitHub520)  
