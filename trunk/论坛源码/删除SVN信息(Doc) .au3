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
DirRemove(@ScriptDir & "\html\.svn",1)
DirRemove(@ScriptDir & "\html\acnfunctions\.svn",1)
DirRemove(@ScriptDir & "\html\appendix\.svn",1)
DirRemove(@ScriptDir & "\html\css\.svn",1)
DirRemove(@ScriptDir & "\html\examples\.svn",1)
DirRemove(@ScriptDir & "\html\functions\.svn",1)
DirRemove(@ScriptDir & "\html\guiref\.svn",1)
DirRemove(@ScriptDir & "\html\images\.svn",1)
DirRemove(@ScriptDir & "\html\intro\.svn",1)
DirRemove(@ScriptDir & "\html\keywords\.svn",1)
DirRemove(@ScriptDir & "\html\libfunctions\.svn",1)
DirRemove(@ScriptDir & "\html\macros\.svn",1)
DirRemove(@ScriptDir & "\html\tutorials\.svn",1)
DirRemove(@ScriptDir & "\html\tutorials\guimsgbox\.svn",1)
DirRemove(@ScriptDir & "\html\tutorials\helloworld\.svn",1)
DirRemove(@ScriptDir & "\html\tutorials\notepad\.svn",1)
DirRemove(@ScriptDir & "\html\tutorials\regexp\.svn",1)
DirRemove(@ScriptDir & "\html\tutorials\simplecalc-josbe\.svn",1)
DirRemove(@ScriptDir & "\html\tutorials\simplecalc-josbe\CSSAlternative\.svn",1)
DirRemove(@ScriptDir & "\html\tutorials\winzip\.svn",1)
DirRemove(@ScriptDir & "\MATH\.svn",1)
DirRemove(@ScriptDir & "\scite\.svn",1)
DirRemove(@ScriptDir & "\scite\AU3Record_doc_files\.svn",1)
DirRemove(@ScriptDir & "\scite\AutoItMacroGenerator\.svn",1)
DirRemove(@ScriptDir & "\scite\AutoItMacroGenerator\html\.svn",1)
DirRemove(@ScriptDir & "\scite\AutoItMacroGenerator\html\Images\.svn",1)
DirRemove(@ScriptDir & "\scite\css\.svn",1)
DirRemove(@ScriptDir & "\scite\FuncPopUp_instructions_files\.svn",1)
DirRemove(@ScriptDir & "\scite\images\.svn",1)
DirRemove(@ScriptDir & "\scite\Lua_Doc\.svn",1)
DirRemove(@ScriptDir & "\scite\Scite_instructions_files\.svn",1)
DirRemove(@ScriptDir & "\scite\SciTEConfig_doc_files\.svn",1)
DirRemove(@ScriptDir & "\scite\Scitedoc\.svn",1)
DirRemove(@ScriptDir & "\scite\tidy_doc_files\.svn",1)
DirRemove(@ScriptDir & "\scite_EN\.svn",1)
DirRemove(@ScriptDir & "\scite_EN\AU3Record_doc_files\.svn",1)
DirRemove(@ScriptDir & "\scite_EN\AutoItMacroGenerator\.svn",1)
DirRemove(@ScriptDir & "\scite_EN\AutoItMacroGenerator\html\.svn",1)
DirRemove(@ScriptDir & "\scite_EN\AutoItMacroGenerator\html\Images\.svn",1)
DirRemove(@ScriptDir & "\scite_EN\css\.svn",1)
DirRemove(@ScriptDir & "\scite_EN\FuncPopUp_instructions_files\.svn",1)
DirRemove(@ScriptDir & "\scite_EN\images\.svn",1)
DirRemove(@ScriptDir & "\scite_EN\Lua_Doc\.svn",1)
DirRemove(@ScriptDir & "\scite_EN\Scite_instructions_files\.svn",1)
DirRemove(@ScriptDir & "\scite_EN\SciTEConfig_doc_files\.svn",1)
DirRemove(@ScriptDir & "\scite_EN\Scitedoc\.svn",1)
DirRemove(@ScriptDir & "\scite_EN\tidy_doc_files\.svn",1)
DirRemove(@ScriptDir & "\txt2htm\.svn",1)
DirRemove(@ScriptDir & "\txt2htm\AcnExamples\.svn",1)
DirRemove(@ScriptDir & "\txt2htm\AcnLibFunctions\.svn",1)
DirRemove(@ScriptDir & "\txt2htm\ADF\.svn",1)
DirRemove(@ScriptDir & "\txt2htm\txtFunctions\.svn",1)
DirRemove(@ScriptDir & "\txt2htm\txtKeywords\.svn",1)
DirRemove(@ScriptDir & "\txt2htm\txtlibfunctions\.svn",1)
DirRemove(@ScriptDir & "\txt2htm\UnicodeExamples\.svn",1)
DirRemove(@ScriptDir & "\txt2htm\UnicodeLibExamples\.svn",1)
DirRemove(@ScriptDir & "\txt2htm\UnicodeLibExamples\Extras\.svn",1)
DirRemove(@ScriptDir & "\txt2htm_EN\.svn",1)
DirRemove(@ScriptDir & "\txt2htm_EN\examples\.svn",1)
DirRemove(@ScriptDir & "\txt2htm_EN\libExamples\.svn",1)
DirRemove(@ScriptDir & "\txt2htm_EN\txtFunctions\.svn",1)
DirRemove(@ScriptDir & "\txt2htm_EN\txtKeywords\.svn",1)
DirRemove(@ScriptDir & "\txt2htm_EN\txtlibfunctions\.svn",1)
