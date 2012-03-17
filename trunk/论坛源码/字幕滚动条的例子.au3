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

#include <GuiConstantsEx.au3>
#include <GDIPlus.au3>
#Include <GDIPlusEx.au3>
#Include <WinAPIEx.au3>
#Include <WindowsConstants.au3>
;#include <array.au3>
 
Opt('MustDeclareVars', 1)
 
Global   $left=@DesktopWidth
Local $hGUI, $hWnd, $hGraphic, $hBrush, $hFormat, $hFamily, $hFont, $tLayout, $aInfo  
Local $sString = "Hello world"&@CRLF&"滚动字幕测试,为了增加长度再来一次,不知道中英文混合的效果如何? this is a 测试!"&@CRLF&"abcdefghijklmnop"
 
$aInfo=_GetStringsize($sString,"微软雅黑",12,2,400);只需注意这里设置的字体设置与LABEL的字体一致
 
Local $W=DllStructGetData($aInfo[0],3)
Local $H=DllStructGetData($aInfo[0],4)
 
$hGUI = GUICreate("GDI+", $W,$H,0-$W,0,0x80000000+0x00000200,0x02000000+0x00080000+0x00000020)
GUISetBkColor(0x010101)
        
GUICtrlCreateLabel($sString,0,0,$W,$H)
GUICtrlSetFont(-1,12,400,2,"微软雅黑");控件ID, 大小 , 权值 , 属性 , 字体名
GUICtrlSetColor(-1,0xfcaf17)
GUICtrlSetBkColor(-1,-2)
_WinAPI_SetLayeredWindowAttributes($hGUI,0xff010101,255,0x03,True)
GUISetState()
  
AdlibRegister("time",50)
 
while GUIGetMsg()+3
WEnd
 
Func time()
        if $left<0-$W then 
                AdlibUnRegister("time")
                Exit
        EndIf
        WinMove($hGUI,"",$left,0)
        $left-=1
EndFunc
 
#cs
Name           :_GetStringsize
Description   :返回字符串像素宽,高
Syntax        :_GetStringsize($sString,$Font_Family,$Font_Size,$Font_iStyle)
Parameters  : $sString - 输入的字符串
                  $Font_Family - 字体族
                                  $Font_Size - 字体大小
                                  $Font_iStyle - 字体样式. 可以结合下面的值:
                                                                        0 - 正常重度或者浓度
                                                                        2 - 斜体
                                                                        4 - 下划线
                                                                        8 - 删除线
                                 $Font_weight - 字体权值
                                                                        400 - (正常)
                                                                        800 - (粗体)
Return values: 成功:返回下格式数组: 
                                                        [0] - 接收字符串矩形边界的 $tagGDIPRECTF 结构 
                                                        [1] - 矩形布局中实际适合的字符数量 
                                                        [2] - 矩形布局中实际适合的行数 
                                        失败   - 返回 0
#ce
Func _GetStringsize($sString,$Font_Family,$Font_Size,$Font_iStyle,$Font_weight)
        if BitAND($Font_iStyle,1)=1 then $Font_iStyle=$Font_iStyle-1
        if $Font_weight=400 Then 
                $Font_weight=0
        Else
                $Font_weight=1
        EndIf   
_GDIPlus_Startup ()
$hGraphic = _GDIPlus_GraphicsCreateFromHWND (WinGetHandle(@ScriptFullPath))
$hBrush = _GDIPlus_BrushCreateSolid (0xFF00007F)
$hFormat = _GDIPlus_StringFormatCreate ()
$hFamily = _GDIPlus_FontFamilyCreate ($Font_Family)
$hFont = _GDIPlus_FontCreate ($hFamily, $Font_Size, BitOR($Font_iStyle,$Font_weight))
$tLayout = _GDIPlus_RectFCreate (0)
$aInfo = _GDIPlus_GraphicsMeasureString ($hGraphic, $sString, $hFont, $tLayout, $hFormat)
if $aInfo=0 then Return SetError(0)
_GDIPlus_FontDispose ($hFont)
_GDIPlus_FontFamilyDispose ($hFamily)
_GDIPlus_StringFormatDispose ($hFormat)
_GDIPlus_BrushDispose ($hBrush)
_GDIPlus_GraphicsDispose ($hGraphic)
_GDIPlus_Shutdown ()
return $aInfo
EndFunc