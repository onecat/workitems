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
#include <GUIConstantsEx.au3>
#include <ProgressConstants.au3>
#include <WindowsConstants.au3>
#include <IE.au3>
#Region ### START Koda GUI section ### Form=
Local $get ,$size
$Form1 = GUICreate("����", 623, 442, 192, 124)
$Progress1 = GUICtrlCreateProgress(72, 96, 393, 65)
$Button1 = GUICtrlCreateButton("", 104, 216, 305, 97)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
        $nMsg = GUIGetMsg()
        Switch $nMsg
                Case $GUI_EVENT_CLOSE
                        Exit

                Case $Button1
					rt()
        EndSwitch
WEnd

Func rt()
	                   $url = "http://cjxlist.googlecode.com/svn/CustomStrings.dat"
						;$url = "http://192.168.0.180:621/%E6%9D%BF%E7%AB%AF/CustomStrings.dat"
                        $get = InetGet($url, @ScriptDir & "\update.dat", 1, 1)
                       $size = Int(InetGetSize($url) / 1024)
;~                         AdlibRegister("Down")
;~ 							Do
;~ 							Sleep(250)
;~ 								
;~ 						Until InetGetInfo($get, 2)
;~ 						Local $nBytes = InetGetInfo($get, 0)
;~ 						InetClose($get) 
;~ 						MsgBox(0,"","1")
;~ 						MsgBox(0,"","2")
EndFunc

Func Down()
        $newsize = InetGetInfo($get)
        $pro = Int($newsize[0] / 1024) / $size
        GUICtrlSetData($Progress1, $pro * 100)
        GUICtrlSetData($Button1, "������ " & Int($pro * 100) & "%")
EndFunc   ;==>Down
	