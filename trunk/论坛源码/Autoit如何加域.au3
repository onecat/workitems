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

#Region ;**** ���������� ACNWrapper_GUI ****
#AutoIt3Wrapper_icon=C:\WINDOWS\system32\shell32.dll|-3
#AutoIt3Wrapper_Res_Comment=�������Զ��޸ļ��������������
#AutoIt3Wrapper_Res_LegalCopyright=����
#AutoIt3Wrapper_Add_Constants=n
#EndRegion ;**** ���������� ACNWrapper_GUI ****
#include <GUIConstants.au3>
#include <GUIConstantsEx.au3>
#include <EditConstants.au3>
Opt("GUICoordMode",1)
Opt("TrayIconHide",1)
$gui=GUICreate("����-����",300,200,300,300)
$computer=GUICtrlCreateLabel("������:",20,20,50)
$computer_text=GUICtrlCreateInput("",75,20,200)
$user=GUICtrlCreateLabel("�û���:",20,50,50)
$user_text=GUICtrlCreateInput("shenzhen\test1",75,50,200)
$pwd=GUICtrlCreateLabel("����:",20,80,50)
$pwd_text=GUICtrlCreateInput("000000",75,80,200,"",$ES_PASSWORD)
$domain_name=GUICtrlCreateLabel("��:",20,110,50)
$domain_text=GUICtrlCreateInput("shenzhen.lh.com",75,110,200)
$ou=GUICtrlCreateLabel("OU:",20,140,50)
$ou_text=GUICtrlCreateInput("ou=computers,ou=sales,dc=shenzhen,dc=lh,dc=com",75,140,200)
$ok=GUICtrlCreateButton("ȷ  ��",80,175,80)
$cancel=GUICtrlCreateButton("ȡ  ��",195,175,80)
GUISetState(@SW_SHOW)
GUICtrlSetData($computer_text,getOldCName())
While 1
        Local $msg=GUIGetMsg()
        Local $result
        Select
                Case $msg=$ok
                        Local $computer_r=GUICtrlRead($computer_text)
                        Local $user_r=GUICtrlRead($user_text)
                        Local $password_r=GUICtrlRead($pwd_text)
                        Local $domain_r=GUICtrlRead($domain_text)
                        Local $ou_r=GUICtrlRead($ou_text)
                        WinSetState("����-����","",@SW_HIDE)
                        ProgressOn("����-����","����Ҫ�ļ��Ƿ����","","400","350",2)
                        If Not(FileExists(@SystemDir&"\dsquery.exe") And FileExists(@SystemDir&"\netdom.exe") And FileExists(@SystemDir&"\dsquery.dll")) Then
                                MsgBox(4096,"��ʾ","�븴��dsquery.exe��netdom.exe��dsquery.dll��system32�ļ���")
                                ProgressOff()
                                WinSetState("����-����","",@SW_SHOW)
                                ContinueLoop
                        EndIf
                        ProgressSet(10,"","����Ƿ���д����")
                        If $computer_r="" Or $user_r="" Or $password_r="" Or $domain_r="" Then
                                MsgBox(4096,"��ʾ","����д����!")
                                ProgressOff()
                                WinSetState("����-����","",@SW_SHOW)
                                ContinueLoop
                        EndIf
                        ProgressSet(20,"","����������Ƿ���Ϲ���")
            If Not nameIsRorE($computer_r) Then
                MsgBox(4096,"��ʾ","������������Ϲ���,ֻ������ĸ���ֺ����ַ����,���ܳ���15���ַ�,�Ҳ���ȫΪ����!")
                                ProgressOff()
                                WinSetState("����-����","",@SW_SHOW)                            
                ContinueLoop
                        EndIf
                        ProgressSet(30,"","���������������")
                        If Not Ping_domain($domain_r) Then
                                MsgBox(4096,"��ʾ","������ϵ����"&$domain_r&"������������!")
                                ProgressOff()
                                WinSetState("����-����","",@SW_SHOW)                            
                                ContinueLoop
                        EndIf
                        ProgressSet(40,"","����Ƿ��Ѿ���������")
                        If Not isGorD() Then
                                MsgBox(4096,"��ʾ","���Ѿ������Ա!")
                                ProgressOff()
                                WinSetState("����-����","",@SW_SHOW)                            
                                ContinueLoop
                        EndIf
                        ProgressSet(50,"","��֤�û����������Ƿ���ȷ")
                        If Not E_UandP($domain_r,$user_r,$password_r) Then
                                MsgBox(4096,"��ʾ","�û������������!")
                                ProgressOff()
                                WinSetState("����-����","",@SW_SHOW)                            
                                ContinueLoop
                        EndIf
                        ProgressSet(60,"","����������Ƿ��Ѿ�������ʹ��")
                        If userExists($computer_r,$domain_r,$user_r,$password_r) Then
                                MsgBox(4096,"��ʾ","�ü�������Ѿ�������ʹ��!")
                                ProgressOff()
                                WinSetState("����-����","",@SW_SHOW)                            
                                ContinueLoop
                        EndIf
                        ProgressSet(70,"","���ڼ�������")
                        If StringUpper($computer_r)==StringUpper(getOldCName()) Then
                                $alert=MsgBox(1,"��ʾ","��û���޸ļ������,ȷ���Ե�ǰ�����������������?")
                                If $alert>1 Then
                                    ProgressOff()
                                    WinSetState("����-����","",@SW_SHOW)                                                
                                        ContinueLoop
                                EndIf
                        Else
                                ProgressSet(80,"�����޸ļ������")
                                rename($computer_r)
                        EndIf
                        ProgressSet(90,"���ڼ�������")
                        $result=join($computer_r,$domain_r,$user_r,$password_r,$ou_r)
                        If $result=1 Then
                                ProgressSet(100,"","���")
                                Sleep(3000)
                                ProgressOff()
                                popup("����","����ɹ������������10�������",10)
                                Shutdown(6)
                        Else
                                ProgressOff()
                                WinSetState("����-����","",@SW_SHOW)
                                ContinueLoop
                        EndIf
                        Exit
                Case $msg=$cancel Or $msg=$GUI_EVENT_CLOSE
                        ExitLoop
        EndSelect
WEnd
Func Ping_domain($domain) ;�ж��ܷ����ӵ���
        If Ping($domain) Then
                Return True
        Else
                Return False
        EndIf
EndFunc
Func getOldCName();��ȡ�ɵĵ�������
        $obj=ObjCreate("WScript.Network")
        Return $obj.ComputerName
EndFunc
Func isGorD() ;�ж��Ƿ��Ѿ���������
        $strComputer = "." 
    $objWMIService = ObjGet("winmgmts:\\" & $strComputer & "\root\cimv2")
        $collitems=$objWMIService.ExecQuery("Select * From Win32_ComputerSystem")
        For $colitem In $collitems
                Local $rule=$colitem.DomainRole
                If $rule=0 Then
                        Return True
                Else
                        Return False
                EndIf
        Next
EndFunc
Func userExists($computer_name,$domainname,$username,$password) ;�ж������Ƿ��Ѿ�������ͬ�ĵ�����
        Local $path=@SystemDir&"\comp.txt"
    If FileExists($path) Then
           FileDelete($path)
   EndIf
    RunWait(@ComSpec&" /c dsquery computer -name "&$computer_name&" -d "&$domainname&" -u "&$username&" -p "&$password&" > "&$path,"",@SW_HIDE)
    If FileGetSize($path)>0 Then
           Return True
    Else
           Return False
    EndIf
EndFunc
Func rename($name) ;������������
         RegWrite("HKLM\system\currentcontrolset\control\computername\computername","computername","REG_SZ",$name)
     RegWrite("HKLM\system\currentcontrolset\control\computername\ActiveComputerName","computername","REG_SZ",$name)
     RegWrite("HKLM\system\currentcontrolset\services\tcpip\parameters","nv hostname","REG_SZ",$name)
     RegWrite("HKLM\system\currentcontrolset\services\tcpip\parameters","hostname","REG_SZ",$name)
 EndFunc
 Func join($computer_name,$domain,$user,$pwd,$ou) ;����
          Local $temp=@SystemDir&"\join.txt"
          Local $str
          Local $result
          If $ou="" Then
                  $str=" /c netdom join "&$computer_name&" /domain:"&$domain&" /userD:"&$user&" /passwordd:"&$pwd &" > "&$temp
          Else
                  $str=" /c netdom join "&$computer_name&" /domain:"&$domain&" /ou:"&$ou&" /userD:"&$user&" /passwordd:"&$pwd &" > "&$temp
          EndIf
          If MsgBox(1,"ȷ��","��ȷ�ϼ������� "&$domain &" ?")=1 Then
                  If FileExists($temp) Then
                          FileDelete($temp)
                  EndIf
                  RunWait(@ComSpec&$str,"",@SW_HIDE)
                  If FileExists($temp) Then
                          $str=FileReadLine($temp)
                          If StringLower($str)=="the command completed successfully." Then
                                  $result=1
                          Else
                                  $result=2
                                  MsgBox(4096,"��ʾ",$str)
                          EndIf
                  EndIf
          Else
                  $result=3
          EndIf
          Return $result
  EndFunc
  Func nameIsRorE($computername) ;�жϼ�������Ƿ���Ϲ���
          $result=StringRegExp($computername,'^[a-zA-Z0-9-]{1,15}$')
          $result1=StringRegExp($computername,'^\d{1,15}$')
          If $result==1 And $result1==0 Then
                  Return True
          Else
                  Return False
          EndIf
  EndFunc
  Func E_UandP($domain,$user,$pwd)  ;�ж��û����������Ƿ���ȷ
          Local $path=@SystemDir&"\net.txt"
          If FileExists($path) Then
                  FileDelete($path)
          EndIf
          RunWait(@ComSpec&' /c net use * /del /y',"",@SW_HIDE)
          RunWait(@ComSpec&" /c net use \\"& $domain & "\ipc$ /user:"&$user&" "&$pwd&" > " &$path,"",@SW_HIDE)
          If FileExists($path) Then
                  If FileGetSize($path)>0 Then
                          Return True
                  Else
                          Return False
                  EndIf
          EndIf
  EndFunc  
Func popup($title,$text,$second)
        Local $gui=GUICreate($title,240,60)
    GUISetState(@SW_SHOW)
    $tishi=GUICtrlCreateLabel("",10,20,200,15)
    While 1
            If $second>0 Then
           timespan($tishi,$text,$second)
                   ExitLoop
            EndIf
    WEnd
EndFunc
Func timespan($gui,$text,$time)
    While $time>0
            GUICtrlSetData($gui,$text&" "&$time)
                Sleep(1000)
                $time=$time-1
    WEnd
EndFunc