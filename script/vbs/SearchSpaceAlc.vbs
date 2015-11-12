'*******************************************************************************
' スペース アルクで検索するためのスクリプト
'*******************************************************************************

SPACE_ALC_URL = "http://eow.alc.co.jp/search?q="

Input = InputBox("検索ワードを入力してください","SpaceAlc検索")

' 入力がないとき、アプリケーションを終了させる
IF Input = "" Then
	WScript.Quit
End IF

EXEC_URL = SPACE_ALC_URL & Input

Set objWShell = CreateObject("WScript.Shell")
objWShell.Run EXEC_URL, vbHide, False
