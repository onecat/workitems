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

;ʵ��
_QRcode(@ScriptDir&'\1.png',200,'Should you have any questions concerning this EULA, or if you desire to contact the author of this Software for any reason, please contact him/her at the email address mentioned at ')
If @error Then MsgBox(96,'',@error)


;$sPath:�����ļ��Ĵ�·�����ļ�����ӦΪpng�ļ�
;$WH:�����ļ��Ŀ��
;���������ļ����ַ���
#include<array.au3>
Func _QRcode($sPath, $sWH, $sString)
        If StringRegExp($sString, '[^\x00-\xff]') Then
                SetError(1)
                Return False
        EndIf;����Ƿ�Ϊȫ���ֽ�
    $sString = StringReplace($sString,'+','%2B')
        $sString = StringReplace($sString,'%','%25')
        $sString = StringReplace($sString,@CR,'%0D')
        $sString = StringReplace($sString,@LF,'%0A')
        $sString = StringReplace($sString,' ','+')
        If StringLen($sString) +stringlen("http://chart.apis.google.com/chart?cht=qr&chs=" & $sWH & 'x' & $sWH & "&chl=" ) > 2048 Then
                SetError(2)
                Return False
        EndIf;�ַ�����
        FileDelete($sPath)
        ;��ʼ�������ݣ�����ȡ��ά����
        InetGet("http://chart.apis.google.com/chart?cht=qr&chs=" & $sWH & 'x' & $sWH & "&chl=" & $sString, $sPath, 1, 0)
        If @error  Then
                SetError(3)
                Return False
        EndIf;�������
 
        Return True
EndFunc   ;==>_QRcode

