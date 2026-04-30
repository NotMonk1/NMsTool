@echo off
title NMs Tool - Main
:: Made by NotMonk

set CURRENT_VERSION=1.02

curl -s https://pastebin.com/raw/ZVc8HCPr > "%TEMP%\latest_version.txt"
set /p LATEST_VERSION=<"%TEMP%\latest_version.txt"
del "%TEMP%\latest_version.txt"

if "%LATEST_VERSION%" neq "%CURRENT_VERSION%" (
    title NMs Tool - Update Available
    echo Update available! You are on %CURRENT_VERSION%, latest is %LATEST_VERSION%
    echo If you wish to continue using this version type "continue" else type "update" to open the download page.
    set /p choice=Enter choice: 
if "%choice%"=="continue" goto Main
if "%choice%"=="update" goto UPD
)
goto Main

:UPD
start https://github.com/NotMonk1/NMsTool
exit

:Main
cls
echo "/+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+\"
echo "/  _   _ __  __         _______          _  \"
echo "/ | \ | |  \/  |       |__   __|        | | \"
echo "/ |  \| | \  / |  ___     | | ___   ___ | | \"
echo "/ | . ` | |\/| | / __|    | |/ _ \ / _ \| | \"
echo "/ | |\  | |  | | \__ \    | | (_) | (_) | | \"
echo "/ |_| \_|_|  |_| |___/    |_|\___/ \___/|_| \"
echo "/        Made By NotMonk                    \"
echo "/+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+\"
echo .
echo 1. Windows only Stuff
echo 2. Gorilla Tag Stuff
echo 3. Media Player
echo 4. Credits
echo . TYPE QUIT TO EXIT .
echo .

set /p choice=Enter choice: 
if "%choice%"=="1" goto WindowsStuff
if "%choice%"=="2" goto Gtag_Stuff
if "%choice%"=="3" goto Media_Player
if "%choice%"=="3" goto Credits
if "%choice%"=="quit" exit

:WindowsStuff
cls
title NMs Tool - Windows Stuff
echo windows stuff soon
timeout /t 2 >nul
goto Main

:Gtag_Stuff
cls
title NMs Tool - Gtag Stuff
echo -----------------------
echo GORILLA TAG STUFF
echo -----------------------
echo .
echo 1. Return
echo 2. Start Gorilla Tag
echo 3. Install BepInEx
echo .

set /p choice=Enter choice: 
if "%choice%"=="1" goto Main
if "%choice%"=="2" start steam://rungameid/1533390
if "%choice%"=="3" goto BepInEx_Installer

:Media_Player
cls
title NMs Tool - Media Player

echo -------------
echo MEDIA PLAYER
echo -------------
echo .
echo 1. Return
cd C:\Users\%username%\Music
echo --------Files from C:\Users\%username%\Music--------
dir /b *.mp3 *.wav *.flac *.ogg 2>nul
echo ----------------------------------------------------
echo type the file name to play it (ex. WheelsOnTheBus.mp3)
~if "%media%"=="1" goto Main
if exist "%media%" (
	start "" "%media%"
	title NMs Tool - Playing %media%
	echo Playing %media%...
	timeout /t 6 >nul
	goto Media_Player
) else (
	echo File not found, returning to menu...
	timeout /t 2 >nul
	goto Media_Player
)

:Credits
cls
title NMs Tool - Credits
echo --------
echo CREDITS
echo --------
echo Version: 1.02
echo .
echo NotMonk | Owner - Made NMs Tool and currently all code
echo Mason | Owner - helps with coding
echo Seralyth - Made the menu installer i used as a base for the BepInEx installer
echo .



:: DO NOT MOVE!!
~
:: CREDIT TO SERALYTH (i literally js removed the Seralyth menu installer part :P)
:: Made by NotMonk (i dont take credit for anything but remaking iis dumbass BepInEx installer))

@echo off
setlocal enabledelayedexpansion
chcp ANSI

cls
title BepInEx Installer // [#---------] Getting directory
color 0e

:: Thanks to tdcvoid for telling me the new path for Oculus
set steamPath1="C:/Program Files (x86)/Steam/steamapps/common/Gorilla Tag"
set steamPath2="D:/SteamLibrary/steamapps/common/Gorilla Tag"
set steamPath3="C:/Program Files/Meta Horizon/Software/Software/another-axiom-gorilla-tag" 
set steamPath4="D:/Steam/steamapps/common/Gorilla Tag"

if exist %steamPath1% (
    set gamePath=%steamPath1%
) else if exist %steamPath2% (
    set gamePath=%steamPath2%
) else if exist %steamPath3% (
    set gamePath=%steamPath3%
) else if exist %steamPath4% (
    set gamePath=%steamPath4%
) else (
    color 0c
    set /p userPath=Gorilla Tag directory not found.
    pause
    exit /b
)

color 0e
cls
title BepInEx Installer // [###-------] Downloading BepInEx
curl -L "https://github.com/BepInEx/BepInEx/releases/download/v5.4.23.4/BepInEx_win_x64_5.4.23.4.zip" -o BPNX54234.zip

powershell -command "Expand-Archive -Path 'BPNX54234.zip' -DestinationPath '%gamePath%' -Force"

cls
title BepInEx Installer // [####------] Creating directories
mkdir %gamePath%/BepInEx/config
mkdir %gamePath%/BepInEx/plugins

cls
title BepInEx Installer // [#####-----] Downloading latest config
curl https://raw.githubusercontent.com/iiDk-the-actual/ModInfo/refs/heads/main/BepInEx.cfg -o %gamePath%/BepInEx/config/BepInEx.cfg

cls
title BepInEx Installer // [##########] Finished
echo BepInEx should now be installed!

del "BPNX54234.zip"

pause
