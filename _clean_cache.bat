:: this file will clean the cache & backup files
:: The `Cache` folder is located inside %LOCALAPPDATA%. No need to worry about 
:: it, because it's local to machine.
@echo off
setlocal

set PORTABLE_ROOT=%~dp0
set PORTABLE_DATA_ROOT=%PORTABLE_ROOT%\Data

:: this simulate a array, in which store all the files/folders that need
:: to be deleted

set DELFOLDER@Backup=%PORTABLE_DATA_ROOT%\Backup

set DELFILE@Cookies=%PORTABLE_DATA_ROOT%\dummy-dummy

:: display some
echo "WARNING: some files/folders will be deleted in Data folder.."

:: delete folders

for /f "tokens=2 delims==" %%a in ('set DELFOLDER') do (
    if exist %%a (
        rmdir /s /q %%a
    )
)

:: delete files

for /f "tokens=2 delims==" %%a in ('set DELFILE') do (
    if exist %%a (
        del /q %%a
    )
)

pause
endlocal
