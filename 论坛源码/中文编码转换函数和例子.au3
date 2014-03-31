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

#include <winapi.au3>

Local $sInputText = 'AutoIt 中文学院'
$fan=_JianToFan($sInputText)
MsgBox(0,'简转繁：',$fan)
$jian=_FanToJian($sInputText)
MsgBox(0,'繁转简：',$jian)
$big5=_GbkToBig5($fan)
MsgBox(0,'转大五：',$big5)
$gbk=_Big5toGbk($big5)
MsgBox(0,'转GBK：',$gbk)
$jian=_FanToJian($gbk)
MsgBox(0,'繁转简：',$jian)


Func _Big5toGbk(ByRef $sInputText);BIG5转GBK
    $sInputText = _WinAPI_MultiByteToWideChar($sInputText, 950, $MB_COMPOSITE, False);转为繁体中文
    $sInputText = _WinAPI_WideCharToMultiByte($sInputText, 936);转为GBK繁体中文
    Return $sInputText
EndFunc   ;==>_Big5toGbk

Func _GbkToBig5($sInputText);GBK转BIG5
    $sInputText = _WinAPI_MultiByteToWideChar($sInputText, 936, $MB_COMPOSITE, False);转为繁体中文
    $sInputText = _WinAPI_WideCharToMultiByte($sInputText, 950);转为GBK繁体中文
    Return $sInputText
EndFunc

Func _JianToFan($sInputText);GB2312转GBK
Local $InPtr = _WinAPI_MultiByteToWideChar($sInputText, 936, $MB_COMPOSITE, False)
Local $OutPtr
Local $dll=DllOpen('kernel32.dll')
Local $result = DllCall($dll, "none","LCMapStringA", "LONG", 0x0804, "dword", 0x4000000, "STR", _
                    DllStructGetData($InPtr,1),"LONG",DllStructGetSize($InPtr),"str",$OutPtr,'long',DllStructGetSize($InPtr)); "PTR",$OutPtr,'long',DllStructGetSize($InPtr))
If IsArray($result) Then Return $result[5]
EndFunc

Func _FanToJian($sInputText);GBK转GB2312
Local $InPtr = _WinAPI_MultiByteToWideChar($sInputText, 936, $MB_COMPOSITE, False)
Local $OutPtr
Local $dll=DllOpen('kernel32.dll')
Local $result = DllCall($dll, "none","LCMapStringA", "LONG", 0x0804, "dword", 0x2000000, "STR", _
                    DllStructGetData($InPtr,1),"LONG",DllStructGetSize($InPtr),"str",$OutPtr,'long',DllStructGetSize($InPtr)); "PTR",$OutPtr,'long',DllStructGetSize($InPtr))
If IsArray($result) Then Return $result[5]
EndFunc