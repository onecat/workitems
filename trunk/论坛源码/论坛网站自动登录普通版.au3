#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
        
        Au3 �汾: 3.3.6.1
        �ű�����: �L�ѡ��V�A��
        ��վ֧��: [url]http://www.autoitx.com/[/url]
          
        
        
#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
 
#NoTrayIcon
 
#Region
#AutoIt3Wrapper_OutFile=SwInst.exe
#AutoIt3Wrapper_UseX64=n
#AutoIt3Wrapper_Res_File_Add=Skin.skf
#AutoIt3Wrapper_Res_File_Add=SkinCrafterDll.dll
#EndRegion
 
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <GUIListBox.au3>
#include <StaticConstants.au3>
#include <TreeViewConstants.au3>
#include <WindowsConstants.au3>
#include <IE.au3>
#include <GuiTreeView.au3>
#Include <_StringEncryptX.au3>
#include <Array.au3>
 
Opt("MustDeclareVars", 1)
 
 
Global $g_SkinDll
Global Const $gc_FormName = "��̳��վ��½��"
Global Const $gc_IniFile = _
                @ScriptDir & "\IniFile.ini"
 
 
#Region
Global $gu_MainForm = _
                GUICreate($gc_FormName, 592, 420, -1, -1)
Global $gu_Group1 = _
                GUICtrlCreateGroup("", 8, 0, 577, 369)
Global $gu_TreeView1 = _
                GUICtrlCreateTreeView(16, 16, 177, 342, _
                BitOR($GUI_SS_DEFAULT_TREEVIEW, _  ;BitOR ��λ"��"����.
                $TVS_CHECKBOXES, $WS_BORDER))      ;BitOR ( ֵ1, ֵ2 [, ֵ n] );$TVS_CHECKBOXES ����������ͼ�ؼ��еļ���
                                                   ;$WS_BORDER ����һ��ϸ�߿�Ĵ���.
Global $gu_List1 = _
                GUICtrlCreateList("", 200, 16, 377, 342, _
                BitOR($LBS_NOTIFY, $WS_VSCROLL))
GUICtrlCreateGroup("", -99, -99, 1, 1)
Global $gu_Button1 = _
                GUICtrlCreateButton("����", 8, 376, 73, 33)
Global $gu_Button3 = _
                GUICtrlCreateButton("�Զ���½", 512, 376, 73, 33)
#EndRegion
HotKeySet("{ESC}", "Form1_1Close")
_Main()
Exit
 
Func _Main()
        Global  $s,$ds 
        Local $a_Nodes = _ReadwebsiteNodes($gc_IniFile)
        _CreateTreeviewNodes($a_Nodes)
        _DisplaywebsiteList($gu_List1, $a_Nodes) ;$gu_List1 = GUICtrlCreateList("", 200, 16, 377, 342, BitOR($LBS_NOTIFY, $WS_VSCROLL))
        
        GUISetState(@SW_SHOW)   ;GUISetState===>�������ڵ�״̬
                               ;@SW_SHOW==> ����ָ�����ڲ�ʹ���Ե�ǰ��С��λ����Ϣ��ʾ. 
        
        Local $nMsg
        While 1
                $nMsg = GUIGetMsg() ;���񴰿���Ϣ
                Switch $nMsg
                        Case $GUI_EVENT_CLOSE
                                Exit
;~                         
                        Case $gu_Button1
                                MsgBox(0 + 64, $gc_FormName, _                
                                                "�����������������Զ���½", _
                                                0, $gu_MainForm)
;~                         
                        Case $gu_Button3
                                                _Installlogins($a_Nodes, "Auto")
                EndSwitch
                _TreeViewControl($a_Nodes, $nMsg)
        WEnd
EndFunc   ;==>_Main
 
Func _ReadwebsiteNodes($IniFile)
        Local Const $N = 8
        Local $a_Nodes[1][$N], $p = 1          
        Local $SwDir = @ScriptDir & "\IniFile"
        Local $i = 1
                
        While 1
                Local $Allchoice
                                Local $ClsName = _
                                IniRead($IniFile, $i, $i & ".Name", "")   ;????
                If $ClsName = "" Then ExitLoop    ;        Then ExitLoop===>��ֹһ�� While/Do/For ѭ��.
                ReDim $a_Nodes[$p + 1][$N]   ;ReDim====>����һ���Ѿ����ڵ�����Ĵ�С
                $a_Nodes[$p][1] = "root"  
                                
                $a_Nodes[$p][2] = _      ;              Ĭ�Ϲ�ѡ�е����и���Ŀ (1/0),(��/��)
                                                                IniRead($IniFile, $i, $i & ".Rootchoice", "")   
                                If $a_Nodes[$p][2] = 0 Then $Allchoice =0 ;����һ�����Ŀ��ѡʱ��������Ŀ����Ŀ��ѡ
                                If $a_Nodes[$p][2] = 1 Then $Allchoice =1 ;����Ŀ��ѡʱ����Ŀȫѡ
 
                $a_Nodes[$p][3] = _       
                                IniRead($IniFile, $i, $i & ".Name", "")
                $a_Nodes[$p][4] = _         
                                $SwDir & "\" & _
                                IniRead($IniFile, $i, $i & ".Icon", "")
                $a_Nodes[$p][5] = _
                                IniRead($IniFile, $i, $i & ".Expand", "")
                $p += 1    ;$p=$p+1
                
                Local $j = 1
                While 1
                                            Local $i
                        Local $SwName = _
                                        IniRead($IniFile, $i, _
                                        $i & "-" & $j & ".Name", "")
                        If $SwName = "" Then ExitLoop
                        ReDim $a_Nodes[$p + 1][$N]
                        $a_Nodes[$p][1] = "sub"
                                                If $Allchoice =1 Then
                                                        $a_Nodes[$p][2] = 1
                                                        Else
                        $a_Nodes[$p][2] = _    ;����Ĭ�Ϲ�ѡ����������Ŀ (1/0),(��/��)
                                                                IniRead($IniFile, $i, _
                                        $i & "-" & $j &  ".subchoice", "")
                                                EndIf
;~                                      Next
                        $a_Nodes[$p][3] =  _
                                        IniRead($IniFile, $i, _          ;��ȡ�ı�����������
                                        $i & "-" & $j & ".Name", "")
                        $a_Nodes[$p][4] = $SwDir & "\" & _              ;�ļ���·����@ScriptDir�Ǻ���ر�д��������ܷ�������
                                        IniRead($IniFile, $i, _
                                        $i & "-" & $j & ".Icon", "")
                        $a_Nodes[$p][5] = $SwDir & "\" & _
                                        IniRead($IniFile, $i, _
                                        $i & "-" & $j & ".Usermame", "")
                        $a_Nodes[$p][6] = $SwDir & "\" & _
                                        IniRead($IniFile, $i, _
                                        $i & "-" & $j & ".Password", "")
                        $a_Nodes[$p][7] = $SwDir & "\" & _
                                        IniRead($IniFile, $i, _
                                        $i & "-" & $j & ".Http", "")
;~                                                         IniWrite(@ScriptDir & "\IniFile.ini", $i, $i & ".Rootchoice",'0')
;~                                                         IniWrite(@ScriptDir & "\IniFile.ini", $i,$i & "-" & $j & ".subchoice",'0')
 
                        $p += 1
                        $j += 1
                WEnd
                $i += 1
        WEnd
        $a_Nodes[0][0] = UBound($a_Nodes, 1) - 1
        Return $a_Nodes
EndFunc   ;==>_ReadwebsiteNodes
 
Func _CreateTreeviewNodes(ByRef $a_Nodes)        ;$a_Nodes = _ReadwebsiteNodes($gc_IniFile)
        _GUICtrlTreeView_BeginUpdate($gu_TreeView1) ;��ʼ�ؼ�����,ֱ�� EndUpdate ����������
        Local $i
        For $i = 1 To UBound($a_Nodes, 1) - 1
                Local $Root
                If $a_Nodes[$i][1] = "root" Then
                        $a_Nodes[$i][0] = _
                                        GUICtrlCreateTreeViewItem( _      ;��GUI�ϴ���һ�� TreeViewItem �ؼ�.
                                        $a_Nodes[$i][3], $gu_TreeView1)   ;GUICtrlCreateTreeViewItem ( "�ı�", �б���ͼID )
                        GUICtrlSetImage( _                                 ;����ָ���ؼ���λͼ��ͼ��   
                                        $a_Nodes[$i][0], $a_Nodes[$i][4])  ;GUICtrlSetImage ( �ؼ�ID, �ļ��� [, ͼ���� [, ͼ������]] )
                        $Root = $a_Nodes[$i][0]
                Else
                        $a_Nodes[$i][0] = _
                                        GUICtrlCreateTreeViewItem( _     ;��GUI�ϴ���һ�� TreeViewItem �ؼ�.
                                        $a_Nodes[$i][3], $Root)          ; GUICtrlCreateTreeViewItem ( "�ı�", �б���ͼID )
                        GUICtrlSetImage( _                               ;����ָ���ؼ���λͼ��ͼ��
                                        $a_Nodes[$i][0], $a_Nodes[$i][4]) ;GUICtrlSetImage ( �ؼ�ID, �ļ��� [, ͼ���� [, ͼ������]] )
                EndIf
        Next
        Local $i
        For $i = UBound($a_Nodes, 1) - 1 To 1 Step -1
                If $a_Nodes[$i][2] = 1 Then
                        _GUICtrlTreeView_SetChecked( _                ;������Ŀ��ѡ��ѡ��
                                        $gu_TreeView1, $a_Nodes[$i][0], True) ;_GUICtrlTreeView_SetChecked(�ؼ����, ��Ŀ��� [, չ�����۵���־])
                                                                        EndIf
                                                                        
                If $a_Nodes[$i][1] = "root" And _
                                $a_Nodes[$i][5] = 1 Then
                        _GUICtrlTreeView_Expand( _                     ;չ�����۵�����Ŀ��ص������б�
                                        $gu_TreeView1, $a_Nodes[$i][0], True)  ;_GUICtrlTreeView_Expand(�ؼ����[, ��Ŀ��� = 0[, չ�����۵���־]])
                EndIf
        Next
        _GUICtrlTreeView_EndUpdate($gu_TreeView1)
EndFunc   ;==>_CreateTreeviewNodes
 
Func _TreeViewControl(ByRef $a_Nodes, $iMsg)
        Local $i
        For $i = 1 To $a_Nodes[0][0]
                Switch $iMsg
                        Case $a_Nodes[$i][0]
                                If $a_Nodes[$i][1] = "root" Then
                                        If _GUICtrlTreeView_GetChecked( _                ;������Ŀ��ѡ��ѡ��
                                                        $gu_TreeView1, $a_Nodes[$i][0]) = True _  ;_GUICtrlTreeView_GetChecked($hWnd, $hItem)
                                                        And $a_Nodes[$i][2] = 0 Then
                                                $a_Nodes[$i][2] = 1
                                                Local $j
                                                For $j = $i + 1 To $a_Nodes[0][0]
                                                        If $a_Nodes[$j][1] = "sub" Then
                                                                _GUICtrlTreeView_SetChecked( _
                                                                                $gu_TreeView1, _
                                                                                $a_Nodes[$j][0], True)
                                                                $a_Nodes[$j][2] = 1
                                                        Else
                                                                ExitLoop
                                                        EndIf
                                                Next
                                                _DisplaywebsiteList($gu_List1, $a_Nodes)
                                        ElseIf _GUICtrlTreeView_GetChecked( _
                                                        $gu_TreeView1, $a_Nodes[$i][0]) = False _
                                                        And $a_Nodes[$i][2] = 1 Then
                                                $a_Nodes[$i][2] = 0
                                                Local $j
                                                For $j = $i + 1 To $a_Nodes[0][0]
                                                        If $a_Nodes[$j][1] = "sub" Then
                                                                _GUICtrlTreeView_SetChecked( _
                                                                                $gu_TreeView1, _
                                                                                $a_Nodes[$j][0], False)
                                                                $a_Nodes[$j][2] = 0
                                                        Else
                                                                ExitLoop
                                                        EndIf
                                                Next
                                                _DisplaywebsiteList($gu_List1, $a_Nodes)
                                        EndIf
                                ElseIf $a_Nodes[$i][1] = "sub" Then
                                        If _GUICtrlTreeView_GetChecked( _
                                                        $gu_TreeView1, $a_Nodes[$i][0]) = True _
                                                        And $a_Nodes[$i][2] = 0 Then
                                                $a_Nodes[$i][2] = 1
                                                _DisplaywebsiteList($gu_List1, $a_Nodes)
                                        ElseIf _GUICtrlTreeView_GetChecked( _
                                                        $gu_TreeView1, $a_Nodes[$i][0]) = False _
                                                        And $a_Nodes[$i][2] = 1 Then
                                                $a_Nodes[$i][2] = 0
                                                Local $RootHdl
                                                Local $flag = 0
                                                Local $j
                                                For $j = $i + 1 To $a_Nodes[0][0]
                                                        If $a_Nodes[$j][1] = "root" Then
                                                                ExitLoop
                                                        Else
                                                                If _GUICtrlTreeView_GetChecked( _
                                                                                $gu_TreeView1, _
                                                                                $a_Nodes[$j][0]) = True Then
                                                                        $flag = 1
                                                                        ExitLoop
                                                                EndIf
                                                        EndIf
                                                Next
                                                For $j = $i - 1 To 1 Step -1
                                                        If $a_Nodes[$j][1] = "root" Then
                                                                $RootHdl = $a_Nodes[$j][0]
                                                                ExitLoop
                                                        Else
                                                                If _GUICtrlTreeView_GetChecked( _
                                                                                $gu_TreeView1, _
                                                                                $a_Nodes[$j][0]) = True Then
                                                                        $flag = 1
                                                                        ExitLoop
                                                                EndIf
                                                        EndIf
                                                Next
                                                If $flag = 0 Then
                                                        _GUICtrlTreeView_SetChecked( _
                                                                        $gu_TreeView1, _
                                                                        $RootHdl, False)
                                                        $a_Nodes[$j][2] = 0
                                                EndIf
                                                _DisplaywebsiteList($gu_List1, $a_Nodes)
                                        EndIf
                                EndIf
                EndSwitch
        Next
EndFunc   ;==>_TreeViewControl
 
Func _DisplaywebsiteList($gu_List1, $a_Nodes)
 
        Local $s = ""
        Local $i, $p = 1
        For $i = 1 To UBound($a_Nodes, 1) - 1
                If $a_Nodes[$i][1] = "sub" And $a_Nodes[$i][2] = 1 Then
                        Local $Index
                        If $p < 10 Then
                                $Index = "0" & String($p)   ;����ĳ���ʽ���ַ������
                        Else
                                $Index = String($p)
                        EndIf
                        $s &= "[" & $Index & "] " & $a_Nodes[$i][3] & "|"
                        $p += 1
                EndIf
        Next
        $s = StringTrimRight($s, 1)
        GUICtrlSetData($gu_List1, "", "")
        GUICtrlSetData($gu_List1, $s)
EndFunc   ;==>_DisplaywebsiteList
Func _Installlogins($a_Nodes, $Mode)  ;Local $a_Nodes = _ReadwebsiteNodes($gc_IniFile)
        Local Const $N = 4                              ;ini�����ļ��������
        Local $a_SwList[1][$N], $p = 1
        Local $i
        For $i = 1 To UBound($a_Nodes, 1) - 1
                If $a_Nodes[$i][1] = "sub" And $a_Nodes[$i][2] = 1 Then
                        ReDim $a_SwList[$p + 1][$N]
                        $a_SwList[$p][0] = $a_Nodes[$i][3] ;Name
                        $a_SwList[$p][1] = $a_Nodes[$i][5] ;Usermame
                        $a_SwList[$p][2] = $a_Nodes[$i][6] ;Password
                        $a_SwList[$p][3] = $a_Nodes[$i][7] ;Http
                        $p += 1
                EndIf
        Next
        
        ;;_ArrayDisplay($a_SwList)
        If UBound($a_SwList, 1) - 1 = 0 Then
                MsgBox(0 + 64, $gc_FormName, _
                                "δѡ���κ���ĿŶ!", 0, $gu_MainForm)
                Return 0
        EndIf
        
        Local $httpname,$username,$http,$password, $usernamedecryption,$passworddecryption
        For $i = 1 To UBound($a_SwList, 1) - 1
                _DisplayloginProgress($a_SwList, $i) 
                                        $Mode = "Auto"
                                        $httpname=StringRegExpReplace($a_SwList[$i][0], '^.+\\', '')
                                        $username=StringRegExpReplace($a_SwList[$i][1], '^.+\\', '')
                                        $password=StringRegExpReplace($a_SwList[$i][2], '^.+\\', '')
                                        $http=StringRegExpReplace($a_SwList[$i][3], '^.+\\', '')
                                        $usernamedecryption=_StringEncryptX(0,$username,"XXXX",3) ;RC4 �ַ��������������°汾��
                                                                                $passworddecryption=_StringEncryptX(0,$password,"XXXX",3)  ;�����XXXX�ĳ��Լ��ļ�����Կ                                                                  
                                                                                
                                                                                ;�������°汾�ģ��Ѻ����滻����  StringEncrypt ������_StringEncryptX()
 
                   ;����ı��ύ��������Ҫ�Լ����ģ��кõ����ͳһ��һ�ַ�ʽ�ύ���Ľ�����
Global $oIE,$c,$YXMima,$oForm,$oQuery
$oIE = _IECreate ($http,0,1,1,0)
_IELoadWait($oIE)
_IEPropertySet ($oIE, "width", 800)
_IEPropertySet ($oIE, "height", 600)
Local $oInputs = _IETagNameGetCollection ($oIE, "INPUT")
Local $sHTML = _IEDocReadHTML($oIE)
Local $zc21,$zc22,$zc31,$zc41,$zc51,$da11,$da12,$z1,$z2
$zc21='userid'
$zc22='username'
$zc31='password'
$da11=StringInStr($sHTML,'<FORM')
$da12=StringInStr($sHTML,'<input')
$z1=StringInStr($sHTML,$zc21)
$z2=StringInStr($sHTML,$zc22)
 
 
Select 
        
Case $da12>0 And $z1>0 
$zc51="����վ�ҵ�һ��Դ��"
        msgbox(0 + 64," �L�ѡ��V�A�� ",$zc51,3)
For $oInput In $oInputs
if $oInput.name = $zc21 then
       $oInput.value=$usernamedecryption
EndIf
Next
For $oInput In $oInputs
if $oInput.name = $zc31 then
       $oInput.value=$passworddecryption
EndIf
Next
$oIE.document.getElementsByTagName('button').item(0).click
        
For $oInput In $oInputs
if $oInput.type = "submit" then
        _IEAction ($oInput, "click")
EndIf
Next
 
Case $da12>0 And $z2>0
        $zc51='����վ�ҵڶ���Դ��'
        msgbox(0 + 64,"�L�ѡ��V�A��",$zc51,3)
For $oInput In $oInputs
if $oInput.name = $zc22 then
       $oInput.value=$usernamedecryption
EndIf
Next
For $oInput In $oInputs
if $oInput.name = $zc31 then
       $oInput.value=$passworddecryption
EndIf
Next
$oIE.document.getElementsByTagName('button').item(0).click
For $oInput In $oInputs
if $oInput.type = "submit" then
        $oInput.value="��½"
       _IEAction ($oInput, "click")
EndIf
Next
 
Case $da12=0 And $z2>0
        $zc51='����վ�ҵ�����Դ��'
        msgbox(0 + 64," �L�ѡ��V�A�� ",$zc51,3)
        For $oInput In $oInputs
if $oInput.name = $zc22 then
       $oInput.value=$usernamedecryption
EndIf
Next
For $oInput In $oInputs
if $oInput.name = $zc31 then
       $oInput.value=$passworddecryption
EndIf
Next
 
For $oInput In $oInputs
if $oInput.type = "submit" then
        $oInput.value="��½"
        _IEAction ($oInput, "click")
EndIf
Next
 
 
Case Else
$zc51="��վ�Ѿ���½���߲�������"
        msgbox(0+64," �L�ѡ��V�A�� ",$zc51,3)
EndSelect
 
                Sleep(200)
                        Next
                        $s=StringReplace($s,"���ڵ�½... -->","��½��� ===>")
                        GUICtrlSetData($gu_List1, "", "")
        GUICtrlSetData($gu_List1, $s, $ds);�޸�ָ���ؼ������� ;GUICtrlSetData ( �ؼ�ID, ���� [, Ĭ��ֵ] )
        MsgBox(0 + 64, $gc_FormName, _
                        "��վ��½����!", 0, $gu_MainForm)
        Return 
EndFunc   ;==>_Installlogins
 
Func _DisplayloginProgress($a_SwList, $ii)   
 
         $s = ""
        Local $i, $p = 1
         $ds = ""
        For $i = 1 To UBound($a_SwList, 1) - 1
                Local $Index
                If $p < 10 Then
                        $Index = "0" & String($p)
                Else
                        $Index = String($p)
                EndIf
                If $i < $ii Then
                        $s &= "��½��� ===> " & _
                                        "[" & $Index & "] " & $a_SwList[$i][0] & "|"
                ElseIf $i = $ii Then
                        $ds = "���ڵ�½... --> " & _
                                        "[" & $Index & "] " & $a_SwList[$i][0]
                        $s &= "���ڵ�½... --> "  & _
                                        "[" & $Index & "] " & $a_SwList[$i][0] & "|"
                Else
                        $s &= "[" & $Index & "] " & $a_SwList[$i][0] & "|"
                                EndIf
                $p += 1
                        Next
        $s = StringTrimRight($s, 1)
GUICtrlSetData($gu_List1, "", "")
        GUICtrlSetData($gu_List1, $s, $ds);�޸�ָ���ؼ������� ;GUICtrlSetData ( �ؼ�ID, ���� [, Ĭ��ֵ] )
EndFunc   ;==>_DisplayloginProgress
 
Func Form1_1Close()
Exit 
EndFunc