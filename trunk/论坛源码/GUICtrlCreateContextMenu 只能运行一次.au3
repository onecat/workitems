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


#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <GuiListView.au3>
#include <File.au3>
#include <EditConstants.au3>


Global $mainGui,$tab,$yyxx,$tianjia,$xiugai,$shanchu,$Form1 = -1,$baocun, $a = @DesktopDir & "\����Ҥ", $L_Name,$xiugaig,$youjian

_MainGui()
Func _MainGui()
        $mainGui = GUICreate("�ı��༭",800,600,192,214,BitOR($GUI_SS_DEFAULT_GUI,$WS_MAXIMIZEBOX,$WS_MAXIMIZE,$WS_TABSTOP))
        GUICtrlCreateTab(0, 0, @DesktopWidth, @DesktopHeight)
        _wenzhang()
        _bingzhongwenzhang()
        _guanjiancifenlei()
        _yishengxingxi()
        _tuiguang()
        GUISetState(@SW_SHOW,$mainGui)
        _GUICloseEvent()
EndFunc

Func _wenzhang()
        GUICtrlCreateTabItem("ҽԺ����")
        $yyxx = GUICtrlCreateListView('���|ҽԺ����',-1,30,@DesktopWidth,@DesktopHeight-85)
        _GUICtrlListView_BeginUpdate($yyxx)
        GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY") ;����Ҽ���˫������
        _GUICtrlListView_SetExtendedListViewStyle($yyxx, BitOR($LVS_EX_GRIDLINES, $LVS_EX_FULLROWSELECT))
    Local $aFileList = _FileListToArray("\\192.168.1.221\���ش��� (d)\�����ĵ�", "*")
    Local $iRows = UBound($aFileList)
        For $i=1  To $iRows-1 Step 1
                Local $idItem = GUICtrlCreateListViewItem($i & "|" &$aFileList[$i], $yyxx)
        Next
        _GUICtrlListView_EndUpdate($yyxx)

EndFunc
        


Func _bingzhongwenzhang()
        GUICtrlCreateTabItem("��������")
EndFunc

Func _guanjiancifenlei()
        GUICtrlCreateTabItem("�ؼ��ʷ���")
EndFunc

Func _yishengxingxi()
        GUICtrlCreateTabItem("ҽ����Ϣ")
EndFunc

Func _tuiguang()
        GUICtrlCreateTabItem("�ƹ�")
EndFunc

Func WM_NOTIFY($hWndGUI, $MsgID, $wParam, $lParam) ;�������Ҽ�˫��
        
    Local $tagNMHDR, $Event, $hWndFrom, $IDFrom
        Local $tagNMHDR = DllStructCreate("int;int;int", $LParam)
        If @error Then Return $GUI_RUNDEFMSG
        $IDFrom = DllStructGetData($tagNMHDR, 2)
        $Event = DllStructGetData($tagNMHDR, 3)
        $tagNMHDR = 0
        Switch $IDFrom;ѡ������¼��Ŀؼ�
                        Case $yyxx
                                
                        Switch $Event; ѡ��������¼�     
                                                
                                                        Case $NM_CLICK ; ���
                                                                
                                                        Case $NM_DBLCLK  ;˫��
                                                                             
                                                                $Index = _GUICtrlListView_GetSelectedIndices($yyxx)
                                                                If Not StringLen($Index) Then
                                                                        MsgBox(64,"û��ѡ������","������ѡ��")
                                                                        Return
                                                                EndIf
                                                        $L_Name = _GUICtrlListView_GetItemText($yyxx,Number($Index),1)

                                                        Local $wendang = FileOpen("\\192.168.1.221\���ش��� (d)\�����ĵ�\"&$L_Name)
                                                        Global $wendang1 = FileRead($wendang)
                                                        FileClose($wendang)
                                                        
                                                        Local $1 = WinExists($Form1)
                                                        If $1 = 1 Then
                                                                GUIDelete($Form1)
                                                        EndIf
;~                                                         
                                                        $Form1 = GUICreate($L_Name&"��������", 800,600)
                                                        Global $Edit = GUICtrlCreateEdit("", 0, 0,799,510,$ES_AUTOVSCROLL + $WS_VSCROLL) ;�Զ�����
                                                        GUICtrlSetData(-1, $wendang1)
                                                        $xiugai = GUICtrlCreateButton("�޸ı���", 220, 530, 161, 49)
                                                        $baocun = GUICtrlCreateButton("���浽����",450,530,161,49)
                                                        GUISetState(@SW_SHOW,$Form1)
                                                                
                                                                Case $NM_RCLICK ; �һ�
                                                                $Index = _GUICtrlListView_GetSelectedIndices($yyxx)
                                                                If Not StringLen($Index) Then
                                                                        MsgBox(64,"û��ѡ������","������ѡ��")
                                                                        Return
                                                                EndIf
                                                                $youjian = GUICtrlCreateContextMenu($yyxx)
                                                                $tianjia = GUICtrlCreateMenuItem("���", $youjian)
                                                                $shanchu = GUICtrlCreateMenuItem("ɾ��", $youjian)
                                                                $xiugaig = GUICtrlCreateMenuItem("�޸�", $youjian)
                                                                

                        EndSwitch
                EndSwitch       
                
                

        Switch $IDFrom;
                Case $bzgl
                        Switch $Event; ѡ��������¼�   
                                                        
                                                        Case $NM_CLICK ; ���
                                                                
                                                        Case $NM_DBLCLK
                                                                $Index = _GUICtrlListView_GetSelectedIndices($bzgl)
                                                                If Not StringLen($Index) Then
                                                                        MsgBox(64,"û��ѡ������","������ѡ��")
                                                                        Return
                                                                EndIf
                                                        Global $L_Name1 = _GUICtrlListView_GetItemText($bzgl,Number($Index))
                                                        Local $wendang = FileOpen("\\192.168.1.221\���ش��� (d)\������Ϣ\"&$L_Name1)
                                                        Global $wendang2 = FileRead($wendang)
                                                        FileClose($wendang)
                                                        
                                                                Local $1 = WinExists($Form2)
                                                        If $1 = 1 Then
                                                                GUIDelete($Form2)
                                                        EndIf
                                                        
                                                        $Form2 = GUICreate($L_Name1&"��������", 800,600)
                                                        Global $Edit1 = GUICtrlCreateEdit("", 0, 0,799,510,$ES_AUTOVSCROLL + $WS_VSCROLL)
                                                        GUICtrlSetData(-1, $wendang2)
                                                        $xiugai1 = GUICtrlCreateButton("�޸ı���", 220, 530, 161, 49)
                                                        $baocun1 = GUICtrlCreateButton("���浽����",450,530,161,49)
                                                        GUISetState(@SW_SHOW,$Form2)
                                                        
                                                EndSwitch
                                                
           

        EndSwitch    
                
                 Switch $IDFrom;ѡ������¼��Ŀؼ�
                         
                         Case $mb
                                 
                        Switch $Event; ѡ��������¼�   
                                                        
                                                        Case $NM_CLICK ; ���
                                                                
                                                        Case $NM_DBLCLK
                                                                $Index = _GUICtrlListView_GetSelectedIndices($mb)
                                                                
                                                                If Not StringLen($Index) Then
                                                                        MsgBox(64,"û��ѡ������","������ѡ��")
                                                                        Return
                                                                EndIf
                                                                
                                                        Global $L_Name3 = _GUICtrlListView_GetItemText($mb,Number($Index))
                                                        Local $wendang = FileOpen("\\192.168.1.221\���ش��� (d)\ģ��\"&$L_Name3)
                                                        Global $wendang3 = FileRead($wendang)
                                                        FileClose($wendang)
                                                        
                                                        Local $1 = WinExists($Form4)
                                                        If $1 = 1 Then
                                                                GUIDelete($Form4)
                                                        EndIf
                                                        
                                                        $Form4 = GUICreate($L_Name3&"��������", 800,600)
                                                        Global $Edit2 = GUICtrlCreateEdit("", 0, 0,799,510,$ES_AUTOVSCROLL + $WS_VSCROLL)
                                                        GUICtrlSetData(-1, $wendang3)
                                                        $xiugai2 = GUICtrlCreateButton("�޸ı���", 220, 530, 161, 49)
                                                        $baocun2 = GUICtrlCreateButton("���浽����",450,530,161,49)
                                                        GUISetState(@SW_SHOW,$Form4)
                                                        
                                                        Case $NM_RCLICK ; �һ�
                                                                $Index = _GUICtrlListView_GetSelectedIndices($mb)
                                                                
                                                                If Not StringLen($Index) Then
                                                                        MsgBox(64,"û��ѡ������","������ѡ��")
                                                                        Return
                                                                EndIf
                                                                
                                                        
                                                                Local $youjian = GUICtrlCreateContextMenu($mb)
                                                                $shanchu = GUICtrlCreateMenuItem("ɾ��", $youjian)
                                                                $xiugaig = GUICtrlCreateMenuItem("�޸�", $youjian)
                                                                $shuaxin = GUICtrlCreateMenuItem("ˢ��", $youjian)
                                                                
                                                                
                                                EndSwitch
                                                
           

        EndSwitch    
;~                 
                
        Return $GUI_RUNDEFMSG        

EndFunc  

Func _tianjia()
        ConsoleWrite("1"&"++++++++++++++++")
EndFunc

Func _shanchu()

        ConsoleWrite("2"&"++++++++++++++++++++++++++++++")
;~         MsgBox(64,"������ʾ","ȷ��Ҫɾ����ѡ�ļ�ô��")
        
EndFunc

Func _xiugaig()
        ConsoleWrite("3"&"+++++++++++++++++++++")
EndFunc



Func _baocun() ;ҽԺ��Ϣ���浽����
        
        If FileExists($a) = 0 Then
        DirCreate($a)
        EndIf
        FileWrite($a & "\" & @YEAR&@MON&@MDAY&@HOUR&@MIN&@SEC&".txt",$wendang1)
        MsgBox(64,"","�Ѿ�����")
        GUIDelete($Form1)

EndFunc

Func _xiugai() ;�޸�ҽԺ��Ϣ
        
        Local $yyxxxg = GUICtrlRead($Edit)
        If FileExists($a) = 0 Then
        DirCreate($a)
        EndIf
        FileWrite($a & "\" & @YEAR&@MON&@MDAY&@HOUR&@MIN&@SEC&".txt",$yyxxxg)
        MsgBox(64,"","�Ѿ�����")
        GUIDelete($Form1)
        
EndFunc

Func _GUICloseEvent() ;�ر�
        Local $aMsg = 0  
        While 1
                $aMsg = GUIGetMsg(1)

                Switch $aMsg[1]
                        
                        Case $mainGUI
                                
                                Switch $aMsg[0]
                                        
                                        Case $GUI_EVENT_CLOSE
                                                ExitLoop
                                        Case $shanchu
                                                _shanchu()
                                        Case $tianjia
                                                _tianjia()
                                        Case $xiugaig
                                                _xiugaig()
                                                
                                
                                                
                                EndSwitch
                                
                        Case $Form1
                                
                                Switch $aMsg[0]
                                        
                                        Case $GUI_EVENT_CLOSE
                                                GUIDelete($Form1)
                                                
                                        Case $baocun
                                                _baocun()
                                        Case $xiugai
                                                _xiugai()

                                EndSwitch
                                
                                
                        
                                
                EndSwitch
                
        WEnd
        
        GUIDelete($MainGUI)
        
EndFunc