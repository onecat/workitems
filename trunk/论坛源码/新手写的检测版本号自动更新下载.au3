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

Opt("TrayMenuMode", 1)
dim $oldver,$newver,$sFile1,$aArray1 ,$aArray,$sFile,$Input_Down
$sFile1 = @ScriptDir & "\ver.txt" ;<--��Ҫ�����ļ�
$aArray1 = StringSplit(FileRead($sFile1), @CRLF, 1)
$oldver=$aArray1[1]
;$oldver= FileGetVersion("�ҵĳ���.exe")
Reate_update($oldver)
 Func Reate_update($oldver)
                if InetGetSize("http://www.43979.cn/ver.txt")>0 then   ;<--�ж��Ƿ��������Ƿ������������
        InetGet("http://www.43979.cn/ver.txt", @ScriptDir & "\ver.txt", 1, 1)   ;<--���ذ汾��Ϣ
        TraySetState(4)
        While 1
                TrayTip("���ڼ���°汾", "Ŀǰ�汾Ϊ"&$oldver&",���ڼ���°汾", 1)
        WEnd
        
        TraySetState(8)

$sFile = @ScriptDir& "\ver.txt" ;<--��Ҫ�����ļ�
$aArray = StringSplit(FileRead($sFile), @CRLF, 1)
$newver=$aArray[1]
        TrayTip("���°汾Ϊ"&$newver,  "���°汾Ϊ"&$newver, 1)
        if $newver<>$oldver then
        If Not IsDeclared("iMsgBoxAnswer2") Then Local $iMsgBoxAnswer2
$iMsgBoxAnswer2 = MsgBox(1,"��ʾ�����°汾����","��ǰ�汾Ϊ"&$oldver&" �����°汾Ϊ"&$newver & @CRLF & "�Ƿ��Զ����£���ȷ����ť����" & @CRLF & "ȡ����ť������")
Select
        Case $iMsgBoxAnswer2 = 1 ;OK
Reate_down()
        Case $iMsgBoxAnswer2 = 2 ;Cancel
exit
EndSelect
        
        
Else
        TrayTip("��ǰ�汾Ϊ���°汾",  "��ǰ�汾Ϊ���°汾����ʱ����Ҫ����", 1)        
exit

endif
Else
TrayTip("��ȡ�汾ʧ��",  "��ȡ�汾ʧ��", 1)        
exit
endif
EndFunc


         Func Reate_down()
                if InetGetSize("http://www.43979.cn/main.exe")>0 then
        InetGet("http://www.43979.cn/main.exe", @ScriptDir & "\�ҵĳ���.exe", 1, 1)
        TraySetState(4)
        While 1
                TrayTip("�����������°汾", "�����������°汾", 1)
        WEnd
        
        TraySetState(8)
        TrayTip("��ȡ�°汾�ɹ�",  "��ȡ�°汾�ɹ�", 1)        
        
                exit
Else
TrayTip("��ȡ�°汾ʧ��",  "��ȡ�°汾ʧ�ܣ������ϰ汾", 1)        

        exit
endif
EndFunc