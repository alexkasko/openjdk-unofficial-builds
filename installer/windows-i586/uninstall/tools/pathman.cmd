@echo off
"%~dp0pathman.exe" %*
if errorlevel 1 exit /b 0
if errorlevel 65536 exit /b 0
exit /b 1
