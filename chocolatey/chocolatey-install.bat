echo off
echo [ECHO] *********************************************
echo [ECHO] * chocolatey�̃C���X�g�[�������{���܂�
echo [ECHO] *********************************************

openfiles > NUL 2>&1 
if NOT %ERRORLEVEL% EQU 0 goto NotAdmin 
	@REM �Ǘ��Ҍ����Ŏ��s��
	echo [ECHO] chocolatey�C���X�g�[�����܂�
	PAUSE;
	powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin
	echo [ECHO] install����
goto End
 
:NotAdmin 
echo [ERROR] �Ǘ��Ҍ����łȂ���chocolatey�͐��������삵�Ȃ��̂ŁA�Ǘ��Ҍ����Ŏ��s���Ă�������
:End

PAUSE;
