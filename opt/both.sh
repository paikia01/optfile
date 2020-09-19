#!/bin/sh

 if [ ! -d "/opt/bin" ]; then
  mount -t tmpfs -o size=24m tmpfs /opt
  else
  echo "[opt is mount  !  !  !]"
 fi

cd /opt
wget -O /opt/opt.tar https://cdn.jsdelivr.net/gh/paikia01/optfile/opt/opttmpg7.tgz
tar -zxf opt.tar
rm -rf opt.tar
logger -t "【opt环境】：安装完成"
if [ $? = 0 ]; then
 opkg update 
fi
logger -t "【opt环境】：已更新"

logger -t "【opt】：正在安装ttyd"
if [ $? = 0 ]; then
opkg install ttyd
fi

if [ $? = 0 ]; then
 /opt/bin/ttyd -p 4200 bash >/dev/null 2>&1 &
fi
logger -t "【ttyd】：启动成功"
