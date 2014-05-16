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

;例子：婚礼进行曲

Local $sMusic = '-5..1.1;1.....;-5..2.-7;1.....;-5..1.4;4..3.2;1..-7.1;2.....;' & _
                '-5..1.1;1.....;-5..2.-7;1.....;-5..1.3;5..3.1;-6..2.3;1.....;' & _
                '4..3.2;-6..-6..;-7..1.2;2.....;4..3.2;-6..-6..;-7..1.2;2.....;' & _
                '1..1.1;1.....;-5..1.-7;1.....;-5..1.3;5..3.1;-6..2.3;1.....;' & _
                '-6..2.3;1.....;1.....'

_BeepMusic($sMusic)        ;婚礼进行曲
;_BeepMusic('1..,2..,3..,4..,5..,6..,7..,,,')        ;试音

Func _BeepMusic($sMusic, $cVal = 7, $vD = 200)
        ;$sMusic - afan定义的简谱字符串：
        ;        “.”数量控制延时；“,”数量控制停顿(如有需要)
        ;        “;”无意义，仅直观小节
        ;$cVal - 音调起步值(7比较准)
        ;$vD - 延时值(ms)
        Local $sYF = '262;294;330;349;392;440;494;' & _
                        '523;578;659;698;792;880;988;' & _
                        '1046;1175;1318;1397;1568;1760;1976'
        Local $aYF = StringSplit($sYF, ';', 2)

        Local $c = -1, $DelaySl, $i
        For $i = $cVal To UBound($aYF) - 1
                Assign('~' & $c, $aYF[$i])
                If $c < 1 Then
                        $c -= 1
                        If $c = -8 Then $c = 1
                Else
                        $c += 1
                EndIf
        Next

        Local $aSR = StringRegExp($sMusic, '-?\d\.*|,', 3)
        If @Error Then Return SetError (1)
        For $i = 0 To UBound($aSR) - 1
                $aSR[$i] = StringRegExpReplace($aSR[$i], ',', '')
                If Not @error And @extended Then
                        Sleep(@extended * $vD)
                        ContinueLoop
                EndIf
                $DelaySl = 0
                $aSR[$i] = StringRegExpReplace($aSR[$i], '\.', '')
                If Not @error And @extended Then
                        $DelaySl = @extended
                EndIf
                Beep(Eval('~' & $aSR[$i]), $vD + $DelaySl * $vD)
                Sleep(1)
        Next
EndFunc   ;==>_BeepMusic