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

Const $sFilePath = @ScriptDir & "\Config.ini"
Local $aList = __IniReadToArray($sFilePath, 'FastStart')
_ArrayDisplay($aList, '')

;===================��'|'�ָ����Ǳ�׼ini�ļ��ɶ�ά����ĺ���==================================
Func __IniReadToArray($sIniFile, $Section, $sDecimal = '|')
        ;ini�ļ�·��        ;�ֶ���        ;�ָ���
        Local $sIni = FileRead($sIniFile)
        Local $_Section = StringRegExpReplace($Section, '^\h*(.+?)\h*$', '$1')
        $_Section = StringRegExpReplace($_Section, '(\.|\||\*|\?|\+|\(|\)|\{|\}|\[|\]|\^|\$|\\)', '\\$1')
        $sIni = StringRegExpReplace($sIni, '(?mi)[\s\S]*?^\h*\[' & $_Section & '\]\V*\v+([\s\S]+?)(?=\r\n\h*\[|\z)[\s\S]*', '\1')
        Local $aLine = StringRegExp($sIni, '\V+', 3)
        If @error Then Return SetError(1)
        Local $i, $afg, $j, $iMax = 1, $iC = 1
        Local $aData[UBound($aLine)][$iMax]
        For $i = 0 To UBound($aLine) - 1
                $afg = StringSplit($aLine[$i], $sDecimal, 1)
                For $j = 1 To $afg[0]
                        If $afg[0] > $iMax Then
                                $iMax = $afg[0]
                                ReDim $aData[UBound($aData)][$iMax]
                        EndIf
                        $aData[$i][$j - 1] = $afg[$j]
                Next
        Next
        ReDim $aData[UBound($aData)][$iMax]
        Return $aData
	EndFunc   ;==>__IniReadToArray
	
	
;ini
;Config.ini
#cs
[FastStart]
mydn|explorer|::{20D04FE0-3AEA-1069-A2D8-08002B30309D} ||||||�ҵĵ���
hsz|explorer|::{645FF040-5081-101B-9F08-00AA002F954E} ||||||����վ
wslj|explorer|::{208D2C60-3AEA-1069-A2D7-08002B30309D} ||||||�����ھ�
wllj|explorer|::{7007ACC7-3202-11D1-AAD2-00805FC1270E} ||||||��������
print|explorer|::{2227A280-3AEA-1069-A2DE-08002B30309D} ||||||��ӡ���봫��
rwjh|explorer|::{D6277990-4C6A-11CF-8D87-00AA0060F5BF} ||||||����ƻ�
bd|C:\Program Files\Mozilla Firefox\firefox.exe|http://www.baidu.com/baidu?wd=%s&cl=3
gg|C:\Program Files\Mozilla Firefox\firefox.exe|https://www.google.com.hk/search ... 2.2.484.v3a8e3RZXxU
dict|C:\Program Files\Mozilla Firefox\firefox.exe|http://dictionary.reference.com/search?q=%s
iciba|C:\Program Files\Mozilla Firefox\firefox.exe|http://www.iciba.com/search?s=%s&t=word&lang=utf-8
mywd|explorer|::{450D8FBA-AD25-11D0-98A8-0800361B1103} ||||||�ҵ��ĵ�
sx|C:\Program Files\Mozilla Firefox\firefox.exe|http://www.acronymfinder.com/af- ... xact&Acronym=%1|||||||��д����
fy|C:\Program Files\Mozilla Firefox\firefox.exe|http://fanyi.baidu.com/translate#en/zh/%s
lx|C:\Program Files\Mozilla Firefox\firefox.exe|http://www.55188.com/forum-68-1.html
chen|C:\Program Files\Mozilla Firefox\firefox.exe|http://www.worldlingo.com/wl/mst ... %s&wlg_table=-3 
ruen|C:\Program Files\Mozilla Firefox\firefox.exe|http://www.translate.ru/url/tran ... 0&psubmit2.y=12
gh|C:\Program Files\Mozilla Firefox\firefox.exe|https://vip.icbc.com.cn/icbc/perbank/index.jsp
jh|C:\Program Files\Mozilla Firefox\firefox.exe|https://ibsbjstar.ccb.com.cn/app/V5/CN/STY1/login.jsp
nh|C:\Program Files\Mozilla Firefox\firefox.exe|http://www.abchina.com/cn/wydl/grwydl/default.htm#
zh|C:\Program Files\Mozilla Firefox\firefox.exe|https://ebsnew.boc.cn/boc15/login.html
ie|C:\Program Files\Internet Explorer\IEXPLORE.EXE
#ce