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

;�رյ����붨ʱ����ָ��Ŀ¼
;֧�ֶ�����,��Ϊ���ŷָ�:
;�ļ���·��: ����Ŀ¼1,����Ŀ¼2,����Ŀ¼3,����Ŀ¼4,,,
;ָ������ֵ: ��ʽ: 00,05,20,,,
;���������: ���������1,���������2,���������3,,,
;�����������ݾ������󼴻��Զ����棬��Ҫ�޸�ʱ����ֹ���޸�����������

#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
$Form1 = GUICreate("�رյ����붨ʱ����", 337, 250)
GUICtrlCreateLabel("��ʱ����ָ���ļ���", 112, 24, 120, 17)
GUICtrlCreateLabel("�ļ���·��(,):", 16, 66, 86, 17)
$Input1 = GUICtrlCreateInput("", 102, 64, 220, 21)
GUICtrlCreateLabel("ָ������ֵ(,):", 16, 104, 86, 17)
$Input2 = GUICtrlCreateInput("", 102, 100, 220, 21)
$Button2 = GUICtrlCreateButton("��������", 16, 140, 85, 25)
$Button3 = GUICtrlCreateButton("�Զ�����", 128, 140, 85, 25)
$Button4 = GUICtrlCreateButton("��ֹ�Զ�����", 238, 140, 85, 25)
GUICtrlCreateLabel("�رյ���", 147, 188, 80, 17)
GUICtrlCreateLabel("���������(,):", 16, 214, 86, 17)
$Input3 = GUICtrlCreateInput("", 102, 210, 186, 21)
$Button6 = GUICtrlCreateButton("����", 292, 210, 30, 21)
GUISetState(@SW_SHOW)
GUICtrlSetData($Input1,IniRead("ljmin.ini","ljmin","lj","")) 
GUICtrlSetData($Input2,IniRead("ljmin.ini","ljmin","min","")) 
GUICtrlSetData($Input3,IniRead("ljmin.ini","ljmin","Popup",""))  
Local $Dira ,$fzjsa,$Dir ,$fzjs,$Dir1 ,$fzjs1,$qddszdql = 0,$qddszdq2 = 0,$sfqlg = 0,$xyql = 0
Local $Button6x = 0 ,$tcbt,$tcbt1,$tcbt2,$jccklm = 0,$jcckbt = 0,$timejs1 = 0
While 1
        $nMsg = GUIGetMsg()
        Switch $nMsg
                Case $GUI_EVENT_CLOSE
                        Exit
                Case $Button2
            $qddszdq2 = 1
            GUICtrlSetState($Button2, $GUI_DISABLE)
                        mlmin()        
                Case $Button3
            $qddszdql = 1
            GUICtrlSetState($Button3, $GUI_DISABLE)
            mlmin()                
                Case $Button4 
            $qddszdql = 0 
                        GUICtrlSetState($Button3, $GUI_ENABLE)
                Case $Button6
            If $Button6x = 0 Then 
                GUICtrlSetData($Button6,"ֹͣ")         
                                $tcbt2 = GUICtrlRead($Input3)   
                                $tcbt = StringSplit($tcbt2,",")
                    $tcbt1 = UBound($tcbt)-1
                                IniWrite("ljmin.ini","ljmin","Popup",$tcbt2)
                $Button6x = 1                                
                        Else 
                                GUICtrlSetData($Button6,"����") 
                                $Button6x = 0
            EndIf  
                EndSwitch
        If $timejs1 >= 40 Then 
            If $Dir1 >= 1 And $fzjs1 >= 1 Then
                    For $i = 1 To $fzjs[0]
                            If $fzjs[$i] = @MIN Then 
                                    $xyql = 1
                                    ExitLoop
                            Else 
                                    $xyql = 0                                        
                            EndIf
                    Next
                    If $xyql = 0 Then $sfqlg = 0                                
            If $qddszdql = 1 And $xyql = 1 And $sfqlg = 0 Or $qddszdq2 = 1 Then 
                            For $i = 1 To $Dir[0]
                                    RunWait(@ComSpec & ' /c rd /q /s ' & $Dir[$i], '', 0) 
                            Next         
                            If $qddszdql = 1 And $qddszdq2 <> 1 Then $sfqlg = 1
                            If  $qddszdq2 = 1 Then 
                                $qddszdq2 = 0 
                                GUICtrlSetState($Button2, $GUI_ENABLE)
                        EndIf 
            EndIf 
            EndIf
                $timejs1 = 0
            If $tcbt1 >= 1 And $Button6x = 1 Then
                    For $i = 1 To $tcbt[0]
                            $jccklm = WinExists("[CLASS:"&$tcbt[$i]&"]")
                            $jcckbt = WinExists($tcbt[$i])
                If $jccklm = 1 Then 
                                    WinClose("[CLASS:"&$tcbt[$i]&"]")
                            $jccklm = 0
                EndIf
                            If $jcckbt = 1 Then 
                                    WinClose($tcbt[$i])
                            $jcckbt = 0
                EndIf
            Next 
        EndIf
            $timejs2 = 0
    EndIf         
    Sleep(50)
        $timejs1 += 1
WEnd
Func mlmin()
        $Dira = GUICtrlRead($Input1)
    $Dir = StringSplit($Dira,",")
    $Dir1 = UBound($Dir)-1
        $fzjsa = GUICtrlRead($Input2)
    $fzjs = StringSplit($fzjsa,",")
    $fzjs1 = UBound($fzjs)-1
        IniWrite("ljmin.ini","ljmin","lj",$Dira)
        IniWrite("ljmin.ini","ljmin","min",$fzjsa)
EndFunc 