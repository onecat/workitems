#Region ;**** 参数创建于 ACNWrapper_GUI ****
#PRE_Icon=J:\UIDesigner2\UIDesigner.exe
#PRE_Outfile=C:\Users\chtyfox\Desktop\UIDesigner修改自动退出补丁.exe
#PRE_Compression=4
#PRE_UseUpx=n
#PRE_Res_Fileversion=1.0.0.0
#PRE_Res_Fileversion_AutoIncrement=p
#EndRegion ;**** 参数创建于 ACNWrapper_GUI ****
#Region ACN预处理程序参数(常用参数)
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
#include <EditConstants.au3>
$I1 =  StringReplace(RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\UIDesigner","DisplayIcon"), "UIDesigner.exe", "")
FileInstall("Config.config",$I1 & "resource\",1) 
;$2 = $I1 & "resource\"
;MsgBox(0,0,$2)

#cs  ;名字Config.config
<?xml version="1.0" encoding="utf-8" ?>
<configuration>
    <appSettings>
        <add key="WindowState" value="Maximized" />
        <add key="AdvanceToolPropertySort" value="Alphabetical" />
        <add key="ShowAdvanceTool" value="True" />
        <add key="ShowGrid" value="False" />
        <add key="CustomColorsList" value="" />
        <add key="PreviewKeyDownLargeChange" value="8" />
        <add key="LatestSolution" value="D:\UI设计工具测试\对外项目测试" />
        <add key="WindowTop" value="208" />
        <add key="WindowLeft" value="241" />
        <add key="WindowHeight" value="619" />
        <add key="WindowWidth" value="798" />
        <add key="PreviewShowDialogMode" value="True" />
        <add key="SolutionLoad" value="True" />
        <add key="DesignFormCanMoved" value="True" />
        <add key="ImageExportFileStyle" value="2" />
        <add key="ProjectInfoPanelVisible" value="True" />
        <add key="CurrentSkinName" value="DemoSkin" />
        <add key="CurrentTaskName" value="dd" />
        <add key="CurrentFileName" value="主界面" />
        <add key="WorkingFolder" value="M:\UIDtest" />
        <add key="AutoUpdate" value="True" />
        <add key="JoinUX" value="False" />
        <add key="UpdateEXE" value="Update.exe" />
        <add key="ShowGuidePage" value="True" />
        <add key="DesignerColor" value="79, 86, 92" />
        <add key="Online" value="False" />
        <add key="Dockconfig" value="\resource\UserDock.config" />
    </appSettings>
    <connectionStrings>
        <add name="PWServer" connectionString="http://www.tencent.com" />
        <add name="Server" connectionString="svn://111.16.103.2/document" />
    </connectionStrings>
</configuration>

#ce