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
;$iFlag = Trueȡip���ڳ���      ��$iFlag = falseȡip
;�����ؿ�ֵ��������@errorΪ-1
;By CrossDoor
MsgBox(0,"IP",_GetAddress(false))
MsgBox(0,"���ڳ���",_GetAddress(True))
Func _GetAddress($iFlag = True)
        $bReadIp = InetRead("http://www.onlinedown.net/ajax_ip.php")
        $return = BinaryToString($bReadIp)
        $IP = StringRegExp($return, '((2[0-4]\d|25[0-5]|[01]?\d\d?)\.){3}(2[0-4]\d|25[0-5]|[01]?\d\d?)', 2)
        If Not @error Then
                If $iFlag Then
                        $bReadCity = InetRead("http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=json&ip=" & $IP[0])
                        $return = BinaryToString($bReadCity)
                        $Mid1 = StringInStr($return, 'city":"')
                        $Mid2 = StringInStr($return, '","district"')
                        $City = StringMid($return, $Mid1+7,$Mid2-$Mid1-7)               
                        Return (BinaryToString(Binary("0x" & StringReplace($City,"\u","")), 3))
                Else
                        Return $IP[0]
                EndIf
        Else
                Return SetError(-1, 0, "")
        EndIf
EndFunc

