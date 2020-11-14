[![996.icu](https://img.shields.io/badge/link-996.icu-red.svg)](https://996.icu)
[![LICENSE](https://img.shields.io/badge/license-Anti%20996-blue.svg)](https://github.com/996icu/996.ICU/blob/master/LICENSE)

# Introduction

This is a custom defconfig for [buildroot](https://buildroot.org/).

## feature

20201104: 
 - add **openssh**、**autossh**、**sshpass**. 
 - change **initV** to **systemd**
 - add *autossh.service* and *autossh.sh*. 
 
 Could open a [revert ssh connection ](https://www.ssh.com/ssh/tunneling/example) at system startup, then you can connect to your board anywhere. 

 Especilly  convenient for doing your own study at work, **[ANTI 996](https://github.com/996icu/996.ICU)**!


 ------------------------------------------------------------

# 简介

这是一个自定义的[buildroot](https://buildroot.org/)配置。

## 功能

20201104: 
 - 添加 **openssh**、**autossh**、**sshpass**. 
 - 更改启动系统，由 **initV** 更改为 **systemd**
 - 增加启动服务： *autossh.service* and *autossh.sh*. 
 
 可以在系统启动时自动建立一个[ssh反向通道](https://www.ssh.com/ssh/tunneling/example), 之后你可以在任意位置通过ssh访问你的开发板。

特别适合在上班的适合摸鱼, **[反对996 从我做起](https://github.com/996icu/996.ICU)**!
