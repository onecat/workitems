#Region ACNԤ����������(���ò���)
#PRE_Icon= 										;ͼ��,֧��EXE,DLL,ICO
#PRE_OutFile=									;����ļ���
#PRE_OutFile_Type=exe							;�ļ�����
#PRE_Compression=4								;ѹ���ȼ�
#PRE_UseUpx=y 									;ʹ��ѹ��
#PRE_Res_Comment= 								;����ע��
#PRE_Res_Description=							;��ϸ��Ϣ
#PRE_Res_Fileversion=							;�ļ��汾
#PRE_Res_FileVersion_AutoIncrement=p			;�Զ����°汾
#PRE_Res_LegalCopyright= 						;��Ȩ
#PRE_Change2CUI=N                   			;�޸�����ĳ���ΪCUI(����̨����)
;#PRE_Res_Field=AutoIt Version|%AutoItVer%		;�Զ�����Դ��
;#PRE_Run_Tidy=                   				;�ű�����
;#PRE_Run_Obfuscator=      						;�����Ի�
;#PRE_Run_AU3Check= 							;�﷨���
;#PRE_Run_Before= 								;����ǰ
;#PRE_Run_After=								;���к�
;#PRE_UseX64=n									;ʹ��64λ������
;#PRE_Compile_Both								;����˫ƽ̨����
#EndRegion ACNԤ�����������������
#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�

 Au3 �汾: 
 �ű�����: 
 �����ʼ�: 
	QQ/TM: 
 �ű��汾: 
 �ű�����: 

#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�

#NoTrayIcon
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <string.au3>
#include <Clipboard.au3>
#include <StaticConstants.au3>
#Region ### START Koda GUI section ### Form=
$Form1_1 = GUICreate("����Unicode�������", 517, 294, 192, 124)
$about = GUICtrlCreateButton("", 236, 240, 40, 40, BitOR($BS_ICON, $WS_GROUP))
GUICtrlSetImage(-1, "shell32.dll", -222)
$Encrypt = GUICtrlCreateButton("���� ->", 216, 104, 81, 25, $WS_GROUP)
$Decrypt = GUICtrlCreateButton("<- ����", 216, 144, 81, 25, $WS_GROUP)
$Edit1 = GUICtrlCreateEdit("", 16, 48, 185, 201, BitOR($ES_LEFT, $ES_WANTRETURN))
GUICtrlSetFont(-1, 9, 400, 0, "Fixedsys")
GUICtrlSetColor(-1, 0x808080)
$Edit2 = GUICtrlCreateEdit("", 312, 48, 185, 201, BitOR($ES_LEFT, $ES_WANTRETURN))
GUICtrlSetFont(-1, 9, 400, 0, "Fixedsys")
GUICtrlSetColor(-1, 0x808080)
$Button1 = GUICtrlCreateButton("����", 16, 256, 57, 25, $WS_GROUP)
$Button2 = GUICtrlCreateButton("���", 144, 256, 57, 25, $WS_GROUP)
$Button3 = GUICtrlCreateButton("����", 312, 256, 57, 25, $WS_GROUP)
$Button4 = GUICtrlCreateButton("���", 440, 256, 57, 25, $WS_GROUP)
$Button5 = GUICtrlCreateButton("ճ��", 80, 256, 57, 25, $WS_GROUP)
$Button6 = GUICtrlCreateButton("ճ��", 376, 256, 57, 25, $WS_GROUP)
$Label1 = GUICtrlCreateLabel("����", 80, 16, 55, 24, $SS_CENTER)
GUICtrlSetFont(-1, 9, 400, 0, "Fixedsys")
GUICtrlSetColor(-1, 0x000080)
$Label2 = GUICtrlCreateLabel("����", 384, 16, 46, 24, $SS_CENTER)
GUICtrlSetFont(-1, 9, 400, 0, "Fixedsys")
GUICtrlSetColor(-1, 0x000080)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
 
While 1
        $nMsg = GUIGetMsg()
        Switch $nMsg
                Case $GUI_EVENT_CLOSE
                        Exit
 
                Case $Encrypt
                        $String = GUICtrlRead($Edit1)
                        $Hex = Unicode2Encode($String)
                        GUICtrlSetData($Edit2, $Hex)
 
                Case $Decrypt
                        $Hex = GUICtrlRead($Edit2)
                        $String = Encode2Unicode($Hex)
                        If $String = -1 Then
                                GUICtrlSetData($Edit1, "�������")
                        Else
                                GUICtrlSetData($Edit1, $String)
                        EndIf
 
                Case $Button1
                        $clip1 = GUICtrlRead($Edit1)
                        _ClipBoard_SetData($clip1)
 
                Case $Button2
                        GUICtrlSetData($Edit1, "")
 
 
                Case $Button3
                        $clip2 = GUICtrlRead($Edit2)
                        _ClipBoard_SetData($clip2)
 
                Case $Button4
                        GUICtrlSetData($Edit2, "")
 
                Case $Button5
                        $paste1 = _ClipBoard_GetData()
                        GUICtrlSetData($Edit1, $paste1)
 
                Case $Button6
                        $paste2 = _ClipBoard_GetData()
                        GUICtrlSetData($Edit2, $paste2)
 
                Case $about
                        MsgBox(8192 + 262144 + 64, "����", "˵��ɶ��?" & @CRLF & "" & @CRLF & "��ã�����")
 
        EndSwitch
 
WEnd
 
Func Unicode2Encode($str)
        Local $EncodedString, $i, $s2d, $sS = StringSplit($str, '')
        For $i = 1 To $sS[0]
                If StringRegExp($sS[$i], '[^\x00-\xff]') Then
                        $EncodedString &= '\u' & Hex(AscW($sS[$i]), 4)
                Else
                        $EncodedString &= $sS[$i]
                EndIf
        Next
        Return $EncodedString
EndFunc   ;==>Unicode2Encode
 
Func Encode2Unicode($str)
        $Temp = StringRegExp($str, '(\\u\w{4})', 3)
        If @error Then Return $str
        For $i = 0 To UBound($Temp) - 1
                $Te = ChrW(Dec(StringReplace($Temp[$i], '\u', '')))
                $unEncode = StringReplace($str, $Temp[$i], $Te, 1)
                $str = $unEncode
        Next
        Return $unEncode
EndFunc   ;==>Encode2Unicode