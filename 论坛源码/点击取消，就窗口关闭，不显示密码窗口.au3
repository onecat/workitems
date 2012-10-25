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

Dim $a, $b
Do
        $a = InputBox ("登录窗口", "请输入用户名", "", "")
		If @error =1 Then Exit
        $b = InputBox ("密码", "输入您的密码.", "", "*")
        If @error =1 Then Exit
        If $a = "" Then
                MsgBox(0 + 16 + 4096 + 262144, "错误信息", "输入的用户名不能为空")
        ElseIf $a <> "admin" Then
                MsgBox(0 + 16 + 4096 + 262144, '错误信息', '用户名不正确，请重新输入')
        Else
                If $b = "" Then
                        MsgBox(0 + 16 + 4096 + 262144, "错误信息", "输入的密码不能为空")
                ElseIf $b <> "123" Then
                        MsgBox(0 + 16 + 4096 + 262144, '错误信息', '密码不正确，请重新输入')
                Else
                        MsgBox(64, "恭喜", "成功")
                EndIf
        EndIf
Until $a = "admin" And $b = "123"
