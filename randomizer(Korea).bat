@echo off
chcp 65001 > nul
title 랜덤 생성기
mode con cols=60 lines=20
color 0A

:: 환영 메시지
echo ================================ 
echo 랜덤 파스워드 및 닉네임 생성기
echo ================================
echo 이 프로그램은 랜덤으로 파스워드와 닉네임을 생성합니다.
echo 프로그램을 종료하려면 'Ctrl + C'를 누르세요.
echo ================================

:: 사용자에게 입력 받기
echo 입력하고 싶은 랜덤 파스워드와 닉네임의 유형을 선택하세요.
echo 1: 파스워드
echo 2: 닉네임
set /p choice=선택하세요 (1 또는 2 입력): 

:: 파스워드 생성
if "%choice%"=="1" (
    echo 파스워드를 생성하고 있습니다...
    setlocal enabledelayedexpansion
    set "length=12"   :: 기본 파스워드 길이 설정
    set "chars=ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()_-+=<>?"
    > result.txt (
        for /l %%i in (1,1,20) do (
            set "password="
            for /l %%j in (1,1,!length!) do (
                set /a "rand=!random! %% 74"
                set "password=!password!!chars:~%%rand,1!"
            )
            echo !password!
        )
    )
    echo ================================ 
    echo 파스워드 생성 완료! result.txt 파일을 확인하세요.
    echo ================================
)

:: 닉네임 생성
if "%choice%"=="2" (
    echo 닉네임을 생성하고 있습니다...
    setlocal enabledelayedexpansion
    set "length=8"   :: 기본 닉네임 길이 설정
    set "chars=ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
    > result.txt (
        for /l %%i in (1,1,20) do (
            set "nickname="
            for /l %%j in (1,1,!length!) do (
                set /a "rand=!random! %% 62"
                set "nickname=!nickname!!chars:~%%rand,1!"
            )
            echo !nickname!
        )
    )
    echo ================================ 
    echo 닉네임 생성 완료! result.txt 파일을 확인하세요.
    echo ================================
)

:: 결과 파일 출력
echo 생성된 결과는 'result.txt' 파일에 저장되었습니다. 확인해 보세요.
pause
