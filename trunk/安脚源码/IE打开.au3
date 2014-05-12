#Region ;**** 参数创建于 ACNWrapper_GUI ****
#PRE_Icon=..\工具\QQ\3D风格ICO图标\IE.ico
#PRE_Outfile=C:\Users\chtyfox\Desktop\项目管理 IE(李).exe
#PRE_UseUpx=n
#PRE_Res_Comment=IE平台自动登录
#PRE_Res_Description=IE平台自动登录
#PRE_Res_Fileversion=2.1.4.2
#PRE_Res_LegalCopyright=小站所有
#PRE_Res_requestedExecutionLevel=None
#PRE_Res_Field=产品名称|平台自动登录
#EndRegion ;**** 参数创建于 ACNWrapper_GUI ****

#include <IE.au3>
$oIE = _IECreate ("http://172.18.1.242/rdm/login")
 BlockInput(1);屏蔽鼠标和键盘用在这只限制IE网页
$Ele = _IEGetObjById($oIE,"username")
_IEFormElementSetValue($Ele,"10111940")
$Ele1 = _IEGetObjById($oIE,"password")
_IEFormElementSetValue($Ele1,"000000")
 BlockInput(0)
$Ele = _IEGetObjByName($oIE,"login") ;注意相同name情况,需要第三参数
_IEAction($Ele,"click") ;点击
_IELoadWait ($oIE)

