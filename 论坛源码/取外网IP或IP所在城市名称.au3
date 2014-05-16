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
;$iFlag = True取ip所在城市      ，$iFlag = false取ip
;出错返回空值，并设置@error为-1
;By CrossDoor
MsgBox(0,"IP",_GetAddress(false))
MsgBox(0,"所在城市",_GetAddress(True))
Func _GetAddress($iFlag = True)
        $bReadIp = InetRead("http://www.onlinedown.net/ajax_ip.php")
        $return = BinaryToString($bReadIp)
        $IP = StringRegExp($return, '((2[0-4]\d|25[0-5]|[01]?\d\d?)\.){3}(2[0-4]\d|25[0-5]|[01]?\d\d?)', 2)
        If Not @error Then
                If $iFlag Then
                        $bReadCity = InetRead("http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=json&ip=" & $IP[0])
                        $return = BinaryToString($bReadCity)
                        $Mid1 = StringInStr($return, 'city":"')
                        $Mid2 = StringInStr($return, '","district"')
                        $City = StringMid($return, $Mid1+7,$Mid2-$Mid1-7)               
                        Return (BinaryToString(Binary("0x" & StringReplace($City,"\u","")), 3))
                Else
                        Return $IP[0]
                EndIf
        Else
                Return SetError(-1, 0, "")
        EndIf
EndFunc

