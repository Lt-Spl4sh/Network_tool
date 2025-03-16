@echo off
title Live Network Monitor - Lt_Spl4sh
color 0A
mode con: cols=50 lines=15

:loop
cls
echo ==========================
echo  Live Network Monitor  
echo ==========================
for /f "tokens=2 delims=:" %%a in ('netsh wlan show interfaces ^| find "SSID"') do echo SSID:%%a
for /f "tokens=2 delims=:" %%a in ('netsh wlan show interfaces ^| find "Name"') do echo NIC:%%a
for /f "tokens=2 delims=:" %%a in ('netsh wlan show interfaces ^| find "State"') do echo Status:%%a
for /f "tokens=2 delims=:" %%a in ('netsh wlan show interfaces ^| find "Signal"') do echo Signal:%%a
for /f "tokens=2 delims=:" %%a in ('netsh wlan show interfaces ^| find "Receive rate"') do echo Speed:%%a Mbps

:: Ping Test
set host=8.8.8.8
for /f "tokens=7 delims== " %%a in ('ping -n 1 %host% ^| find "time="') do set ping=%%a
echo Ping: %ping%

echo ==========================
echo  [Press Ctrl+C to Exit]
echo ==========================
timeout /t 2 >nul
goto loop
