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

Local $IPADD1='192.168.1.1',$IP1LostPackageCount=0  ;定义目标IP和丢包数变量
Local $IPADD2='192.168.1.2',$IP2LostPackageCount=0
 
For $i=1 To 50
        $temp1=Ping($IPADD1,250)  ;设置超时时间，根据你的实际需求来设置。
        If $temp1=0 Then $IP1LostPackageCount+=1  ;如果返回等于0，则证明丢包了。则丢包数+1
        $temp2=Ping($IPADD2,250)
        If $temp2=0 Then $IP2LostPackageCount+=1
        If $temp1<>0 And $temp2<>0 Then
                TrayTip("正在发送第"&$i&"包……","第一包发送成功 "&@CRLF&"第二包发送成功 ",1)  ;显示当前是第几包和状态
        ElseIf $temp1=0 And $temp2<>0  Then
                TrayTip("正在发送第"&$i&"包……","第一包发送失败 "&@CRLF&"第二包发送成功 ",1)  ;显示当前是第几包和状态
        ElseIf $temp1<>0 And $temp2=0  Then
                TrayTip("正在发送第"&$i&"包……","第一包发送成功 "&@CRLF&"第二包发送失败 ",1)  ;显示当前是第几包和状态
        Else
                TrayTip("正在发送第"&$i&"包……","第一包发送失败 "&@CRLF&"第二包发送失败 ",1)  ;显示当前是第几包和状态
        EndIf
        
Next
 
MsgBox(0,"结束","第一个IP丢包数:"&$IP1LostPackageCount&@CRLF&"第二个IP丢包数:"&$IP2LostPackageCount)