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

Local $ShiJianStart="";��Ҫ��������������
Local $ShiJian_ShengYu=""
Local $ShiJianPoint=""
DJS_time(0,0,0)
For $i=0 To 100000
Local $gg=DJS_time($i,100000)
ToolTip($gg)
Next

;�������ݴ���������ʱ�䵹��ʱ,��ǰ����,�������,ģʽ��=0 ��ͷ��ʼ
Func DJS_time($tpoint,$maxp,$model=1)
        If $model=0 Then
                $ShiJianStart=""
                $ShiJian_ShengYu=""
                Return
                EndIf

If $ShiJianStart="" Then
        $ShiJianStart= TimerInit()
        $ShiJianPoint=$tpoint
EndIf


If Mod($tpoint-$ShiJianPoint,1)=0 And $ShiJianPoint<>$tpoint Then
Local $ggec = TimerDiff($ShiJianStart)
Local $everytimem=$ggec/($tpoint-$ShiJianPoint);����ÿ�����ݺ�ʱƽ��ֵ
Local $ShiJian_ShengYu_HM=$everytimem*($maxp-$tpoint)
Local $hour_xs=1000*60*60
Local $min_xs=1000*60
Local $sec_xs=1000

Local $hour_1=Int($ShiJian_ShengYu_HM/$hour_xs)
Local $shengyu_1=""
If $hour_1>=1 Then
        $shengyu_1=$ShiJian_ShengYu_HM-$hour_1*$hour_xs
Else
        $shengyu_1=$ShiJian_ShengYu_HM
        EndIf

Local $min_1=Int($shengyu_1/$min_xs)
If $min_1>=1 Then
        $shengyu_2=$shengyu_1-$min_1*$min_xs
Else
        $shengyu_2=$shengyu_1
        EndIf

Local $sec=Int($shengyu_2/$sec_xs)

If StringLen($hour_1)<2 Then $hour_1="0"&$hour_1
If StringLen($min_1)<2 Then $min_1="0"&$min_1
If StringLen($sec)<2 Then $sec="0"&$sec

 $ShiJian_ShengYu= $hour_1&":"&$min_1&":"&$sec
EndIf
Return  $ShiJian_ShengYu
EndFunc