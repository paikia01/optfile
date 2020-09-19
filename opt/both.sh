#!/bin/sh

killall wget
rm -rf /opt*

if [ -d "/opt" ]; then
  mount -t tmpfs -o size=20m tmpfs /opt
  sleep 15
  cd /opt
  wget -O /opt/opt.tar https://cdn.jsdelivr.net/gh/paikia01/optfile/opt/opttmpg7.tgz 
fi

if [$? = 0] ; then
	sleep 5
	cd /opt
	tar -zxvf opt.tar
	rm -rf opt.tar
	opkg update && opkg install wget ttyd
	logger -t "【wget】：已更新"
	logger -t "【opt环境】：安装完成"
	/opt/bin/ttyd -p 4200 bash >/dev/null 2>&1 & 
	echo "[opkg update]"
	echo "[opkg install wget ttyd]"
	logger -t "【ttyd】：启动成功"
fi