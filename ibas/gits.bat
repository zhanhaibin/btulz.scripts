@echo off
setlocal EnableDelayedExpansion
echo ***************************************************************************
echo                gits.bat
echo                     by niuren.zhu
echo                           2017.09.15
echo  ˵����
echo     1. ��������Ŀ¼������.git�ļ�����ִ�д���ָ�
echo     2. ����1��ָ�
echo ****************************************************************************
REM ���ò�������
REM ����Ŀ¼
SET WORK_FOLDER=%~dp0
REM ����
SET GIT_COMMAND=
REM ƴ������
:LOOP
IF "%1"=="" (
    GOTO :COMMAND_DONE
) ELSE (
    SET GIT_COMMAND=!GIT_COMMAND! %1
    SHIFT /1
    GOTO :LOOP
)
:COMMAND_DONE
IF "!GIT_COMMAND!"=="" (
    echo ������Ч
    GOTO :EOF
)

echo --����Ŀ¼��%WORK_FOLDER%
echo --����ָ�git !GIT_COMMAND!
for /f %%l in ('dir /b "%WORK_FOLDER%"') DO (
  SET FOLDER=%WORK_FOLDER%%%l
  if exist !FOLDER!\.git (
    echo ----!FOLDER!
    cd !FOLDER!
    git %GIT_COMMAND%
  )
)
cd %WORK_FOLDER%
