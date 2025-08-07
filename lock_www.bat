@echo off 
:loop 
echo Delta > C:\Inetpub\wwwroot\banner.txt 
ping 127.0.0.1 -n 3 > nul 
goto loop 
