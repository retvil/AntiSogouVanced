@echo off
setlocal
chcp 65001 >nul

echo ===========================================
echo   AntiSogou Build Script (both editions)
echo ===========================================

python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Python not found! Install Python from python.org
    pause
    exit /b
)

echo [1/4] Installing dependencies (psutil, ttkbootstrap, pyinstaller)...
python -m pip install --upgrade pip >nul
python -m pip install psutil ttkbootstrap pyinstaller >nul

echo [2/4] Building AntiSogouVanced.exe...
python -m PyInstaller --onefile --windowed --name AntiSogouVanced --hidden-import=psutil --collect-all ttkbootstrap --icon=logo.ico --add-data "logo.ico;." main.py
if %errorlevel% neq 0 (
    echo [ERROR] AntiSogouVanced build failed.
    pause
    exit /b
)

echo [3/4] Building AntiSogouExtended.exe...
python -m PyInstaller --onefile --windowed --name AntiSogouExtended --hidden-import=psutil --collect-all ttkbootstrap --icon=logo.ico --add-data "logo.ico;." main_extended.py
if %errorlevel% neq 0 (
    echo [ERROR] AntiSogouExtended build failed.
    pause
    exit /b
)

echo ===========================================
echo [4/4] Done! EXE files are in the dist folder
pause
