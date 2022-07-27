# RAM Cleaning / Memory Cleaning Script
A customized script to prevent showing data from the memory, an anti-forensic technique to combat against memory forensic.

#The Script <br>
@echo off <br>
fsutil behavior query memoryusage<br>
fsutil behavior set memoryusage 2<br>
%windir%\system32\rundll32.exe advapi32.dll,ProcessIdleTasks<br>
bcdedit /set increaseuserva 8000 <br>
Del /S /F /Q %temp% <br>
Del /S /F /Q %Windir%\Temp <br>
bcdedit /set disabledynamictick yes <br>
bcdedit /set useplatformtick yes <br>
bcdedit /set useplatformclock false <br>

REG add "HKCU\Control Panel" /v ForegroundLockTimeout /t REG_DWORD /d 0 /f <br>
REG add "HKCU\Control Panel" /v MenuShowDelay /t REG_SZ /d 100 /f <br>
REG add "HKLM\SYSTEM\CurrentControlSet\Control" /v WaitToKillServiceTimeout /t REG_SZ /d 5000 /f <br>

# Description of Commands

<strong>fsutil behavior set memoryusage 2</strong> (Setting memoryusage to 2 raises the limit of paged pool memory. This might improve performance if your system is opening and closing many files in the same file set and is not already using large amounts of system memory for other apps or for cache memory).<br>
<strong> bcdedit /set increaseuserva 8000 </strong> (Note: The value varies depending on your RAM (for e.g. if you have 16GB of RAM the value would be 16000)<br>
<strong> Del /S /F /Q %temp% </strong>(This will clear the Userprofile Temp folder)<br>
<strong> Del /S /F /Q %Windir%\Temp </strong> (This will clear the Windows temp folder)<br>
<strong> bcdedit /set disabledynamictick yes</strong> (This command forces the kernel timer to constantly poll for interrupts instead of wait for them).<br>
<strong> bcdedit /set useplatformtick yes </strong> (This command forces the clock to be backed by a platform source, no synthetic timers are allowed)<br>
<strong> bcdedit /set useplatformclock false </strong> (TSC is reliable and will give you the lowest latency and highest fps)

Note: Whenever the script will be executed it will clear the page memory, cache, temporary files, background processes, and idle processes

#End of File
