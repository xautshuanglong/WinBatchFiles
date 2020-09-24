@echo off

@rem ############################################################
@rem #
@rem #  信令服务器偶发断开重连
@rem #
@rem ############################################################


@rem ############################################################
@rem #  批处理参数解析
@rem ############################################################

set INPUT_IP=%1
set INPUT_PORT=%2

if "%INPUT_IP%"=="" (
    goto LABEL_HELP
) else (
    if "%INPUT_PORT%"=="" (
        goto LABEL_HELP
    )
)


@rem ############################################################
@rem #  设置可执行程序路径 和 命令行参数
@rem ############################################################

set TCPING_BIN=d:\Program_Files\Tools\tcping.exe

set TARGET_IP=%INPUT_IP%
set TARGET_PORT=%INPUT_PORT%

@rem ############################################################
@rem #  根据启动时间构建日志文件名
@rem ############################################################

echo %date% %time%

set YEAR=%date:~0,4%
set MONTH=%date:~5,2%
set DAY=%date:~8,2%
set HOUR=%time:~0,2%
set MINUTE=%time:~3,2%
set SECOND=%time:~6,2%

set DATE_STRING=%YEAR%%MONTH%%DAY%_%HOUR%%MINUTE%%SECOND%
set IP_PORT_STRING=ip_%TARGET_IP%_port_%TARGET_PORT%

if not exist logs (
    mkdir logs
)

%TCPING_BIN% -d -t %TARGET_IP% %TARGET_PORT% > logs/tcping_%IP_PORT_STRING%_%DATE_STRING%.txt
goto LABEL_EXIT

:LABEL_HELP
echo Please input %0 IP PORT!
goto LABEL_EXIT

:LABEL_EXIT
echo ------------- finished -------------
@rem exit
