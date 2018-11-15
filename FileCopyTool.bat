@echo off
title 文件拷贝工具
cls
color 0A
mode con cols=100 lines=30
setlocal enabledelayedexpansion

set configRoot=.\FileCopyToolConfig.txt

set sourceRoot=E:\ScriptWorks\
set targetRoot="E:\ScriptWorks\"

:: 定义GameArr
call :Array GameArr
call :readGamePath GameArr
rem 菜单：循环调用直到选择退出
:loop
echo.
echo.
echo                                ***********************************
echo                                              主菜单
echo                                ***********************************
echo                                            1.【 拷贝 】
echo                                            2.【 添加 】
echo                                            3.【 删除 】
echo                                            4.【 保存 】
echo                                            5.【 清空 】
echo                                            q.【 退出 】
echo.

set /p choice= 你的选择：

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

::将小游戏模块路径插入到小游戏列表，以便后续拷贝
:insertGame
    set gamePath=
    set /p gamePath=输入 CGI 路径: 
    if /i "%gamePath%"=="" (
        echo 提示：CGI 路径不能为空!
    )else (
        call :PushArray GameArr "%gamePath%"
        echo 提示：添加成功。
    )
    
goto :eof
    
::从小游戏列表中删除所选小游戏列表
:deleteGame
    if "%GameArr_Length%"=="0" (
        echo 提示：没有 CGI 路径可以删除!
        goto :eof
    )else (
        call :PrintArray GameArr
    )
    set deleteChoice=
    set /p deleteChoice=删除哪一个: 
::    echo deleteChoice=%deleteChoice%
    if /i not "%deleteChoice%"=="" (
        call :FreeArray GameArr "%deleteChoice%"
        echo 提示：删除成功。
    )

goto :eof
    
::将所选路径下的小游戏拷贝到工程目录下
:copyGame
    if "%GameArr_Length%"=="0" (
        echo 提示：没有  CGI 程序可以拷贝!
        goto :eof
    )else (
        call :PrintArray GameArr
    )
    set copyChoice=
    set /p copyChoice=拷贝哪一个: 
    if /i not "%copyChoice%"=="" (
        if not "!GameArr_%copyChoice%!"=="" (
            copy /y %sourceRoot%!GameArr_%copyChoice%! %targetRoot%
        )else (
            echo 错误：所选的  CGI 路径不存在。
        )
    )
goto :eof

:saveGamePath
    echo *****************************************************>%configRoot%
    echo *           CGI程序路径配置表>>%configRoot%
    echo *****************************************************>>%configRoot%
    if defined %~1_Array (
        set /a tempCount=%~1_Length
        for /l %%i in (1,1,!tempCount!) do (
        echo !%~1_%%i!>>%configRoot%
        )
    )
    echo 成功保存至 %configRoot%
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
echo 提示：%~1_Array 重复定义。
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
        echo 提示：%~1_Array 已清空
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
    echo                            文件拷贝路径路径列表
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
