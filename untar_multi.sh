#!/bin/bash
#这个脚本是用来批量解压某个目录中的tar.gz格式的安装包
#这个脚本的初忠是想用脚本的方式搭建LNMP或LAMP环境的，这里是第一步。
cd /root/download
for i in `ls |grep gz`
do
  if [ -d ${i%%.tar.gz} ]
  then
    rm -rf $｛i%%.tar.gz}
    tar xf $i
    chown -R root:root ${i%%.tar.gz}
  else
    tar xf $i
    chown -R root:root ${i%%.tar.gz}
  fi
done
