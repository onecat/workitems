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

#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
 Au3 �汾: AutoIt v3.3.6.1
 �������: ��������
 ִ�л���: WinXP
 ��������: 2009-12-31
 �޸�����: 2011-03-16
 �ű�����: easefull
        Email: 
        QQ/TM: 19519549
 �ű��汾: 1.1.0 Build 20110316
 �ű�����: ���Դ�8����Ϣ��Դ��ȡ����IP��ַ�������ַ����ȡ˳��ɿء�
#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
#include <Array.au3>
$asResult = fn_GetWanIP(2)
If Not IsArray($asResult) Then
        MsgBox(4096, "", "���ؽ��������" &@LF& $asResult)
Else
        _ArrayDisplay($asResult)
EndIf
Exit





; ===============================================================================================================================
; ��������: fn_GetWanIP
; ��������: AutoIt3 v3.3.6.1
; �����汾: 1.1.0 Build 20110316
; ����˵��: ���ݲ���,ѡ��Ӳ�ͬ����Ϣ������ȡ����IP��ַ
; �����﷨: fn_GetWanIP($sInfoSource, $sTempDir, $sTempFile)
; ����˵��: $sInfoSource        ����        ��ϢԴ��ʶ/���
;                   |1                        ����        ��ϢԴ���,ѡ����ϢԴ��                        http://www.ip138.com/ip2city.asp
;                   |2                        ����        ��ϢԴ���,ѡ����ϢԴ��                         http://www.whatismyip.com/automation/n09230945.asp
;                   |3                        ����        ��ϢԴ���,ѡ����ϢԴ��                         http://www.aamailsoft.com/getip.php
;                   |4                        ����        ��ϢԴ���,ѡ����ϢԴ��                         http://checkip.dyndns.org/
;                   |5                        ����        ��ϢԴ���,ѡ����ϢԴ��                         http://www.geobytes.com/IpLocator.htm
;                   |6                        ����        (Ĭ��)��ϢԴ���,ѡ����ϢԴ��        http://ip.qq.com/cgi-bin/index
;                   |7                        ����        ��ϢԴ���,ѡ����ϢԴ��                         http://www.123cha.com/ip/
;                                |8                        ����        ��ϢԴ���,ѡ����ϢԴ��                         http://ip.91cool.net/ip.php
;                   
;                   |ip138                ����        ��ϢԴ��ʶ,ѡ����ϢԴ��                        http://www.ip138.com/ip2city.asp
;                   |whatismyip        ����        ��ϢԴ��ʶ,ѡ����ϢԴ��                         http://www.whatismyip.com/automation/n09230945.asp
;                   |aamailsoft        ����        ��ϢԴ��ʶ,ѡ����ϢԴ��                         http://www.aamailsoft.com/getip.php
;                   |dyndns                ����        ��ϢԴ��ʶ,ѡ����ϢԴ��                         http://checkip.dyndns.org/
;                   |geobytes        ����        ��ϢԴ��ʶ,ѡ����ϢԴ��                         http://www.geobytes.com/IpLocator.htm
;                   |qq                        ����        ��ϢԴ��ʶ,ѡ����ϢԴ��                         http://ip.qq.com/cgi-bin/index
;                   |123cha                ����        ��ϢԴ��ʶ,ѡ����ϢԴ��                         http://www.123cha.com/ip/
;                   |91cool                ����        ��ϢԴ��ʶ,ѡ����ϢԴ��                         http://ip.91cool.net/ip.php
;                   
;           $iMode                        ����        �Ƿ�ֻʹ��ָ������ϢԴ��ȡIP��ַ(1 = yes|0(Ĭ��) = no)
;           $sTempDir                ����        ������ȡ���������˲�����ʽֻΪ�˼��ݾɰ汾����
;           $sTempFile                ����        ������ȡ���������˲�����ʽֻΪ�˼��ݾɰ汾����
; �� �� ֵ: ����һ�����飺
;                                        ��һ��Ԫ��($array[0])��������IP��ַ����ȡʧ�ܷ��� "0.0.0.0"
;                                        �ڶ���Ԫ��($array[1])��������IP��ַ���ڵ������ַ����ȡʧ�ܷ��ؿ��ַ�
;                                        ������Ԫ��($array[2])������Ϣ��Դ��ַ����ȡʧ�ܷ��ؿ��ַ�
; ��������: easefull
; ��������: 2009-12-31
; ��������: 2011-03-16
; ��������: 
; �޸�˵��: 
; ��غ���: 
; ������ҳ: 
; ����ʾ��: 
;           Example 1: 
;           #include <Array.au3>
;           $Array = fn_GetWanIP()
;           _ArrayDisplay($Array)
;           
;           Example 2: 
;           #include <Array.au3>
;           $iInfoSource = 1
;           $Array = fn_GetWanIP($iInfoSource)
;           _ArrayDisplay($Array)
;           
;           Example 3: 
;           #include <Array.au3>
;           $sInfoSource = "ip138"
;           $Array = fn_GetWanIP($sInfoSource)
;           _ArrayDisplay($Array)
;           
;           Example 4: 
;           #include <Array.au3>
;           $iInfoSource = "ip138"
;           $iMode = 1
;           $Array = fn_GetWanIP($iInfoSource, $iMode)
;           _ArrayDisplay($Array)
; ===============================================================================================================================
Func fn_GetWanIP($sInfoSource = 6, $iMode = 0, $sTempDir = "", $sTempFile = "")
        ;=================================================
        ; ����ֲ�����
        ; $sURL                                ����        ���� IP��ȡҳ��URL(Key)
        ; $asURL                        ����        ���� IP��ȡҳ��URL(����)
        ; $asResult                        ����        ���� ����IP��ַ�������ַ
        ; $nIndex                        ����        ���� �ɻ�ȡ����ϢԴ����
        ; $iStep                        ����        ���� ��Ϣ��ʶ�ۼ���
        ; $sHTML                        ����        ���� ����ҳ������
        ; $asIP[0]                        ����        ��ת���� ƥ������򷵻�ֵ
        ;=================================================
        Local $sURL = @CR & _
        "http://www.ip138.com/ip2city.asp" & @CR & _
        "http://www.whatismyip.com/automation/n09230945.asp" & @CR & _
        "http://www.aamailsoft.com/getip.php" & @CR & _
        "http://checkip.dyndns.org/" & @CR & _
        "http://www.geobytes.com/IpLocator.htm" & @CR & _
        "http://ip.QQ.com/cgi-bin/index" & @CR & _
        "http://www.123cha.com/ip/" & @CR & _
        "http://ip.91cool.net/ip.php" & @CR
        Local $asURL  = StringRegExp($sURL, '(?<=\r)[\S]+(?=\r)', 3)
        Local $nIndex = UBound($asURL), $iStep = 0, $iMark
        Local $asResult[3], $sHTML, $asIP[1]
        ;=================================================
        ; ����������ֹ�������
        ;=================================================
        ; ��ʽ������ ��ϢԴ��ʶ
        ;=================================================
        If StringIsDigit($sInfoSource) = 0 Or $sInfoSource > $nIndex Or $sInfoSource < 0 Then
                For $i = 0 To $nIndex - 1 Step 1
                        $asIP = StringRegExp($asURL[$i], '(?<=\.)\w+(?=\.)', 1)
                        If $sInfoSource == $asIP[0] Then
                                $sInfoSource = $i + 1
                                ExitLoop
                        EndIf
                Next
                If StringIsDigit($sInfoSource) = 0 Or $sInfoSource > $nIndex Or $sInfoSource < 0 Then $sInfoSource = 6
        EndIf
        ;=================================================
        ; ʹ�û�еָ��ṹ,�Ӳ�ͬ��Ϣ��ѭ����ȡIP��Ϣ
        ;=================================================
        Do
                ;=================================================
                ; ��ָ������ϢԴ��ȡ��Ϣ
                ;=================================================
                $sHTML = BinaryToString(InetRead($asURL[$sInfoSource - 1], 1))
                $asIP  = StringRegExp($sHTML, '(((25[0-5]|2[0-4]\d|[01]?\d?\d)\.){3}(25[0-5]|2[0-4]\d|[01]?\d?\d))', 1)
                ;=================================================
                ; ����ɹ���ȡ��Ϣ
                ;=================================================
                If Not @error Then
                        ;=================================================
                        ; ���� IP��ַ
                        ;=================================================
                        $asResult[0] = $asIP[0]
                        ;=================================================
                        ; ��ȡ ��Ϣ��Դ��ַ
                        ;=================================================
                        $asIP        = StringRegExp($asURL[$sInfoSource - 1], '(?<=\.)\w+\.\w+(?=\/)', 1)
                        If Not @error Then $asResult[2] = $asIP[0]
                        ;=================================================
                        ; ��ȡ IP���ڵ������ַ
                        ;=================================================
                        If $sInfoSource <> 6 And $sInfoSource <> 8 Then
                                ;=================================================
                                ; ��ϢԴ���ṩ�����ַ�Ľ��ӵ�6��ϢԴ��ȡ�����ַ
                                ;=================================================
                                $sInfoSource = 6
                                $sHTML = BinaryToString(InetRead($asURL[$sInfoSource - 1], 1))
                        EndIf
                        Select
                                Case $sInfoSource = 6
                                        $asIP = StringRegExp($sHTML, '(?<=<span>)[^<]+(?=</span></p>)', 1)
                                        If Not @error Then $asResult[1] = StringRegExpReplace($asIP[0], '&nbsp;', '')
                                Case $sInfoSource = 8
                                        $asIP = StringRegExp($sHTML, '(?<=����)[^"]+(?=")', 1)
                                        If Not @error Then $asResult[1] = $asIP[0]
                        EndSelect
                EndIf
                ;=================================================
                ; ��еָ�����
                ; ����ѭ������IP
                ;=================================================
                $iStep += 1
                $sInfoSource = $sInfoSource + $iStep
                If $sInfoSource > $nIndex Then $sInfoSource -= $nIndex
        Until $asResult[0] Or $iMode Or $iStep = $nIndex
        ;=================================================
        ; ����ִ�н��
        ;=================================================
        If Not $asResult[0] Then $asResult[0] = "0.0.0.0"
        Return($asResult)
EndFunc   ;==>fn_GetWanIP