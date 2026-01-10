@echo off
setlocal

:: Set paths
set PROJECT_DIR=%~dp0
set BUNDLE_DIR=%PROJECT_DIR%flapper-ready-to-bundle\game
set OUTPUT_ZIP=%PROJECT_DIR%bundle.zip

:: Clean up previous bundle and zip
if exist "%BUNDLE_DIR%" rmdir /s /q "%BUNDLE_DIR%"
if exist "%OUTPUT_ZIP%" del "%OUTPUT_ZIP%"

:: Create bundle directory if it doesn't exist
mkdir "%BUNDLE_DIR%"

:: Copy main.lua and src to bundle
copy "%PROJECT_DIR%main.lua" "%BUNDLE_DIR%\"
xcopy "%PROJECT_DIR%src" "%BUNDLE_DIR%\src\" /E /I /Y

:: Use 7-Zip to create the archive
"C:\Program Files\7-Zip\7z.exe" a -tzip "%OUTPUT_ZIP%" "%PROJECT_DIR%flapper-ready-to-bundle\*"

echo.
echo Bundle and zip completed: %OUTPUT_ZIP%
pause