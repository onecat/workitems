#Region ;**** ���������� ACNWrapper_GUI ****
#PRE_Icon=..\����\QQ\3D���ICOͼ��\IE.ico
#PRE_Outfile=C:\Users\chtyfox\Desktop\��Ŀ���� IE(��).exe
#PRE_UseUpx=n
#PRE_Res_Comment=IEƽ̨�Զ���¼
#PRE_Res_Description=IEƽ̨�Զ���¼
#PRE_Res_Fileversion=2.1.4.2
#PRE_Res_LegalCopyright=Сվ����
#PRE_Res_requestedExecutionLevel=None
#PRE_Res_Field=��Ʒ����|ƽ̨�Զ���¼
#EndRegion ;**** ���������� ACNWrapper_GUI ****

#include <IE.au3>
$oIE = _IECreate ("http://172.18.1.242/rdm/login")
 BlockInput(1);�������ͼ���������ֻ����IE��ҳ
$Ele = _IEGetObjById($oIE,"username")
_IEFormElementSetValue($Ele,"10111940")
$Ele1 = _IEGetObjById($oIE,"password")
_IEFormElementSetValue($Ele1,"000000")
 BlockInput(0)
$Ele = _IEGetObjByName($oIE,"login") ;ע����ͬname���,��Ҫ��������
_IEAction($Ele,"click") ;���
_IELoadWait ($oIE)

