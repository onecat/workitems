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
#AutoIt3Wrapper_Run_Debug_Mode=y                ;�������ģʽ
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

Dim $h=MsgBox(1, "��ע��", "ȷ��Ҫɾ��SVN��Ϣ,�Ƿ��ڸ��������б����򣬲��ǵ�ȡ�����븴�Ƴɸ�����������")
    if  $h<>1  Then
    Exit 0
EndIf

DirRemove(@ScriptDir & "\.svn",1)
DirRemove(@ScriptDir & "\Aut2Exe\.svn",1)
DirRemove(@ScriptDir & "\Aut2Exe\Icons\.svn",1)
DirRemove(@ScriptDir & "\AutoItX\.svn",1)
DirRemove(@ScriptDir & "\AutoItX\StandardDLL\.svn",1)
DirRemove(@ScriptDir & "\AutoItX\StandardDLL\DevC\.svn",1)
DirRemove(@ScriptDir & "\AutoItX\StandardDLL\VC6\.svn",1)
DirRemove(@ScriptDir & "\AutoItX\StandardDLL\VC6\Example\.svn",1)
DirRemove(@ScriptDir & "\AutoItX\StandardDLL\VC6\Example\bin\.svn",1)
DirRemove(@ScriptDir & "\AutoItX\ActiveX\.svn",1)
DirRemove(@ScriptDir & "\AutoItX\ActiveX\VBScript\.svn",1)
DirRemove(@ScriptDir & "\Examples\.svn",1)
DirRemove(@ScriptDir & "\Examples\ACN_BlockInputEx\.svn",1)
DirRemove(@ScriptDir & "\Examples\ACN_MSXML\.svn",1)
DirRemove(@ScriptDir & "\Examples\COM\.svn",1)
DirRemove(@ScriptDir & "\Examples\GUI\.svn",1)
DirRemove(@ScriptDir & "\Examples\GUI\Advanced\.svn",1)
DirRemove(@ScriptDir & "\Examples\GUI\Advanced\Images\.svn",1)
DirRemove(@ScriptDir & "\Examples\Helpfile\.svn",1)
DirRemove(@ScriptDir & "\Examples\WinAPIEx\.svn",1)
DirRemove(@ScriptDir & "\Examples\WinAPIEx\Extras\.svn",1)
DirRemove(@ScriptDir & "\Examples\WinINet\.svn",1)
DirRemove(@ScriptDir & "\Extras\.svn",1)
DirRemove(@ScriptDir & "\Extras\Au3Record\.svn",1)
DirRemove(@ScriptDir & "\Extras\AutoUpdateIt\.svn",1)
DirRemove(@ScriptDir & "\Extras\File2script\.svn",1)
DirRemove(@ScriptDir & "\Extras\OLEview\.svn",1)
DirRemove(@ScriptDir & "\Extras\OtherEXE\.svn",1)
DirRemove(@ScriptDir & "\Extras\Otherfile\.svn",1)
DirRemove(@ScriptDir & "\Extras\PCRE\.svn",1)
DirRemove(@ScriptDir & "\Extras\Spy++\.svn",1)
DirRemove(@ScriptDir & "\Extras\SQLite\.svn",1)
DirRemove(@ScriptDir & "\Include\.svn",1)
DirRemove(@ScriptDir & "\SciTe\.svn",1)
DirRemove(@ScriptDir & "\SciTe\ACNLua\.svn",1)
DirRemove(@ScriptDir & "\SciTe\ACNWrapper\.svn",1)
DirRemove(@ScriptDir & "\SciTe\api\.svn",1)
DirRemove(@ScriptDir & "\SciTe\api\batch\.svn",1)
DirRemove(@ScriptDir & "\SciTe\cSnippet\.svn",1)
DirRemove(@ScriptDir & "\SciTe\cSnippet\includes\.svn",1)
DirRemove(@ScriptDir & "\SciTe\cSnippet\Snips\.svn",1)
DirRemove(@ScriptDir & "\SciTe\css\.svn",1)
DirRemove(@ScriptDir & "\SciTe\FuncPopUp\.svn",1)
DirRemove(@ScriptDir & "\SciTe\Koda\.svn",1)
DirRemove(@ScriptDir & "\SciTe\Koda\Extras\.svn",1)
DirRemove(@ScriptDir & "\SciTe\Koda\Extras\Control Templates\.svn",1)
DirRemove(@ScriptDir & "\SciTe\Koda\Extras\Default Names Fix\.svn",1)
DirRemove(@ScriptDir & "\SciTe\Koda\Extras\Import\.svn",1)
DirRemove(@ScriptDir & "\SciTe\Koda\Language\.svn",1)
DirRemove(@ScriptDir & "\SciTe\Koda\Templates\.svn",1)
DirRemove(@ScriptDir & "\SciTe\Koda\Templates\���Լ���ģ��\.svn",1)
DirRemove(@ScriptDir & "\SciTe\Obfuscator\.svn",1)
DirRemove(@ScriptDir & "\SciTe\SciTEConfig\.svn",1)
DirRemove(@ScriptDir & "\SciTe\Tidy\.svn",1)
DirRemove(@ScriptDir & "\SciTe\UserHome\.svn",1)
DirRemove(@ScriptDir & "\SciTe\�����ļ�\.svn",1)
DirRemove(@ScriptDir & "\SciTe\�����ļ�2\.svn",1)
DirRemove(@ScriptDir & "\SciTe\�����ļ�2\LUA\.svn",1)
DirRemove(@ScriptDir & "\SciTe\�����ļ�2\OTHER\.svn",1)
DirRemove(@ScriptDir & "\SciTe\���˵��\.svn",1)
DirRemove(@ScriptDir & "\UserInclude\.svn",1)