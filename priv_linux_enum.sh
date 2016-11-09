#!/bin/bash

echo -e "\nPrivilege Escalation Technique Script\n"

# Current User
echo -e "\n$(tput setaf 2)Current User:$(tput sgr 0)"
whoami
id


# OS Information
echo -e "\n$(tput setaf 2)OS Information$(tput sgr 0)"
echo -e "==============\n"

cat /etc/*-release 2>/dev/null
uname -a 2>/dev/null
echo -e "\n$(tput setaf 2)hostname:$(tput sgr 0)"
hostname
echo -e "\n$(tput setaf 2)Kernel Information:$(tput sgr 0)"
cat /proc/version


# passwd & shadow & group
echo -e "\n$(tput setaf 2)passwd,shadow:$(tput sgr 0)"
echo -e "\n$(tput setaf 2)/etc/passwd:$(tput sgr 0)"
cat /etc/passwd
echo -e "\n$(tput setaf 2)/etc/shadow:$(tput sgr 0)"
cat /etc/shadow
echo -e "\n$(tput setaf 2)/etc/group:$(tput sgr 0)"
cat /etc/group

# Files with sensitive words in them
echo -e "\n$(tput setaf 2)Files with 'password' in /var:$(tput sgr 0)"
#grep -rnw 'password' /var 2>/dev/null
echo -e "\n$(tput setaf 2)Files with 'password' in /etc':$(tput sgr 0)"
#grep -rnw 'password' /etc 2>/dev/null
echo -e "\n$(tput setaf 2)PHP files with 'password|DB_PASS|PASSWORD':$(tput sgr 0)"
grep -Rnw --include="*.php" 'password' /var/
grep -Rnw --include="*.php" 'DB_PASS' /var/www/
grep -Rnw --include="*.php" 'PASSWORD' /var/www/

# root,home
echo -e "\n$(tput setaf 2)ls -alHR:$(tput sgr 0)"
ls -aHlR /root/
ls -aHlR /home/
#ls -ahlR /var/

# Network information
echo -e "\n$(tput setaf 2)Network Information:$(tput sgr 0)"
ifconfig
echo -e "\n$(tput setaf 2)netstat:$(tput sgr 0)"
netstat -antp
netstat -tulnp
netstat -lntp
echo -e "\n$(tput setaf 2)route information:$(tput sgr 0)"
route
echo -e "\n$(tput setaf 2)nmap:$(tput sgr 0)"
nmap --version

#Current Processess
echo -e "\n$(tput setaf 2)Current Processes:$(tput sgr 0)"
ps aux
echo -e "\n$(tput setaf 2)Currents processes running as root:$(tput sgr 0)"
ps aux | grep root

# Current Users
echo -e "\n$(tput setaf 2)Current Users logged in system:$(tput sgr 0)"
finger
pink
users
who -a
w

# Permissions on files and files
#echo -e "\n$(tput setaf 2)Files with 777 permissions:$(tput sgr 0)"
#find / -type f -perm 0777 2>/dev/null
#echo -e "\n$(tput setaf 2)Folders with 777 permissions:$(tput sgr 0)"
#find / -type d -perm 0777 2>/dev/null
echo -e "\n$(tput setaf 2)Files with SUID owned by root:$(tput sgr 0)"
find / -type f -uid 0 -perm -4000 2>/dev/null
echo -e "\n$(tput setaf 2)Files with SUID permissions:$(tput sgr 0)"
find / -type f -perm -u=s 2>/dev/null
echo -e "\n$(tput setaf 2)Folders with SUID permissions:$(tput sgr 0)"
find / -type d -perm -u=s 2>/dev/null
echo -e "\n$(tput setaf 2)Files with SGID permissions:$(tput sgr 0)"
find / -tyope f -perm -g=s 2>/dev/null
#echo -e "\n$(tput setaf 2)Files readable to anyone in /etc/:$(tput sgr 0)"
#find /etc/ -readable -type f 2>/dev/null
#echo -e "\n$(tput setaf 2)Folders readable to anyone in /etc/:$(tput sgr 0)"
#find /etc/ -readable -type d 2>/dev/null

# Scheduled job tasks
echo -e "\n$(tput setaf 2)Show cron & at jobs:$(tput sgr 0)"
ls -al /etc/cron*
cat /etc/at.allow
cat /etc/cron.allow
cat /var/spool/cron/crontabs/root

# Package list & versions
echo -e "\n$(tput setaf 2)Package list & versions:$(tput sgr 0)"
dpkg -l 2>/dev/null
rpm -qa 2>/dev/null

# Mounted filesystems
echo "\n$(tput setaf 2)Mounted filesystems:$(tput sgr 0)"
mount
df -h

# Development tools & Upload tools
#echo -e "\n$(tput setaf 2)Upload tools:$(tput sgr 0)"
#find / -name wget 2>/dev/null
#find / -name nc* 2>/dev/null
#find / -name netcat* 2>/dev/null
#find / -name tftp 2>/dev/null
#find / -name ftp 2>/dev/null
#echo -e "\n$(tput setaf 2)Development tools:$(tput sgr 0)"
#find / -name perl* 2>/dev/null
#find / -name python* 2>/dev/null
#find / -name ruby* 2>/dev/null
#find / -name gcc* 2>/dev/null
#find / -name cc 2>/dev/null


# Logs

echo -en "\nLog Check: "

file /etc/httpd/logs/access_log
file /etc/httpd/logs/access.log
file /etc/httpd/logs/error_log
file /etc/httpd/logs/error.log
file /var/log/apache2/access_log
file /var/log/apache2/access.log
file /var/log/apache2/error_log
file /var/log/apache2/error.log
file /var/log/apache/access_log
file /var/log/apache/access.log
file /var/log/auth.log
file /var/log/chttp.log
file /var/log/cups/error_log
file /var/log/dpkg.log
file /var/log/faillog
file /var/log/httpd/access_log
file /var/log/httpd/access.log
file /var/log/httpd/error_log
file /var/log/httpd/error.log
file /var/log/lastlog
file /var/log/lighttpd/access.log
file /var/log/lighttpd/error.log
file /var/log/lighttpd/lighttpd.access.log
file /var/log/lighttpd/lighttpd.error.log
file /var/log/messages
file /var/log/secure
file /var/log/syslog
file /var/log/wtmp
file /var/log/xferlog
file /var/log/yum.log
file /var/run/utmp
file /var/webmin/miniserv.log
file /var/www/logs/access_log
file /var/www/logs/access.log
