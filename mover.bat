cd /d "%~dp0"
del ..\.minecraft\mods\offlineskins-1.20.1-v1.jar
rmdir /s /q "..\.minecraft\Distant_Horizons_server_data"


robocopy ".minecraft" "..\.minecraft" /move /e
pause