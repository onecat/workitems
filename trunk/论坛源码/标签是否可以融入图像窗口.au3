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
#include <WindowsConstants.au3>
Local $Pic = RegRead('HKLM\SOFTWARE\AutoIt v3\AutoIt', 'InstallDir') & '\Examples\GUI\msoobe.jpg'
If Not FileExists($Pic) Then Exit MsgBox(48, '', 'ͼƬ�����ڣ�����')
Local $hGUI = GUICreate('����...@afan', 380, 200, -1, -1, $WS_POPUP, $WS_EX_LAYERED)
GUICtrlCreatePic($Pic, -5, 0, 380 + 5, 200, -1, 0x00100000)
GUISetState()
Local $hCGui = GUICreate('', 300, 230, 0, 10, $WS_POPUP, $WS_EX_LAYERED + $WS_EX_MDICHILD, $hGUI)
GUISetBkColor(0x333333, $hCGui)
GUICtrlCreateLabel('Esc ���˳�', 10, 0, 350, 12)
GUICtrlSetColor(-1, 0xEEEEEE)
Local $iLabel2 = GUICtrlCreateLabel('       ..........', 80, 110, 350, 20)
GUICtrlSetFont(-1, 12, 800, -1, '΢���ź�')
GUICtrlSetColor(-1, 0xFFFFFF)
_API_SetLayeredWindowAttributes($hCGui, 0x333333, 200)
GUISetState()
Local $sTime, $x = AdlibRegister('_MTimer', 100)
Do
Until GUIGetMsg() = -3
Func _MTimer() ;����ʱ��
        Local $Time = StringFormat('%02s ʱ, %02s ��, %02s ��, %02s ����', @HOUR, @MIN, @SEC, @MSEC)
        If $sTime <> $Time Then ControlSetText($hCGui, '', $iLabel2, $Time)
        $sTime = $Time
EndFunc   ;==>_MTimer
Func _API_SetLayeredWindowAttributes($hwnd, $i_transcolor, $Transparency = 255) ;����ǰ������͸��
        $i_transcolor = Hex(String($i_transcolor), 6)
        $i_transcolor = Execute('0x00' & StringMid($i_transcolor, 5, 2) & StringMid($i_transcolor, 3, 2) & StringMid($i_transcolor, 1, 2))
        DllCall('user32.dll', 'int', 'SetLayeredWindowAttributes', 'hwnd', $hwnd, 'long', $i_transcolor, 'byte', $Transparency, 'long', 3)
EndFunc   ;==>_API_SetLayeredWindowAttributes


