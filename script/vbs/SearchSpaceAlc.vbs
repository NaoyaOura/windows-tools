'*******************************************************************************
' �X�y�[�X �A���N�Ō������邽�߂̃X�N���v�g
'*******************************************************************************

SPACE_ALC_URL = "http://eow.alc.co.jp/search?q="

Input = InputBox("�������[�h����͂��Ă�������","SpaceAlc����")

' ���͂��Ȃ��Ƃ��A�A�v���P�[�V�������I��������
IF Input = "" Then
	WScript.Quit
End IF

EXEC_URL = SPACE_ALC_URL & Input

Set objWShell = CreateObject("WScript.Shell")
objWShell.Run EXEC_URL, vbHide, False
