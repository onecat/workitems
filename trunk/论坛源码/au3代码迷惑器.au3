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

#include <Array.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
 
Global $sTitle = 'au3�����Ի���'
Global $sObfuscator = StringRegExpReplace(@AutoItExe, '(.+\\).+', '$1') & 'SciTE\Obfuscator\Obfuscator.exe'
Global $hGui = GUICreate($sTitle, 640, 240)
GUICtrlCreateGroup('Դ�ļ�', 10, 10, 300, 110)
GUICtrlCreateLabel('�ļ���:', 20, 50, 70, 25)
$hSourceFilename = GUICtrlCreateLabel('', 90, 50, 200, 25)
GUICtrlCreateLabel('��:', 20, 70, 70, 25)
$hSourceLines = GUICtrlCreateLabel('0', 90, 70, 200, 25)
GUICtrlCreateLabel('�ļ���С:', 20, 90, 70, 25)
$hSourceFilesize = GUICtrlCreateLabel('0 �ֽ�', 90, 90, 200, 25)
GUICtrlCreateGroup('', -99, -99, 1, 1)
GUICtrlCreateGroup('Ŀ���ļ�', 330, 10, 300, 110)
GUICtrlCreateLabel('�ļ���:', 340, 50, 70, 25)
$hDestFilename = GUICtrlCreateLabel('', 410, 50, 200, 25)
GUICtrlCreateLabel('��:', 340, 70, 70, 25)
$hDestLines = GUICtrlCreateLabel('0', 410, 70, 200, 25)
GUICtrlCreateLabel('�ļ���С:', 340, 90, 70, 25)
$hDestFilesize = GUICtrlCreateLabel('0 �ֽ�', 410, 90, 200, 25)
GUICtrlCreateGroup('', -99, -99, 1, 1)
$hProgressPercent = GUICtrlCreateLabel('0%', 295, 130, 60, 18, $SS_CENTER)
$hProgress = GUICtrlCreateProgress(10, 150, 620, 16)
$hStatusLine = GUICtrlCreateLabel(' ѡ��ű� . . .', -2, 222, 644, 18, $SS_SUNKEN)
GUISetState()
 
$sScriptSource = FileOpenDialog('ѡ��ű�', @ScriptDir, 'AutoIt-Script (*.au3)', 3, '', $hGui)
If @error Then _End()
GUICtrlSetData($hSourceFilename, StringRegExpReplace($sScriptSource, '.+\\(.+)', '$1'))
$sSource = FileRead($sScriptSource)
GUICtrlSetData($hSourceFilesize, _StringAddThousandsSep(FileGetSize($sScriptSource), '.', ',') & '�ֽ�')
StringReplace($sSource, @CR, '')
GUICtrlSetData($hSourceLines, @extended)
 
$sSource = _FileReplaceWcharToBinary($sSource)
$sSource = StringReplace($sSource, '#AutoIt3Wrapper_Run_Obfuscator', '; #AutoIt3Wrapper_Run_Obfuscator')
$sSource = StringReplace($sSource, '#Obfuscator_Parameters', '; #Obfuscator_Parameters')
$sSource = StringRegExpReplace($sSource, '((\x22|\x27).*(\x22|\x27))|(;\V*)|(?s)((#cs|#comments-start).+?(#ce|#comments-end)\V*)', '$1')
$sSource = StringRegExpReplace($sSource, '(\r\n)\s+', '$1')
GUICtrlSetData($hStatusLine, ' �����Ļ�ϵͳ . . .')
$oDictVars = ObjCreate('Scripting.Dictionary')
If Not IsObj($oDictVars) Then _End('�޷�������һScripting.Dictionary!')
$oDictVars.CompareMode = 1
$oDictFuncs = ObjCreate('Scripting.Dictionary')
If Not IsObj($oDictFuncs) Then _End('�޷������ڶ�Scripting.Dictionary!')
$oDictFuncs.CompareMode = 1
$oDictHelpV = ObjCreate('Scripting.Dictionary')
If Not IsObj($oDictHelpV) Then _End('�޷���������Scripting.Dictionary!')
$oDictHelpV.CompareMode = 1
$oDictHelpF = ObjCreate('Scripting.Dictionary')
If Not IsObj($oDictHelpF) Then _End('�޷���������Scripting.Dictionary!')
$oDictHelpF.CompareMode = 1
_Exception($sSource)
 
GUICtrlSetData($hStatusLine, '   �����Ի���� . . .')
$sTmp = StringRegExpReplace($sSource, '(?:\x22|\x27)(.+?)(?:\x22|\x27)', '')
$aVars = StringRegExp($sTmp, '(?i)\$\w+', 3)
If IsArray($aVars) Then
        $aVars = _ArrayUnique($aVars)
        _ArraySort($aVars, 1)
        For $i = 1 To $aVars[0]
                If Not $oDictVars.Exists($aVars[$i]) Then $oDictVars.Add($aVars[$i], _RandomVar())
                $sSource = StringReplace($sSource, $aVars[$i], $oDictVars.Item($aVars[$i]))
                $iPercent = Int(50 / $aVars[0] * $i)
                GUICtrlSetData($hProgress, $iPercent)
                GUICtrlSetData($hProgressPercent, $iPercent & '%')
        Next
EndIf
GUICtrlSetData($hStatusLine, '   �����Ի���. . .')
 
$aFuncs = StringRegExp($sTmp, '(?i)Func (\w+)', 3)
If IsArray($aFuncs) Then
        $aFuncs = _ArrayUnique($aFuncs)
        _ArraySort($aFuncs, 1)
        For $i = 1 To $aFuncs[0]
                If Not $oDictFuncs.Exists($aFuncs[$i]) Then $oDictFuncs.Add($aFuncs[$i], _RandomFunc())
                $sSource = StringReplace($sSource, $aFuncs[$i], $oDictFuncs.Item($aFuncs[$i]))
                $iPercent = Int(50 / $aFuncs[0] * $i) + 50
                GUICtrlSetData($hProgress, $iPercent)
                GUICtrlSetData($hProgressPercent, $iPercent & '%')
        Next
EndIf
 
GUICtrlSetData($hProgress, 100)
GUICtrlSetData($hProgressPercent, '100%')
StringReplace($sSource, @CR, '')
GUICtrlSetData($hDestLines, @extended)
GUICtrlSetData($hStatusLine, '   �����Ի�ű�. . .')
 
$sDestFile = StringRegExpReplace($sScriptSource, '(.+)(\..+)', '$1_bak$2')
GUICtrlSetData($hDestFilename, StringRegExpReplace($sDestFile, '.+\\(.+)', '$1'))
$hFile = FileOpen($sDestFile, 2)
If $hFile <> -1 Then
        FileWrite($hFile, $sSource)
        FileClose($hFile)
EndIf
 
GUICtrlSetData($hDestFilesize, _StringAddThousandsSep(FileGetSize($sDestFile), '.', ',') & '�ֽ�')
GUICtrlSetData($hStatusLine, '    ����ԭʼ�Ի�.....���Ժ�!')
RunWait('"' & $sObfuscator & '" "' & $sDestFile & '" /cs 1 /cn 1 /cf 1 /cv 1', @ScriptDir, @SW_HIDE)
$sDestFile = StringRegExpReplace($sScriptSource, '(.+)(\..+)', '$1_bak_obfuscated$2')
GUICtrlSetData($hStatusLine, ' ����.')
 
Do
Until GUIGetMsg() = $GUI_EVENT_CLOSE
 
Func _End($msg = '')
        If $msg <> '' Then MsgBox(262144 + 16, '����', $msg)
        Exit
EndFunc   ;==>_End
 
Func _Exception($sScript)
        Local $aException
        $aException = StringRegExp($sScript, '(?i)IsDeclared\h*\((.*?)\)', 3)
        If IsArray($aException) Then
                For $i = 0 To UBound($aException) - 1
                        If StringLeft($aException[$i], 1) <> '$' Then $aException[$i] = Execute('"$" &' & $aException[$i])
                        $oDictVars.Add($aException[$i], $aException[$i])
                Next
        EndIf
        $aException = StringRegExp($sScript, '(?i)Assign\h*\((.*?),', 3)
        If IsArray($aException) Then
                For $i = 0 To UBound($aException) - 1
                        If StringLeft($aException[$i], 1) <> '$' Then $aException[$i] = Execute('"$" &' & $aException[$i])
                        $oDictVars.Add($aException[$i], $aException[$i])
                Next
        EndIf
        _GetIncludeConsts($oDictVars, StringRegExpReplace(@AutoItExe, '(.+\\).+', '$1') & 'Include')
EndFunc   ;==>_Exception
 
Func _RandomVar()
        Local $sVar
        Do
                $sVar = '$' & Chr(Random(65, 90, 1))
                For $i = 0 To 7
                        $sVar &= Chr(Random(48, 57, 1))
                Next
        Until Not $oDictHelpV.Exists($sVar)
        $oDictHelpV.Add($sVar, $sVar)
        Return $sVar
EndFunc   ;==>_RandomVar
 
Func _RandomFunc()
        Local $sFunc
        Do
                $sFunc = Chr(Random(65, 90, 1))
                For $i = 0 To 8
                        $sFunc &= Chr(Random(48, 57, 1))
                Next
        Until Not $oDictHelpF.Exists($sFunc)
        $oDictHelpF.Add($sFunc, $sFunc)
        Return $sFunc
EndFunc   ;==>_RandomFunc
 
Func _GetIncludeConsts(ByRef $oDict, $sPath)
        Local $aIncludeFiles, $sFile, $aConstants
        $aIncludeFiles = _MyFileListToArray($sPath, '*.au3')
        If Not IsArray($aIncludeFiles) Then _End('������û���ҵ����ļ�!')
        For $sInclude In $aIncludeFiles
                $sFile = FileRead($sPath & '\' & $sInclude)
                $aConstants = StringRegExp($sFile, '(?s)(?:Global|Global Const) (\$.+?)(?:\;|\,|\h)', 3)
                If IsArray($aConstants) Then
                        For $sConstant In $aConstants
                                If Not $oDict.Exists($sConstant) Then $oDict.Add($sConstant, $sConstant)
                        Next
                EndIf
        Next
EndFunc   ;==>_GetIncludeConsts
 
Func _MyFileListToArray($sPath, $sFilter)
        Local $sFileList = '', $hSearch, $sFile
        If StringRight($sPath, 1) <> '\' Then $sPath &= '\'
        $hSearch = FileFindFirstFile($sPath & $sFilter)
        If @error Then Return
        Do
                $sFile = FileFindNextFile($hSearch)
                If @extended Then ContinueLoop
                $sFileList &= $sFile & '|'
        Until @error
        FileClose($hSearch)
        If $sFileList = '' Then Return
        Return StringSplit(StringTrimRight($sFileList, 1), '|', 2)
EndFunc   ;==>_MyFileListToArray
 
Func _StringAddThousandsSep($sString, $sThousands = -1, $sDecimal = -1)
        Local $sResult = ""
        Local $rKey = "HKCU\Control Panel\International"
        If $sDecimal = -1 Then $sDecimal = RegRead($rKey, "sDecimal")
        If $sThousands = -1 Then $sThousands = RegRead($rKey, "sThousand")
        Local $aNumber = StringRegExp($sString, "(\D?\d+)\D?(\d*)", 1)
        If UBound($aNumber) = 2 Then
                Local $sLeft = $aNumber[0]
                While StringLen($sLeft)
                        $sResult = $sThousands & StringRight($sLeft, 3) & $sResult
                        $sLeft = StringTrimRight($sLeft, 3)
                WEnd
                $sResult = StringTrimLeft($sResult, StringLen($sThousands))
                If $aNumber[1] <> "" Then $sResult &= $sDecimal & $aNumber[1]
        EndIf
        Return $sResult
EndFunc   ;==>_StringAddThousandsSep
 
Func _FileReplaceWcharToBinary($sFile)
        Local $aSR = StringRegExp($sFile, '("|' & "')(?:(?!\1).)*?[^\x00-\xff](?:(?!\1).)*\1", 4)
        If @error Then Return SetError(1, 0, '')
        Local $i, $aTmp = 0, $_s = ''
        For $i = 0 To UBound($aSR) - 1
                $aTmp = $aSR[$i]
                $_s = StringTrimRight(StringTrimLeft($aTmp[0], 1), 1)
                $sFile = StringReplace($sFile, $aTmp[0], 'BinaryToString("' & StringToBinary($_s) & '")')
        Next
        Return $sFile
EndFunc   ;==>_FileReplaceWcharToBinary
