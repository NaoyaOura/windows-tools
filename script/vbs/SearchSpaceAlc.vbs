'*******************************************************************************
' �X�y�[�X �A���N�Ō������邽�߂̃X�N���v�g
'*******************************************************************************

SPACE_ALC_URL = "http://eow.alc.co.jp/search?q="

Dim oParam
Dim Input
Set oParam = WScript.Arguments

If oParam.Count = 0 Then
	Input = InputBox("�������[�h����͂��Ă�������","SpaceAlc����")
Else
	Input = oParam(0)
End If

' ���͂��Ȃ��Ƃ��A�A�v���P�[�V�������I��������
IF Input = "" Then
	WScript.Quit
End IF

EXEC_URL = SPACE_ALC_URL & Input

Set objWShell = CreateObject("WScript.Shell")
objWShell.Run EXEC_URL, vbHide, False
