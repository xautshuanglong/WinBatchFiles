@echo off

:start
cls
netstat -ano | findstr 5678
Wscript Sleep1000.vbs
goto :start
