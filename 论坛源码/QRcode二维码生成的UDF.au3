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

;实例
_QRcode(@ScriptDir&'\1.png',200,'Should you have any questions concerning this EULA, or if you desire to contact the author of this Software for any reason, please contact him/her at the email address mentioned at ')
If @error Then MsgBox(96,'',@error)


;$sPath:生成文件的带路径的文件名，应为png文件
;$WH:生成文件的宽高
;用于生成文件的字符串
#include<array.au3>
Func _QRcode($sPath, $sWH, $sString)
        If StringRegExp($sString, '[^\x00-\xff]') Then
                SetError(1)
                Return False
        EndIf;检测是否为全单字节
    $sString = StringReplace($sString,'+','%2B')
        $sString = StringReplace($sString,'%','%25')
        $sString = StringReplace($sString,@CR,'%0D')
        $sString = StringReplace($sString,@LF,'%0A')
        $sString = StringReplace($sString,' ','+')
        If StringLen($sString) +stringlen("http://chart.apis.google.com/chart?cht=qr&chs=" & $sWH & 'x' & $sWH & "&chl=" ) > 2048 Then
                SetError(2)
                Return False
        EndIf;字符超限
        FileDelete($sPath)
        ;开始发送数据，并获取二维码了
        InetGet("http://chart.apis.google.com/chart?cht=qr&chs=" & $sWH & 'x' & $sWH & "&chl=" & $sString, $sPath, 1, 0)
        If @error  Then
                SetError(3)
                Return False
        EndIf;网络故障
 
        Return True
EndFunc   ;==>_QRcode

