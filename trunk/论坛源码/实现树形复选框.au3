#Region ACNԤ����������(���ò���)
#PRE_Icon= 										;ͼ��,֧��EXE,DLL,ICO
#PRE_OutFile=									;����ļ���
#PRE_OutFile_Type=exe							;�ļ�����
#PRE_Compression=4								;ѹ���ȼ�
#PRE_UseUpx=y 									;ʹ��ѹ��
#PRE_Res_Comment= 								;����ע��
#PRE_Res_Description=							;��ϸ��Ϣ
#PRE_Res_Fileversion=							;�ļ��汾
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
#include <GUIConstantsEx.au3>
#include <TreeViewConstants.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=stc2.kxf
$Form1 = GUICreate("STC Conformance Automation", 326, 406, 222, 124)
$MenuItem1 = GUICtrlCreateMenu("File")
$MenuItem2 = GUICtrlCreateMenu("Action")
$MenuItem3 = GUICtrlCreateMenu("About")
$Group1 = GUICtrlCreateGroup("Action", 16, 8, 297, 377)
$Button1 = GUICtrlCreateButton("ConfigureIUT", 112, 32, 81, 25)
$Button2 = GUICtrlCreateButton("Setup", 24, 32, 73, 25)
$Button3 = GUICtrlCreateButton("StartTest", 216, 32, 73, 25)
$Group2 = GUICtrlCreateGroup("Select Feature(s)", 24, 64, 273, 313)
$TreeView1 = GUICtrlCreateTreeView(40, 88, 241, 289, BitOR($GUI_SS_DEFAULT_TREEVIEW,$TVS_CHECKBOXES))
GUICtrlSetBkColor(-1, 0xFFFFFF)
$TreeView1_0 = GUICtrlCreateTreeViewItem("IP Multicast", $TreeView1)
$TreeView1_1 = GUICtrlCreateTreeViewItem("IGMPV2", $TreeView1_0)
$TreeView1_2 = GUICtrlCreateTreeViewItem("IGMPV3", $TreeView1_0)
$TreeView1_3 = GUICtrlCreateTreeViewItem("IGMPSNOOPING", $TreeView1_0)
$TreeView1_4 = GUICtrlCreateTreeViewItem("MLDSNOOPING", $TreeView1_0)
$TreeView1_5 = GUICtrlCreateTreeViewItem("MLDV2", $TreeView1_0)
$TreeView1_6 = GUICtrlCreateTreeViewItem("MLDV1", $TreeView1_0)
$TreeView1_7 = GUICtrlCreateTreeViewItem("MSDP", $TreeView1_0)
$TreeView1_8 = GUICtrlCreateTreeViewItem("PIM", $TreeView1_0)
$TreeView1_9 = GUICtrlCreateTreeViewItem("Broadband Access", $TreeView1)
$TreeView1_10 = GUICtrlCreateTreeViewItem("IPv4 and IPv6 Routing", $TreeView1)
$TreeView1_11 = GUICtrlCreateTreeViewItem("Bridging", $TreeView1)
$TreeView1_12 = GUICtrlCreateTreeViewItem("Data Center", $TreeView1)
$TreeView1_13 = GUICtrlCreateTreeViewItem("Metro and Copper Ethernet", $TreeView1)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
        $nMsg = GUIGetMsg()
        Switch $nMsg
                Case $GUI_EVENT_CLOSE
                        Exit

        EndSwitch
WEnd