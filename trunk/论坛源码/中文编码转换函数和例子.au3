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

#include <winapi.au3>

Local $sInputText = 'AutoIt ����ѧԺ'
$fan=_JianToFan($sInputText)
MsgBox(0,'��ת����',$fan)
$jian=_FanToJian($sInputText)
MsgBox(0,'��ת��',$jian)
$big5=_GbkToBig5($fan)
MsgBox(0,'ת���壺',$big5)
$gbk=_Big5toGbk($big5)
MsgBox(0,'תGBK��',$gbk)
$jian=_FanToJian($gbk)
MsgBox(0,'��ת��',$jian)


Func _Big5toGbk(ByRef $sInputText);BIG5תGBK
    $sInputText = _WinAPI_MultiByteToWideChar($sInputText, 950, $MB_COMPOSITE, False);תΪ��������
    $sInputText = _WinAPI_WideCharToMultiByte($sInputText, 936);תΪGBK��������
    Return $sInputText
EndFunc   ;==>_Big5toGbk

Func _GbkToBig5($sInputText);GBKתBIG5
    $sInputText = _WinAPI_MultiByteToWideChar($sInputText, 936, $MB_COMPOSITE, False);תΪ��������
    $sInputText = _WinAPI_WideCharToMultiByte($sInputText, 950);תΪGBK��������
    Return $sInputText
EndFunc

Func _JianToFan($sInputText);GB2312תGBK
Local $InPtr = _WinAPI_MultiByteToWideChar($sInputText, 936, $MB_COMPOSITE, False)
Local $OutPtr
Local $dll=DllOpen('kernel32.dll')
Local $result = DllCall($dll, "none","LCMapStringA", "LONG", 0x0804, "dword", 0x4000000, "STR", _
                    DllStructGetData($InPtr,1),"LONG",DllStructGetSize($InPtr),"str",$OutPtr,'long',DllStructGetSize($InPtr)); "PTR",$OutPtr,'long',DllStructGetSize($InPtr))
If IsArray($result) Then Return $result[5]
EndFunc

Func _FanToJian($sInputText);GBKתGB2312
Local $InPtr = _WinAPI_MultiByteToWideChar($sInputText, 936, $MB_COMPOSITE, False)
Local $OutPtr
Local $dll=DllOpen('kernel32.dll')
Local $result = DllCall($dll, "none","LCMapStringA", "LONG", 0x0804, "dword", 0x2000000, "STR", _
                    DllStructGetData($InPtr,1),"LONG",DllStructGetSize($InPtr),"str",$OutPtr,'long',DllStructGetSize($InPtr)); "PTR",$OutPtr,'long',DllStructGetSize($InPtr))
If IsArray($result) Then Return $result[5]
EndFunc