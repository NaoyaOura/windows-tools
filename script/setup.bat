@REM 
echo off
echo **************************************************
echo * setup 
echo * ~�֗��c�[����SendTo�ɔz�u����
echo **************************************************

@REM SendTo��SendTo�ɓo�^
echo copy %~dp0\vbs\SendTo.vbs to "%UserProfile%\AppData\Roaming\Microsoft\Windows\SendTo"
copy %~dp0\vbs\SendTo.vbs "%UserProfile%\AppData\Roaming\Microsoft\Windows\SendTo\0.�u����v���j���[�ɒǉ�.vbs"

@REM SendTo��SendStartUp��o�^
echo copy %~dp0\vbs\SendStartUp.vbs to "%UserProfile%\AppData\Roaming\Microsoft\Windows\SendTo"
copy %~dp0\vbs\SendStartUp.vbs "%UserProfile%\AppData\Roaming\Microsoft\Windows\SendTo\1.PC�N�����Ɏ��s����.vbs"

Pause;