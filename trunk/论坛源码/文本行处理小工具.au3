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

#region ;**** ���������� ACNWrapper_GUI ****
#AutoIt3Wrapper_Icon=AutoIt.ico
#endregion ;**** ���������� ACNWrapper_GUI ****

#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

$hGUI = GUICreate("Form1", 634, 210, 50, 2, BitOR($WS_POPUP, $WS_BORDER), _
                BitOR($WS_EX_TOPMOST, $WS_EX_TOOLWINDOW, $WS_EX_ACCEPTFILES))
GUISetBkColor(0xE0F0FE)

$ExitLabel = GUICtrlCreateButton("X", 613, -2, 20, 20)
GUICtrlSetFont(-1, 14, 800, 0, "MS Sans Serif")
GUICtrlSetColor(-1, 0xFF0000)

$Compare_Replace = GUICtrlCreateButton("�����ı���", 540, 180, 80, 20)

GUICtrlCreateLabel("Ŀ���ļ�", 10, 22, 60, 17)
$01 = GUICtrlCreateInput("����Ŀ���ı��ļ�", 65, 19, 555, 17)
GUICtrlSetState(-1, $GUI_DROPACCEPTED)

GUICtrlCreateLabel("�ؼ��ַ���", 375, 40, 60, 17)
$02 = GUICtrlCreateInput("", 375, 55, 245, 17)

GUICtrlCreateLabel("�滻�ַ���", 375, 90, 60, 17)
$03 = GUICtrlCreateInput("", 375, 105, 245, 17)

GUICtrlCreateLabel("·��\���ļ���.txt��", 375, 140, 140, 17)
$04 = GUICtrlCreateInput("�ϷŻ�����·��\���ļ���.txt", 375, 155, 245, 17)
GUICtrlSetState($04, $GUI_DROPACCEPTED)

GUICtrlCreateGroup(" ����ѡ��: ", 10, 42, 355, 158)
$radio1 = GUICtrlCreateRadio(" ������ʽ�滻�ؼ��ַ�.", 20, 58, 160, 16)
$radio2 = GUICtrlCreateRadio(" �ر�������ʽ,ֱ���滻�ؼ��ַ�.", 20, 75, 220, 16)

$radio3 = GUICtrlCreateRadio(" ɾ������Ϊ'�ؼ��ַ�' ��������.", 20, 105, 200, 17)
$radio4 = GUICtrlCreateRadio(" ɾ������Ϊ'�ؼ��ַ�' ��������, д�����ļ�.", 20, 125, 280, 17)

$radio5 = GUICtrlCreateRadio(" ɾ������'�ؼ��ַ�'��������.", 20, 155, 260, 17)
$radio6 = GUICtrlCreateRadio(" ������ʽɾ������'�ؼ��ַ�'��������.", 20, 175, 260, 17)

$radio7 = GUICtrlCreateRadio(" ɾ�����п���.", 250, 58, 100, 17)

GUICtrlCreateGroup("", -99, -99, 1, 1)

# ��ɫ�߿�:
Local $Pic0 = @ScriptDir & "\gradient_1024x24.jpg"
$Pic1 = GUICtrlCreatePic($Pic0, 0, 0, 613, 5, -1, $GUI_WS_EX_PARENTDRAG)
$Pic2 = GUICtrlCreatePic($Pic0, 0, 5, 5, 205, -1, $GUI_WS_EX_PARENTDRAG)
$Pic3 = GUICtrlCreatePic($Pic0, 0, 205, 633, 5, -1, $GUI_WS_EX_PARENTDRAG)
$Pic4 = GUICtrlCreatePic($Pic0, 628, 15, 5, 205, -1, $GUI_WS_EX_PARENTDRAG)

GUISetState(@SW_SHOW)
Global $radioX = ''
While 1
        $nMsg = GUIGetMsg()
        If $nMsg = 0 Or $nMsg = -11 Or $nMsg = -7 Or $nMsg = -8 Then
                ContinueLoop
        Else
        EndIf
        Switch $nMsg
                Case $GUI_EVENT_CLOSE
                        Exit
                Case $ExitLabel ;�˳�
                        Exit
                Case $GUI_EVENT_DROPPED
                        Local $mouse = GUIGetCursorInfo($hGUI)
                        Local $_str = ControlCommand($hGUI, '', $mouse[4], 'GetSelected', '')
                        If $mouse[4] = 6 Then
                                GUICtrlSetData($01, $_str)
                        ElseIf $mouse[4] = 12 Then
                                GUICtrlSetData($04, $_str)
                        EndIf
                Case $Compare_Replace
                        For $q = 1 To 7
                                If GUICtrlRead(Eval('radio' & $q)) = $GUI_CHECKED Then
                                        $radioX = $q
                                        ExitLoop
                                ElseIf $q = 7 And $radioX = '' Then
                                        MsgBox(16, '����', 'δѡ��������')
                                        ContinueCase
                                EndIf
                        Next
                        $Path_0 = GUICtrlRead($01)
                        If $Path_0 = '����Ŀ���ı��ļ�' Or $Path_0 = 0 Then
                                MsgBox(16, '����', 'û��ָ��Ŀ���ļ� !')
                                ContinueCase
                        EndIf
                        $Key = GUICtrlRead($02)
                        $displace = GUICtrlRead($03)
                        $New_File = GUICtrlRead($04)
                        If $radioX = 1 Then
                                If $Key = 0 Or $displace = 0 Then
                                        MsgBox(16, '����', 'û��ָ���ؼ��ַ� �� �滻�ַ� !')
                                        ContinueCase
                                Else
                                        _FileSRER2Line($Path_0, $Key, $displace);�����滻����Ϊ '�ؼ�\��'����
                                        _return(@extended)
                                EndIf
                        ElseIf $radioX = 2 Then
                                If $Key = 0 Or $displace = 0 Then
                                        MsgBox(16, '����', 'û��ָ���ؼ��ַ� �� �滻�ַ� !')
                                        ContinueCase
                                Else
                                        _FileSRER2Line($Path_0, $Key, $displace, 0, 0) ;�ر�����,���ļ��е����а���'�ؼ�\��'�����滻Ϊ'AB\C'
                                        _return(@extended)
                                EndIf
                        ElseIf $radioX = 3 Then
                                If $Key = 0 Then
                                        MsgBox(16, '����', 'û��ָ���ؼ��ַ� !')
                                        ContinueCase
                                Else
                                        _FileSRER2Line($Path_0, $Key) ;ɾ���ļ�������Ϊ'�ؼ���'��������
                                        _return(@extended)
                                EndIf
                        ElseIf $radioX = 4 Then
                                If $Key = 0 Or $New_File = '�ϷŻ�����·��\���ļ���.txt' Or $New_File = 0 Then
                                        MsgBox(16, '����', 'û��ָ���ؼ��ַ� �� ���ļ� !')
                                        ContinueCase
                                Else
                                        _FileSRER2Line($Path_0, $Key, '', 1, 1, 1, $New_File) ;ɾ���ļ��е���������Ϊ'�ؼ���'���У�д�뵽�� .txt �ļ�
                                        _return(@extended)
                                EndIf
                        ElseIf $radioX = 5 Then
                                If $Key = 0 Then
                                        MsgBox(16, '����', 'û��ָ���ؼ��ַ� !')
                                        ContinueCase
                                Else
                                        _FileSRER2Line($Path_0, $Key, '', 0) ;ɾ���ļ��е����а���'�ؼ���'����
                                        _return(@extended)
                                EndIf
                        ElseIf $radioX = 5 Then
                                If $Key = 0 Then
                                        MsgBox(16, '����', 'û��ָ���ؼ��ַ� !')
                                        ContinueCase
                                Else
                                        _FileSRER2Line($Path_0, $Key, '', 0, 1, 1, '') ;����ɾ���ļ��е����а���'�ؼ���'����
                                        _return(@extended)
                                EndIf
                        ElseIf $radioX = 6 Then
                                _FileSRER2Line($Path_0) ;ɾ���ļ��е����п���
                                _return(@extended)
                        EndIf

        EndSwitch
WEnd

;==========================================================================================
; ˵��:����ָ���Ĺؼ����滻��ɾ���ı��У���ѡ���Ƿ�ʹ��������ʽ���Ƿ�д���ļ��ȡ�
; �﷨:��_FileSRER2Line('�ļ�·��'[, '�����ַ�'[, '�滻'[, ƥ���־[, �����־[, �س���[, д���־]]]]]])
; ����:����ѡ��������'�����ַ�'�ַ�Ϊ��(Ĭ��)��ɾ�����п��С�
;����������ѡ��������'�滻'�ַ�Ϊ��(Ĭ��)��ɾ��ƥ���У��Ҳ������¿��С�
;����������ѡ������ƥ���־ = 1 :��������ȫƥ��(Ĭ��)��ƥ���־ = 0 :����ֻ������ؼ��֡�
;����������ѡ������ʹ�������־ = 1 ʹ������(Ĭ��)��Ϊ 0 ��ʹ������ʹ��ԭʼ�ַ���ƥ�䡣
;����������ѡ�������س�����־ = 1 ��ʶ���лس����Ķ���@CRLF(Ĭ��,�ٶȿ�)��Ϊ 0 ֻҪ�л��з�@LF��ʶ��Ϊ���С�
;����������ѡ������д���־ = '' д��ԭ�ļ�(Ĭ��)����Ϊ����д��ָ���ļ���= 0 �����ز�д�롣
; ע��:��������������Ϊ������λ����������һ���к��м����ؼ��־���һ���滻��λ������
; ����ֵ:�����滻����ַ������滻����������@extended���С�
; ����:��Afan -- http://www.autoit.net.cn
;=====================================================================================start
Func _FileSRER2Line($File, $pattern = '', $replace = '', $flag = 1, $SRE = 1, $CR = 1, $Write = '')
        Local $sFile = String(FileRead($File)), $strqhz = '', $extended = 0, $sRER, $strZY, $CRF = ''
        If $CR = 0 Then $CRF = '?'
        If $pattern = '' Then
                $sRER = StringRegExpReplace(@CRLF & $sFile, '\r' & $CRF & '\n(?=\r' & $CRF & '\n)|\r' & $CRF & '\n$', '')
        Else
                If $SRE = 0 Then
                        $strZY = '(\.|\||\*|\?|\+|\(|\)|\{|\}|\[|\]|\^|\$|\\)'
                        $pattern = StringRegExpReplace($pattern, $strZY, '\\$1')
                        $replace = StringRegExpReplace($replace, $strZY, '\\$1')
                EndIf
                If $flag = 0 Then $strqhz = '\V*'
                Local $patternWZ = $strqhz & $pattern & $strqhz
                $pattern = '(\r' & $CRF & '\n)' & $patternWZ & '(?=\r' & $CRF & '\n)|\r' & $CRF & '\n' & $patternWZ & '$'
                If $replace <> '' Then
                        $sRER = StringRegExpReplace(@CRLF & $sFile, $pattern, '${1}' & $replace)
                Else
                        $sRER = StringRegExpReplace(@CRLF & $sFile, $pattern, '')
                EndIf
        EndIf
        $extended = $extended + @extended
        $sRER = StringRegExpReplace($sRER, '^\r' & $CRF & '\n', '')
        If $Write = '' And $Write <> '0' Then
                $sTmp = FileOpen($File, 2)
                FileWrite($sTmp, $sRER)
                FileClose($sTmp)
        ElseIf $Write <> '' Then
                $sTmp = FileOpen($Write, 2)
                FileWrite($sTmp, $sRER)
                FileClose($sTmp)
        EndIf
        SetExtended($extended)
        Return $sRER
EndFunc   ;==>_FileSRER2Line

Func _return($a)
        If $a = 0 Then
                MsgBox(0, 0, 'δ�ҵ��ؼ���')
        Else
                MsgBox(64, '���', '�滻��������' & $a)
        EndIf
EndFunc   ;==>_return