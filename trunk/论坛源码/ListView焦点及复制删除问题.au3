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

#include <Access.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <ListViewConstants.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <GUIConstants.au3>
#include <GUIListView.au3>
#include <Array.au3>
#include <GuiEdit.au3>


Opt("GUIOnEventMode", 1)

$FrmConfirm = GUICreate("Confirm", 505, 385, -1, -1)
GUISetOnEvent($GUI_EVENT_CLOSE, "_GUI")
$LstPass = GUICtrlCreateListView("NO|LOC|     Symptom     ", 5, 60, 220, 270)
_GUICtrlListView_SetItemSelected($LstPass,1,True,True)
GUICtrlCreateListViewItem("01|C1|ABC", $LstPass)
GUICtrlCreateListViewItem("03|C3|FEG", $LstPass)
GUICtrlCreateListViewItem("04|D3|DEF", $LstPass)

$LstFail = GUICtrlCreateListView("NO|LOC|     Symptom     ", 280, 60, 220, 270)
$BtnConfirm = GUICtrlCreateButton("Finish", 150, 340, 200, 32)
GUICtrlSetOnEvent(-1, "_GUI")

$Right = GUICtrlCreateButton("->", 230, 140, 46, 50)
GUICtrlSetOnEvent(-1, "_GUI")

$Left = GUICtrlCreateButton("<-", 230, 220, 46, 50)
GUICtrlSetOnEvent(-1, "_GUI")

GUISetState(@SW_SHOW, $FrmConfirm)


While 1
        Sleep(10)
        
WEnd

Func _GUI()

        Switch @GUI_CtrlId

                Case $BtnConfirm, $GUI_EVENT_CLOSE
                        Exit
                Case $Right
                        _GUICtrlListView_CopyItems($LstPass, $LstFail, True)
                Case $Left
                        _GUICtrlListView_CopyItems($LstFail, $LstPass, True)
                        
        EndSwitch
EndFunc   ;==>_GUI