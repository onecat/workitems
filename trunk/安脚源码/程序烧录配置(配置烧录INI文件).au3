#Region ACNԤ����������(���ò���)
#PRE_Icon= 										;ͼ��,֧��EXE,DLL,ICO
#PRE_OutFile=									;����ļ���
#PRE_OutFile_Type=exe							;�ļ�����
#PRE_Compression=4								;ѹ���ȼ�
#PRE_UseUpx=y 									;ʹ��ѹ��
#PRE_Res_Comment= 								;����ע��
#PRE_Res_Description=							;��ϸ��Ϣ
#PRE_Res_Fileversion=1.0.0.1
#PRE_Res_FileVersion_AutoIncrement=p			;�Զ����°汾
#PRE_Res_LegalCopyright= 						;��Ȩ
#PRE_Change2CUI=N                   			;�޸�����ĳ���ΪCUI(����̨����)
;#PRE_Res_Field=AutoIt Version|%AutoItVer%		;�Զ�����Դ��
;#PRE_Run_Tidy=                   				;�ű�����
;#PRE_Run_Obfuscator=      						;�����Ի�
;#PRE_Run_AU3Check= 							;�﷨���
;#PRE_Run_Before= 								;����ǰ
;#PRE_Run_After=								;���к�
;#PRE_UseX64=n									;ʹ��64λ������
;#PRE_Compile_Both								;����˫ƽ̨����
#EndRegion ACNԤ�����������������
#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�

 Au3 �汾: 
 �ű�����: 
 �����ʼ�: 
	QQ/TM: 
 �ű��汾: 
 �ű�����: 

#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <GuiIPAddress.au3>
#include <ComboConstants.au3>
#Region ### START Koda GUI section ### Form=c:\users\chtyfox\desktop\form1.kxf
Local $MyDocsFolder = "::{450D8FBA-AD25-11D0-98A8-0800361B1103}"
Global Const $NetworkAdapterInfo = _NetworkAdapterInfo()
$path = FileSelectFolder("ѡ����¼�����ļ���", "", 2)
If @error = 1 Then Exit
$Form1_1 = GUICreate("������¼����", 497, 416, 192, 124)
$Label1 = GUICtrlCreateLabel("kernel", 16, 28, 35, 17)
$Input1 = GUICtrlCreateInput("", 56, 24, 281, 21)
$Label2 = GUICtrlCreateLabel("rootfs", 16, 60, 35, 17)
$Input2 = GUICtrlCreateInput("", 56, 56, 281, 21)
$Label3 = GUICtrlCreateLabel("app", 16, 92, 22, 17)
$Input3 = GUICtrlCreateInput("", 56, 88, 281, 21)
$Label4 = GUICtrlCreateLabel("www", 16, 124, 28, 17)
$Input4 = GUICtrlCreateInput("", 56, 120, 281, 21)
$Label5 = GUICtrlCreateLabel("uboot", 16, 156, 31, 17)
$Input5 = GUICtrlCreateInput("", 56, 152, 281, 21)
$Label6 = GUICtrlCreateLabel("logo", 16, 188, 24, 17)
$Input6 = GUICtrlCreateInput("", 56, 184, 281, 21)
$Label7 = GUICtrlCreateLabel("serverip ", 32, 227, 44, 17)
$IPAddress1 = _GUICtrlIpAddress_Create($Form1_1, 88, 224, 234, 21) ;_GUICtrlIpAddress_Set($IPAddress1, "")
$Label8 = GUICtrlCreateLabel("netmask", 32, 267, 44, 17)
$IPAddress2 = _GUICtrlIpAddress_Create($Form1_1, 88, 264, 234, 21)
$Label9 = GUICtrlCreateLabel("gatewayip",  32, 307, 52, 17)
$IPAddress3 = _GUICtrlIpAddress_Create($Form1_1, 88, 304, 234, 21)
$Label10 = GUICtrlCreateLabel("ipaddr", 32, 347, 33, 17)
$IPAddress4 = _GUICtrlIpAddress_Create($Form1_1, 88, 344, 234, 21)
$Label11 = GUICtrlCreateLabel("ѡ����¼����", 8, 387, 76, 17)
$Combo1 = GUICtrlCreateCombo("", 88, 383, 233, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))
$Button1 = GUICtrlCreateButton("�Զ���ȡ", 344, 22, 73, 25)
$Button2 = GUICtrlCreateButton("�Զ���ȡ", 344, 54, 73, 25)
$Button3 = GUICtrlCreateButton("�Զ���ȡ", 344, 86, 73, 25)
$Button4 = GUICtrlCreateButton("�Զ���ȡ", 344, 118, 73, 25)
$Button5 = GUICtrlCreateButton("�Զ���ȡ", 344, 150, 73, 25)
$Button6 = GUICtrlCreateButton("�Զ���ȡ", 344, 182, 73, 25)
$Button7 = GUICtrlCreateButton("�ֶ���ȡ", 424, 22, 65, 25)
$Button8 = GUICtrlCreateButton("�ֶ���ȡ", 424, 54, 65, 25)
$Button9 = GUICtrlCreateButton("�ֶ���ȡ", 424, 86, 65, 25)
$Button10 = GUICtrlCreateButton("�ֶ���ȡ", 424, 118, 65, 25)
$Button11 = GUICtrlCreateButton("�ֶ���ȡ", 424, 150, 65, 25)
$Button12 = GUICtrlCreateButton("�ֶ���ȡ", 424, 182, 65, 25)
$Button13 = GUICtrlCreateButton("һ����ȡ��¼�ļ�", 352, 214, 121, 33)
$Button14 = GUICtrlCreateButton("�����¼�ļ�", 352, 254, 121, 33)
$Button15 = GUICtrlCreateButton("���IP", 352, 294, 121, 33)
$Button16 = GUICtrlCreateButton("ȷ��", 352, 334, 121, 33,$WS_GROUP)
GUICtrlSetState(-1, $GUI_DEFBUTTON)
$Button17 = GUICtrlCreateButton("�˳�", 352, 374, 121, 33)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

For $i=1 To $NetworkAdapterInfo[0][0]
        GUICtrlSetData($Combo1,$NetworkAdapterInfo[$i][2],$NetworkAdapterInfo[$i][2])
If $NetworkAdapterInfo[$i][0] = 0 Then
        GUICtrlSetData($Combo1,"û���ҵ����õ�������Ϣ^_^")
Else
		_GUICtrlIpAddress_Set($IPAddress1,$NetworkAdapterInfo[$i][5])
		_GUICtrlIpAddress_Set($IPAddress2,$NetworkAdapterInfo[$i][7])
		_GUICtrlIpAddress_Set($IPAddress3,$NetworkAdapterInfo[$i][6])
EndIf
Next

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Combo1
			$ipset = GUICtrlRead($Combo1)
          For $i=1 To $NetworkAdapterInfo[0][0]
               If $NetworkAdapterInfo[$i][2] = $ipset Then
                    _GUICtrlIpAddress_Set($IPAddress1,$NetworkAdapterInfo[$i][5])
					_GUICtrlIpAddress_Set($IPAddress2,$NetworkAdapterInfo[$i][7])
					_GUICtrlIpAddress_Set($IPAddress3,$NetworkAdapterInfo[$i][6])
				EndIf
			Next	
		Case $Button1	
			$kernel = FindAllFile($path,"kernel",1)
			GUICtrlSetData($Input1,$kernel)
		Case $Button2
			$rootfs = FindAllFile($path,"rootfs",2)
			GUICtrlSetData($Input2,$rootfs)
		Case $Button3
			$app = FindAllFile($path,"app",3)
			GUICtrlSetData($Input3,$app)
		Case $Button4
			$www = FindAllFile($path,"www",4)
			GUICtrlSetData($Input4,$www)
		Case $Button5
			$uboot = FindAllFile($path,"uboot",5)
			GUICtrlSetData($Input5,$uboot)
		Case $Button6
			$logo = FindAllFile($path,"logo",6)
			GUICtrlSetData($Input6,$logo)
		Case $Button7
			$LJ = FileSaveDialog( "����һ����¼��������.", $MyDocsFolder, "��¼�������� (*.*)", 2)
			$kernel = StringTrimLeft($LJ,SDHC($path)+1)
			GUICtrlSetData($Input1,$kernel)
		Case $Button8
			$LJ = FileSaveDialog( "����һ����¼��������.", $MyDocsFolder, "��¼�������� (*.*)", 2)
			$rootfs = StringTrimLeft($LJ,SDHC($path)+1)
			GUICtrlSetData($Input2,$rootfs)
		Case $Button9
			$LJ = FileSaveDialog( "����һ����¼��������.", $MyDocsFolder, "��¼�������� (*.*)", 2)
			$app = StringTrimLeft($LJ,SDHC($path)+1)
			GUICtrlSetData($Input3,$app)
		Case $Button10
			$LJ = FileSaveDialog( "����һ����¼��������.", $MyDocsFolder, "��¼�������� (*.*)", 2)
			$www = StringTrimLeft($LJ,SDHC($path)+1)
			GUICtrlSetData($Input4,$www)
		Case $Button11
			$LJ = FileSaveDialog( "����һ����¼��������.", $MyDocsFolder, "��¼�������� (*.*)", 2)
			$uboot = StringTrimLeft($LJ,SDHC($path)+1)
			GUICtrlSetData($Input5,$uboot)
		Case $Button12
			$LJ = FileSaveDialog( "����һ����¼��������.", $MyDocsFolder, "��¼�������� (*.*)", 2)
			$logo = StringTrimLeft($LJ,SDHC($path)+1)
			GUICtrlSetData($Input6,$logo)
		Case $Button13
			yjhq()
		Case $Button14
			QLSLWJ()
		Case $Button15
			QLIP()
		Case $Button16
			 XPZWJ()
			 Exit
		Case $Button17
		     Exit
	EndSwitch
WEnd

Func XPZWJ()
	IniWrite($path & "\��¼�����ļ�.ini", "��¼", "kernel" , " " & GUICtrlRead($Input1))
	IniWrite($path & "\��¼�����ļ�.ini", "��¼", "rootfs" , " " & GUICtrlRead($Input2))
	IniWrite($path & "\��¼�����ļ�.ini", "��¼", "app" , " " & GUICtrlRead($Input3))
	IniWrite($path & "\��¼�����ļ�.ini", "��¼", "www" , " " & GUICtrlRead($Input4))
	IniWrite($path & "\��¼�����ļ�.ini", "��¼", "uboot" , " " & GUICtrlRead($Input5))
	IniWrite($path & "\��¼�����ļ�.ini", "��¼", "logo" , " " & GUICtrlRead($Input6))
	IniWrite($path & "\��¼�����ļ�.ini", "��¼", "serverip" , " " & _GUICtrlIpAddress_Get($IPAddress1))
	IniWrite($path & "\��¼�����ļ�.ini", "��¼", "netmask" , " " & _GUICtrlIpAddress_Get($IPAddress2))
	IniWrite($path & "\��¼�����ļ�.ini", "��¼", "gatewayip" , " " & _GUICtrlIpAddress_Get($IPAddress3))
	IniWrite($path & "\��¼�����ļ�.ini", "��¼", "ipaddr" , " " & _GUICtrlIpAddress_Get($IPAddress4))
EndFunc

Func QLIP()
	_GUICtrlIpAddress_ClearAddress($IPAddress1)
	_GUICtrlIpAddress_ClearAddress($IPAddress2)
	_GUICtrlIpAddress_ClearAddress($IPAddress3)
	_GUICtrlIpAddress_ClearAddress($IPAddress4)
EndFunc

Func QLSLWJ()
	GUICtrlSetData($Input1,"")
	GUICtrlSetData($Input2,"")
	GUICtrlSetData($Input3,"")
	GUICtrlSetData($Input4,"")
	GUICtrlSetData($Input5,"")
	GUICtrlSetData($Input6,"")
EndFunc

Func SDHC($sdDir)
	$LJJG = StringLen($sdDir)
	Return $LJJG
EndFunc	

Func FindAllFile($sDir,$JG,$SZ);�����ļ������������ļ�
Local $hSearch = FileFindFirstFile($sDir & "\*.*")
; ��������Ƿ�ɹ�
If $hSearch = -1 Then
    MsgBox(4096, "����", "û���ļ�/Ŀ¼ ƥ������")
    Exit
EndIf

While 1
    Local $H, $sFile = FileFindNextFile($hSearch)
    If @error Then ExitLoop
	If $SZ = 1 Then
		$H = StringLeft($sFile,StringLen($JG))	
		If $H = $JG then
			Return $sFile
		EndIf
	ElseIf 	 $SZ = 2 Then	
		$H = StringLeft($sFile,StringLen($JG))	
		If $H = $JG then
			Return $sFile
		EndIf
	ElseIf 	 $SZ = 3 Then	
		$H = StringLeft($sFile,StringLen($JG))	
		If $H = $JG then
			Return $sFile
		EndIf
	ElseIf 	 $SZ = 4 Then	
		$H = StringLeft($sFile,StringLen($JG))	
		If $H = $JG then
			Return $sFile
		EndIf
	ElseIf 	 $SZ = 5 Then	
		$H = StringLeft($sFile,StringLen($JG))	
		If $H = $JG then
			Return $sFile
		EndIf
    ElseIf 	 $SZ = 6 Then	
		$H = StringLeft($sFile,StringLen($JG))	
		If $H = $JG then
			Return $sFile
		EndIf		
	EndIf	
WEnd
EndFunc

Func _NetworkAdapterInfo();��ȡ����IP��ַ
    Local $colItem
    Local $objItem
    Local $colItems 
    Local $objItems
    Local $objWMIService 
    Local $Adapters[1][12]
    $Adapters[0][0] = 0
    $objWMIService = ObjGet("winmgmts:\\localhost\root\CIMV2")
    $colItem  = $objWMIService.ExecQuery("Select * FROM Win32_NetworkAdapter Where NetConnectionStatus >0", "WQL", 0x30)
    If IsObj($colItem) Then
        For $objItem In $colItem
            If $objItem.MACAddress = "00:00:00:00:00:00" Then ContinueLoop
            $Adapters[0][0] += 1
            ReDim $Adapters[UBound($Adapters) + 1][12]
            $Adapters[$Adapters[0][0]][0] += $Adapters[0][0]
            $Adapters[$Adapters[0][0]][1] = $objItem.NetConnectionStatus
            $Adapters[$Adapters[0][0]][2] = $objItem.Description
            $Adapters[$Adapters[0][0]][3] = $objItem.NetConnectionID
            $Adapters[$Adapters[0][0]][4] = $objItem.MACAddress 
                        $Adapters[$Adapters[0][0]][11] = $objItem.PNPDeviceID 
            $colItems  = $objWMIService.ExecQuery('Select * FROM Win32_NetworkAdapterConfiguration Where MACAddress = "'&$Adapters[$Adapters[0][0]][4]&'" And IPEnabled = True ' , "WQL", 0x30)                     
            If IsObj($colItems) Then
                For $objItems In $colItems
                    $Adapters[$Adapters[0][0]][5] = $objItems.IPAddress(0)
                    $Adapters[$Adapters[0][0]][6] = $objItems.DefaultIPGateway(0)
                    $Adapters[$Adapters[0][0]][7] = $objItems.IPSubnet(0)
                    $Adapters[$Adapters[0][0]][8] = $objItems.DNSServerSearchOrder(0)
                    $Adapters[$Adapters[0][0]][9] = $objItems.DNSServerSearchOrder(1)
                    $Adapters[$Adapters[0][0]][10] = $objItems.SettingID
                Next    
            EndIf
        Next
    EndIf
Return $Adapters
EndFunc

Func yjhq()
		$kernel = FindAllFile($path,"kernel",1)
		GUICtrlSetData($Input1,$kernel)
		$rootfs = FindAllFile($path,"rootfs",2)
		GUICtrlSetData($Input2,$rootfs)
		$app = FindAllFile($path,"app",3)
		GUICtrlSetData($Input3,$app)
		$www = FindAllFile($path,"www",4)
		GUICtrlSetData($Input4,$www)
		$uboot = FindAllFile($path,"uboot",5)
		GUICtrlSetData($Input5,$uboot)
		$logo = FindAllFile($path,"logo",6)
		GUICtrlSetData($Input6,$logo)
EndFunc	