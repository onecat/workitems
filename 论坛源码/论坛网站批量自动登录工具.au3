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

#cs ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿
        
        Au3 版本: 3.3.6.1
        脚本作者: 風冄·訴華年
        网站支持: http://www.autoitx.com/
        论坛账户:lsb968   
        
        
#ce ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <GUIListBox.au3>
#include <StaticConstants.au3>
#include <TreeViewConstants.au3>
#include <WindowsConstants.au3>
#include <IE.au3>
#include <GuiTreeView.au3>
;#Include <_StringEncryptX.au3>
#include <Array.au3>

Opt("MustDeclareVars", 1)


Global $g_SkinDll
Global Const $gc_FormName = "论坛网站登陆器"
Global Const $gc_IniFile = _
                @ScriptDir & "\IniFile.ini"


#Region
Global $gu_MainForm = _
                GUICreate($gc_FormName, 592, 420, -1, -1)
Global $gu_Group1 = _
                GUICtrlCreateGroup("", 8, 0, 577, 369)
Global $gu_TreeView1 = _
                GUICtrlCreateTreeView(16, 16, 177, 342, _
                BitOR($GUI_SS_DEFAULT_TREEVIEW, _  ;BitOR 按位"或"运算.
                $TVS_CHECKBOXES, $WS_BORDER))      ;BitOR ( 值1, 值2 [, 值 n] );$TVS_CHECKBOXES 启用树形视图控件中的检查框
                                                   ;$WS_BORDER 创建一个细边框的窗口.
Global $gu_List1 = _
                GUICtrlCreateList("", 200, 16, 377, 342, _
                BitOR($LBS_NOTIFY, $WS_VSCROLL))
GUICtrlCreateGroup("", -99, -99, 1, 1)
Global $gu_Button1 = _
                GUICtrlCreateButton("关于", 8, 376, 73, 33)
Global $gu_Button3 = _
                GUICtrlCreateButton("自动登陆", 512, 376, 73, 33)
#EndRegion
HotKeySet("{ESC}", "Form1_1Close")
_Main()
Exit

Func _Main()
        Global  $s,$ds 
        Local $a_Nodes = _ReadwebsiteNodes($gc_IniFile)
        _CreateTreeviewNodes($a_Nodes)
        _DisplaywebsiteList($gu_List1, $a_Nodes) ;$gu_List1 = GUICtrlCreateList("", 200, 16, 377, 342, BitOR($LBS_NOTIFY, $WS_VSCROLL))
        
        GUISetState(@SW_SHOW)   ;GUISetState===>调整窗口的状态
                               ;@SW_SHOW==> 激活指定窗口并使其以当前大小和位置信息显示. 
        
        Local $nMsg
        While 1
                $nMsg = GUIGetMsg() ;捕获窗口消息
                Switch $nMsg
                        Case $GUI_EVENT_CLOSE
                                Exit
;~                         
                        Case $gu_Button1
                                MsgBox(0 + 64, $gc_FormName, _                
                                                "本软件用于软件批量自动登陆", _
                                                0, $gu_MainForm)
;~                         
                        Case $gu_Button3
;~                                 Local $r = _
                                                _Installlogins($a_Nodes, "Auto")
;~                                 If $r = 1 Then Exit
                EndSwitch
                _TreeViewControl($a_Nodes, $nMsg)
        WEnd
EndFunc   ;==>_Main

Func _ReadwebsiteNodes($IniFile)
        Local Const $N = 8
        Local $a_Nodes[1][$N], $p = 1          
        Local $SwDir = @ScriptDir & "\IniFile"
        Local $i = 1
                
        While 1
                Local $Allchoice
                                Local $ClsName = _
                                IniRead($IniFile, $i, $i & ".Name", "")   ;????
                If $ClsName = "" Then ExitLoop    ;        Then ExitLoop===>终止一个 While/Do/For 循环.
                ReDim $a_Nodes[$p + 1][$N]   ;ReDim====>调整一个已经存在的数组的大小
                $a_Nodes[$p][1] = "root"  
                                
                $a_Nodes[$p][2] = _      ;              默认勾选中的所有根项目 (1/0),(是/否)
                                                                IniRead($IniFile, $i, $i & ".Rootchoice", "")        
                                If $a_Nodes[$p][2] = 0 Then $Allchoice =0 ;其中一项根项目勾选时其他根项目子项目不选
                                If $a_Nodes[$p][2] = 1 Then $Allchoice =1 ;根项目勾选时子项目全选

                $a_Nodes[$p][3] = _       
                                IniRead($IniFile, $i, $i & ".Name", "")
                $a_Nodes[$p][4] = _         
                                $SwDir & "\" & _
                                IniRead($IniFile, $i, $i & ".Icon", "")
                $a_Nodes[$p][5] = _
                                IniRead($IniFile, $i, $i & ".Expand", "")
                $p += 1    ;$p=$p+1
                
                Local $j = 1
                While 1
                                            Local $i
                        Local $SwName = _
                                        IniRead($IniFile, $i, _
                                        $i & "-" & $j & ".Name", "")
                        If $SwName = "" Then ExitLoop
                        ReDim $a_Nodes[$p + 1][$N]
                        $a_Nodes[$p][1] = "sub"
                                                If $Allchoice =1 Then
                                                        $a_Nodes[$p][2] = 1
                                                        Else
                        $a_Nodes[$p][2] = _    ;设置默认勾选中所有子项目 (1/0),(是/否)
                                                                IniRead($IniFile, $i, _
                                        $i & "-" & $j &  ".subchoice", "")
                                                EndIf
;~                                         Next
                        $a_Nodes[$p][3] =  _
                                        IniRead($IniFile, $i, _          ;读取文本，区别以下
                                        $i & "-" & $j & ".Name", "")
                        $a_Nodes[$p][4] = $SwDir & "\" & _              ;文件的路径，@ScriptDir是宏相关编写进代码才能返回数据
                                        IniRead($IniFile, $i, _
                                        $i & "-" & $j & ".Icon", "")
                        $a_Nodes[$p][5] = $SwDir & "\" & _
                                        IniRead($IniFile, $i, _
                                        $i & "-" & $j & ".Usermame", "")
                        $a_Nodes[$p][6] = $SwDir & "\" & _
                                        IniRead($IniFile, $i, _
                                        $i & "-" & $j & ".Password", "")
                        $a_Nodes[$p][7] = $SwDir & "\" & _
                                        IniRead($IniFile, $i, _
                                        $i & "-" & $j & ".Http", "")
;~                                                         IniWrite(@ScriptDir & "\IniFile.ini", $i, $i & ".Rootchoice",'0')
;~                                                         IniWrite(@ScriptDir & "\IniFile.ini", $i,$i & "-" & $j & ".subchoice",'0')

                        $p += 1
                        $j += 1
                WEnd
                $i += 1
        WEnd
        $a_Nodes[0][0] = UBound($a_Nodes, 1) - 1
        Return $a_Nodes
EndFunc   ;==>_ReadwebsiteNodes

Func _CreateTreeviewNodes(ByRef $a_Nodes)        ;$a_Nodes = _ReadwebsiteNodes($gc_IniFile)
        _GUICtrlTreeView_BeginUpdate($gu_TreeView1) ;开始控件更新,直到 EndUpdate 函数被调用
        Local $i
        For $i = 1 To UBound($a_Nodes, 1) - 1
                Local $Root
                If $a_Nodes[$i][1] = "root" Then
                        $a_Nodes[$i][0] = _
                                        GUICtrlCreateTreeViewItem( _      ;在GUI上创建一个 TreeViewItem 控件.
                                        $a_Nodes[$i][3], $gu_TreeView1)   ;GUICtrlCreateTreeViewItem ( "文本", 列表视图ID )
                        GUICtrlSetImage( _                                 ;设置指定控件的位图或图标   
                                        $a_Nodes[$i][0], $a_Nodes[$i][4])  ;GUICtrlSetImage ( 控件ID, 文件名 [, 图标名 [, 图标类型]] )
                        $Root = $a_Nodes[$i][0]
                Else
                        $a_Nodes[$i][0] = _
                                        GUICtrlCreateTreeViewItem( _     ;在GUI上创建一个 TreeViewItem 控件.
                                        $a_Nodes[$i][3], $Root)          ; GUICtrlCreateTreeViewItem ( "文本", 列表视图ID )
                        GUICtrlSetImage( _                               ;设置指定控件的位图或图标
                                        $a_Nodes[$i][0], $a_Nodes[$i][4]) ;GUICtrlSetImage ( 控件ID, 文件名 [, 图标名 [, 图标类型]] )
                EndIf
        Next
        Local $i
        For $i = UBound($a_Nodes, 1) - 1 To 1 Step -1
                If $a_Nodes[$i][2] = 1 Then
                        _GUICtrlTreeView_SetChecked( _                ;设置项目复选框选中
                                        $gu_TreeView1, $a_Nodes[$i][0], True) ;_GUICtrlTreeView_SetChecked(控件句柄, 项目句柄 [, 展开或折叠标志])
                                                                        EndIf
;~                                 If $a_Nodes[$i][1] = "root" And $a_Nodes[$i][2] = 1 Then
;~                         _GUICtrlTreeView_SetChecked( _                ;设置项目复选框选中
;~                                         $gu_TreeView1, $a_Nodes[$i][0], True) ;_GUICtrlTreeView_SetChecked(控件句柄, 项目句柄 [, 展开或折叠标志])
;~                                                                         EndIf                                        
;~                                                                         
                                                                        
                If $a_Nodes[$i][1] = "root" And _
                                $a_Nodes[$i][5] = 1 Then
                        _GUICtrlTreeView_Expand( _                     ;展开或折叠父项目相关的子项列表
                                        $gu_TreeView1, $a_Nodes[$i][0], True)  ;_GUICtrlTreeView_Expand(控件句柄[, 项目句柄 = 0[, 展开或折叠标志]])
                EndIf
        Next
        _GUICtrlTreeView_EndUpdate($gu_TreeView1)
EndFunc   ;==>_CreateTreeviewNodes

Func _TreeViewControl(ByRef $a_Nodes, $iMsg)
        Local $i
        For $i = 1 To $a_Nodes[0][0]
                Switch $iMsg
                        Case $a_Nodes[$i][0]
                                If $a_Nodes[$i][1] = "root" Then
                                        If _GUICtrlTreeView_GetChecked( _                ;设置项目复选框选中
                                                        $gu_TreeView1, $a_Nodes[$i][0]) = True _  ;_GUICtrlTreeView_GetChecked($hWnd, $hItem)
                                                        And $a_Nodes[$i][2] = 0 Then
                                                $a_Nodes[$i][2] = 1
                                                Local $j
                                                For $j = $i + 1 To $a_Nodes[0][0]
                                                        If $a_Nodes[$j][1] = "sub" Then
                                                                _GUICtrlTreeView_SetChecked( _
                                                                                $gu_TreeView1, _
                                                                                $a_Nodes[$j][0], True)
                                                                $a_Nodes[$j][2] = 1
                                                        Else
                                                                ExitLoop
                                                        EndIf
                                                Next
                                                _DisplaywebsiteList($gu_List1, $a_Nodes)
                                        ElseIf _GUICtrlTreeView_GetChecked( _
                                                        $gu_TreeView1, $a_Nodes[$i][0]) = False _
                                                        And $a_Nodes[$i][2] = 1 Then
                                                $a_Nodes[$i][2] = 0
                                                Local $j
                                                For $j = $i + 1 To $a_Nodes[0][0]
                                                        If $a_Nodes[$j][1] = "sub" Then
                                                                _GUICtrlTreeView_SetChecked( _
                                                                                $gu_TreeView1, _
                                                                                $a_Nodes[$j][0], False)
                                                                $a_Nodes[$j][2] = 0
                                                        Else
                                                                ExitLoop
                                                        EndIf
                                                Next
                                                _DisplaywebsiteList($gu_List1, $a_Nodes)
                                        EndIf
                                ElseIf $a_Nodes[$i][1] = "sub" Then
                                        If _GUICtrlTreeView_GetChecked( _
                                                        $gu_TreeView1, $a_Nodes[$i][0]) = True _
                                                        And $a_Nodes[$i][2] = 0 Then
                                                $a_Nodes[$i][2] = 1
                                                _DisplaywebsiteList($gu_List1, $a_Nodes)
                                        ElseIf _GUICtrlTreeView_GetChecked( _
                                                        $gu_TreeView1, $a_Nodes[$i][0]) = False _
                                                        And $a_Nodes[$i][2] = 1 Then
                                                $a_Nodes[$i][2] = 0
                                                Local $RootHdl
                                                Local $flag = 0
                                                Local $j
                                                For $j = $i + 1 To $a_Nodes[0][0]
                                                        If $a_Nodes[$j][1] = "root" Then
                                                                ExitLoop
                                                        Else
                                                                If _GUICtrlTreeView_GetChecked( _
                                                                                $gu_TreeView1, _
                                                                                $a_Nodes[$j][0]) = True Then
                                                                        $flag = 1
                                                                        ExitLoop
                                                                EndIf
                                                        EndIf
                                                Next
                                                For $j = $i - 1 To 1 Step -1
                                                        If $a_Nodes[$j][1] = "root" Then
                                                                $RootHdl = $a_Nodes[$j][0]
                                                                ExitLoop
                                                        Else
                                                                If _GUICtrlTreeView_GetChecked( _
                                                                                $gu_TreeView1, _
                                                                                $a_Nodes[$j][0]) = True Then
                                                                        $flag = 1
                                                                        ExitLoop
                                                                EndIf
                                                        EndIf
                                                Next
                                                If $flag = 0 Then
                                                        _GUICtrlTreeView_SetChecked( _
                                                                        $gu_TreeView1, _
                                                                        $RootHdl, False)
                                                        $a_Nodes[$j][2] = 0
                                                EndIf
                                                _DisplaywebsiteList($gu_List1, $a_Nodes)
                                        EndIf
                                EndIf
                EndSwitch
        Next
EndFunc   ;==>_TreeViewControl

Func _DisplaywebsiteList($gu_List1, $a_Nodes)

        Local $s = ""
        Local $i, $p = 1
        For $i = 1 To UBound($a_Nodes, 1) - 1
                If $a_Nodes[$i][1] = "sub" And $a_Nodes[$i][2] = 1 Then
                        Local $Index
                        If $p < 10 Then
                                $Index = "0" & String($p)   ;返回某表达式的字符串结果
                        Else
                                $Index = String($p)
                        EndIf
                        $s &= "[" & $Index & "] " & $a_Nodes[$i][3] & "|"
                        $p += 1
                EndIf
        Next
        $s = StringTrimRight($s, 1)
        GUICtrlSetData($gu_List1, "", "")
        GUICtrlSetData($gu_List1, $s)
EndFunc   ;==>_DisplaywebsiteList
Func _Installlogins($a_Nodes, $Mode)  ;Local $a_Nodes = _ReadwebsiteNodes($gc_IniFile)
        Local Const $N = 4                              ;ini配置文件里的项数
        Local $a_SwList[1][$N], $p = 1
        Local $i
        For $i = 1 To UBound($a_Nodes, 1) - 1
                If $a_Nodes[$i][1] = "sub" And $a_Nodes[$i][2] = 1 Then
                        ReDim $a_SwList[$p + 1][$N]
                        $a_SwList[$p][0] = $a_Nodes[$i][3] ;Name
                        $a_SwList[$p][1] = $a_Nodes[$i][5] ;Usermame
                        $a_SwList[$p][2] = $a_Nodes[$i][6] ;Password
                        $a_SwList[$p][3] = $a_Nodes[$i][7] ;Http
                        $p += 1
                EndIf
        Next
        
        ;;_ArrayDisplay($a_SwList)
        If UBound($a_SwList, 1) - 1 = 0 Then
                MsgBox(0 + 64, $gc_FormName, _
                                "未选中任何项目哦!", 0, $gu_MainForm)
                Return 0
        EndIf
        
        Local $httpname,$username,$http,$password, $usernamedecryption,$passworddecryption
        For $i = 1 To UBound($a_SwList, 1) - 1
                _DisplayloginProgress($a_SwList, $i) 
                Select
                        Case $Mode = "Manual"
                                RunWait($a_SwList[$i][1])
                        Case $Mode = "Auto"
                                        
                                        $httpname=StringRegExpReplace($a_SwList[$i][0], '^.+\\', '')
                                        $username=StringRegExpReplace($a_SwList[$i][1], '^.+\\', '')
                                        $password=StringRegExpReplace($a_SwList[$i][2], '^.+\\', '')
                                        $http=StringRegExpReplace($a_SwList[$i][3], '^.+\\', '')
                                        $usernamedecryption=_StringEncryptX(0,$username,"XXXX",3) ;RC4 字符串加密由于是新版本的
                                                                                $passworddecryption=_StringEncryptX(0,$password,"XXXX",3)  ;里面的XXXX改成自己的加密密钥                                                                  
                                                                                
                                                                                ;由于是新版本的，把函数替换掉了  StringEncrypt 换成了_StringEncryptX()

                   ;下面的表单提交看个人需要自己更改，有好点可以统一用一种方式提交表单的介绍下
Global $oIE,$c,$YXMima,$oForm,$oQuery
$oIE = _IECreate ($http,0,1,1,0)
_IELoadWait($oIE)
_IEPropertySet ($oIE, "width", 800)
_IEPropertySet ($oIE, "height", 600)
Local $oInputs = _IETagNameGetCollection ($oIE, "INPUT")
Local $sHTML = _IEDocReadHTML($oIE)
Local $zc21,$zc22,$zc31,$zc41,$zc51,$da11,$da12,$z1,$z2
$zc21='userid'
$zc22='username'
$zc31='password'
;~ $zc41='submit' 
$da11=StringInStr($sHTML,'<FORM')
$da12=StringInStr($sHTML,'<input')
$z1=StringInStr($sHTML,$zc21)
$z2=StringInStr($sHTML,$zc22)


Select 
        
Case $da12>0 And $z1>0 
$zc51="此网站我第一种源码"
        msgbox(0 + 64," 風冄·訴華年 ",$zc51,3)
For $oInput In $oInputs
if $oInput.name = $zc21 then
       $oInput.value=$usernamedecryption
EndIf
Next
For $oInput In $oInputs
if $oInput.name = $zc31 then
       $oInput.value=$passworddecryption
EndIf
Next
$oIE.document.getElementsByTagName('button').item(0).click
        
For $oInput In $oInputs
if $oInput.type = "submit" then
        _IEAction ($oInput, "click")
EndIf
Next

Case $da12>0 And $z2>0
        $zc51='此网站我第二种源码'
        msgbox(0 + 64,"風冄·訴華年",$zc51,3)
For $oInput In $oInputs
if $oInput.name = $zc22 then
       $oInput.value=$usernamedecryption
EndIf
Next
For $oInput In $oInputs
if $oInput.name = $zc31 then
       $oInput.value=$passworddecryption
EndIf
Next
$oIE.document.getElementsByTagName('button').item(0).click
For $oInput In $oInputs
if $oInput.type = "submit" then
        $oInput.value="登陆"
       _IEAction ($oInput, "click")
EndIf
Next
;~         
Case $da12=0 And $z2>0
        $zc51='此网站我第三种源码'
        msgbox(0 + 64," 風冄·訴華年 ",$zc51,3)
        For $oInput In $oInputs
if $oInput.name = $zc22 then
       $oInput.value=$usernamedecryption
EndIf
Next
For $oInput In $oInputs
if $oInput.name = $zc31 then
       $oInput.value=$passworddecryption
EndIf
Next

For $oInput In $oInputs
if $oInput.type = "submit" then
        $oInput.value="登陆"
        _IEAction ($oInput, "click")
EndIf
Next


Case Else
$zc51="网站已经登陆或者参数有误"
        msgbox(0+64," 風冄·訴華年 ",$zc51,3)
EndSelect

                EndSelect
                Sleep(200)
                        Next
                        $s=StringReplace($s,"正在登陆... -->","登陆完成 ===>")
                        GUICtrlSetData($gu_List1, "", "")
        GUICtrlSetData($gu_List1, $s, $ds);修改指定控件的数据 ;GUICtrlSetData ( 控件ID, 数据 [, 默认值] )
        MsgBox(0 + 64, $gc_FormName, _
                        "网站登陆结束!", 0, $gu_MainForm)
        Return 
EndFunc   ;==>_Installlogins

Func _DisplayloginProgress($a_SwList, $ii)   

         $s = ""
        Local $i, $p = 1
         $ds = ""
        For $i = 1 To UBound($a_SwList, 1) - 1
                Local $Index
                If $p < 10 Then
                        $Index = "0" & String($p)
                Else
                        $Index = String($p)
                EndIf
                If $i < $ii Then
                        $s &= "登陆完成 ===> " & _
                                        "[" & $Index & "] " & $a_SwList[$i][0] & "|"
                ElseIf $i = $ii Then
                        $ds = "正在登陆... --> " & _
                                        "[" & $Index & "] " & $a_SwList[$i][0]
                        $s &= "正在登陆... --> "  & _
                                        "[" & $Index & "] " & $a_SwList[$i][0] & "|"
                Else
                        $s &= "[" & $Index & "] " & $a_SwList[$i][0] & "|"
                                EndIf
                $p += 1
                        Next
        $s = StringTrimRight($s, 1)
GUICtrlSetData($gu_List1, "", "")
        GUICtrlSetData($gu_List1, $s, $ds);修改指定控件的数据 ;GUICtrlSetData ( 控件ID, 数据 [, 默认值] )
EndFunc   ;==>_DisplayloginProgress

Func Form1_1Close()
Exit 
EndFunc

;_StringEncryptX
Func _StringEncryptX($i_Encrypt, $s_EncryptText, $s_EncryptPassword, $i_EncryptLevel = 1)
        If $i_Encrypt <> 0 And $i_Encrypt <> 1 Then
                SetError(1)
                Return ''
        ElseIf $s_EncryptText = '' Or $s_EncryptPassword = '' Then
                SetError(1)
                Return ''
        Else
                If Number($i_EncryptLevel) <= 0 Or Int($i_EncryptLevel) <> $i_EncryptLevel Then $i_EncryptLevel = 1
                Local $v_EncryptModified, $i_EncryptCountH, $i_EncryptCountG, $v_EncryptSwap, $av_EncryptBox[256][2]
                Local $i_EncryptCountA, $i_EncryptCountB, $i_EncryptCountC, $i_EncryptCountD, $i_EncryptCountE
                Local $v_EncryptCipher, $v_EncryptCipherBy
                If $i_Encrypt = 1 Then
                        For $i_EncryptCountF = 0 To $i_EncryptLevel Step 1
                                $i_EncryptCountG = ''
                                $i_EncryptCountH = ''
                                $v_EncryptModified = ''
                                For $i_EncryptCountG = 1 To StringLen($s_EncryptText)
                                        If $i_EncryptCountH = StringLen($s_EncryptPassword) Then
                                                $i_EncryptCountH = 1
                                        Else
                                                $i_EncryptCountH += 1
                                        EndIf
                                        $v_EncryptModified = $v_EncryptModified & ChrW(BitXOR(AscW(StringMid($s_EncryptText, $i_EncryptCountG, 1)), AscW(StringMid($s_EncryptPassword, $i_EncryptCountH, 1)), 255))
                                Next
                                $s_EncryptText = $v_EncryptModified
                                $i_EncryptCountA = ''
                                $i_EncryptCountB = 0
                                $i_EncryptCountC = ''
                                $i_EncryptCountD = ''
                                $i_EncryptCountE = ''
                                $v_EncryptCipherBy = ''
                                $v_EncryptCipher = ''
                                $v_EncryptSwap = ''
                                $av_EncryptBox = ''
                                Local $av_EncryptBox[256][2]
                                For $i_EncryptCountA = 0 To 255
                                        $av_EncryptBox[$i_EncryptCountA][1] = AscW(StringMid($s_EncryptPassword, Mod($i_EncryptCountA, StringLen($s_EncryptPassword)) + 1, 1))
                                        $av_EncryptBox[$i_EncryptCountA][0] = $i_EncryptCountA
                                Next
                                For $i_EncryptCountA = 0 To 255
                                        $i_EncryptCountB = Mod(($i_EncryptCountB + $av_EncryptBox[$i_EncryptCountA][0] + $av_EncryptBox[$i_EncryptCountA][1]), 256)
                                        $v_EncryptSwap = $av_EncryptBox[$i_EncryptCountA][0]
                                        $av_EncryptBox[$i_EncryptCountA][0] = $av_EncryptBox[$i_EncryptCountB][0]
                                        $av_EncryptBox[$i_EncryptCountB][0] = $v_EncryptSwap
                                Next
                                For $i_EncryptCountA = 1 To StringLen($s_EncryptText)
                                        $i_EncryptCountC = Mod(($i_EncryptCountC + 1), 256)
                                        $i_EncryptCountD = Mod(($i_EncryptCountD + $av_EncryptBox[$i_EncryptCountC][0]), 256)
                                        $i_EncryptCountE = $av_EncryptBox[Mod(($av_EncryptBox[$i_EncryptCountC][0] + $av_EncryptBox[$i_EncryptCountD][0]), 256)][0]
                                        $v_EncryptCipherBy = BitXOR(AscW(StringMid($s_EncryptText, $i_EncryptCountA, 1)), $i_EncryptCountE)
                                        $v_EncryptCipher &= Hex($v_EncryptCipherBy, 2)
                                Next
                                $s_EncryptText = $v_EncryptCipher
                        Next
                Else
                        For $i_EncryptCountF = 0 To $i_EncryptLevel Step 1
                                $i_EncryptCountB = 0
                                $i_EncryptCountC = ''
                                $i_EncryptCountD = ''
                                $i_EncryptCountE = ''
                                $v_EncryptCipherBy = ''
                                $v_EncryptCipher = ''
                                $v_EncryptSwap = ''
                                $av_EncryptBox = ''
                                Local $av_EncryptBox[256][2]
                                For $i_EncryptCountA = 0 To 255
                                        $av_EncryptBox[$i_EncryptCountA][1] = AscW(StringMid($s_EncryptPassword, Mod($i_EncryptCountA, StringLen($s_EncryptPassword)) + 1, 1))
                                        $av_EncryptBox[$i_EncryptCountA][0] = $i_EncryptCountA
                                Next
                                For $i_EncryptCountA = 0 To 255
                                        $i_EncryptCountB = Mod(($i_EncryptCountB + $av_EncryptBox[$i_EncryptCountA][0] + $av_EncryptBox[$i_EncryptCountA][1]), 256)
                                        $v_EncryptSwap = $av_EncryptBox[$i_EncryptCountA][0]
                                        $av_EncryptBox[$i_EncryptCountA][0] = $av_EncryptBox[$i_EncryptCountB][0]
                                        $av_EncryptBox[$i_EncryptCountB][0] = $v_EncryptSwap
                                Next
                                For $i_EncryptCountA = 1 To StringLen($s_EncryptText) Step 2
                                        $i_EncryptCountC = Mod(($i_EncryptCountC + 1), 256)
                                        $i_EncryptCountD = Mod(($i_EncryptCountD + $av_EncryptBox[$i_EncryptCountC][0]), 256)
                                        $i_EncryptCountE = $av_EncryptBox[Mod(($av_EncryptBox[$i_EncryptCountC][0] + $av_EncryptBox[$i_EncryptCountD][0]), 256)][0]
                                        $v_EncryptCipherBy = BitXOR(Dec(StringMid($s_EncryptText, $i_EncryptCountA, 2)), $i_EncryptCountE)
                                        $v_EncryptCipher = $v_EncryptCipher & ChrW($v_EncryptCipherBy)
                                Next
                                $s_EncryptText = $v_EncryptCipher
                                $i_EncryptCountG = ''
                                $i_EncryptCountH = ''
                                $v_EncryptModified = ''
                                For $i_EncryptCountG = 1 To StringLen($s_EncryptText)
                                        If $i_EncryptCountH = StringLen($s_EncryptPassword) Then
                                                $i_EncryptCountH = 1
                                        Else
                                                $i_EncryptCountH += 1
                                        EndIf
                                        $v_EncryptModified &= ChrW(BitXOR(AscW(StringMid($s_EncryptText, $i_EncryptCountG, 1)), AscW(StringMid($s_EncryptPassword, $i_EncryptCountH, 1)), 255))
                                Next
                                $s_EncryptText = $v_EncryptModified
                        Next
                EndIf
                Return $s_EncryptText
        EndIf
EndFunc   ;==>_StringEncryptX

#cs
配置文件 IniFile.ini
[IniFile]
InstallPath=""

[1]
;类名称
1.Name="论坛"
;类图标
1.Icon="论坛\论坛.ico"
;是否默认展开（0/1，否/是）
1.Expand=1


;名称
1-1.Name="百度I"
;图标
1-1.Icon="论坛\百度I.ico"
;账号
1-1.Usermame=
;密码
1-1.Password=
;网址
1-1.Http="https://passport.baidu.com/v2/?login&tpl=mn&u=http%3A%2F%2Fwww.baidu.com%2F"


1-2.Name="百度II"
1-2.Icon="论坛\百度II.ico"
1-2.Usermame=
1-2.Password=
1-2.Http="https://passport.baidu.com/v2/?login&tpl=mn&u=http%3A%2F%2Fwww.baidu.com%2F"


1-3.Name="中关村在线"
1-3.Icon="论坛\中关村在线.ico"
1-3.Usermame=
1-3.Password=
1-3.Http="http://service.zol.com.cn/user/login.php"


1-4.Name="中国红客联盟"
1-4.Icon="论坛\中国红客联盟.ico"
1-4.Usermame=
1-4.Password=
1-4.Http="http://www.cnhonkerarmy.com/member.php?mod=logging&action=login"


1-5.Name="诺语论坛"
1-5.Icon="论坛\诺语论坛.ico"
1-5.Usermame=
1-5.Password=
1-5.Http="http://www.inuoyu.com/"

1-6.Name="CC99账号分享网"
1-6.Icon="论坛\CC99账号分享网.ico"
1-6.Usermame=
1-6.Password=
1-6.Http="http://www.cc99.com/bbs/forum.php"


1-7.Name="远景论坛"
1-7.Icon="论坛\远景论坛.ico"
1-7.Usermame=
1-7.Password=
1-7.Http="http://bbs.pcbeta.com/member.php?mod=logging&action=login"

1-8.Name="AutoIt中文论坛"
1-8.Icon="论坛\AutoIt.ico"
1-8.Usermame=
1-8.Password=
1-8.Http="http://www.autoitx.com/logging.php?action=login"



[2]
2.Name="邮箱"
2.Icon="邮箱\邮箱.ico"
2.Expand=0

2-1.Name="163邮箱 I"
2-1.Icon="邮箱\163.ico"
2-1.Usermame=
2-1.Password=
2-1.Http="http://mail.163.com/"


2-2.Name="163邮箱 II"
2-2.Icon="邮箱\163.ico"
2-2.Usermame=
2-2.Password=
2-2.Http="http://mail.163.com/"
#ce