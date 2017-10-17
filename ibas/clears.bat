@echo off
setlocal EnableDelayedExpansion
echo ***************************************************************************
echo              clears.bat
echo                     by niuren.zhu
echo                           2017.06.23
echo  ˵����
echo     1. ��������Ŀ¼��ɾ����־�ļ���
echo     2. ����1������Ŀ¼��
echo ****************************************************************************
REM ���ò�������
REM ����Ŀ¼
SET STARTUP_FOLDER=%~dp0
REM ����Ĺ���Ŀ¼
SET WORK_FOLDER=%~1
REM �ж��Ƿ񴫹���Ŀ¼��û����������Ŀ¼
if "%WORK_FOLDER%"=="" SET WORK_FOLDER=%STARTUP_FOLDER%
REM ������Ŀ¼����ַ����ǡ�\������
if "%WORK_FOLDER:~-1%" neq "\" SET WORK_FOLDER=%WORK_FOLDER%\

if not exist "%WORK_FOLDER%compile_order.txt" dir /a:d /b "%WORK_FOLDER%" >"%WORK_FOLDER%compile_order.txt"

echo --������Ŀ¼��%WORK_FOLDER%
for /f %%l in (%WORK_FOLDER%compile_order.txt) do (
  SET FOLDER=%WORK_FOLDER%%%l
  echo --����Ŀ¼��!FOLDER!
  if exist !FOLDER!\*log*.txt (
    del /q !FOLDER!\*log*.txt
  )
  cd !FOLDER!
  for /f %%m in ('dir /a:d /b /s 3rdparty') do (
    SET FOLDER=%%m
    if !FOLDER:~-25!==\src\main\webapp\3rdparty (
      echo --����Ŀ¼��!FOLDER!
      if exist !FOLDER!\ibas rd /s /q !FOLDER!\ibas
      if exist !FOLDER!\openui5 rd /s /q !FOLDER!\openui5
    )
  )
)
cd %WORK_FOLDER%