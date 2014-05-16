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

;查询主流价格
MsgBox(0,"",SearchItemPrice("连衣裙"))
Func SearchItemPrice($word)
Local $aryv[2]
Local $gryup=AnsiURLEncode($word)
$res=InetGet("http://s.etao.com/search?q="&$gryup&"&sort=sale-desc",@ScriptDir&"\112233.txt",1+2+4+8+16)
InetClose($res)
Local $filenr=FileRead(@ScriptDir&"\112233.txt")
Local $seller=QUZJDX($filenr,'<div class="seller-name">','</div>')
Local $price=StringReplace(QUZJDX($filenr,'<li class="price">','</em>'),"<em>","")
$price223=StringRegExp($price,"(\d+\.\d{2})",3)
If UBound($price223)>0 Then $price=$price223[0]
If StringInStr($seller,'charset="gbk"')>0 Then
$aryv[0]="互联网"
Else
$aryv[0]=$seller
EndIf
If Not StringRegExp($price,"\d+\.\d{2}") Then
$aryv[0]="没有找到"
$aryv[1]="没有找到"
Else
$aryv[1]="￥"&$price
EndIf
If StringInStr($filenr,"抱歉， 没有找到")>0 Then
$aryv[0]="没有找到"
$aryv[1]="没有找到"
        EndIf
Return $aryv
EndFunc

;截取项目中间的字符串
Func QUZJDX($stringc,$sstring,$estring,$cs=1)
Local $start=StringInStr($stringc,$sstring,1,$cs)+StringLen($sstring)
Local $end=StringInStr($stringc,$estring,0,1,$start)
If $end-$start<=0 Then Return ""
Return StringStripWS(StringMid($stringc,$start,$end-$start),3)
EndFunc

;转换UTF编码
Func AnsiURLEncode($str, $falg = 0)
        ;可选参数$falg = 0，不转换字母及数字(默认)；$falg = 1，全部转换(字符头http://除外)
        Local $str_s = StringRegExpReplace($str, '^(http://).+', '$1')
        If @extended = 0 Then $str_s = ''
        If @extended > 0 Then $str = StringRegExpReplace($str, '^http://', '')
        Local $astr, $i, $s2d, $sS = StringSplit($str, '')
        For $i = 1 To UBound($sS) - 1
                If StringRegExp($sS[$i], '[^\x00-\xff]') Then
                        $s2d = StringToBinary($sS[$i] & ' ')
                        $astr &= '%' & StringMid($s2d, 3, 2) & '%' & StringMid($s2d, 5, 2)
                ElseIf StringRegExp($sS[$i], '[^\w]') Then
                        $s2d = StringToBinary($sS[$i])
                        $astr &= '%' & StringMid($s2d, 3, 2)
                Else
                        If $falg = 0 Then $astr &= $sS[$i]
                        If $falg <> 0 Then
                                $s2d = StringToBinary($sS[$i])
                                $astr &= '%' & StringMid($s2d, 3, 2)
                        EndIf
                EndIf
        Next
        $astr = StringReplace($astr, '%20', '+') ;转换空格的编码为'+'号，也可不要此行
        Return $str_s & $astr
EndFunc