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
;#include <Debug.au3>
Opt("MustDeclareVars", 1)
Opt("SendKeyDelay", 50)

;_DebugSetup ("Quick copy Koda GUI code")

HotKeySet("^!k", "QuickCopyKodaGUICode"); Main()
While 1
        Sleep(100)
WEnd

Func QuickCopyKodaGUICode()
        ;������������ڲ����ƴ������
        Local $kodaTitle = "Koda �����"
        If Not WinExists($kodaTitle) Then Return
        WinActivate($kodaTitle)
        WinWaitActive($kodaTitle)
        Send("{F9}")
        Sleep(500)
        Send("!c")
        ;���Ҵ���༭��
        Local $sciteTitle = "[REGEXPTITLE:.+SciTE\(ACN\).+]"
        If Not WinExists($sciteTitle) Then Return
        ;��ȡ�������
        Local $text = ClipGet()
        Local $startTag = "#Region ### START Koda GUI section ###"
        Local $start = StringInStr($text, $startTag)
        If ($start <= 0) Then Return
        Local $endTag = "#EndRegion ### END Koda GUI section ###"
        Local $end = StringInStr($text, $endTag)
        If ($end <= 0) Then Return
        Local $formCode = StringMid($text, $start, $end - $start + StringLen($endTag))
        ;��ȡ�ļ���
        Local $formName = ""
        Local $items = StringRegExp($formCode, StringReplace($startTag, " ", "\s") & "\sForm=(.+kxf?)\r\n", 1)
        If @error = 0 Then
                $formName = $items[0]
        EndIf
        ;���Ʊ༭������
        WinActivate($sciteTitle)
        WinWaitActive($sciteTitle)
        ;_DebugOut("�����Ѿ�����")
        ;ControlClick($sciteTitle, "", "[CLASS:Scintilla; INSTANCE:1]", "left", 120, 20)
        Send("^a^c")
        Local $code = ClipGet()
        ;_DebugOut("code:" & $code)
        If $formName <> "" Then
                $start = StringInStr($code, $startTag & " Form=" & $formName)
        Else
                $start = StringInStr($code, $startTag)
        EndIf
        If ($start <= 0) Then Return
        $end = StringInStr($code, $endTag)
        If ($end <= 0) Then Return
        ;_DebugOut("start:"&$start & ",end:"&$end)
        ;��ȡ�������
        Local $varsContent = "Local "
        Local $arrVars = StringRegExp($formCode, "(\$[\w]+)\s", 3)
        If @error = 0 Then
                For $i = 0 To UBound($arrVars) - 1
                        If StringInStr($varsContent, $arrVars[$i] & ", ") <= 0 Then
                                $varsContent = $varsContent & $arrVars[$i] & ", "
                        EndIf
                Next
        EndIf
        $varsContent = StringTrimRight($varsContent, 2)
        ;ƴ���µĴ���
        $startTag = $startTag & " Form=" & $formName
        Local $newCode = StringLeft($code, $start - 1) & $startTag & @CRLF _
                & $varsContent _
                & StringTrimLeft($formCode, StringLen($startTag)) _
                & StringRight($code, StringLen($code) - $end - StringLen($endTag))
        ClipPut($newCode)
        Send("^v")
EndFunc


#Region ### START Koda GUI section ### Form=d:\autoit\myapp\mytool.kxf
;test
#EndRegion ### END Koda GUI section ###
