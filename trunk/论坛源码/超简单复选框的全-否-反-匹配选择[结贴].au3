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

#include <GUIConstantsEx.au3>
Dim $aCheckbox[11], $state = True
GUICreate('124')
For $i = 1 To 10
  $aCheckbox[$i] = GUICtrlCreateCheckbox($i, 10, 10 + $i * 20, 30, 20)
Next
$ok = GUICtrlCreateButton('ȫѡ', 40, 30, 70, 20)
$no = GUICtrlCreateButton('ȫ��', 40, 60, 70, 20)
$op = GUICtrlCreateButton('��ѡ', 40, 90, 70, 20)
$onekey = GUICtrlCreateButton('ȫѡ', 40, 120, 70, 20)
$include = GUICtrlCreateButton('ѡȡ����1��', 40, 150, 70, 20)
GUISetState()
While 1
  $msg = GUIGetMsg()
  Switch $msg
    Case $no
      For $i = 1 To 10
        GUICtrlSetState($aCheckbox[$i], $gui_unchecked)
      Next
      GUICtrlSetData($onekey, 'ȫѡ')
    Case $ok
      For $i = 1 To 10
        GUICtrlSetState($aCheckbox[$i], $gui_checked)
      Next
      GUICtrlSetData($onekey, 'ȫ��')
    Case $op
      For $i = 1 To 10
        GUICtrlSetState($aCheckbox[$i], BitAND(BitOR($gui_checked, $gui_unchecked), BitNOT(GUICtrlRead($aCheckbox[$i]))))
        $state = BitAND(GUICtrlRead($aCheckbox[$i]), $state)
      Next
      GUICtrlSetData($onekey, StringMid('ȫѡȫ��', 2 * $state + 1, $state + 2))
      $state = True
    Case $onekey
      For $i = 1 To 10
        GUICtrlSetState($aCheckbox[$i], Bitand(BitOR($gui_checked, $gui_unchecked), BitNot(StringInStr(GUICtrlRead($onekey), 'ȫ��'))))
      Next
      GUICtrlSetData($onekey, StringMid('ȫѡȫ��', 2 * StringInStr(GUICtrlRead($onekey), 'ȫѡ') + 1, StringInStr(GUICtrlRead($onekey), 'ȫѡ') + 2))
    Case $include
      For $i = 1 To 10
        ;ѡ������1(�����еĵڶ���1��ʾ���ֵ)��
        If StringInStr(GUICtrlRead($aCheckbox[$i], 1), 1) Then GUICtrlSetState($aCheckbox[$i], $gui_checked)
      Next
    Case -3
      Exit
  EndSwitch
WEnd
