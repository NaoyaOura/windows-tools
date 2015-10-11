'*******************************************************************************
' �V���[�g�J�b�g���쐬����ėp�R�}���h
'*******************************************************************************
Option Explicit

Call preExecute
Call Execute

'*******************************************************************************
' �w���v�E�B���h�E��\�����܂�
'*******************************************************************************
Sub HelpWindow()
	WScript.echo	"�V���[�g�J�b�g���쐬����ėp�R�}���h�ł��B" & vbCrLf & _
					vbCrLf & _
					"�������P�݂̂̂Ƃ��ASendTo�ɃR�}���h��ݒ肵�܂��B" & vbCrLf & _
					"%UserProfile%\AppData\Roaming\Microsoft\Windows\SendTo" & _
					"�ɓ��t�@�C����z�u���邱�ƂŉE�N���b�N���j���[�̑���ɑ�������R�}���h�ɂȂ�܂�" & vbCrLf & _
					vbCrLf & _
					"/?                 �w���v�E�B���h���J���܂�" & vbCrLf & _
					"/F:{fileName}      �z�u����t�@�C�����w�肵�܂�" & vbCrLf & _
					"/D:{directoryPath} �Ώۂ̃f�B���N�g���Ƀp�X�w�肵�܂�"
	WScript.Quit
End Sub

'*******************************************************************************
' �O����
'*******************************************************************************
Sub preExecute()
	Dim oParam
	Set oParam = WScript.Arguments

	'�����`�F�b�N
	If oParam.Count = 0 Then
		Call HelpWindow
	End If
	If oParam.Named.Exists("?") Then
		Call HelpWindow
	End If

End Sub

'*******************************************************************************
' ���C������
'*******************************************************************************
Sub Execute()

	Dim oParam
	Dim sFileNm			' �V���[�g�J�b�g���쐬�������t�@�C��
	Dim sSendDir		' �V���[�g�J�b�g���쐬����f�B���N�g��
	Set oParam = WScript.Arguments

	sFileNm = GetParam("F", oParam(0))
	sSendDir = GetParam("D", GetEnvParameter("%UserProfile%") & _
						"\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup")

	Call CreateShortCut(sFileNm, sSendDir)

	MsgBox "�V���[�g�J�b�g�L�[�̔z�u���������܂���" & vbCrLf & _ 
			"[�z�u�f�B���N�g��]�F" & sSendDir & vbCrLf & _
			"[�t�@�C��]�F" & sFileNm

	Set oParam = Nothing
End Sub

' *****************************
' * �����擾�i���݂��Ȃ���΃f�t�H���g�l��ݒ�j
' * 
' * �������F�I�v�V�����R�[�h�l
' * �������F�I�v�V���������݂��Ȃ��Ƃ��̃f�t�H���g�l
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
' * �V���[�g�J�b�g�쐬
' * 	�Ώۈ������s���l�̂Ƃ��A�����������I������
' * �������F�V���[�g�J�b�g�쐬�Ώۃt�@�C��
' * �������F�V���[�g�J�b�g�z�u�t�H���_
' ***********************************
Sub CreateShortCut(sFilePh ,sSendDir)

	Dim oShell
	Dim oShellApp
	Dim oFileSys

	Dim oShortCut		' �V���[�g�J�b�g�쐬�p�I�u�W�F�N�g
	Dim sExePh			' �����̑Ώۃt�@�C��
	Dim sExeFileBaseNm	' �Ώۃt�@�C����Base���iC:\temp\hoge.bat -> hoge�j
	Dim sShortCutLnkPh	' �X�^�[�g�A�b�v�ɒǉ����郊���N��Path

	Set oShell = WScript.CreateObject("WScript.Shell")
	Set oShellApp = WScript.CreateObject("Shell.Application")
	Set oFileSys = WScript.CreateObject("Scripting.FileSystemObject")

	' �����`�F�b�N
	sExePh = GetFileOrDirAbsolutePath(sFilePh)
	sSendDir = GetDirAbsolutePath(sSendDir)

	' �g���q�����̃t�@�C�����̂��擾
	sExeFileBaseNm = oFileSys.GetBaseName(sExePh)

	' �X�^�[�g�A�b�v�ɔz�u����t�@�C���p�X
	sShortCutLnkPh = sSendDir & "\" & sExeFileBaseNm & ".lnk"

	' �X�^�[�g�A�b�v�ɓ���t�@�C�����̂��̂��Ȃ����`�F�b�N
	If oFileSys.FileExists(sShortCutLnkPh) = True Then
		MsgBox "[Error]" & vbCrLf & _
			"����t�@�C�����̃V���[�g�J�b�g�����݂��܂��B" & vbCrLf & _
			sSendDir & vbCrLf & _
			"��L�ɂ���t�@�C��[" & sExeFileBaseNm & ".lnk" & "]���폜���ύX���ĉ�����"
		' �X�^�[�g�A�b�v�f�B���N�g�����J��
		oShellApp.Explore sSendDir
		WScript.Quit
	End If

	' �X�^�[�g�A�b�v�ɃV���[�g�J�b�g�t�@�C����z�u
	Set oShortCut = oShell.CreateShortcut(sShortCutLnkPh)
	oShortCut.TargetPath = sExePh
	oShortCut.Save

	Set oShell = Nothing
	Set oFileSys = Nothing
	Set oShortCut = Nothing
End Sub


' *******************************
' * ���ϐ��擾
' * 
' * �������F���ϐ���
' * return : ���ϐ��̒l
' *******************************
Function GetEnvParameter(env)
	Dim oShell
	Set oShell = WScript.CreateObject("WScript.Shell")
	GetEnvParameter = oShell.ExpandEnvironmentStrings(env)
	Set oShell = Nothing
End Function


' *******************************
' * �t�@�C��or�f�B���N�g�����݃`�F�b�N
' * 
' * �������F���΃t�@�C���p�X
' * return : �t�@�C���܂��̓f�B���N�g�������݂���Ƃ��A��΃p�X�������ɂ���
' *******************************
Function GetFileOrDirAbsolutePath(sFIlePh)
	Dim oFileSys
	Set oFileSys = WScript.CreateObject("Scripting.FileSystemObject")
	
	' �����`�F�b�N
	If oFileSys.FileExists(sFilePh) = True Then
		GetFileOrDirAbsolutePath = oFileSys.GetFile(sFilePh).Path
	ElseIf oFileSys.FolderExists(sFilePh) = True Then
		GetFileOrDirAbsolutePath = oFileSys.GetAbsolutePathName(sFilePh)
	Else
		MsgBox "[Error]" & vbCrLf & _
			"�����̃t�@�C�������݂��܂���(" & sFIlePh & ")"
		WScript.Quit
	End If
End Function

' *******************************
' * �t�@�C�����݃`�F�b�N
' * 
' * �������F���΃t�@�C���p�X
' * return : �t�@�C�������݂���Ƃ��A��΃p�X�������ɂ���
' *******************************
Function GetFileAbsolutePath(sFIlePh)
	Dim oFileSys
	Set oFileSys = WScript.CreateObject("Scripting.FileSystemObject")
	
	' �����`�F�b�N
	If oFileSys.FileExists(sFilePh) = False Then
	    MsgBox "[Error]" & vbCrLf & _
			"�����̃t�@�C�������݂��܂���(" & sFIlePh & ")"
		WScript.Quit
	End If

	Set GetFileAbsolutePath = oFileSys.GetFile(sFilePh).Path
	
End Function

' *******************************
' * �f�B���N�g����΃p�X���擾
' * 
' * �������F���΃t�@�C���p�X
' * return : �t�@�C�������݂���Ƃ��A��΃p�X�������ɂ���
' *******************************
Function GetDirAbsolutePath(sFIlePh)
	Dim oFileSys
	Set oFileSys = WScript.CreateObject("Scripting.FileSystemObject")

	If oFileSys.FolderExists(sFilePh) = False Then
	    MsgBox "[Error]" & vbCrLf & _
			"�����̃t�H���_�����݂��܂���(" & sFIlePh & ")"
		WScript.Quit
	End If

	GetDirAbsolutePath = oFileSys.GetAbsolutePathName(sFilePh)
End Function
