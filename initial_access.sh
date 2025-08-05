#!/bin/bash
echo "[+] Running basic recon as $(whoami)"

echo -e "\n[+] Kernel info:"
uname -a

echo -e "\n[+] OS info:"
cat /etc/os-release 2>/dev/null

echo -e "\n[+] Current user and groups:"
id

echo -e "\n[+] Home directories:"
ls -lh /home/

echo -e "\n[+] Network interfaces:"
ip addr show

echo -e "\n[+] Open network connections:"
ss -tuln

echo -e "\n[+] Users with login shell:"
grep -vE '(/false|/nologin)' /etc/passwd

echo -e "\n[+] Sudo privileges:"
sudo -l

echo -e "\n[+] Setuid files:"
find / -perm -4000 -type f 2>/dev/null

echo -e "\n[+] Cron jobs:"
cat /etc/crontab 2>/dev/null

echo -e "\n[+] Interesting capabilities:"
getcap -r / 2>/dev/null

