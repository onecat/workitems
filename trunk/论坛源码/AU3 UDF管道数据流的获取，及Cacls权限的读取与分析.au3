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

#include <Constants.au3>
 
;####### ʾ��ʼ #########
MsgBox(0,"ֱ�Ӳ鿴 cacls.exe c:\windows\Explorer.exe �Ĺܵ���������",kc_STD_Return("cacls.exe","c:\windows\Explorer.exe")&@CRLF)
 
Local $a = kc_Cacls_Return("c:\windows\Explorer.exe")
Local $txt
For $i=1 To $a[0]
        $txt &= @CRLF&$a[$i]
Next
MsgBox(0,"�鿴 c:\windows\Explorer.exe ��Ȩ�ޣ�","   ��Ϣ����"&$a[0]&@CRLF&$txt&@CRLF)
 
MsgBox(0,"Administrators ��Explorer.exe�ϵ�Ȩ�ޣ�",kc_UserCacls_Return("c:\windows\Explorer.exe","Administrators"))
;####### ʾ���� #########
 
#cs
��д��KiwiCsj @ 200903241359
���ܣ�ȡָ������Ĺܵ�������
���ͣ�kc_STD_Return(ָ������,�����򴫵ݵĲ���,ָ���ĳ���Ĺ���·��)     
        ȱʡ����·��ΪϵͳĿ¼
���أ���ȡ���Ĺܵ��������ı�
 
#ce
Func kc_STD_Return($kcu_Pro,$kcu_Key,$kcu_WorkPath=@SystemDir)  ;
        Local $kcu_info,$kcu_ReadProcessPid
        $kcu_ReadProcessPid = Run($kcu_Pro&" "&$kcu_Key,$kcu_WorkPath, @SW_HIDE, $STDERR_CHILD + $STDOUT_CHILD)
        While 1
                $kcu_info &= StdoutRead($kcu_ReadProcessPid)
                If @error Then ExitLoop
        Wend
        Return StringStripWS($kcu_info,7)
EndFunc ;==>kc_STD_Return
 
#cs
��д��KiwiCsj @ 200903241359
���ܣ�ȡָ���ļ���Ȩ���б�
���ͣ�kc_Cacls_Return(ָ���ļ�,��ʽ)    
        ��ʽ1���������а���������Ϣ�����ܿ��������� 
        ȱʡ��ʽΪ2
���أ�Ȩ�����飬���鵥Ԫ0Ϊ�����е�������������0��Ԫ����1��ԪΪ�ļ�����·����2��ԪʼΪ��Ȩ�� �û�����ʽ��Ȩ��ֵ
 
#ce
Func kc_Cacls_Return($kcu_file,$kcu_mode=2)     
        Local $kcu_Pro = "cacls.exe", $kcu_info, $kcu_tmpA, $kcu_tmpB
        $kcu_info = kc_STD_Return($kcu_Pro,$kcu_file)
        If $kcu_info <> "" Then
                $kcu_tmpA = StringSplit($kcu_info,":",1)                ;ȡ���η���
                Local $kcu_ReArray[$kcu_tmpA[0]+2]
                For $i=$kcu_tmpA[0] To 1 Step -1
                        $kcu_tmpB = StringSplit($kcu_tmpA[$i]," ")      ;ȡ���η���(��1Ϊǰһ�����ĩ��)
                        $kcu_ReArray[$i-1] = $kcu_tmpB[1]
                        For $s = 2 To $kcu_tmpB[0]                                      ;ȡ��ĩ���������
                                $kcu_ReArray[$i] &= " "&$kcu_tmpB[$s]
                        Next
                        If $kcu_mode <> 1 And $i <> 1 Then 
                                Local $kcu_t = StringInStr($kcu_ReArray[$i],"\",1)
                                If $kcu_t <> 0 Then $kcu_ReArray[$i] = StringReplace($kcu_ReArray[$i],StringMid($kcu_ReArray[$i],3,$kcu_t-2),"")
                        EndIf
                Next
                $kcu_ReArray[1] = $kcu_ReArray[0]&":"&$kcu_ReArray[1]
                $kcu_ReArray[0] = $kcu_tmpA[0]-1                        ;������
        EndIf
        Return $kcu_ReArray     ; ����
EndFunc ;==>kc_Cacls_Return
 
#cs
��д��KiwiCsj @ 200903241359
���ܣ�ȡָ���ļ���ָ���û���Ȩ��ֵ
���ͣ�kc_UserCacls_Return(ָ���ļ�,ָ���û�)
���أ�windows��Ȩ�޴��룬F = ��ȫȨ�ޣ�R = ֻ�����������
 
#ce
Func kc_UserCacls_Return($kcu_file,$kcu_user)
        Local $kcu_cac = kc_Cacls_Return($kcu_file)
        For $i = 2 To $kcu_cac[0]
                If StringInStr($kcu_cac[$i],$kcu_user) <> 0 Then
                        Local $kcu_cacT = StringSplit($kcu_cac[$i]," ",1)
                        Return $kcu_cacT[1]
                EndIf
        Next
EndFunc ;==>kc_UserCacls_Return
