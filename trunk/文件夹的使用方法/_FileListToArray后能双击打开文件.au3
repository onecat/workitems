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



;~   #Include <File.au3>
;~   #Include <Array.au3>
;~   Local $var
;~   $var = _FileListToArray("C:\Users\xiaozhan\Desktop\�ӵ���","*",2)
;~   MsgBox(0,"",$var[2])


#include <GUIConstantsEx.au3>
#include <ListViewConstants.au3>
#include <WindowsConstants.au3>
#include <File.au3>
#include <Array.au3>
#include <GuiListView.au3>

$FileList = _FileListToArray(@DesktopDir)
if isarray($FileList)  then
$Form1 = GUICreate("Form1", 246, 293, -1, -1)
$ListView1 = GUICtrlCreateListView("11111111111111111111111111111", 8, 16, 218, 270, $LVS_SINGLESEL, $LVS_EX_GRIDLINES)
GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY")
For $i = 1 To $FileList[0]
        GUICtrlCreateListViewItem($FileList[$i], $ListView1)
Next
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
        $nMsg = GUIGetMsg()
        Switch $nMsg
                Case $GUI_EVENT_CLOSE
                        Exit

        EndSwitch
WEnd
endif


Func WM_NOTIFY($hWnd, $iMsg, $iwParam, $ilParam)
        Local $hWndFrom, $iIDFrom, $iCode, $tNMHDR, $hWndListView, $tInfo, $Menu
        $hWndListView = $ListView1
        If Not IsHWnd($ListView1) Then $hWndListView = GUICtrlGetHandle($ListView1)
        $tNMHDR = DllStructCreate($tagNMHDR, $ilParam)
        $hWndFrom = HWnd(DllStructGetData($tNMHDR, "hWndFrom"))
        $iCode = DllStructGetData($tNMHDR, "Code")
        Switch $hWndFrom
                Case $hWndListView
                        Switch $iCode
                                Case $NM_DBLCLK ; ��Ӧ List1 ��Χ�ڵ�˫��
                                        $Index = _GUICtrlListView_GetSelectedIndices($hWndListView)
                                        If $Index <> "" Then
                                                $L_Name = _GUICtrlListView_GetItemText($hWndListView, $Index)
                                                Select
                                                        Case StringRight($L_Name, 4) = ".lnk"
                                                                $exe = FileGetShortcut(@DesktopDir & '\' & $L_Name)
                                                                RunWait($exe[0])
                                                        Case StringRight($L_Name, 4) = ".exe" Or StringRight($L_Name, 4) = ".com"
                                                                $exe = @DesktopDir & '\' & $L_Name
                                                                RunWait($exe)
                                                        Case Else
                                                                ShellExecuteWait(@DesktopDir & '\' & $L_Name)
                                                EndSelect

                                        EndIf
                        EndSwitch
        EndSwitch
        Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_NOTIFY