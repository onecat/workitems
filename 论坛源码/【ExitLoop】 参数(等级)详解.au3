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
#cs

大家也知道【ExitLoop】是终止 While 或 Do 或 For 循环.
ExitLoop是非常有用的函数，但是一般使用ExitLoop都不用参数.

帮助文档里也没有详细说明，我想很多朋友都不知道这个参数是干什么的.
所以在这里给大家介绍一下，留个记录.

ExitLoop
--------------------------------------------------------------------------------

终止 While 或 Do 或 For 循环.

ExitLoop [等级]
        
[等级]
        0 = 不会有任何效果.
        1 = 默认为 1(表示当前循环).
        2以上 = 退出多个循环.


这个等级是使用多个循环时候非常有用，如果代码中检查出错时可以退出多个循环.
#ce
;例子：
For $s = 0 To 99; 第一个循环

        For $i = 0 To 99; 第二个循环

                $file = FileOpen('lixiaolong') ;指定不存在的文件试试.

               

;~              If $file = -1 Then ExitLoop ;退出当前循环，相当于 ExitLoop 1，继续实行第一个循环.

                If $file = -1 Then ExitLoop 2 ;退出2个循环，不再实行第一个循环.

        Next

        MsgBox(0, '', '如果For $i 没有出错实行这个')

Next

 

If $s <> 100 Then MsgBox(0,0,'发生错误')

Exit




;例子2 请看ConsoleWrite输出的循环动作：
$a = 0

 

While 1

        ConsoleWrite('Loop 1' & @CRLF)

        While 2

                ConsoleWrite('Loop 2' & @CRLF)

                While 3

                        ConsoleWrite('Loop 3' & @CRLF)

                        While 4

                                $a += 1

                                ConsoleWrite('Loop 4' & @CRLF)

                                If $a = 5 Then

                                        MsgBox(0, 0, 'ExitLoop 0')

                                        ConsoleWrite('===ExitLoop 0===' & @CRLF)

                                        ExitLoop 0 ;没有任何效果

                                ElseIf $a = 10 Then

                                        MsgBox(0, 0, 'ExitLoop 1')

                                        ConsoleWrite('===ExitLoop 1===' & @CRLF)

                                        ExitLoop 1 ; 退出While 4

                                ElseIf $a = 30 Then

                                        MsgBox(0, 0, 'ExitLoop 2')

                                        ConsoleWrite('===ExitLoop 2===' & @CRLF)

                                        ExitLoop 2 ; 退出While 3，While 4

                                ElseIf $a = 50 Then

                                        MsgBox(0, 0, 'ExitLoop 3')

                                        ConsoleWrite('===ExitLoop 3===' & @CRLF)

                                        ExitLoop 3 ; 退出While 2，While 3，While 4

                                ElseIf $a = 70 Then

                                        MsgBox(0, 0, 'ExitLoop 4')

                                        ConsoleWrite('===ExitLoop 4===' & @CRLF)

                                        ExitLoop 4 ; 退出While 1，While 2，While 3，While 4

                                EndIf

                        WEnd

                WEnd

        WEnd

WEnd

 

MsgBox(0, 0, '退出了所有循环')




;ContinueLoop 的循环等级也一样.
For $i = 0 To 100

        MsgBox(0,$i,'我是第一个循环')

        For $s = 1 To 10

                If $s = 7 Then ContinueLoop 2

                MsgBox(0, "$i 的当前值为: ", $i)

        Next

Next

Exit

