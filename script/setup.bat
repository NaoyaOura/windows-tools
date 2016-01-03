@REM 
echo off
echo **************************************************
echo * setup 
echo * ~便利ツールをSendToに配置する
echo **************************************************

echo "「送る」メニューに「0.送るメニューを追加」を登録"
copy %~dp0\vbs\SendTo.vbs "%UserProfile%\AppData\Roaming\Microsoft\Windows\SendTo\0.「送る」メニューに追加.vbs"

echo "「送る」メニューに「1.PC起動時に実行する」を登録"
copy %~dp0\vbs\SendStartUp.vbs "%UserProfile%\AppData\Roaming\Microsoft\Windows\SendTo\1.PC起動時に実行する.vbs"


echo "「送る」メニューに「2.shortcutに追加」を登録"
copy %~dp0\vbs\SendAddShortcut.vbs "%UserProfile%\AppData\Roaming\Microsoft\Windows\SendTo\2.shortcutに追加.vbs"

echo "「送る」メニューに「3.新しいタブでExcelを開く」を登録"
copy %~dp0\vbs\NewTabExcelOpen.vbs "%UserProfile%\AppData\Roaming\Microsoft\Windows\SendTo\3.新しいタブでExcelを開く.vbs"


@REM "shortcutフォルダの設定"
SET SHORTCUT_FOLDER="C:\shortcut"
SET SHORTCUT_SCRIPT_FOLDER=%SHORTCUT_FOLDER%"\script"

IF EXIST %SHORTCUT_FOLDER% goto endPoint1
	echo %SHORTCUT_FOLDER%作成
	mkdir %SHORTCUT_FOLDER%
:endPoint1
IF EXIST %SHORTCUT_SCRIPT_FOLDER% goto endPoint2
	echo %SHORTCUT_SCRIPT_FOLDER%作成
	mkdir %SHORTCUT_SCRIPT_FOLDER%
:endPoint2

echo "スペースアルク検索を登録"
copy %~dp0\vbs\SearchSpaceAlc.vbs %SHORTCUT_SCRIPT_FOLDER%\alc.vbs
call %~dp0\vbs\SendTo.vbs /F:%SHORTCUT_SCRIPT_FOLDER%\alc.vbs /D:%SHORTCUT_FOLDER%
echo "デスクトップフォルダを登録"
call %~dp0\vbs\SendTo.vbs /F:%UserProfile%\Desktop /D:%SHORTCUT_FOLDER%
echo "shortcutフォルダを登録"
call %~dp0\vbs\SendTo.vbs /F:%SHORTCUT_FOLDER% /D:%SHORTCUT_FOLDER%
echo "SendToフォルダを登録"
call %~dp0\vbs\SendTo.vbs /F:"%UserProfile%\AppData\Roaming\Microsoft\Windows\SendTo" /D:%SHORTCUT_FOLDER%
echo "StartUpフォルダを登録"
call %~dp0\vbs\SendTo.vbs /F:"%UserProfile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup" /D:%SHORTCUT_FOLDER%


echo **************************************************
echo * 自分で設定すること
echo * 1. "%SHORTCUT_FOLDER%"フォルダを環境変数かコマンドランチャに登録すること
echo **************************************************

Pause;