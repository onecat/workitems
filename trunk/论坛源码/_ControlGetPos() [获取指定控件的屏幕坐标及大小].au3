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

;���ӣ�
ShellExecute(@SystemDir & '\calc.exe')
Sleep(1000)
$cp = _ControlGetPos('������', '', 'Button13')
MsgBox(0, 'C ������Ļ����Ϊ�� ' & $cp[0] & '  ' & $cp[1], '���ȷ�����ƶ���굽Ŀ������λ�� ')
MouseMove($cp[0] + $cp[2] / 2, $cp[1] + $cp[3] / 2)


; ������:_ControlGetPos;========================================================================
; ˵��:����ȡָ���ؼ������Ļ���Ͻ�(0,0)������λ�úʹ�С����Ϣ
; �﷨:��_ControlGetPos('���ھ�������', '�����ı�', '�ؼ�ID')
; ����ֵ:�ɹ�: ����һ������ָ���ؼ������Ļ���Ͻ�(0,0)λ�ü���С��Ϣ������: 
;��������������$array[0] = X ����, $array[1] = Y ����, $array[2] = ���, $array[3] = �߶� 
;��������ʧ��: ����0��������@Error=1 ָ���Ĵ��ڻ�ؼ������ڣ�@Error=2 ����$tagPOINT�ṹ����
; ����:��Afan - www.autoitx.com
;==========================================================================================start
Func _ControlGetPos($hWnd, $text, $Ctrlid)
        Local $ControlPos = ControlGetPos($hWnd, $text, $Ctrlid)
        If @error Then Return SetError(1)
        If Not IsHWnd($hWnd) Then $hWnd = WinGetHandle($hWnd, $text)
        Local $tPoint = DllStructCreate('int X;int Y')
        DllStructSetData($tPoint, 'X', $ControlPos[0])
        DllStructSetData($tPoint, 'Y', $ControlPos[1])
        DllCall("user32.dll", "bool", "ClientToScreen", "hwnd", $hWnd, "ptr", DllStructGetPtr($tPoint))
        If @error Then Return SetError(2)
        Local $xy[4] = [DllStructGetData($tPoint, 'X'), DllStructGetData($tPoint, 'Y'), $ControlPos[2], $ControlPos[3]]
        Return $xy
EndFunc   ;==>_ControlGetPos