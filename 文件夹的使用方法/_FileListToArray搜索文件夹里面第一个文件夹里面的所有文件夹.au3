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

;C:\Users\chtyfox\Desktop\板端\11\222\333\4444\55555\666666
  #Include <File.au3>
  #Include <Array.au3>
  Local $var ,$pathfile,$pa,$FILE2
  $_Path = "C:\Users\chtyfox\Desktop\板端"
  _FileReadDir($_Path)
  $FILE2 = StringRight($pathfile, StringLen($pathfile) - StringInStr($pathfile, "\", 1, -1))
  MsgBox(0,"1",$FILE2)
  $1 = StringLen($FILE2)+1
  $2 = StringLen($pathfile) -$1
  $3 = StringLeft($pathfile,$2)
  $FILE3 = StringRight($3, StringLen($3) - StringInStr($3, "\", 1, -1) )
  MsgBox(0,"2",$FILE3)
  $4 = StringLen($FILE3)+1
  $5 = StringLen($3) -$4
  $6 = StringLeft($3,$5)
  $FILE4 = StringRight($6, StringLen($6) - StringInStr($6, "\", 1, -1) )
  MsgBox(0,"3",$FILE4)
  $7 = StringLen($FILE4)+1
  $8 = StringLen($6) -$7
  $9 = StringLeft($6,$8)
  $FILE5 = StringRight($9, StringLen($9) - StringInStr($9, "\", 1, -1) )
  MsgBox(0,"4",$FILE5)
  $10 = StringLen($FILE5)+1
  $11 = StringLen($9) -$10
  $12= StringLeft($9,$11)
  $FILE6 = StringRight($12, StringLen($12) - StringInStr($12, "\", 1, -1) )
  MsgBox(0,"5",$FILE6)
  $13 = StringLen($FILE6)+1
  $14= StringLen($12) -$13
  $15= StringLeft($12,$14)
  $FILE7 = StringRight($15, StringLen($15) - StringInStr($15, "\", 1, -1) )
  MsgBox(0,"6",$FILE7)
Func _FileReadDir($_Path)
        $Folder = _FileListToArray($_Path, "*", 2)
        If Not IsArray($Folder) Then Return 0
        For $i = 1 To $Folder[0]
				$pathfile =$_Path & "\" & $Folder[$i]
               _FileReadDir($_Path & "\" & $Folder[$i]) 
			Next
EndFunc			