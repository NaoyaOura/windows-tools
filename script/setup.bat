@REM 
echo off
echo **************************************************
echo * setup 
echo * ~便利ツールをSendToに配置する
echo **************************************************

@REM SendToをSendToに登録
echo copy %~dp0\vbs\SendTo.vbs to "%UserProfile%\AppData\Roaming\Microsoft\Windows\SendTo"
copy %~dp0\vbs\SendTo.vbs "%UserProfile%\AppData\Roaming\Microsoft\Windows\SendTo\0.「送る」メニューに追加.vbs"

@REM SendToにSendStartUpを登録
echo copy %~dp0\vbs\SendStartUp.vbs to "%UserProfile%\AppData\Roaming\Microsoft\Windows\SendTo"
copy %~dp0\vbs\SendStartUp.vbs "%UserProfile%\AppData\Roaming\Microsoft\Windows\SendTo\1.PC起動時に実行する.vbs"

Pause;