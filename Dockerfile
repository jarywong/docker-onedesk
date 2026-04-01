FROM ghcr.io/linuxserver/baseimage-selkies:debiantrixie

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="JaryWong"

# 标题
ENV TITLE=OneDesk
# 全屏/非全屏
ENV NO_FULL=true
# 时区
ENV TZ="Asia/Shanghai"
# 本地化
ENV LC_ALL="zh_CN.UTF-8"

# 添加icon
COPY assets/icon.png /usr/share/selkies/www/icon.png

# 基础
RUN \
  echo "**** install packages ****" && \
  apt-get update && \
  apt-get install -y --no-install-recommends \
    fonts-noto-cjk \
    tint2

# 终端（不想用xterm的话）
#RUN \
#  echo "**** install terminal ****" && \
#  apt-get install -y xfce4-terminal

# 文件管理器
RUN \
  apt-get install -y --no-install-recommends \
    caja

# Chromium
RUN \
  echo "**** install chromium ****" && \
  apt-get install -y --no-install-recommends \
    chromium \
    chromium-l10n && \
  mv \
    /usr/bin/chromium \
    /usr/bin/chromium-real

# RDP（Windows的远程连接，网络不是很好的时候，RDP更流畅）
RUN apt-get install -y xrdp

# VNC（应用程序）
RUN apt-get install -y tigervnc-standalone-server tigervnc-common

# 添加输入法（输入法适用于VNC或者RDP连接时）
RUN \
  echo "**** install input methods ****" && \
  apt-get install -y \
    fcitx5 \
    # 日语
    fcitx5-mozc \
    # 中文
    fcitx5-chinese-addons \
    fcitx5-configtool

# 微信
RUN \
  echo "**** install weixin ****" && \
  curl -o \
    /tmp/weixin.app -L \
    "https://dldir1v6.qq.com/weixin/Universal/Linux/WeChatLinux_x86_64.AppImage" && \
  cd /tmp && \
  chmod +x weixin.app && \
  ./weixin.app --appimage-extract && \
  mv \
    squashfs-root \
    /opt/weixin && \
  echo "**** application tweaks ****" && \
  ln -s \
    /opt/weixin/AppRun \
    /usr/bin/wechat && \
  cp \
    /opt/weixin/wechat.png \
    /usr/share/icons/hicolor/48x48/apps/ && \
  cp \
    /opt/weixin/wechat.desktop \
    /usr/share/applications/ && \
  sed -i \
    's/AppRun/wechat/g' \
    /usr/share/applications/wechat.desktop

# Edge
RUN \
  echo "**** install edge ****" && \
  if [ -z ${EDGE_VERSION+x} ]; then \
    EDGE_VERSION=$(curl -sL https://packages.microsoft.com/repos/edge/pool/main/m/microsoft-edge-stable/ | awk -F'(<a href="microsoft-edge-stable_|_amd64.deb")' '/href=/ {print $2}' | sort --version-sort | tail -1); \
  fi && \
  curl -o \
    /tmp/edge.deb -L \
    "https://packages.microsoft.com/repos/edge/pool/main/m/microsoft-edge-stable/microsoft-edge-stable_${EDGE_VERSION}_amd64.deb" && \
  apt install --no-install-recommends -y \
    /tmp/edge.deb && \
  echo "**** edge docker tweaks ****" && \
  mv \
    /usr/bin/microsoft-edge \
    /usr/bin/microsoft-edge-real

# VS Code
#RUN \
#  echo "**** install vscode ****" && \
#  wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /etc/apt/trusted.gpg.d/microsoft.gpg && \
#  echo "deb [arch=amd64] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list && \
#  sudo apt-get update && \
#  sudo apt-get install -y code

# 清理
RUN \
  echo "cleanup" && \
  apt-get purge -y --autoremove && \
  apt-get autoclean && \
  rm -fr \
    /config/.cache \
    /var/lib/apt/list/* \
    /var/tmp/* \
    /tmp/*

# add local files
COPY /root /

VOLUME /config
