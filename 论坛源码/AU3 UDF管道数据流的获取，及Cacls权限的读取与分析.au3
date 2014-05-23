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

#include <Constants.au3>
 
;####### 示例始 #########
MsgBox(0,"直接查看 cacls.exe c:\windows\Explorer.exe 的管道数据流：",kc_STD_Return("cacls.exe","c:\windows\Explorer.exe")&@CRLF)
 
Local $a = kc_Cacls_Return("c:\windows\Explorer.exe")
Local $txt
For $i=1 To $a[0]
        $txt &= @CRLF&$a[$i]
Next
MsgBox(0,"查看 c:\windows\Explorer.exe 的权限：","   信息量："&$a[0]&@CRLF&$txt&@CRLF)
 
MsgBox(0,"Administrators 在Explorer.exe上的权限：",kc_UserCacls_Return("c:\windows\Explorer.exe","Administrators"))
;####### 示例毕 #########
 
#cs
编写：KiwiCsj @ 200903241359
功能：取指定程序的管道数据流
解释：kc_STD_Return(指定程序,给程序传递的参数,指定的程序的工具路径)     
        缺省工作路径为系统目录
返回：截取到的管道数据流文本
 
#ce
Func kc_STD_Return($kcu_Pro,$kcu_Key,$kcu_WorkPath=@SystemDir)  ;
        Local $kcu_info,$kcu_ReadProcessPid
        $kcu_ReadProcessPid = Run($kcu_Pro&" "&$kcu_Key,$kcu_WorkPath, @SW_HIDE, $STDERR_CHILD + $STDOUT_CHILD)
        While 1
                $kcu_info &= StdoutRead($kcu_ReadProcessPid)
                If @error Then ExitLoop
        Wend
        Return StringStripWS($kcu_info,7)
EndFunc ;==>kc_STD_Return
 
#cs
编写：KiwiCsj @ 200903241359
功能：取指定文件的权限列表
解释：kc_Cacls_Return(指定文件,样式)    
        样式1返回数组中包含更多信息，但很可能无意义 
        缺省样式为2
返回：权限数组，数组单元0为数组中的数据量（不含0单元），1单元为文件完整路径，2单元始为“权限 用户”格式的权限值
 
#ce
Func kc_Cacls_Return($kcu_file,$kcu_mode=2)     
        Local $kcu_Pro = "cacls.exe", $kcu_info, $kcu_tmpA, $kcu_tmpB
        $kcu_info = kc_STD_Return($kcu_Pro,$kcu_file)
        If $kcu_info <> "" Then
                $kcu_tmpA = StringSplit($kcu_info,":",1)                ;取畸形分组
                Local $kcu_ReArray[$kcu_tmpA[0]+2]
                For $i=$kcu_tmpA[0] To 1 Step -1
                        $kcu_tmpB = StringSplit($kcu_tmpA[$i]," ")      ;取二次分组(组1为前一正组的末组)
                        $kcu_ReArray[$i-1] = $kcu_tmpB[1]
                        For $s = 2 To $kcu_tmpB[0]                                      ;取除末组外的数据
                                $kcu_ReArray[$i] &= " "&$kcu_tmpB[$s]
                        Next
                        If $kcu_mode <> 1 And $i <> 1 Then 
                                Local $kcu_t = StringInStr($kcu_ReArray[$i],"\",1)
                                If $kcu_t <> 0 Then $kcu_ReArray[$i] = StringReplace($kcu_ReArray[$i],StringMid($kcu_ReArray[$i],3,$kcu_t-2),"")
                        EndIf
                Next
                $kcu_ReArray[1] = $kcu_ReArray[0]&":"&$kcu_ReArray[1]
                $kcu_ReArray[0] = $kcu_tmpA[0]-1                        ;置数量
        EndIf
        Return $kcu_ReArray     ; 返回
EndFunc ;==>kc_Cacls_Return
 
#cs
编写：KiwiCsj @ 200903241359
功能：取指定文件的指定用户的权限值
解释：kc_UserCacls_Return(指定文件,指定用户)
返回：windows的权限代码，F = 完全权限，R = 只读，诸如此类
 
#ce
Func kc_UserCacls_Return($kcu_file,$kcu_user)
        Local $kcu_cac = kc_Cacls_Return($kcu_file)
        For $i = 2 To $kcu_cac[0]
                If StringInStr($kcu_cac[$i],$kcu_user) <> 0 Then
                        Local $kcu_cacT = StringSplit($kcu_cac[$i]," ",1)
                        Return $kcu_cacT[1]
                EndIf
        Next
EndFunc ;==>kc_UserCacls_Return
