'*******************************************************************************
' ショートカットを作成する汎用コマンド
'*******************************************************************************
Option Explicit

Call preExecute
Call Execute

'*******************************************************************************
' ヘルプウィンドウを表示します
'*******************************************************************************
Sub HelpWindow()
	WScript.echo	"ショートカットを作成する汎用コマンドです。" & vbCrLf & _
					vbCrLf & _
					"引数が１つのみのとき、SendToにコマンドを設定します。" & vbCrLf & _
					"%UserProfile%\AppData\Roaming\Microsoft\Windows\SendTo" & _
					"に当ファイルを配置することで右クリックメニューの送るに相当するコマンドになります" & vbCrLf & _
					vbCrLf & _
					"/?                 ヘルプウィンドを開きます" & vbCrLf & _
					"/F:{fileName}      配置するファイルを指定します" & vbCrLf & _
					"/D:{directoryPath} 対象のディレクトリにパス指定します"
	WScript.Quit
End Sub

'*******************************************************************************
' 前処理
'*******************************************************************************
Sub preExecute()
	Dim oParam
	Set oParam = WScript.Arguments

	'引数チェック
	If oParam.Count = 0 Then
		Call HelpWindow
	End If
	If oParam.Named.Exists("?") Then
		Call HelpWindow
	End If

End Sub

'*******************************************************************************
' メイン処理
'*******************************************************************************
Sub Execute()

	Dim oParam
	Dim sFileNm			' ショートカットを作成したいファイル
	Dim sSendDir		' ショートカットを作成するディレクトリ
	Set oParam = WScript.Arguments

	sFileNm = GetParam("F", oParam(0))
	sSendDir = GetParam("D", GetEnvParameter("%UserProfile%") & _
						"\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup")

	Call CreateShortCut(sFileNm, sSendDir)

	MsgBox "ショートカットキーの配置が完了しました" & vbCrLf & _ 
			"[配置ディレクトリ]：" & sSendDir & vbCrLf & _
			"[ファイル]：" & sFileNm

	Set oParam = Nothing
End Sub

' *****************************
' * 引数取得（存在しなければデフォルト値を設定）
' * 
' * 第一引数：オプションコード値
' * 第二引数：オプションが存在しないときのデフォルト値
' *****************************
Function GetParam(sOptionCd, sDefaultVal)
	Dim oParam
	Set oParam = WScript.Arguments

	If oParam.Named.Exists(sOptionCd) Then
		GetParam = oParam.Named(sOptionCd)
	Else
		GetParam = sDefaultVal
	End If
	Set oParam = Nothing
End Function

' **********************************
' * ショートカット作成
' * 	対象引数が不正値のとき、処理を強制終了する
' * 第一引数：ショートカット作成対象ファイル
' * 第二引数：ショートカット配置フォルダ
' ***********************************
Sub CreateShortCut(sFilePh ,sSendDir)

	Dim oShell
	Dim oShellApp
	Dim oFileSys

	Dim oShortCut		' ショートカット作成用オブジェクト
	Dim sExePh			' 引数の対象ファイル
	Dim sExeFileBaseNm	' 対象ファイルのBase名（C:\temp\hoge.bat -> hoge）
	Dim sShortCutLnkPh	' スタートアップに追加するリンクのPath

	Set oShell = WScript.CreateObject("WScript.Shell")
	Set oShellApp = WScript.CreateObject("Shell.Application")
	Set oFileSys = WScript.CreateObject("Scripting.FileSystemObject")

	' 引数チェック
	sExePh = GetFileOrDirAbsolutePath(sFilePh)
	sSendDir = GetDirAbsolutePath(sSendDir)

	' 拡張子無しのファイル名称を取得
	sExeFileBaseNm = oFileSys.GetBaseName(sExePh)

	' スタートアップに配置するファイルパス
	sShortCutLnkPh = sSendDir & "\" & sExeFileBaseNm & ".lnk"

	' スタートアップに同一ファイル名のものがないかチェック
	If oFileSys.FileExists(sShortCutLnkPh) = True Then
		MsgBox "[Error]" & vbCrLf & _
			"同一ファイル名のショートカットが存在します。" & vbCrLf & _
			sSendDir & vbCrLf & _
			"上記にあるファイル[" & sExeFileBaseNm & ".lnk" & "]を削除か変更して下さい"
		' スタートアップディレクトリを開く
		oShellApp.Explore sSendDir
		WScript.Quit
	End If

	' スタートアップにショートカットファイルを配置
	Set oShortCut = oShell.CreateShortcut(sShortCutLnkPh)
	oShortCut.TargetPath = sExePh
	oShortCut.Save

	Set oShell = Nothing
	Set oFileSys = Nothing
	Set oShortCut = Nothing
End Sub


' *******************************
' * 環境変数取得
' * 
' * 第一引数：環境変数名
' * return : 環境変数の値
' *******************************
Function GetEnvParameter(env)
	Dim oShell
	Set oShell = WScript.CreateObject("WScript.Shell")
	GetEnvParameter = oShell.ExpandEnvironmentStrings(env)
	Set oShell = Nothing
End Function


' *******************************
' * ファイルorディレクトリ存在チェック
' * 
' * 第一引数：相対ファイルパス
' * return : ファイルまたはディレクトリが存在するとき、絶対パスを引数にする
' *******************************
Function GetFileOrDirAbsolutePath(sFIlePh)
	Dim oFileSys
	Set oFileSys = WScript.CreateObject("Scripting.FileSystemObject")
	
	' 引数チェック
	If oFileSys.FileExists(sFilePh) = True Then
		GetFileOrDirAbsolutePath = oFileSys.GetFile(sFilePh).Path
	ElseIf oFileSys.FolderExists(sFilePh) = True Then
		GetFileOrDirAbsolutePath = oFileSys.GetAbsolutePathName(sFilePh)
	Else
		MsgBox "[Error]" & vbCrLf & _
			"引数のファイルが存在しません(" & sFIlePh & ")"
		WScript.Quit
	End If
End Function

' *******************************
' * ファイル存在チェック
' * 
' * 第一引数：相対ファイルパス
' * return : ファイルが存在するとき、絶対パスを引数にする
' *******************************
Function GetFileAbsolutePath(sFIlePh)
	Dim oFileSys
	Set oFileSys = WScript.CreateObject("Scripting.FileSystemObject")
	
	' 引数チェック
	If oFileSys.FileExists(sFilePh) = False Then
	    MsgBox "[Error]" & vbCrLf & _
			"引数のファイルが存在しません(" & sFIlePh & ")"
		WScript.Quit
	End If

	Set GetFileAbsolutePath = oFileSys.GetFile(sFilePh).Path
	
End Function

' *******************************
' * ディレクトリ絶対パスを取得
' * 
' * 第一引数：相対ファイルパス
' * return : ファイルが存在するとき、絶対パスを引数にする
' *******************************
Function GetDirAbsolutePath(sFIlePh)
	Dim oFileSys
	Set oFileSys = WScript.CreateObject("Scripting.FileSystemObject")

	If oFileSys.FolderExists(sFilePh) = False Then
	    MsgBox "[Error]" & vbCrLf & _
			"引数のフォルダが存在しません(" & sFIlePh & ")"
		WScript.Quit
	End If

	GetDirAbsolutePath = oFileSys.GetAbsolutePathName(sFilePh)
End Function
