#!/bin/bash

# Create user
username="services"
password="delta"

echo "[+] Creating user '$username'"
useradd -s /bin/bash "$username"

echo "[+] Setting password"
echo "$username:$password" | chpasswd

echo "[+] Giving sudo privileges"
echo "$username ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

echo "[+] Done. '$username'"

