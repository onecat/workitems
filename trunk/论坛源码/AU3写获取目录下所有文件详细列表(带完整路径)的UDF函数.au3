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

;~ #Include <WinAPIEx.au3>
;~ $1= _WinAPI_GetFileTitle ( @ScriptDir )
;~ MsgBox(1,"1",$1)
#include <File.au3>
#include <Array.au3>
Dim $Dir
; ***********************************************************
; *获取目录下文件详细文件(带完整路径名的)的函数，包括子目录的文件
; *输入为带完整路径的目录名
; *输出为一个数组，$List[0]=目录内文件总数，$List[1...N]为带完整路径的
; *文件列表。
; ************************************************************
$testdir=@ScriptDir
$testlist=FileListToArray($testdir)
If IsArray($testlist) Then
For $i=1 To UBound($testlist)-1
MsgBox(0,"文件列表",$testlist[$i],1)
Next    
EndIf
Func FileListToArray($Dir)
    Dim $FilePath,$FilesList,$List[1]=[0],$Files,$i
    $FilesList=_FileListToArray($Dir)
    If (Not IsArray($FilesList)) and (@Error=1) Then
          MsgBox (0,"","No Files\Folders Found.")
          Return
    EndIf
    $Files=_FileListToArray($Dir,"*",1)
    If IsArray($Files) Then
          For $i=1 To $Files[0]
                $FilePath=$Dir&"\"&$Files[$i]
                ReDim $List[UBound($List)+1]
                $List[0]=$List[0]+1
                $List[UBound($List)-1]=$FilePath
          Next
    EndIf
    $SubDir=_FileListToArray($Dir,"*",2)
    If IsArray($SubDir) Then
          For $i=1 To $SubDir[0]
                $FullPath=$Dir&"\"&$SubDir[$i]
                $tempList=FileListToArray($FullPath)
                For $i=1 To $tempList[0]
                      ReDim $List[UBound($List)+1]
                      $List[0]=$List[0]+1
                      $List[UBound($List)-1]=$tempList[$i]
                Next  
          Next
    EndIf
    Return $List
EndFunc