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
#include <Array.au3>
Local $c = 5 ;列数
Local $Str = _
                '4.916094237        18.47223492        17.72360797        20.07765068        2.244682034        ' & @CRLF & _
                '7.073194034        22.04562807        17.19103832        19.8221179        2.23423084        ' & @CRLF & _
                '9.03093563        24.06295487        17.4786963        20.03798008        2.242400756        ' & @CRLF & _
                '10.97421483        28.26196067        17.39201467        19.94261233        2.24527325'
Local $aSR = StringRegExp($Str, '\S+', 3)
MsgBox(0,"",$aSR[1])
If @error Or Not IsInt(UBound($aSR) / $c) Then Exit
Local $a[UBound($aSR) / $c][$c]
For $i = 0 To UBound($aSR) - 1
        $a[Int($i / $c)][Mod($i, $c)] = $aSR[$i]
Next
_ArrayDisplay($a, UBound($a))
