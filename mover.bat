cd /d "%~dp0"
del ..\.minecraft\mods\offlineskins-1.20.1-v1.jar
rmdir /s /q "..\.minecraft\Distant_Horizons_server_data"


robocopy ".minecraft" "..\.minecraft" /move /e
@echo off
setlocal enableextensions

:: Guardar la ruta de la carpeta actual
set currentDir=%~dp0

:: Guardar la ruta de la carpeta anterior (directorio padre)
set parentDir=%~dp0..
cd %parentDir%
set parentDir=%cd%

:: Crear el archivo cleanup.bat en la carpeta anterior
echo @echo off > "%parentDir%\cleanup.bat"
echo timeout /t 2 /nobreak >> "%parentDir%\cleanup.bat"
echo rd /s /q "%currentDir%" >> "%parentDir%\cleanup.bat"
echo del /q "%%~f0" >> "%parentDir%\cleanup.bat"

:: Ejecutar el archivo cleanup.bat desde la carpeta anterior
start "" "%parentDir%\cleanup.bat"

:: Salir
exit
