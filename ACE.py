#!/usr/bin/env python2

import subprocess
import re
import time

# Subnets to watch
subnets = [
    "10.1.30.", "10.1.40.", "10.1.50.",
    "10.1.20.", "10.1.70.", "10.1.90."
]

def check_output_compat(cmd):
    """Python 2-compatible subprocess.check_output"""
    return subprocess.Popen(cmd, stdout=subprocess.PIPE).communicate()[0]

def get_ftp_connections():
    output = check_output_compat(["netstat", "-antp"])
    connections = []
    lines = output.splitlines()
    for line in lines:
        if "ESTABLISHED" in line and ":21" in line:
            parts = line.split()
            if len(parts) >= 7:
                foreign_ip = parts[4]
                pid_info = parts[6]
                ip_match = re.match(r"(\d+\.\d+\.\d+\.\d+):", foreign_ip)
                if ip_match:
                    ip = ip_match.group(1)
                    for subnet in subnets:
                        if ip.startswith(subnet):
                            pid_match = re.match(r"(\d+)/", pid_info)
                            if pid_match:
                                pid = pid_match.group(1)
                                connections.append((ip, pid))
    return connections

def kick_connections(connections):
    for ip, pid in connections:
        # print "[!] Kicking off connection from %s with PID %s" % (ip, pid)
        subprocess.call(["kill", "-9", pid])

def main():
    while True:
        connections = get_ftp_connections()
        if connections:
            kick_connections(connections)
        time.sleep(1)

if __name__ == "__main__":
    main()

