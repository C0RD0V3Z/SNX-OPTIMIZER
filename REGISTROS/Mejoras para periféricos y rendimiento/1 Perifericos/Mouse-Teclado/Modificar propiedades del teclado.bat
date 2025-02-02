@echo off
:: Archivo creado por xHybrid
color 5F
:title Configuracion de Teclado y Mouse

:menu
cls

echo ==================================================================
echo                     Archivo creado por xHybrid
echo ==================================================================
echo Este script ajustara las configuraciones del teclado y el mouse:
echo  - Retraso de repeticion: Corto (maximo a la derecha)
echo  - Velocidad de repeticion: Rapida (maximo a la derecha)
echo  - Desactivar "Mejorar la precision del puntero"
echo  - Velocidad del doble clic: En el medio (6ta rayita)
echo ==================================================================
echo Opciones:
echo  [S] Aplicar estos cambios.
echo  [R] Reestablecer valores a predeterminados.
echo  [N] Salir sin hacer cambios.
echo ==================================================================

:: Confirmacion del usuario antes de aplicar cambios
CHOICE /C SRN /N /M "Selecciona una opcion (S para aplicar, R para reestablecer, N para salir): "
if %ERRORLEVEL%==2 goto reset_changes
if %ERRORLEVEL%==3 exit
if %ERRORLEVEL%==1 goto apply_changes

:apply_changes
cls
echo ==================================================================
echo Estas a punto de aplicar las siguientes configuraciones:
echo  - Retraso de repeticion: Corto (maximo a la derecha).
echo  - Velocidad de repeticion: Rapida (maximo a la derecha).
echo  - Desactivar "Mejorar la precision del puntero".
echo  - Velocidad del doble clic: En el medio (6ta rayita).
echo ==================================================================

:: Confirmacion antes de aplicar cambios
echo Deseas aplicar estos cambios? (S para Si, N para No)
CHOICE /C SN /N /M "Selecciona una opcion (S para Si, N para No): "
if %ERRORLEVEL%==2 exit

echo Aplicando configuraciones...

:: Establecer Retraso de Repeticion a "Corto" (maximo a la derecha)
reg add "HKCU\Control Panel\Keyboard" /v KeyboardDelay /t REG_SZ /d 0 /f

:: Establecer Velocidad de Repeticion a "Rapida" (maximo a la derecha)
reg add "HKCU\Control Panel\Keyboard" /v KeyboardSpeed /t REG_SZ /d 31 /f

:: Desactivar "Mejorar la precision del puntero"
reg add "HKCU\Control Panel\Mouse" /v MouseEnhancePointerPrecision /t REG_DWORD /d 0 /f

:: Ajustar Velocidad del doble clic a la 6ta rayita (600)
reg add "HKCU\Control Panel\Mouse" /v DoubleClickSpeed /t REG_SZ /d 600 /f

echo Configuraciones aplicadas correctamente.
pause
exit

:reset_changes
cls
echo ==================================================================
echo Estas a punto de restablecer las siguientes configuraciones a los valores predeterminados:
echo  - Retraso de repeticion: Predeterminado.
echo  - Velocidad de repeticion: Predeterminado.
echo  - "Mejorar la precision del puntero": Habilitado.
echo  - Velocidad del doble clic: Predeterminado.
echo ==================================================================

:: Confirmacion antes de reestablecer cambios
echo Deseas reestablecer los valores predeterminados? (S para Si, N para No)
CHOICE /C SN /N /M "Selecciona una opcion (S para Si, N para No): "
if %ERRORLEVEL%==2 exit

echo Restableciendo configuraciones a los valores predeterminados...

:: Restablecer Retraso de Repeticion a los valores predeterminados
reg add "HKCU\Control Panel\Keyboard" /v KeyboardDelay /t REG_SZ /d 500 /f

:: Restablecer Velocidad de Repeticion a los valores predeterminados
reg add "HKCU\Control Panel\Keyboard" /v KeyboardSpeed /t REG_SZ /d 31 /f

:: Restablecer "Mejorar la precision del puntero" a habilitado
reg add "HKCU\Control Panel\Mouse" /v MouseEnhancePointerPrecision /t REG_DWORD /d 1 /f

:: Restablecer Velocidad del doble clic a los valores predeterminados
reg add "HKCU\Control Panel\Mouse" /v DoubleClickSpeed /t REG_SZ /d 500 /f

echo Configuraciones restablecidas a los valores predeterminados correctamente.
pause
exit
