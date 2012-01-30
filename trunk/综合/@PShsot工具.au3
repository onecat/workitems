#Region ;**** 参数创建于 ACNWrapper_GUI ****
#AutoIt3Wrapper_Icon=L:\工具\综合软件\3D风格ICO图标\mc.ico
#AutoIt3Wrapper_Outfile=C:\Users\chtyfox\Desktop\@PShsot工具.exe
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_Res_Comment=Green
#AutoIt3Wrapper_Res_Description=Green
#AutoIt3Wrapper_Res_Fileversion=1.0.0.1
#AutoIt3Wrapper_Res_Fileversion_AutoIncrement=p
#AutoIt3Wrapper_Res_LegalCopyright=www.lite6.com
#EndRegion ;**** 参数创建于 ACNWrapper_GUI ****
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


FileSetAttrib ( "C:\Windows\system32\drivers\etc\hosts", "-RH" ) 
FileMove("C:\Windows\system32\drivers\etc\hosts","C:\Windows\system32\drivers\etc\hosts.txt",9)
Local $file = FileOpen("C:\Windows\system32\drivers\etc\hosts.txt", 1)
FileWrite($file,"127.0.0.1  practivate.adobe.com" & @CRLF)
FileMove("C:\Windows\system32\drivers\etc\hosts.txt","C:\Windows\system32\drivers\etc\hosts",9)
FileClose($file)
FileSetAttrib ( "C:\Windows\system32\drivers\etc\hosts", "+RH" ) 
MsgBox(0,"提示","破解成功")