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

$Form1 = GUICreate("���߳�ʵ��", 272, 139, -1, -1)


$Label1 = GUICtrlCreateLabel("00:00:00:00", 8, 8, 146, 17)



$Label2 = GUICtrlCreateLabel("0", 8, 56, 150, 17)



$Label3 = GUICtrlCreateLabel("", 8, 104, 148, 17)



$Button1 = GUICtrlCreateButton("�ر��߳�1", 168, 8, 89, 25, 0)


$Button2 = GUICtrlCreateButton("�ر��߳�2", 168, 48, 89, 25, 0)


$Button3 = GUICtrlCreateButton("�ر��߳�3", 168, 96, 89, 25, 0)



GUISetState(@SW_SHOW)



Global $t2, $t3 = 1



$Timer = DllCallbackRegister("Timer", "int", "hwnd;uint;uint;dword")



$TimerDLL = DllCall("user32.dll", "uint", "SetTimer", "hwnd", 0, "uint", 0, "int", 1000, "ptr", DllCallbackGetPtr($Timer))



$Timer2 = DllCallbackRegister("Timer", "int", "hwnd;uint;uint;dword")



$Timer2DLL = DllCall("user32.dll", "uint", "SetTimer", "hwnd", 0, "uint", 0, "int", 200, "ptr", DllCallbackGetPtr($Timer2))



$Timer3 = DllCallbackRegister("Timer", "int", "hwnd;uint;uint;dword")



$Timer3DLL = DllCall("user32.dll", "uint", "SetTimer", "hwnd", 0, "uint", 0, "int", 500, "ptr", DllCallbackGetPtr($Timer3))



While 1



        Switch GUIGetMsg()


                Case - 3



                        Exit


                Case $Button1



                       DllCall("user32.dll", "int", "KillTimer", "hwnd", 0, "uint", $TimerDLL)


                        DllCallbackFree($Timer)



                Case $Button2



                        DllCall("user32.dll", "int", "KillTimer", "hwnd", 0, "uint", $Timer2DLL)


                        DllCallbackFree($Timer2)



                Case $Button3



                        DllCall("user32.dll", "int", "KillTimer", "hwnd", 0, "uint", $Timer3DLL)



                        DllCallbackFree($Timer3)



        EndSwitch



WEnd



Func Timer($hWnd, $uiMsg, $idEvent, $dwTime)


        If $idEvent = $TimerDLL[0] Then



                GUICtrlSetData($Label1, @HOUR & ":" & @MIN & ":" & @SEC & ":" & @MSEC)



        ElseIf $idEvent = $Timer2DLL[0] Then



                $t2 += 1



                GUICtrlSetData($Label2, $t2)



        ElseIf $idEvent = $Timer3DLL[0] Then


                $t3 *= 2



                GUICtrlSetData($Label3, $t3)



        EndIf



EndFunc
