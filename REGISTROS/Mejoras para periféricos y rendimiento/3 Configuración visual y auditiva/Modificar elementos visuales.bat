@echo off
:: Archivo creado por xHybrid
color 5F
:title Archivo creado por xHybrid

:: Deshabilitar el pitido
setlocal EnableDelayedExpansion

:menu
cls

echo ==================================================================
echo                     Archivo creado por xHybrid
echo ==================================================================
echo  Presiona la tecla correspondiente para seleccionar una opcion:

echo  [Y] Ajustar para obtener el mejor rendimiento
echo  [R] Ajustar para obtener la mejor apariencia
echo  [S] Salir

:: Usar CHOICE correctamente con opciones Y, R y S sin emitir pitido
CHOICE /C YRS /N /M "Selecciona una opcion (Y, R, S): "

:: Guardar el resultado de la opción seleccionada
set opt=%ERRORLEVEL%

:: Validar la opción seleccionada
if %opt%==1 goto best_performance
if %opt%==2 goto best_appearance
if %opt%==3 exit

:: Si la opción no es válida, muestra un mensaje y vuelve al menú
echo Opcion invalida. Por favor, intenta de nuevo.
pause
goto menu

:: Mejor rendimiento (Y)
:best_performance
cls
echo Ajustando para obtener el mejor rendimiento...
:: Cambiar la configuración a "Ajustar para obtener el mejor rendimiento"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f
:: Ajustar clave para optimización de rendimiento
reg add "HKCU\Control Panel\Performance" /v VisualFXSetting /t REG_DWORD /d 2 /f
echo Configuración de mejor rendimiento aplicada correctamente.
goto menu

:: Mejor apariencia (R)
:best_appearance
cls
echo Ajustando para obtener la mejor apariencia...
:: Cambiar la configuración a "Ajustar para obtener la mejor apariencia"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 1 /f
:: Ajustar clave para maximizar apariencia visual
reg add "HKCU\Control Panel\Performance" /v VisualFXSetting /t REG_DWORD /d 1 /f
echo Configuración de mejor apariencia aplicada correctamente.
goto menu
