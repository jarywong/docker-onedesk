# [OneDesk](https://github.com/jarywong/docker-onedesk)

[![GitHub Stars](https://img.shields.io/github/stars/jarywong/docker-onedesk?style=flat-square&logo=github&color=yellow)](https://github.com/jarywong/docker-onedesk/stargazers)
[![GitHub Forks](https://img.shields.io/github/forks/jarywong/docker-onedesk?style=flat-square&logo=github&color=blue)](https://github.com/jarywong/docker-onedesk/network/members)
[![GitHub Issues](https://img.shields.io/github/issues/jarywong/docker-onedesk?style=flat-square&logo=github&color=red)](https://github.com/jarywong/docker-onedesk/issues)
[![GitHub License](https://img.shields.io/github/license/jarywong/docker-onedesk?style=flat-square&color=green)](https://github.com/jarywong/docker-onedesk/blob/master/LICENSE)
[![Docker Pulls](https://img.shields.io/docker/pulls/jarywong/docker-onedesk?style=flat-square&logo=docker&color=blue)](https://hub.docker.com/r/jarywong/docker-onedesk)
[![Docker Image Size](https://img.shields.io/docker/image-size/jarywong/docker-onedesk?style=flat-square&logo=docker&color=orange)](https://hub.docker.com/r/jarywong/docker-onedesk)
[![GitHub Release](https://img.shields.io/github/v/release/jarywong/docker-onedesk?style=flat-square&logo=github&include_prereleases)](https://github.com/jarywong/docker-onedesk/releases)
[![GitHub Last Commit](https://img.shields.io/github/last-commit/jarywong/docker-onedesk?style=flat-square&logo=github&color=purple)](https://github.com/jarywong/docker-onedesk/commits)

## 1. 项目简介

基于Docker的Linux综合桌面，内置微信、中文/日文输入法、Chromium浏览器、Edge浏览器，可通过浏览器、VNC、RDP进行访问。

## 2. 快速开始

### 2.1 Docker Compose
#### 2.1.1 克隆
```bash
git clone https://github.com/jarywong/docker-onedesk.git
cd docker-onedesk
```

#### 2.1.2 启动
```bash
docker compose up -d
# 旧版本的话，使用docker-compose up -d
```

#### 2.1.3 访问
##### ①浏览器（noVNC）
在浏览器中访问：https://localhost:3001 或 https://<服务器IP>:3001
推荐使用反向代理（反向代理端口指向3000）

##### ②VNC
使用RealVNC Viewer等VNC客户端连接<服务器IP>，密码使用指定的VNC_PASSWORD

##### ③RDP
使用Windows或者Mac的远程桌面连接<服务器IP>，Session选择Xorg，默认用户名密码为：abc/abc

```
！注意：noVNC、VNC、RDP不是在一个session，所以访问的不是同一个桌面，尽量保持一种访问方式。
网速较慢的时候，RDP是操作最流畅的访问方式。
```

#### 2.1.4 使用
##### ①输入法
浏览器访问时，可以直接使用客户端的输入法，VNC/RDP访问时，输入法切换可用快捷键Ctrl+Space进行切换。


## Star History

[![Star History Chart](https://api.star-history.com/svg?repos=jarywong/onedesk&type=Date)](https://www.star-history.com/#jarywong/onedesk&Date)
