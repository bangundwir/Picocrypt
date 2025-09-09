@echo off
setlocal enabledelayedexpansion

REM Build Picocrypt for Windows with GUI subsystem and stripped symbols
REM Usage: build.bat [version]

set VERSION=%1
if "%VERSION%"=="" (
  for /f "usebackq tokens=*" %%i in ("..\..\VERSION") do set VERSION=%%i
)

if not exist ..\..\src\Picocrypt.go (
  echo Could not find src\Picocrypt.go
  exit /b 1
)

set OUT=Picocrypt-%VERSION%-windows-amd64.exe

pushd ..\..\src
set CGO_ENABLED=1
REM Embed version via -X (optional target variable not present now, placeholder)
go build -ldflags="-s -w -H=windowsgui" -o ..\dist\windows\%OUT% Picocrypt.go
if errorlevel 1 (
  echo Build failed
  popd
  exit /b 1
)
popd

echo Built dist\windows\%OUT%

endlocal
