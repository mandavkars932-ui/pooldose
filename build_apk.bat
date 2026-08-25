@echo off
echo ==========================================================
echo  Building PoolDose NOVA-M ORP Controller Android APK
echo ==========================================================

where flutter >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERROR] Flutter SDK not found in PATH. Download at https://flutter.dev
    pause
    exit /b 1
)

echo [1/2] Fetching packages...
call flutter pub get

echo [2/2] Compiling Release APK...
call flutter build apk --release

if %errorlevel% equ 0 (
    echo.
    echo ==========================================================
    echo [SUCCESS] APK compiled successfully!
    echo File: build\app\outputs\flutter-apk\app-release.apk
    echo ==========================================================
) else (
    echo [ERROR] Build failed.
)
pause
