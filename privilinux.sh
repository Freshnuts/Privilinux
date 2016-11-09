#!/bin/bash
#
# Warning: Uncommenting certain commands will dig further but 
# the list will be extrenuous unless the piping/output is managed properly.
#

echo -e "\nPrivilinux: Post X enumeration script\n"
read
# Current User
echo -e "\nCurrent User:"
whoami
id


# OS Information
echo -e "\nOS Information"
echo -e "==============\n"

cat /etc/*-release 2>/dev/null
uname -a 2>/dev/null
echo -e "\nhostname:"
hostname
echo -e "\nKernel Information:"
cat /proc/version


# passwd & shadow & group
echo -e "\npasswd,shadow:"
echo -e "\n/etc/passwd:"
cat /etc/passwd
echo -e "\n/etc/shadow:"
cat /etc/shadow
echo -e "\n/etc/group:"
cat /etc/group

# Files with sensitive words in them
echo -e "\nFiles with 'password' in /var:"
#grep -rnw 'password' /var 2>/dev/null
echo -e "\nFiles with 'password' in /etc':"
#grep -rnw 'password' /etc 2>/dev/null
echo -e "\nPHP files with 'password|DB_PASS|PASSWORD':"
grep -Rnw --include="*.php" 'password' /var/www/
grep -Rnw --include="*.php" 'DB_PASS' /var/www/
grep -Rnw --include="*.php" 'PASSWORD' /var/www/

# root,home
echo -e "\nls -alHR:"
ls -aHlR /root/
ls -aHlR /home/
#ls -ahlR /var/

# Network information
echo -e "\nNetwork Information:"
ifconfig
echo -e "\nnetstat:"
netstat -antp
netstat -tulnp
netstat -lntp
echo -e "\nroute information:"
route
echo -e "\nnmap:"
nmap --version

#Current Processess
echo -e "\nCurrent Processes:"
ps aux
echo -e "\nCurrents processes running as root:"
ps aux | grep root

# Current Users
echo -e "\nCurrent Users logged in system:"
finger
pink
users
who -a
w

# Permissions on files and files
#echo -e "\nFiles with 777 permissions:"
#find / -type f -perm 0777 2>/dev/null
#echo -e "\nFolders with 777 permissions:"
#find / -type d -perm 0777 2>/dev/null
echo -e "\nFiles with SUID owned by root:"
find / -type f -uid 0 -perm -4000 2>/dev/null
echo -e "\nFiles with SUID permissions:"
find / -type f -perm -u=s 2>/dev/null
echo -e "\nFolders with SUID permissions:"
find / -type d -perm -u=s 2>/dev/null
echo -e "\nFiles with SGID permissions:"
find / -tyope f -perm -g=s 2>/dev/null
#echo -e "\nFiles readable to anyone in /etc/:"
#find /etc/ -readable -type f 2>/dev/null
#echo -e "\nFolders readable to anyone in /etc/:"
#find /etc/ -readable -type d 2>/dev/null

# Scheduled job tasks
echo -e "\nShow cron & at jobs:"
ls -al /etc/cron*
cat /etc/at.allow
cat /etc/cron.allow
cat /var/spool/cron/crontabs/root

# Package list & versions
echo -e "\nPackage list & versions:"
dpkg -l 2>/dev/null
rpm -qa 2>/dev/null

# Mounted filesystems
echo "\nMounted filesystems:"
mount
df -h

# Development tools & Upload tools
#echo -e "\nUpload tools:"
#find / -name wget 2>/dev/null
#find / -name nc* 2>/dev/null
#find / -name netcat* 2>/dev/null
#find / -name tftp 2>/dev/null
#find / -name ftp 2>/dev/null
#echo -e "\nDevelopment tools:"
#find / -name perl* 2>/dev/null
#find / -name python* 2>/dev/null
#find / -name ruby* 2>/dev/null
#find / -name gcc* 2>/dev/null
#find / -name cc 2>/dev/null


# Logs

echo -en "\nLog Check: "

file /etc/httpd/logs/access_log 2/dev/null
file /etc/httpd/logs/access.log 2/dev/null
file /etc/httpd/logs/error_log 2/dev/null
file /etc/httpd/logs/error.log 2/dev/null
file /var/log/apache2/access_log 2/dev/null
file /var/log/apache2/access.log 2/dev/null
file /var/log/apache2/error_log 2/dev/null
file /var/log/apache2/error.log 2/dev/null
file /var/log/apache/access_log 2/dev/null
file /var/log/apache/access.log 2/dev/null
file /var/log/auth.log 2/dev/null
file /var/log/chttp.log 2/dev/null
file /var/log/cups/error_log 2/dev/null
file /var/log/dpkg.log 2/dev/null
file /var/log/faillog 2/dev/null
file /var/log/httpd/access_log 2/dev/null
file /var/log/httpd/access.log 2/dev/null
file /var/log/httpd/error_log 2/dev/null
file /var/log/httpd/error.log 2/dev/null
file /var/log/lastlog 2/dev/null
file /var/log/lighttpd/access.log 2/dev/null
file /var/log/lighttpd/error.log 2/dev/null
file /var/log/lighttpd/lighttpd.access.log 2/dev/null
file /var/log/lighttpd/lighttpd.error.log 2/dev/null
file /var/log/messages 2/dev/null
file /var/log/secure 2/dev/null
file /var/log/syslog 2/dev/null
file /var/log/wtmp 2/dev/null
file /var/log/xferlog 2/dev/null
file /var/log/yum.log 2/dev/null
file /var/run/utmp 2/dev/null
file /var/webmin/miniserv.log 2/dev/null
file /var/www/logs/access_log 2/dev/null
file /var/www/logs/access.log 2/dev/null
