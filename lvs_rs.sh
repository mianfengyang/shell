#!/bin/bash
rs_vip=192.168.138.100
case $1 in
	start)
		echo "start config lvs-realserver arp_ignore to 1 and arp_announce to 2"
		echo 1 >/proc/sys/net/ipv4/conf/lo/arp_ignore
		echo 2 >/proc/sys/net/ipv4/conf/lo/arp_announce
		echo 1 >/proc/sys/net/ipv4/conf/all/arp_ignore
		echo 2 >/proc/sys/net/ipv4/conf/all/arp_announce
		ifconfig lo:0 $rs_vip netmask 255.255.255.255 broadcast $rs_vip up
		echo "config success"
		;;
	stop)
		echo "start config lvs-realserver arp_ignore and arp_announce to 0"
		echo 0 >/proc/sys/net/ipv4/conf/lo/arp_ignore
		echo 0 >/proc/sys/net/ipv4/conf/lo/arp_announce
		echo 0 >/proc/sys/net/ipv4/conf/all/arp_ignore
		echo 0 >/proc/sys/net/ipv4/conf/all/arp_announce
		ifconfig lo:0 down
		echo "config success"
		;;
	*)
		echo "Usage start | stop"
esac
		
