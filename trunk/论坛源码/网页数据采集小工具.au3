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
#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <ListViewConstants.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <Array.au3>
#include <IE.au3>

Dim $oIE,$oIE_MHTL

_IEErrorHandlerRegister()

Local $oIE = _IECreateEmbedded()
$Form1 = GUICreate("��վָ�����ݲɼ�����", 623, 548)
;~ $Group1 = GUICtrlCreateGroup("Group1", 0, 0, 621, 217)
$ieGUI = GUICtrlCreateObj($oIE, 1, 0, 621, 217)
$Edit1 = GUICtrlCreateEdit("", 0, 221, 620, 230)
$Input1 = GUICtrlCreateInput("", 0, 456, 505, 21)
$Button1 = GUICtrlCreateButton("ת��", 512, 456, 33, 21)
$Button2 = GUICtrlCreateButton("ֹͣ", 548, 456, 33, 21)
$Button3 = GUICtrlCreateButton("ˢ��", 584, 456, 33, 21)
$Label1 = GUICtrlCreateLabel("������룺", 8, 490, 64, 17)
$Combo1 = GUICtrlCreateCombo("", 72, 488, 433, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1,"href='(http://.*?)' title=|href="&'"'&"(http://.*?)"&'"'&" target=")
$Button4 = GUICtrlCreateButton("����", 512, 488, 33, 21)
$Input2 = GUICtrlCreateInput("", 72, 520, 193, 21)
$Label2 = GUICtrlCreateLabel("�ļ����ƣ�", 8, 522, 64, 17)
$Label3 = GUICtrlCreateLabel("������ֵ��", 304, 522, 64, 17)
$Input3 = GUICtrlCreateInput("", 368, 520, 137, 21)
$Button5 = GUICtrlCreateButton("���(&Save)", 548, 488, 69, 21)
$Button6 = GUICtrlCreateButton("���(&Down��", 512, 520, 105, 21)
Dim $Form1_AccelTable[2][2] = [["{enter}", $Button1],["^{enter}", $Button6]]
GUISetAccelerators($Form1_AccelTable)
GUISetState(@SW_SHOW)
_IENavigate($oIE, "about:blank")

While 1
        $nMsg = GUIGetMsg()
        Switch $nMsg
                Case $GUI_EVENT_CLOSE
                        Exit
                Case $Button1
                        GUICtrlSetData($Edit1,"")
                        _IENavigate($oIE,GUICtrlRead($Input1))
                        $oIE_MHTL = _IEDocReadHTML ($oIE)
                        GUICtrlSetPos ($ieGUI, 1, 0, 621, 217)
                        GUICtrlSetData($Edit1,$oIE_MHTL)
                        $SaveName = StringSplit (GUICtrlRead($Input1),"/",1)
                        If StringInStr($SaveName[1], "http:") = 0 Then
                                GUICtrlSetData($Input2,$SaveName[1]&".txt")
                        Else
                                GUICtrlSetData($Input2,$SaveName[3]&".txt")
                        EndIf
                Case $Button2
                        _IEAction($oIE, "stop")
                Case $Button3
                        _IEAction($oIE, "refresh")
                Case $Button4
                        $url = StringRegExp($oIE_MHTL,GUICtrlRead($Combo1), 3)
                        If Not @Error Then
                                _ArrayDisplay($url, UBound($url))
                        Else
                                MsgBox(0,"","���ʽ����������ݣ�")
                        EndIf
                Case $Button5
                        If GUICtrlRead($Input1) <> "" And GUICtrlRead($Input2) <> "" And GUICtrlRead($Combo1) <> "" Then
                                $url = StringRegExp($oIE_MHTL,GUICtrlRead($Combo1), 3)
                                If Not @Error Then
                                        $i = 0
                                        $name = GUICtrlRead($Input2)
                                        If GUICtrlRead($Input3) = "" Then
                                                Do
                                                        $i = $i + 1
                                                        FileWrite(@ScriptDir&"\"&$name,$url[$i] & @CRLF)
                                                Until $i = UBound($url) -1
                                        Else
                                                Do
                                                        $i = $i + 1
                                                        FileWrite(@ScriptDir&"\"&$name,$url[$i] & @CRLF)
                                                Until $i = GUICtrlRead($Input3)
                                        EndIf
                                Else
                                        MsgBox(0,"","���ʽ����������ݣ�")
                                EndIf
                        Else
                                MsgBox(16,"����","���ݲ���Ϊ��!!")
                        EndIf
                Case $Button6
                        If GUICtrlRead($Input1) <> "" And GUICtrlRead($Input2) <> "" And GUICtrlRead($Combo1) <> "" Then
                                $url = StringRegExp($oIE_MHTL,GUICtrlRead($Combo1), 3)
                                If Not @Error Then
                                        $i = 0
                                        $name = GUICtrlRead($Input2)
                                        If GUICtrlRead($Input3) = "" Then
                                                Do
                                                        $i = $i + 1
                                                        FileWrite(@ScriptDir&"\"&$name,$url[$i] & @CRLF)
                                                Until $i = UBound($url) -1
                                                ;-------���г���
                                        Else
                                                Do
                                                        $i = $i + 1
                                                        FileWrite(@ScriptDir&"\"&$name,$url[$i] & @CRLF)
                                                Until $i = GUICtrlRead($Input3)
                                                ;-------���г���
                                        EndIf
                                Else
                                        MsgBox(0,"","���ʽ����������ݣ�")
                                EndIf
                        Else
                                MsgBox(16,"����","���ݲ���Ϊ��!!")
                        EndIf
        EndSwitch
WEnd
