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
#include<ie.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <StaticConstants.au3>
 
$oIE = _IECreateEmbedded()
$Form1 = GUICreate("ר��", 750, 550, -1, -3,0x00070000); $WS_SIZEBOX)
$B1 = GUICtrlCreateButton("�ٶ�", 5, 90, 58, 25)
$B2 = GUICtrlCreateButton("����", 65, 90, 58, 25)
GUICtrlCreateLabel("", 5, 10, 740, 3, $SS_ETCHEDHORZ)
GUICtrlCreateLabel("Don't say let me to see what help files, can understand will not come" & @CRLF & _
                "here, can't, the brain stupid, will only pick up the ready-made", 10, 20)
GUICtrlCreateLabel("", 5, 80, 740, 3, $SS_ETCHEDHORZ)
 
$ClearEdit1 = GUICtrlCreateLabel("www.autoitx.com", 10, 57, 120)
GUICtrlSetFont($ClearEdit1, 10, 800)
GUICtrlSetColor($ClearEdit1, 0x000090)
 
$GUIActiveX = GUICtrlCreateObj($oIE, 0, 120, 750, 550) ; GUICtrlCreateObj($oIE, 0, 120, 1000, 1000)==>GUICtrlCreateObj($oIE, 0, 120, 750, 550)
GUICtrlSetResizing(-1, 1) ;�����GUICtrlSetResizing(�����´��ڵĴ�С�������ô��ڴ�С������.)
GUISetState()
 
Local $hWndb, $sTafa = True, $sTafb = True
 
While 1
        $Pos = GUIGetCursorInfo($Form1)
        If Not @error Then _Hyperlink($Pos[4])
 
        $msg = GUIGetMsg()
        Select
                Case $msg = $GUI_EVENT_CLOSE
                        Exit
                Case $msg = $B1
                        _IENavigate($oIE, "http://www.baidu.com")
                Case $msg = $B2
                        _IENavigate($oIE, "http://www.sina.com.cn")
                Case $msg = $ClearEdit1
                        ShellExecute("www.autoitx.com")
        EndSelect
WEnd
 
Func _Hyperlink($hWnda)
        If $hWnda = 8 Then
                If $sTafb = True Then
                        GUICtrlSetFont($hWnda, 10, 800, 4)
;~                      GUICtrlSetColor($hWnda, 0x0080CC)
                        $hWndb = $hWnda
                        $sTafb = False
                        $sTafa = False
                EndIf
        Else
                If $sTafa = False Then
                        GUICtrlSetFont($hWndb, 10, 800)
;~                      GUICtrlSetColor($hWndb, 0x000000)
                        $sTafa = True
                        $sTafb = True
                EndIf
        EndIf
EndFunc   ;==>_Hyperlink