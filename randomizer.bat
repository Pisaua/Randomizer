@echo off
chcp 65001 > nul
title Randomizer - Nickname & Password Generator
mode con cols=60 lines=20
color 0A
setlocal enabledelayedexpansion

:: Welcome Screen
echo ================================
echo      RANDOMIZER GENERATOR
echo ================================
echo.
echo  This tool generates random
echo  nicknames and passwords based
echo  on your input.
echo.
echo  NOTE: This is for entertainment
echo  purposes only. Do NOT use these
echo  passwords for real accounts!
echo.
echo ================================
echo.
pause

:: Ask user for input
cls
echo ================================
echo          USER INPUT
echo ================================
set /p base="Enter a base for nicknames & passwords: "

:: Creating file
set output=random_results.txt
echo Generating... Please wait.
echo ================================

:: Simulated Loading
for /L %%i in (1,1,10) do (
    echo Loading [%%i0%%]...
    ping -n 1 127.0.0.1 > nul
)

:: Function to generate random letter
set "letters=ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"

:: Generate 20 nicknames & passwords
(
    echo ============= RESULTS =============
    for /L %%i in (1,1,20) do (
        set /a num=!random! %% 9000 + 1000
        set /a spec=!random! %% 4

        :: Добавление случайной буквы в ник
        set /a randIndex=!random! %% 52
        for %%j in (!randIndex!) do set "randLetter=!letters:~%%j,1!"

        :: Генерация пароля с буквами и символами
        set pass=
        for /L %%k in (1,1,4) do (
            set /a randIndex=!random! %% 52
            for %%j in (!randIndex!) do set "randChar=!letters:~%%j,1!"
            set pass=!pass!!randChar!
        )
        set /a passNum=!random! %% 9000 + 1000

        if !spec! == 0 set pass=!pass!!passNum!@
        if !spec! == 1 set pass=!pass!!passNum!#
        if !spec! == 2 set pass=!pass!!passNum!$
        if !spec! == 3 set pass=!pass!!passNum!*

        echo %base%!randLetter!!num! - !pass!
    )
    echo ============= END =============
    echo.
    echo This application is for entertainment purposes only.
    echo Do not use these passwords for real accounts.
) > %output%

:: Done message
cls
echo ================================
echo        GENERATION COMPLETE!
echo ================================
echo.
echo  File %output% has been created.
echo  Check your folder for results!
echo.
pause
