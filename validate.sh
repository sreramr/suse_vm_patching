#!/bin/bash

echo "date"
date
echo
echo "uname -a"
uname -a
echo
echo "suse Release"
cat /etc/*release
echo
echo "uptime"
uptime  | awk -F " " '{print $3 $4}'
echo
echo "df -h"
df -h
echo
echo "mount"
mount
echo
echo "fstab"
cat /etc/fstab
echo
echo "rc.local"
cat /etc/rc.local
echo
echo "route"
route -n
echo
echo "netstat info"
netstat -ni
echo
echo "LISTENING PORTS"
lsof -i -P -n | grep LISTEN
echo
echo "nimbus"
ps -ef | grep -i nimbus
echo
echo "ifconfig"
ifconfig -a | egrep  -i "inet addr|HWaddr"
echo
echo "ip addr"
ip addr
echo
echo "modprobe.conf"
cat /etc/modprobe.conf
echo
echo "ifconfig files"
intrfcs=`ifconfig | grep HWaddr| awk '{print $1}'`
for i in $intrfcs
do
cat /etc/sysconfig/network-scripts/ifcfg-$i
cp /etc/sysconfig/network-scripts/ifcfg-$i /root/
echo
done
echo
echo "Total Memory"
cat /proc/meminfo | grep -i MemTotal
echo
echo "lvm"
lvdisplay
echo
vgdisplay
echo
echo
echo
lvmdiskscan
echo "UserInfo"
echo
cat /etc/passwd
echo "GroupInfo"
cat /etc/group
echo "PaaswdInfo"
cat /etc/passwd
echo  "Inittab-Info"
cat /etc/inittab
echo "NsSwitch Info"
cat /etc/nsswitch.conf
echo "resolv-Info"
cat /etc/resolv.conf
echo
vgs
echo "lvs-devices"
echo
lvs -a -o +devices
echo "VxDG info"
echo
vxdg list
echo "Full details of DG"
echo
vxdisk -o alldgs list
echo
cat /etc/redhat-release
echo
echo "hosts file"
cat /etc/hosts
echo
echo "network file"
cat /etc/sysconfig/network
echo
#cp /etc/sysconfig/network-scripts/ifcfg-eth* /root/
#echo "ps -ef"
#ps -ef
echo
echo "ntp server"
cat /etc/ntp.conf
echo
echo "ntpq out"
#ntpq -p
ntpq -p | awk -F " " '{print $1}'
echo
echo "Routes"
netstat -nr
echo
echo
echo
echo "Kdump status"
#chkconfig --list kdump
systemctl list-unit-files | grep -i kdump
systemctl  status kdump
echo
echo
echo "Services information"
#chkconfig --list
systemctl list-unit-files
echo
echo
echo "NFS shares exported from file"
cat /etc/exports
exportfs -v
echo "VCSInfo"
echo
hastatus -summ
echo "main.cf&&types.cf"
echo
cat /etc/VRTSvcs/conf/config/main.cf
echo
cat /etc/VRTSvcs/conf/config/types.cf
echo "gab&&llt"
echo
cat /etc/gabtab
echo
cat /etc/llttab
echo "Grub info"
echo
cat /boot/grub2/grub.cfg
echo "Sysctl info"
echo
cat /etc/sysctl.conf
echo
crontab -l
echo
echo "Mail host"
cat /etc/postfix/main.cf | grep -v "#"
echo
echo "postfix status"
ps -ef | grep -i postfix
echo
