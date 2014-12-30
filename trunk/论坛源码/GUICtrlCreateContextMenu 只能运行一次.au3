#Region ACN预处理程序参数(常用参数)
#PRE_Icon= 										;图标,支持EXE,DLL,ICO
#PRE_OutFile=									;输出文件名
#PRE_OutFile_Type=exe							;文件类型
#PRE_Compression=4								;压缩等级
#PRE_UseUpx=y 									;使用压缩
#PRE_Res_Comment= 								;程序注释
#PRE_Res_Description=							;详细信息
#PRE_Res_Fileversion=							;文件版本
#PRE_Res_FileVersion_AutoIncrement=p			;自动更新版本
#PRE_Res_LegalCopyright= 						;版权
#PRE_Change2CUI=N                   			;修改输出的程序为CUI(控制台程序)
;#PRE_Res_Field=AutoIt Version|%AutoItVer%		;自定义资源段
;#PRE_Run_Tidy=                   				;脚本整理
;#PRE_Run_Obfuscator=      						;代码迷惑
;#PRE_Run_AU3Check= 							;语法检查
;#PRE_Run_Before= 								;运行前
;#PRE_Run_After=								;运行后
;#PRE_UseX64=n									;使用64位解释器
;#PRE_Compile_Both								;进行双平台编译
#EndRegion ACN预处理程序参数设置完成
#cs ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿

 Au3 版本: 
 脚本作者: 
 电子邮件: 
	QQ/TM: 
 脚本版本: 
 脚本功能: 

#ce ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿脚本开始＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿


#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <GuiListView.au3>
#include <File.au3>
#include <EditConstants.au3>


Global $mainGui,$tab,$yyxx,$tianjia,$xiugai,$shanchu,$Form1 = -1,$baocun, $a = @DesktopDir & "\李香窑", $L_Name,$xiugaig,$youjian

_MainGui()
Func _MainGui()
        $mainGui = GUICreate("文本编辑",800,600,192,214,BitOR($GUI_SS_DEFAULT_GUI,$WS_MAXIMIZEBOX,$WS_MAXIMIZE,$WS_TABSTOP))
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
        GUICtrlCreateTabItem("医院文章")
        $yyxx = GUICtrlCreateListView('序号|医院文章',-1,30,@DesktopWidth,@DesktopHeight-85)
        _GUICtrlListView_BeginUpdate($yyxx)
        GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY") ;左键右键，双击单击
        _GUICtrlListView_SetExtendedListViewStyle($yyxx, BitOR($LVS_EX_GRIDLINES, $LVS_EX_FULLROWSELECT))
    Local $aFileList = _FileListToArray("\\192.168.1.221\本地磁盘 (d)\各种文档", "*")
    Local $iRows = UBound($aFileList)
        For $i=1  To $iRows-1 Step 1
                Local $idItem = GUICtrlCreateListViewItem($i & "|" &$aFileList[$i], $yyxx)
        Next
        _GUICtrlListView_EndUpdate($yyxx)

EndFunc
        


Func _bingzhongwenzhang()
        GUICtrlCreateTabItem("病种文章")
EndFunc

Func _guanjiancifenlei()
        GUICtrlCreateTabItem("关键词分类")
EndFunc

Func _yishengxingxi()
        GUICtrlCreateTabItem("医生信息")
EndFunc

Func _tuiguang()
        GUICtrlCreateTabItem("推广")
EndFunc

Func WM_NOTIFY($hWndGUI, $MsgID, $wParam, $lParam) ;鼠标左键右键双击
        
    Local $tagNMHDR, $Event, $hWndFrom, $IDFrom
        Local $tagNMHDR = DllStructCreate("int;int;int", $LParam)
        If @error Then Return $GUI_RUNDEFMSG
        $IDFrom = DllStructGetData($tagNMHDR, 2)
        $Event = DllStructGetData($tagNMHDR, 3)
        $tagNMHDR = 0
        Switch $IDFrom;选择产生事件的控件
                        Case $yyxx
                                
                        Switch $Event; 选择产生的事件     
                                                
                                                        Case $NM_CLICK ; 左击
                                                                
                                                        Case $NM_DBLCLK  ;双击
                                                                             
                                                                $Index = _GUICtrlListView_GetSelectedIndices($yyxx)
                                                                If Not StringLen($Index) Then
                                                                        MsgBox(64,"没有选中数据","请重新选择")
                                                                        Return
                                                                EndIf
                                                        $L_Name = _GUICtrlListView_GetItemText($yyxx,Number($Index),1)

                                                        Local $wendang = FileOpen("\\192.168.1.221\本地磁盘 (d)\各种文档\"&$L_Name)
                                                        Global $wendang1 = FileRead($wendang)
                                                        FileClose($wendang)
                                                        
                                                        Local $1 = WinExists($Form1)
                                                        If $1 = 1 Then
                                                                GUIDelete($Form1)
                                                        EndIf
;~                                                         
                                                        $Form1 = GUICreate($L_Name&"内容如下", 800,600)
                                                        Global $Edit = GUICtrlCreateEdit("", 0, 0,799,510,$ES_AUTOVSCROLL + $WS_VSCROLL) ;自动换行
                                                        GUICtrlSetData(-1, $wendang1)
                                                        $xiugai = GUICtrlCreateButton("修改保存", 220, 530, 161, 49)
                                                        $baocun = GUICtrlCreateButton("保存到桌面",450,530,161,49)
                                                        GUISetState(@SW_SHOW,$Form1)
                                                                
                                                                Case $NM_RCLICK ; 右击
                                                                $Index = _GUICtrlListView_GetSelectedIndices($yyxx)
                                                                If Not StringLen($Index) Then
                                                                        MsgBox(64,"没有选中数据","请重新选择")
                                                                        Return
                                                                EndIf
                                                                $youjian = GUICtrlCreateContextMenu($yyxx)
                                                                $tianjia = GUICtrlCreateMenuItem("添加", $youjian)
                                                                $shanchu = GUICtrlCreateMenuItem("删除", $youjian)
                                                                $xiugaig = GUICtrlCreateMenuItem("修改", $youjian)
                                                                

                        EndSwitch
                EndSwitch       
                
                

        Switch $IDFrom;
                Case $bzgl
                        Switch $Event; 选择产生的事件   
                                                        
                                                        Case $NM_CLICK ; 左击
                                                                
                                                        Case $NM_DBLCLK
                                                                $Index = _GUICtrlListView_GetSelectedIndices($bzgl)
                                                                If Not StringLen($Index) Then
                                                                        MsgBox(64,"没有选中数据","请重新选择")
                                                                        Return
                                                                EndIf
                                                        Global $L_Name1 = _GUICtrlListView_GetItemText($bzgl,Number($Index))
                                                        Local $wendang = FileOpen("\\192.168.1.221\本地磁盘 (d)\病种信息\"&$L_Name1)
                                                        Global $wendang2 = FileRead($wendang)
                                                        FileClose($wendang)
                                                        
                                                                Local $1 = WinExists($Form2)
                                                        If $1 = 1 Then
                                                                GUIDelete($Form2)
                                                        EndIf
                                                        
                                                        $Form2 = GUICreate($L_Name1&"内容如下", 800,600)
                                                        Global $Edit1 = GUICtrlCreateEdit("", 0, 0,799,510,$ES_AUTOVSCROLL + $WS_VSCROLL)
                                                        GUICtrlSetData(-1, $wendang2)
                                                        $xiugai1 = GUICtrlCreateButton("修改保存", 220, 530, 161, 49)
                                                        $baocun1 = GUICtrlCreateButton("保存到桌面",450,530,161,49)
                                                        GUISetState(@SW_SHOW,$Form2)
                                                        
                                                EndSwitch
                                                
           

        EndSwitch    
                
                 Switch $IDFrom;选择产生事件的控件
                         
                         Case $mb
                                 
                        Switch $Event; 选择产生的事件   
                                                        
                                                        Case $NM_CLICK ; 左击
                                                                
                                                        Case $NM_DBLCLK
                                                                $Index = _GUICtrlListView_GetSelectedIndices($mb)
                                                                
                                                                If Not StringLen($Index) Then
                                                                        MsgBox(64,"没有选中数据","请重新选择")
                                                                        Return
                                                                EndIf
                                                                
                                                        Global $L_Name3 = _GUICtrlListView_GetItemText($mb,Number($Index))
                                                        Local $wendang = FileOpen("\\192.168.1.221\本地磁盘 (d)\模板\"&$L_Name3)
                                                        Global $wendang3 = FileRead($wendang)
                                                        FileClose($wendang)
                                                        
                                                        Local $1 = WinExists($Form4)
                                                        If $1 = 1 Then
                                                                GUIDelete($Form4)
                                                        EndIf
                                                        
                                                        $Form4 = GUICreate($L_Name3&"内容如下", 800,600)
                                                        Global $Edit2 = GUICtrlCreateEdit("", 0, 0,799,510,$ES_AUTOVSCROLL + $WS_VSCROLL)
                                                        GUICtrlSetData(-1, $wendang3)
                                                        $xiugai2 = GUICtrlCreateButton("修改保存", 220, 530, 161, 49)
                                                        $baocun2 = GUICtrlCreateButton("保存到桌面",450,530,161,49)
                                                        GUISetState(@SW_SHOW,$Form4)
                                                        
                                                        Case $NM_RCLICK ; 右击
                                                                $Index = _GUICtrlListView_GetSelectedIndices($mb)
                                                                
                                                                If Not StringLen($Index) Then
                                                                        MsgBox(64,"没有选中数据","请重新选择")
                                                                        Return
                                                                EndIf
                                                                
                                                        
                                                                Local $youjian = GUICtrlCreateContextMenu($mb)
                                                                $shanchu = GUICtrlCreateMenuItem("删除", $youjian)
                                                                $xiugaig = GUICtrlCreateMenuItem("修改", $youjian)
                                                                $shuaxin = GUICtrlCreateMenuItem("刷新", $youjian)
                                                                
                                                                
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
;~         MsgBox(64,"操作提示","确定要删除所选文件么？")
        
EndFunc

Func _xiugaig()
        ConsoleWrite("3"&"+++++++++++++++++++++")
EndFunc



Func _baocun() ;医院信息保存到桌面
        
        If FileExists($a) = 0 Then
        DirCreate($a)
        EndIf
        FileWrite($a & "\" & @YEAR&@MON&@MDAY&@HOUR&@MIN&@SEC&".txt",$wendang1)
        MsgBox(64,"","已经保存")
        GUIDelete($Form1)

EndFunc

Func _xiugai() ;修改医院信息
        
        Local $yyxxxg = GUICtrlRead($Edit)
        If FileExists($a) = 0 Then
        DirCreate($a)
        EndIf
        FileWrite($a & "\" & @YEAR&@MON&@MDAY&@HOUR&@MIN&@SEC&".txt",$yyxxxg)
        MsgBox(64,"","已经保存")
        GUIDelete($Form1)
        
EndFunc

Func _GUICloseEvent() ;关闭
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