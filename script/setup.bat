@REM 
echo off
echo **************************************************
echo * setup 
echo * ~�֗��c�[����SendTo�ɔz�u����
echo **************************************************

echo "�u����v���j���[�Ɂu0.���郁�j���[��ǉ��v��o�^"
copy %~dp0\vbs\SendTo.vbs "%UserProfile%\AppData\Roaming\Microsoft\Windows\SendTo\0.�u����v���j���[�ɒǉ�.vbs"

echo "�u����v���j���[�Ɂu1.PC�N�����Ɏ��s����v��o�^"
copy %~dp0\vbs\SendStartUp.vbs "%UserProfile%\AppData\Roaming\Microsoft\Windows\SendTo\1.PC�N�����Ɏ��s����.vbs"


echo "�u����v���j���[�Ɂu2.shortcut�ɒǉ��v��o�^"
copy %~dp0\vbs\SendAddShortcut.vbs "%UserProfile%\AppData\Roaming\Microsoft\Windows\SendTo\2.shortcut�ɒǉ�.vbs"

echo "�u����v���j���[�Ɂu3.�V�����^�u��Excel���J���v��o�^"
copy %~dp0\vbs\NewTabExcelOpen.vbs "%UserProfile%\AppData\Roaming\Microsoft\Windows\SendTo\3.�V�����^�u��Excel���J��.vbs"


@REM "shortcut�t�H���_�̐ݒ�"
SET SHORTCUT_FOLDER="C:\shortcut"
SET SHORTCUT_SCRIPT_FOLDER=%SHORTCUT_FOLDER%"\script"

IF EXIST %SHORTCUT_FOLDER% goto endPoint1
	echo %SHORTCUT_FOLDER%�쐬
	mkdir %SHORTCUT_FOLDER%
:endPoint1
IF EXIST %SHORTCUT_SCRIPT_FOLDER% goto endPoint2
	echo %SHORTCUT_SCRIPT_FOLDER%�쐬
	mkdir %SHORTCUT_SCRIPT_FOLDER%
:endPoint2

echo "�X�y�[�X�A���N������o�^"
copy %~dp0\vbs\SearchSpaceAlc.vbs %SHORTCUT_SCRIPT_FOLDER%\alc.vbs
call %~dp0\vbs\SendTo.vbs /F:%SHORTCUT_SCRIPT_FOLDER%\alc.vbs /D:%SHORTCUT_FOLDER%
echo "�f�X�N�g�b�v�t�H���_��o�^"
call %~dp0\vbs\SendTo.vbs /F:%UserProfile%\Desktop /D:%SHORTCUT_FOLDER%
echo "shortcut�t�H���_��o�^"
call %~dp0\vbs\SendTo.vbs /F:%SHORTCUT_FOLDER% /D:%SHORTCUT_FOLDER%
echo "SendTo�t�H���_��o�^"
call %~dp0\vbs\SendTo.vbs /F:"%UserProfile%\AppData\Roaming\Microsoft\Windows\SendTo" /D:%SHORTCUT_FOLDER%
echo "StartUp�t�H���_��o�^"
call %~dp0\vbs\SendTo.vbs /F:"%UserProfile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup" /D:%SHORTCUT_FOLDER%


echo **************************************************
echo * �����Őݒ肷�邱��
echo * 1. "%SHORTCUT_FOLDER%"�t�H���_�����ϐ����R�}���h�����`���ɓo�^���邱��
echo **************************************************

Pause;