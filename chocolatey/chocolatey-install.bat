echo off
echo [ECHO] *********************************************
echo [ECHO] * chocolateyのインストールを実施します
echo [ECHO] *********************************************

openfiles > NUL 2>&1 
if NOT %ERRORLEVEL% EQU 0 goto NotAdmin 
	@REM 管理者権限で実行中
	echo [ECHO] chocolateyインストールします
	PAUSE;
	powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin
	echo [ECHO] install完了
goto End
 
:NotAdmin 
echo [ERROR] 管理者権限でないとchocolateyは正しく動作しないので、管理者権限で実行してください
:End

PAUSE;
