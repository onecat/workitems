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

#include <GUIConstantsEx.au3>
#include <TreeViewConstants.au3>
#include <WindowsConstants.au3>
#Include <GuiImageList.au3>
#include <GuiComboBoxEx.au3>

Global $rVar

#Region ### START Koda GUI section ### Form=
$GUI = GUICreate("GUI 4 ComboBox", 205, 240)
$rComboBox = _GUICtrlComboBoxEx_Create($GUI, "", 10, 8, 185, 425, $CBS_DROPDOWNLIST)
$rButton = GUICtrlCreateButton("�� ��", 20, 210, 205 - 40 ,27)
GUISetState()

$hImage = _GUIImageList_Create(16, 16, 5, 3)
_GUIImageList_AddIcon($hImage, "shell32.dll", 3)        ;�رյ��ļ���
_GUIImageList_AddIcon($hImage, "shell32.dll", 4)        ;�򿪵��ļ���
_GUIImageList_AddIcon($hImage, "shell32.dll", 126)        ;�ҵ��ĵ�
_GUIImageList_AddIcon($hImage, "shell32.dll", 127)        ;ͼƬ�ղ�
_GUIImageList_AddIcon($hImage, "shell32.dll", 128)        ;�ҵ�����
_GUIImageList_AddIcon($hImage, "shell32.dll", 7)        ;�ƶ��洢
_GUIImageList_AddIcon($hImage, "shell32.dll", 8)        ;Ӳ��
_GUIImageList_AddIcon($hImage, "shell32.dll", 11)        ;ROM
_GUIImageList_AddIcon($hImage, "shell32.dll", 15)        ;�ҵĵ���
_GUIImageList_AddIcon($hImage, "shell32.dll", 34)        ;����
_GUIImageList_AddIcon($hImage, "shell32.dll", 23)        ;����
_GUIImageList_AddIcon($hImage, "shell32.dll", 22)        ;����
_GUICtrlComboBoxEx_SetImageList($rComboBox, $hImage)

_GUICtrlComboBoxEx_BeginUpdate ($rComboBox)
_GUICtrlComboBoxEx_AddString($rComboBox, "�ҵ��ĵ�", 2, 2)
_GUICtrlComboBoxEx_AddString($rComboBox, "ͼƬ�ղ�", 3, 3)
_GUICtrlComboBoxEx_AddString($rComboBox, "�ҵ�����", 4, 4)
_GUICtrlComboBoxEx_AddString($rComboBox, "����", 9, 9)
_GUICtrlComboBoxEx_AddString($rComboBox, "�ҵĵ���", 8, 8)
;~ _GUICtrlComboBoxEx_SetItemIndent ($rComboBox, 2, 2)
$rFixed = DriveGetDrive("FIXED")
If Not @error Then
        For $rFix = 1 To $rFixed[0]
                $rVar = $rVar & ";" &$rFixed[$rFix]
        Next
        $rVar = StringTrimLeft(StringUpper($rVar),1)
        $a = _GUICtrlComboBoxEx_AddString($rComboBox, "����Ӳ��(" & $rVar & ")", 6, 6, 6 ,1)
EndIf
$var = DriveGetDrive("All")
If Not @error Then
        For $i = 1 To $var[0]
                $Type = DriveGetType($var[$i])
                $rVar = StringUpper($var[$i])
                If Not @error Then
                        If $Type = "CDROM" Then
                                _GUICtrlComboBoxEx_AddString($rComboBox, "CD ������(" & $rVar & ")", 7, 7, 7, 1)
                        ElseIf $Type = "FIXED" Then
                                _GUICtrlComboBoxEx_AddString($rComboBox, "����Ӳ��(" & $rVar & ")", 6, 6, 6 , 1)
                        ElseIf $Type = "REMOVABLE" Then
                                _GUICtrlComboBoxEx_AddString($rComboBox, "�ƶ��洢(" & $rVar & ")", 5, 5, 5 , 1)
                        Else
                                _GUICtrlComboBoxEx_AddString($rComboBox, "δ֪����(" & $rVar & ")", 10, 10,10,1)
                        EndIf
                EndIf
        Next
EndIf
_GUICtrlComboBoxEx_EndUpdate ($rComboBox)

_GUICtrlComboBoxEx_AddString($rComboBox, "��� ...", 11, 11)
_GUICtrlComboBoxEx_SetCurSel($rComboBox, 5)
_GUICtrlComboBoxEx_ShowDropDown($rComboBox, True)
#EndRegion ### END Koda GUI section ###

While 1
        $nMsg = GUIGetMsg()
        Switch $nMsg
                Case $GUI_EVENT_CLOSE
                        Exit
                Case $rButton
                        $sAr = ComboBoxEx_GUICtrlRead($rComboBox)
                        MsgBox(0,"ѡ����Ŀ",$sAr)
        EndSwitch
WEnd

Func ComboBoxEx_GUICtrlRead($hWnd)
        $sAr = _GUICtrlComboBoxEx_GetCurSel($rComboBox)
        $rAr = _GUICtrlComboBoxEx_GetListArray($rComboBox)
        Return $rAr[$sAr + 1]
EndFunc