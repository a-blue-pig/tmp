@echo off
setlocal

:: Configuration
set "TARGET_FILE=C:\\Inetpub\wwwroot\banner.txt"
set "TARGET_FILEB=C:\\Inetpub\ftproot\banner.txt"
set "NEW_CONTENT=Delta"

:loop
(
    echo %NEW_CONTENT%
) > "%TARGET_FILE%"

(
    echo %NEW_CONTENT%
) > "%TARGET_FILEB%"
goto loop

