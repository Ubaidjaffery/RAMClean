@echo off

fsutil behavior query memoryusage
fsutil behavior set memoryusage 2

%windir%\system32\rundll32.exe advapi32.dll,ProcessIdleTasks

bcdedit /set increaseuserva 8000

Del /S /F /Q %temp%
Del /S /F /Q %Windir%\Temp

bcdedit /set disabledynamictick yes
bcdedit /set useplatformtick yes
bcdedit /set useplatformclock false

REG add "HKCU\Control Panel" /v ForegroundLockTimeout /t REG_DWORD /d 0 /f 
REG add "HKCU\Control Panel" /v MenuShowDelay /t REG_SZ /d 100 /f
REG add "HKLM\SYSTEM\CurrentControlSet\Control" /v WaitToKillServiceTimeout /t REG_SZ /d 5000 /f 