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

#include<GuiTreeView.au3>
#include<EditConstants.au3>
#include<GUIConstantsEx.au3>
#include<TreeViewConstants.au3>
#include<WindowsConstants.au3>

Global $sPath = 'C:\WINDOWS'
Global $width = 800, $height = 600
Global $hGui = GUICreate('目录树状图', $width, $height, -1, 0)
Global $hInput = GUICtrlCreateInput($sPath, 10, 10, $width - 160, 20, BitOR($ES_AUTOHSCROLL, $ES_READONLY))
Global $hChoose = GUICtrlCreateButton('...', $width - 148, 9, 30, 22)
GUICtrlSetFont(-1, 9, 600, 0, 'Verdana')
Global $hFiles = GUICtrlCreateCheckbox('包括文件', $width - 100, 10, 80, 16)
Global $bFiles = False
Global $hTreeView = GUICtrlCreateTreeView(10, 40, $width - 20, $height - 70, BitOR($GUI_SS_DEFAULT_TREEVIEW, $TVS_CHECKBOXES), $WS_EX_STATICEDGE)
GUICtrlSetFont(-1, 10, 400, 0, 'Arial')
GUICtrlSetBkColor(-1, 0xF8F8F8)
Global $hContextMenu = GUICtrlCreateContextMenu($hTreeView)
Global $hInfo = GUICtrlCreateMenuItem('信息', $hContextMenu)
Global $hExpand = GUICtrlCreateMenuItem('展开所有', $hContextMenu)
Global $hCollapse = GUICtrlCreateMenuItem('折叠所有', $hContextMenu)
Global $hStatus1 = GUICtrlCreateLabel('', 0, $height - 16, $width / 2, 16, -1, $WS_EX_STATICEDGE)
Global $hStatus2 = GUICtrlCreateLabel('', $width / 2 + 1, $height - 16, $width / 2, 16, -1, $WS_EX_STATICEDGE)
GUISetState()

_TreeViewUpdate()

While True
        Switch GUIGetMsg()
                Case $hChoose
                        $sTmp = FileSelectFolder('目录', '', 0, $sPath, $hGui)
                        If Not @error Then
                                $sPath = $sTmp
                                GUICtrlSetData($hInput, $sPath)
                                _TreeViewUpdate()
                        EndIf
                Case $hFiles
                        $bFiles = BitAND(GUICtrlRead($hFiles), $GUI_CHECKED) = $GUI_CHECKED
                        _TreeViewUpdate()
                Case $GUI_EVENT_PRIMARYDOWN
                        $aInfo = GUIGetCursorInfo($hGui)
                        If $aInfo[4] = $hTreeView Then
                                $oldGUIDataSeparatorChar = Opt('GUIDataSeparatorChar', '\')
                                GUICtrlSetData($hStatus1, ' ' & StringReplace(_GUICtrlTreeView_GetTree($hTreeView), '\\', '\'))
                                Opt('GUIDataSeparatorChar', $oldGUIDataSeparatorChar)
                                If BitAND(_GUICtrlTreeView_HitTest($hTreeView, $aInfo[0] - 11, $aInfo[1] - 41), 64) Then
                                        $checked = _GUICtrlTreeView_GetChecked($hTreeView, _GUICtrlTreeView_GetSelection($hTreeView))
                                        _GUICtrlTreeView_SetBold($hTreeView, _GUICtrlTreeView_GetSelection($hTreeView), $checked)
                                        $hItem = _GUICtrlTreeView_GetFirstChild($hTreeView, _GUICtrlTreeView_GetSelection($hTreeView))
                                        If $hItem Then _MarkChildItems($hTreeView, $hItem, $checked)
                                EndIf
                        EndIf
                Case $hInfo
                        $oldGUIDataSeparatorChar = Opt('GUIDataSeparatorChar', '\')
                        $TempPath = StringReplace(_GUICtrlTreeView_GetTree($hTreeView), '\\', '\')
                        Opt('GUIDataSeparatorChar', $oldGUIDataSeparatorChar)
                        MsgBox(0, '信息', $TempPath & @CRLF & '文件大小: ' & FileGetSize($TempPath) & ' Bytes')
                Case $hExpand
                        _ExpandAll($hTreeView)
                Case $hCollapse
                        _CollapseAll($hTreeView)
                Case $GUI_EVENT_CLOSE
                        Exit
        EndSwitch
WEnd

Func _MarkChildItems(ByRef $hTreeView, $hItem, $checked)
        Do
                $hNewItem = _GUICtrlTreeView_GetFirstChild($hTreeView, $hItem)
                If $hNewItem Then _MarkChildItems($hTreeView, $hNewItem, $checked)
                _GUICtrlTreeView_SetChecked($hTreeView, $hItem, $checked)
                _GUICtrlTreeView_SetBold($hTreeView, $hItem, $checked)
                $hItem = _GUICtrlTreeView_GetNextChild($hTreeView, $hItem)
        Until $hItem = 0
EndFunc   ;==>_MarkChildItems

Func _ExpandAll($hTreeView)
        _GUICtrlTreeView_Expand($hTreeView)
EndFunc   ;==>_ExpandAll

Func _CollapseAll($hTreeView)
        _GUICtrlTreeView_Expand($hTreeView, 0, False)
EndFunc   ;==>_CollapseAll

Func _TreeViewUpdate()
        GUICtrlSetData($hStatus1, ' 请稍等！目录是只读...')
        GUICtrlSetData($hStatus2, '')
        $Timer = TimerInit()
        Local $aCount = _GUICtrlTreeView_CreateDirectory($hTreeView, $sPath, $bFiles)
        If Not @error Then
                $msg = ' 耗时: ' & Round(TimerDiff($Timer) / 1000, 3) & ' 秒'
                $msg &= '  |   ' & $aCount[1] & ' 文件 ' & $aCount[0] & ' 目录'
                GUICtrlSetData($hStatus1, ' 空闲.')
                GUICtrlSetData($hStatus2, $msg)
        EndIf
EndFunc   ;==>_TreeViewUpdate


Func _GUICtrlTreeView_CreateDirectory($hTreeView, $sPath, $bFiles = False)
        Local $hFileItem, $FolderColor = 0x0000FF, $Folder, $aCount[2] = [0, 0]
        If Not StringInStr(FileGetAttrib($sPath), 'D') Then Return SetError(1, 0, 0)
        $sPath = FileGetLongName($sPath)
        Local $oFSO = ObjCreate('Scripting.FileSystemObject')
        If @error Then Return SetError(2, 0, 0)
        _GUICtrlTreeView_BeginUpdate($hTreeView)
        _GUICtrlTreeView_DeleteAll(GUICtrlGetHandle($hTreeView))
        Local $hTreeViewItem = GUICtrlCreateTreeViewItem($sPath, $hTreeView)
        GUICtrlSetColor(-1, $FolderColor)
        _GUICtrlTreeView_SetIcon($hTreeView, $hTreeViewItem, 'shell32.dll', 0)
        $Folder = $oFSO.GetFolder($sPath)
        _CreateDirectoryRecursive($hTreeView, $Folder, $hTreeViewItem, $bFiles, $aCount)
        If $bFiles Then
                For $Files In $Folder.Files
                        $hFileItem = GUICtrlCreateTreeViewItem($Files.Name, $hTreeViewItem)
                        $aCount[1] += 1
                Next
        EndIf
        _GUICtrlTreeView_SetIcon($hTreeView, $hTreeViewItem, 'shell32.dll', 3, 2)
        _GUICtrlTreeView_SetIcon($hTreeView, $hTreeViewItem, 'shell32.dll', 110, 4)
        _GUICtrlTreeView_EndUpdate($hTreeView)
        GUICtrlSetState($hTreeViewItem, $GUI_EXPAND)
        $oFSO = ''
        Return $aCount
EndFunc   ;==>_GUICtrlTreeView_CreateDirectory

Func _CreateDirectoryRecursive($hTreeView, $Folder, $ItemOld, $bFiles, ByRef $aCount)
        Local $hFolderItem, $hFileItem, $FolderColor = 0x0000FF
        For $Subfolder In $Folder.SubFolders
                $hFolderItem = GUICtrlCreateTreeViewItem($Subfolder.Name, $ItemOld)
                GUICtrlSetColor(-1, $FolderColor)
                _GUICtrlTreeView_SetIcon($hTreeView, $hFolderItem, 'shell32.dll', 3, 2)
                _GUICtrlTreeView_SetIcon($hTreeView, $hFolderItem, 'shell32.dll', 110, 4)
                $aCount[0] += 1
                _CreateDirectoryRecursive($hTreeView, $Subfolder, $hFolderItem, $bFiles, $aCount)
                If $bFiles Then
                        For $Files In $Subfolder.Files
                                $hFileItem = GUICtrlCreateTreeViewItem($Files.Name, $hFolderItem)
                                $aCount[1] += 1
                        Next
                EndIf
        Next
EndFunc   ;==>_CreateDirectoryRecursive