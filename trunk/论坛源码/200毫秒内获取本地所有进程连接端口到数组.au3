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

#include <Array.au3>
#Include <File.au3>

$ddd=port_list()
_ArrayDisplay($ddd,'Debug~~~')        

Func port_list()
Local $port_list = @TempDir & '\port_list.txt'
RunWait(@ComSpec & " /c " & 'netstat -ano >' & $port_list, '', @SW_HIDE)
$sum=_FileCountLines($port_list)-4
Global $list[$sum][6]
Local $file = FileOpen($port_list)
If $file <> -1 Then
        $f=0
        While 1
                Local $line = FileReadLine($file,$f+5)
                If @error = -1 Then ExitLoop
                                        $line=StringRegExpReplace($line,"(.\h{5,15})","    ")
                                        Local $aArray = StringSplit($line,"    ",2+1)
                                        ;_ArrayDisplay($aArray,$f)        
                                                If @error=0 Then 
                                                        For $i = 0 To UBound($aArray)-1
                                                                          $list[$f][$i]=$aArray[$i]
                                                        next
                                                   $list[$f][5]=_GetProcPath($aArray[$i-1]) 
                                                EndIf 
                                        $f=$f+1                
                WEnd
EndIf
FileClose($file)
   Return $list
EndFunc 
Func _GetProcPath($iPID)
        Local $aProc = DllCall('kernel32.dll', 'hwnd', 'OpenProcess', 'int', 0x00000410, 'int', 0, 'int', $iPID)
        If $aProc[0] = 0 Then Return SetError(1, 0, '')
        Local $vStruct = DllStructCreate('int[1024]')
        DllCall('psapi.dll', 'int', 'EnumProcessModules', 'hwnd', $aProc[0], 'ptr', DllStructGetPtr($vStruct), 'int', _
                        DllStructGetSize($vStruct), 'int_ptr', 0)
        Local $aReturn = DllCall('psapi.dll', 'int', 'GetModuleFileNameEx', 'hwnd', $aProc[0], 'int', _
                        DllStructGetData($vStruct, 1), 'str', '', 'int', 2048)
        If StringLen($aReturn[3]) = 0 Then Return SetError(2, 0, '')
        Return $aReturn[3]
EndFunc   ;==>_GetProcPath