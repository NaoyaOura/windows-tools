echo off
echo *********************************************
echo * chocolatey��config�C���X�g�[�������{���܂�
echo *********************************************

openfiles > NUL 2>&1 
if NOT %ERRORLEVEL% EQU 0 goto NotAdmin 
	@REM �Ǘ��Ҍ����Ŏ��s��
	echo defaultSetting.config�̓��e���C���X�g�[�����܂�
	call chocolatey install %~dp0\defaultSetting.config --yes
	echo install����
goto End
 
:NotAdmin 
echo �Ǘ��Ҍ����łȂ���chocolatey�͐��������삵�Ȃ��̂ŁA�Ǘ��Ҍ����Ŏ��s���Ă�������
:End

PAUSE;
