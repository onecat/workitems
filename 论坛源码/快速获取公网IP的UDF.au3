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
;~ MsgBox(0, '获取公网IP',"你的公网IP是："& _NetworkGetInternetIP())
;~ Func _NetworkGetInternetIP()
;~         Local $ip
;~          $ip=InetRead("http://www.aamailsoft.com/getip.php",1)
;~          $ip=BinaryToString($ip)
;~         If      StringStripWS($ip,8) <> "" Then
;~                 Return $ip
;~         Else
;~                 Return "0.0.0.0"
;~         EndIf
;~ EndFunc   ;==>_NetworkGetInternetIP



MsgBox(0, '获取公网IP',"你的公网IP是："& _getmyip())
Func _getmyip()
        Local $oiehtml = BinaryToString(InetRead("http://iframe.ip138.com/ic.asp"))
        Local $strarray = StringRegExp($oiehtml, '\[([^\]]+)', 3)
        If Not @error Then
                Return $strarray[0]
        Else
                Local $err = "错误"
                Return $err
        EndIf
EndFunc   ;==>_getmyip