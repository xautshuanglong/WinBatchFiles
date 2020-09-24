@echo off

@rem ############################################################
@rem #
@rem #  ���������ż���Ͽ�����
@rem #
@rem ############################################################


@rem ############################################################
@rem #  �������������
@rem ############################################################

set INPUT_IP=%1

if "%INPUT_IP%"=="" (
    goto LABEL_HELP
)


@rem ############################################################
@rem #  ���ÿ�ִ�г���·�� �� �����в���
@rem ############################################################

set PING_BIN=ping.exe

set TARGET_IP=%INPUT_IP%
set TARGET_PORT=%INPUT_PORT%

@rem ############################################################
@rem #  ��������ʱ�乹����־�ļ���
@rem ############################################################

echo %date% %time%

set YEAR=%date:~0,4%
set MONTH=%date:~5,2%
set DAY=%date:~8,2%
set HOUR=%time:~0,2%
set MINUTE=%time:~3,2%
set SECOND=%time:~6,2%

set DATE_STRING=%YEAR%%MONTH%%DAY%_%HOUR%%MINUTE%%SECOND%
set IP_PORT_STRING=ip_%TARGET_IP%%

if not exist logs (
    mkdir logs
)

%PING_BIN% -t %TARGET_IP% > logs/icmp_%IP_PORT_STRING%_%DATE_STRING%.txt
goto LABEL_EXIT

:LABEL_HELP
echo Please input %0 IP!
goto LABEL_EXIT

:LABEL_EXIT
echo ------------- finished -------------
@rem exit
