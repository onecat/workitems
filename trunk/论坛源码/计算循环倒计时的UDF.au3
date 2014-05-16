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

Local $ShiJianStart="";需要声明的三个变量
Local $ShiJian_ShengYu=""
Local $ShiJianPoint=""
DJS_time(0,0,0)
For $i=0 To 100000
Local $gg=DJS_time($i,100000)
ToolTip($gg)
Next

;计算数据处理所消耗时间倒计时,当前条数,最大条数,模式：=0 重头开始
Func DJS_time($tpoint,$maxp,$model=1)
        If $model=0 Then
                $ShiJianStart=""
                $ShiJian_ShengYu=""
                Return
                EndIf

If $ShiJianStart="" Then
        $ShiJianStart= TimerInit()
        $ShiJianPoint=$tpoint
EndIf


If Mod($tpoint-$ShiJianPoint,1)=0 And $ShiJianPoint<>$tpoint Then
Local $ggec = TimerDiff($ShiJianStart)
Local $everytimem=$ggec/($tpoint-$ShiJianPoint);计算每个数据耗时平均值
Local $ShiJian_ShengYu_HM=$everytimem*($maxp-$tpoint)
Local $hour_xs=1000*60*60
Local $min_xs=1000*60
Local $sec_xs=1000

Local $hour_1=Int($ShiJian_ShengYu_HM/$hour_xs)
Local $shengyu_1=""
If $hour_1>=1 Then
        $shengyu_1=$ShiJian_ShengYu_HM-$hour_1*$hour_xs
Else
        $shengyu_1=$ShiJian_ShengYu_HM
        EndIf

Local $min_1=Int($shengyu_1/$min_xs)
If $min_1>=1 Then
        $shengyu_2=$shengyu_1-$min_1*$min_xs
Else
        $shengyu_2=$shengyu_1
        EndIf

Local $sec=Int($shengyu_2/$sec_xs)

If StringLen($hour_1)<2 Then $hour_1="0"&$hour_1
If StringLen($min_1)<2 Then $min_1="0"&$min_1
If StringLen($sec)<2 Then $sec="0"&$sec

 $ShiJian_ShengYu= $hour_1&":"&$min_1&":"&$sec
EndIf
Return  $ShiJian_ShengYu
EndFunc