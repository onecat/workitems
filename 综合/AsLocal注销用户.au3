#Region ACN预处理程序参数(完整参数)
;** 注释行不需要您删除，这是一些描述信息，不会到最终的EXE中.
;===============================================================================================================
;** AUTOIT3 设置
#PRE_UseX64=                         ;(Y/N) 使用 X64 版本的 AutoIt3_x64/AUT2EXE_x64. 默认=N
#PRE_Run_Debug_Mode=                 ;(Y/N) 运行脚本于控制图调试. 默认=N
#PRE_Run_SciTE_Minimized=            ;(Y/N) 当脚本运行时最小化 SciTE 窗口. 默认=n
#PRE_Run_SciTE_OutputPane_Minimized= ;(Y/N) 运行时关闭 SciTE 输出窗口. 默认=n
;===============================================================================================================
;** AUT2EXE 设置
#PRE_Icon=                           ;需要使用的图标(路径)名称,支持EXE,DLL,ICO
#PRE_OutFile=                        ;目标 exe/a3x 文件名.
#PRE_OutFile_Type=exe                ;a3x=小型 AutoIt3 文件; exe=标准可执行文件(默认)
#PRE_Compression=                    ;压缩参数 0-4 ?=低 2=中 4=高 默认=2
#PRE_UseUpx=                         ;(Y/N) 压缩输出的程序.  默认=Y
#PRE_UPX_Parameters=                 ;覆盖默认UPX参数.
#PRE_Change2CUI=                     ;(Y/N) 修改输出的程序为CUI(控制台程序). 默认=N
;===============================================================================================================
;** 目标程序资源信息
#PRE_Res_Comment=                    ;注释
#PRE_Res_Description=                ;详细信息
#PRE_Res_Fileversion=                ;文件版本
#PRE_Res_FileVersion_AutoIncrement=  ;(Y/N/P)自动更新版本  . 默认=N P=提示
#PRE_Res_ProductVersion=             ;Product Version. Default is the AutoIt3 version used.
#PRE_Res_Language=                   ;资源语言代码. 官方默认 2057=英语 (英国),ACN版本默认 2052=简体中文(中国)
#PRE_Res_LegalCopyright=             ;版权
#PRE_res_requestedExecutionLevel=    ;None, asInvoker, highestAvailable or requireAdministrator   (默认=None)
#PRE_res_Compatibility=    		;Vista,Windows7 . Both alloweed seperated by a comma     (default=None)
#PRE_Res_SaveSource=                 ;(Y/N) 保持源代码备份到EXE资源中. 默认=N

#cs ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿

 Au3 版本: 
 脚本作者: 
 电子邮件: 
	QQ/TM: 
 脚本版本: 
 脚本功能: 

#ce ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿脚本开始＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿

ProcessClose ("NDSvr.exe") 
ProcessClose ("explorer.exe") 
Sleep(1000)
Run(@ComSpec & " /k explorer")
ProcessClose("cmd.exe")
