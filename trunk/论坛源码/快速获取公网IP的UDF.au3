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
;~ MsgBox(0, '��ȡ����IP',"��Ĺ���IP�ǣ�"& _NetworkGetInternetIP())
;~ Func _NetworkGetInternetIP()
;~         Local $ip
;~          $ip=InetRead("http://www.aamailsoft.com/getip.php",1)
;~          $ip=BinaryToString($ip)
;~         If      StringStripWS($ip,8) <> "" Then
;~                 Return $ip
;~         Else
;~                 Return "0.0.0.0"
;~         EndIf
;~ EndFunc   ;==>_NetworkGetInternetIP



MsgBox(0, '��ȡ����IP',"��Ĺ���IP�ǣ�"& _getmyip())
Func _getmyip()
        Local $oiehtml = BinaryToString(InetRead("http://iframe.ip138.com/ic.asp"))
        Local $strarray = StringRegExp($oiehtml, '\[([^\]]+)', 3)
        If Not @error Then
                Return $strarray[0]
        Else
                Local $err = "����"
                Return $err
        EndIf
EndFunc   ;==>_getmyip