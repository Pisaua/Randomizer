@echo off
chcp 65001 > nul
title Randomizer - Health Check
mode con cols=60 lines=20
color 0A

:: Устанавливаем путь к основному приложению
set "appPath=randomizer.bat"

:: Лог файл
set "logFile=log.txt"

:: Начало логирования
echo ================================ > %logFile%
echo Health Check started at %date% %time% >> %logFile%
echo ================================ >> %logFile%

:: Проверка на наличие основного приложения
echo Checking for the application... >> %logFile%
echo Checking for the application...
if exist "%appPath%" (
    echo Application found: %appPath% >> %logFile%
    echo Application found: %appPath%
) else (
    echo ERROR: Application %appPath% not found! >> %logFile%
    echo ERROR: Application %appPath% not found!
    echo Please make sure the file exists and try again. >> %logFile%
    echo Please make sure the file exists and try again.
    exit /b 1
)

:: Проверка запуска
echo Attempting to run the application... >> %logFile%
echo Attempting to run the application...

:: Запуск randomizer.bat и проверка
call "%appPath%"
if errorlevel 1 (
    echo ERROR: Application failed to run. >> %logFile%
    echo ERROR: Application failed to run.
    echo Possible issue: Missing dependencies or invalid input. >> %logFile%
    echo Possible issue: Missing dependencies or invalid input.
    echo Suggestion: Ensure all necessary files are in place and try again. >> %logFile%
    echo Suggestion: Ensure all necessary files are in place and try again.
    exit /b 1
) else (
    echo SUCCESS: Application ran successfully. >> %logFile%
    echo SUCCESS: Application ran successfully.
)

:: Завершаем логирование
echo ================================ >> %logFile%
echo Health Check completed at %date% %time% >> %logFile%
echo ================================ >> %logFile%

:: Оповещение пользователя
cls
echo ================================
echo      Health Check Complete
echo ================================
echo The application ran successfully! Check the log for details.
echo Log file saved as %logFile%.
pause
