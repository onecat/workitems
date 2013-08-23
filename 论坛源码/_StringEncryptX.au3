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

Func _StringEncryptX($i_Encrypt, $s_EncryptText, $s_EncryptPassword, $i_EncryptLevel = 1)
        If $i_Encrypt <> 0 And $i_Encrypt <> 1 Then
                SetError(1)
                Return ''
        ElseIf $s_EncryptText = '' Or $s_EncryptPassword = '' Then
                SetError(1)
                Return ''
        Else
                If Number($i_EncryptLevel) <= 0 Or Int($i_EncryptLevel) <> $i_EncryptLevel Then $i_EncryptLevel = 1
                Local $v_EncryptModified, $i_EncryptCountH, $i_EncryptCountG, $v_EncryptSwap, $av_EncryptBox[256][2]
                Local $i_EncryptCountA, $i_EncryptCountB, $i_EncryptCountC, $i_EncryptCountD, $i_EncryptCountE
                Local $v_EncryptCipher, $v_EncryptCipherBy
                If $i_Encrypt = 1 Then
                        For $i_EncryptCountF = 0 To $i_EncryptLevel Step 1
                                $i_EncryptCountG = ''
                                $i_EncryptCountH = ''
                                $v_EncryptModified = ''
                                For $i_EncryptCountG = 1 To StringLen($s_EncryptText)
                                        If $i_EncryptCountH = StringLen($s_EncryptPassword) Then
                                                $i_EncryptCountH = 1
                                        Else
                                                $i_EncryptCountH += 1
                                        EndIf
                                        $v_EncryptModified = $v_EncryptModified & ChrW(BitXOR(AscW(StringMid($s_EncryptText, $i_EncryptCountG, 1)), AscW(StringMid($s_EncryptPassword, $i_EncryptCountH, 1)), 255))
                                Next
                                $s_EncryptText = $v_EncryptModified
                                $i_EncryptCountA = ''
                                $i_EncryptCountB = 0
                                $i_EncryptCountC = ''
                                $i_EncryptCountD = ''
                                $i_EncryptCountE = ''
                                $v_EncryptCipherBy = ''
                                $v_EncryptCipher = ''
                                $v_EncryptSwap = ''
                                $av_EncryptBox = ''
                                Local $av_EncryptBox[256][2]
                                For $i_EncryptCountA = 0 To 255
                                        $av_EncryptBox[$i_EncryptCountA][1] = AscW(StringMid($s_EncryptPassword, Mod($i_EncryptCountA, StringLen($s_EncryptPassword)) + 1, 1))
                                        $av_EncryptBox[$i_EncryptCountA][0] = $i_EncryptCountA
                                Next
                                For $i_EncryptCountA = 0 To 255
                                        $i_EncryptCountB = Mod(($i_EncryptCountB + $av_EncryptBox[$i_EncryptCountA][0] + $av_EncryptBox[$i_EncryptCountA][1]), 256)
                                        $v_EncryptSwap = $av_EncryptBox[$i_EncryptCountA][0]
                                        $av_EncryptBox[$i_EncryptCountA][0] = $av_EncryptBox[$i_EncryptCountB][0]
                                        $av_EncryptBox[$i_EncryptCountB][0] = $v_EncryptSwap
                                Next
                                For $i_EncryptCountA = 1 To StringLen($s_EncryptText)
                                        $i_EncryptCountC = Mod(($i_EncryptCountC + 1), 256)
                                        $i_EncryptCountD = Mod(($i_EncryptCountD + $av_EncryptBox[$i_EncryptCountC][0]), 256)
                                        $i_EncryptCountE = $av_EncryptBox[Mod(($av_EncryptBox[$i_EncryptCountC][0] + $av_EncryptBox[$i_EncryptCountD][0]), 256)][0]
                                        $v_EncryptCipherBy = BitXOR(AscW(StringMid($s_EncryptText, $i_EncryptCountA, 1)), $i_EncryptCountE)
                                        $v_EncryptCipher &= Hex($v_EncryptCipherBy, 2)
                                Next
                                $s_EncryptText = $v_EncryptCipher
                        Next
                Else
                        For $i_EncryptCountF = 0 To $i_EncryptLevel Step 1
                                $i_EncryptCountB = 0
                                $i_EncryptCountC = ''
                                $i_EncryptCountD = ''
                                $i_EncryptCountE = ''
                                $v_EncryptCipherBy = ''
                                $v_EncryptCipher = ''
                                $v_EncryptSwap = ''
                                $av_EncryptBox = ''
                                Local $av_EncryptBox[256][2]
                                For $i_EncryptCountA = 0 To 255
                                        $av_EncryptBox[$i_EncryptCountA][1] = AscW(StringMid($s_EncryptPassword, Mod($i_EncryptCountA, StringLen($s_EncryptPassword)) + 1, 1))
                                        $av_EncryptBox[$i_EncryptCountA][0] = $i_EncryptCountA
                                Next
                                For $i_EncryptCountA = 0 To 255
                                        $i_EncryptCountB = Mod(($i_EncryptCountB + $av_EncryptBox[$i_EncryptCountA][0] + $av_EncryptBox[$i_EncryptCountA][1]), 256)
                                        $v_EncryptSwap = $av_EncryptBox[$i_EncryptCountA][0]
                                        $av_EncryptBox[$i_EncryptCountA][0] = $av_EncryptBox[$i_EncryptCountB][0]
                                        $av_EncryptBox[$i_EncryptCountB][0] = $v_EncryptSwap
                                Next
                                For $i_EncryptCountA = 1 To StringLen($s_EncryptText) Step 2
                                        $i_EncryptCountC = Mod(($i_EncryptCountC + 1), 256)
                                        $i_EncryptCountD = Mod(($i_EncryptCountD + $av_EncryptBox[$i_EncryptCountC][0]), 256)
                                        $i_EncryptCountE = $av_EncryptBox[Mod(($av_EncryptBox[$i_EncryptCountC][0] + $av_EncryptBox[$i_EncryptCountD][0]), 256)][0]
                                        $v_EncryptCipherBy = BitXOR(Dec(StringMid($s_EncryptText, $i_EncryptCountA, 2)), $i_EncryptCountE)
                                        $v_EncryptCipher = $v_EncryptCipher & ChrW($v_EncryptCipherBy)
                                Next
                                $s_EncryptText = $v_EncryptCipher
                                $i_EncryptCountG = ''
                                $i_EncryptCountH = ''
                                $v_EncryptModified = ''
                                For $i_EncryptCountG = 1 To StringLen($s_EncryptText)
                                        If $i_EncryptCountH = StringLen($s_EncryptPassword) Then
                                                $i_EncryptCountH = 1
                                        Else
                                                $i_EncryptCountH += 1
                                        EndIf
                                        $v_EncryptModified &= ChrW(BitXOR(AscW(StringMid($s_EncryptText, $i_EncryptCountG, 1)), AscW(StringMid($s_EncryptPassword, $i_EncryptCountH, 1)), 255))
                                Next
                                $s_EncryptText = $v_EncryptModified
                        Next
                EndIf
                Return $s_EncryptText
        EndIf
EndFunc   ;==>_StringEncryptX