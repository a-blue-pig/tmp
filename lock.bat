@echo off 
:loop 
echo Delta > C:\Inetpub\ftproot\banner.txt 
ping 127.0.0.1 -n 3 > nul 
goto loop 
