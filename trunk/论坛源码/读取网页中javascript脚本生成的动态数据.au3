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
Local $http = 'http://www.timedate.cn/worldclock/ti.asp'
Local $sData = InetRead($http)
Local $Source = BinaryToString($sData, 1)
Local $aSR = StringRegExp($Source, 'n\w+\=(\d+)', 3)
If @error Or UBound($aSR) < 7 Then Exit
Local $Array[8] = ['��', 'һ', '��', '��', '��', '��', '��', '��']
MsgBox(0, '', StringFormat('%d��%d��%d�� ����%s %02d:%02d:%02d', $aSR[0], $aSR[1], $aSR[2], $Array[$aSR[3]], $aSR[4], $aSR[5], $aSR[6]))

;~ $oIE=ObjCreate('internetExplorer.application')
;~ $oIE.navigate('http://www.timedate.cn/worldclock/ti.asp')
;~ Sleep(1000)
;~ MsgBox(0,'��ǰʱ��',$oIE.document.getElementById('clock').innerHTML)
