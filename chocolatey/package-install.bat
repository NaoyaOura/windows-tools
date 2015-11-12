echo off
echo *********************************************
echo * chocolateyのconfigインストールを実施します
echo *********************************************

openfiles > NUL 2>&1 
if NOT %ERRORLEVEL% EQU 0 goto NotAdmin 
	@REM 管理者権限で実行中
	echo defaultSetting.configの内容をインストールします
	call chocolatey install %~dp0\defaultSetting.config --yes
	echo install完了
goto End
 
:NotAdmin 
echo 管理者権限でないとchocolateyは正しく動作しないので、管理者権限で実行してください
:End

PAUSE;
