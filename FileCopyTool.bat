@echo off
title �ļ���������
cls
color 0A
mode con cols=100 lines=30
setlocal enabledelayedexpansion

set configRoot=.\FileCopyToolConfig.txt

set sourceRoot=E:\ScriptWorks\
set targetRoot="E:\ScriptWorks\"

:: ����GameArr
call :Array GameArr
call :readGamePath GameArr
rem �˵���ѭ������ֱ��ѡ���˳�
:loop
echo.
echo.
echo                                ***********************************
echo                                              ���˵�
echo                                ***********************************
echo                                            1.�� ���� ��
echo                                            2.�� ��� ��
echo                                            3.�� ɾ�� ��
echo                                            4.�� ���� ��
echo                                            5.�� ��� ��
echo                                            q.�� �˳� ��
echo.

set /p choice= ���ѡ��

if /i "%choice%"=="1" (
    call :insertGame
)else if /i "%choice%"=="2" (
    call :deleteGame
)else if /i "%choice%"=="3" (
    call :copyGame
)else if /i "%choice%"=="4" (
    call :saveGamePath GameArr
)else if /i "%choice%"=="Q" (
    call :saveGamePath GameArr
    exit
)else if /i "%choice%"=="q" (
    call :saveGamePath GameArr
    exit
)

call :loop

::��С��Ϸģ��·�����뵽С��Ϸ�б��Ա��������
:insertGame
    set gamePath=
    set /p gamePath=���� CGI ·��: 
    if /i "%gamePath%"=="" (
        echo ��ʾ��CGI ·������Ϊ��!
    )else (
        call :PushArray GameArr "%gamePath%"
        echo ��ʾ����ӳɹ���
    )
    
goto :eof
    
::��С��Ϸ�б���ɾ����ѡС��Ϸ�б�
:deleteGame
    if "%GameArr_Length%"=="0" (
        echo ��ʾ��û�� CGI ·������ɾ��!
        goto :eof
    )else (
        call :PrintArray GameArr
    )
    set deleteChoice=
    set /p deleteChoice=ɾ����һ��: 
::    echo deleteChoice=%deleteChoice%
    if /i not "%deleteChoice%"=="" (
        call :FreeArray GameArr "%deleteChoice%"
        echo ��ʾ��ɾ���ɹ���
    )

goto :eof
    
::����ѡ·���µ�С��Ϸ����������Ŀ¼��
:copyGame
    if "%GameArr_Length%"=="0" (
        echo ��ʾ��û��  CGI ������Կ���!
        goto :eof
    )else (
        call :PrintArray GameArr
    )
    set copyChoice=
    set /p copyChoice=������һ��: 
    if /i not "%copyChoice%"=="" (
        if not "!GameArr_%copyChoice%!"=="" (
            copy /y %sourceRoot%!GameArr_%copyChoice%! %targetRoot%
        )else (
            echo ������ѡ��  CGI ·�������ڡ�
        )
    )
goto :eof

:saveGamePath
    echo *****************************************************>%configRoot%
    echo *           CGI����·�����ñ�>>%configRoot%
    echo *****************************************************>>%configRoot%
    if defined %~1_Array (
        set /a tempCount=%~1_Length
        for /l %%i in (1,1,!tempCount!) do (
        echo !%~1_%%i!>>%configRoot%
        )
    )
    echo �ɹ������� %configRoot%
goto :eof

:readGamePath
    if exist %configRoot% (
        for /F "eol=*" %%i in (%configRoot%) do (
            set /a %~1_Length += 1
            set %~1_!%~1_Length!=%%i
        )
    )
goto :eof

:: ============================= Array Library (Below) ===========================
:Array
if not defined %~1_Array (
    set %~1_Array=true
    set %~1_Length=0
    
    set a=%~1_Array
    set /a b=%~1_Length
::    echo %~1_Array = !a!  %~1_Length = !b!
    goto :eof
)
echo ��ʾ��%~1_Array �ظ����塣
goto :eof

:PushArray
::echo %~1 %~2
if defined %~1_Array (
    if not "%~2"=="" (
        set /a %~1_Length += 1
        set /a tempIndex=%~1_Length
        set %~1_!tempIndex!=%~2
    )
)

goto :eof

:FreeArray
if defined %~1_Array (
    if not "%~2"=="" (
        if not "!%~1_%~2!"=="" (
            set /a tempCount=%~1_Length - 1
            for /l %%i in (%~2,1,!tempCount!) do (
::                echo %%i  --- %~1_%%i  --- !%~1_%%i!
                set /a nextIndex=%%i+1
                call :TransValue %~1 %%i !nextIndex!
            )
::                echo %%i  --- %~1_%%i  --- !%~1_%%i!
            set /a tempCount=%~1_Length
            set %~1_!tempCount!=
            set /a %~1_Length -= 1
        )
    )else (
        for /l %%i in (1,1,!tempCount!) do (
            set /a %~1_Length -= 1
            set %~1_%%i=
        )
        set %~1_Array=
        echo ��ʾ��%~1_Array �����
    )
)
    
::    call :PrintArray %~1

goto :eof

:PrintArray
::echo inside :PrintArray
if defined %~1_Array (
    set /a tempCount=%~1_Length
rem    echo !tempCount!
    echo.
    echo.
    echo            ***************************************************
    echo                            �ļ�����·��·���б�
    echo            ***************************************************
    for /l %%i in (1,1,!tempCount!) do (
        echo             %%i . !%~1_%%i!
    )
    echo.
    echo.
)

goto :eof

:: ============================= Array Library (Above) ===========================

:TransValue
    set %~1_%~2=!%~1_%~3!
goto :eof
