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



#include <GuiMenu.au3>
#include <GuiConstantsEx.au3>
#include <WinAPI.au3>
;~ #include <WindowsConstants.au3>
 
Local $MenuItem[6]
Local $MenuItemName[6] = ['��', '�½� &N', '�� &O', '���� &S', '', '�˳� &X']
 
Local $MenuItem2[6]
Local $MenuItemName2[6] = ['���', '�ټ�', 'лл', '', '��', '�˳� &X']
 
; ���� GUI
$hGUI = GUICreate("�˵�������ʾ", 400, 300)
 
; �����ļ��˵�
$hMenu = GUICtrlCreateMenu("�˵�")
For $i = 0 To UBound($MenuItem) - 1
        $MenuItem[$i] = GUICtrlCreateMenuItem($MenuItemName[$i], $hMenu)
Next
 
$hMenu2 = GUICtrlCreateMenu("�˵�2")
For $i = 0 To UBound($MenuItem2) - 1
        $MenuItem2[$i] = GUICtrlCreateMenuItem($MenuItemName2[$i], $hMenu2)
Next
 
_GUIMenuSetBkColor($hGUI, 2, 0xffffff); ��Ϊ��ɫ
GUISetState()
 
Do
Until GUIGetMsg() = $GUI_EVENT_CLOSE




#include <GuiMenu.au3>
#include <WinAPI.au3>
#include-once
; #FUNCTION# ===================================================================
; �������� ...........: _GUIMenuSetBkColor()
; ���� ...............: ����GUI�˵�������ɫ.
; �﷨ ...............:  _GUIMenuSetBkColor($hWnd, $Menu_num, $Menu_BkColor)
;                     : $hWnd = ���ڵľ��.
;                     : $Menu_num = �˵�����.
;                     : $Menu_BkColor = ���ڱ���ɫ.
;
; ����................: lixiaolong - [url]http://www.autoitx.com/[/url]
;===============================================================================
Func _GUIMenuSetBkColor($hWnd, $Menu_num, $Menu_BkColor)
        Local $_count, $h_File
        Local $Get_Menu_Handle = _GUICtrlMenu_GetMenu($hWnd)
        Local $h_Brush = _WinAPI_CreateSolidBrush($Menu_BkColor); ��ɫ

        For $_count = 0 To $Menu_num - 1
                $h_File = _GUICtrlMenu_GetItemSubMenu($Get_Menu_Handle, $_count)
                If Not $h_File Then ExitLoop
                _GUICtrlMenu_SetMenuBackground($h_File, $h_Brush)
                _GUICtrlMenu_SetItemType($h_File, 0, $MFT_MENUBREAK, 1)
        Next
        If $_count Then
                Return True
        Else
                Return False
        EndIf
EndFunc   ;==>_GUIMenuSetBkColor
