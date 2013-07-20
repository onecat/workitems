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
Local $nDownload
Local $nSize
Local $ProgressBar
DirCreate ("H:\TEST")  ;创建一个文件夹、用于存放下载的文件

;用InetGetSize获取文件大小
$nSize = InetGetSize("ftp://sam:sam@192.168.9.253/2.rar")
MsgBox(0,"提示框","文件大小:" & $nSize)

;显示下载进度
ProgressOn ("下载进度","正在下载请稍候.....","0 %")
For $ProgressBar = 0 To $nSize Step 10
        Sleep(1000)
        ProgressSet($ProgressBar,$ProgressBar & " %")
Next
ProgressSet(100 ,"完成","全部完成")
Sleep(500)

;使用InetGet下载文件
$nDownload = InetGet("ftp://sam:sam@192.168.9.253/2.rar","H:\TEST\2.rar",0,1) 
Do
        Sleep(200)
        Until InetGetInfo($nDownload,2) ;检测是否下载完成

ProgressOff() ;关闭进度条

MsgBox(0,"完成提示框","下载完成")
