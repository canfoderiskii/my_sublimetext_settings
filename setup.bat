:: this file set up the environment for vscode.
::  1. check the %APPDATA%\Sublime Text 3 folders existance
::  2. create symbolic links for folders provided by my portable version

@echo off
setlocal

set PORTABLE_ROOT=%~dp0

set PORTABLE_DATA_ROOT=%~dp0\Data
set APPDATA_DATA_FOLDER="%APPDATA%\Sublime Text 3"

:: if folders exist, delete them
if exist %APPDATA_DATA_FOLDER% (
    @echo "WARNING: sublime's folder exist inside APPDATA, deleting.."
    rmdir /s /q %APPDATA_DATA_FOLDER%
)

:: create symbolic links
mklink /d %APPDATA_DATA_FOLDER% %PORTABLE_DATA_ROOT%

:: check if folders are created, due to FAT32 does not support link
if not exist %APPDATA_DATA_FOLDER% (
    @echo "ERROR: create code folder link failed, aborting.."
    exit 1
)

pause
endlocal
