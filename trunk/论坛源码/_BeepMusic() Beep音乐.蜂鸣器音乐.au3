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

;���ӣ����������

Local $sMusic = '-5..1.1;1.....;-5..2.-7;1.....;-5..1.4;4..3.2;1..-7.1;2.....;' & _
                '-5..1.1;1.....;-5..2.-7;1.....;-5..1.3;5..3.1;-6..2.3;1.....;' & _
                '4..3.2;-6..-6..;-7..1.2;2.....;4..3.2;-6..-6..;-7..1.2;2.....;' & _
                '1..1.1;1.....;-5..1.-7;1.....;-5..1.3;5..3.1;-6..2.3;1.....;' & _
                '-6..2.3;1.....;1.....'

_BeepMusic($sMusic)        ;���������
;_BeepMusic('1..,2..,3..,4..,5..,6..,7..,,,')        ;����

Func _BeepMusic($sMusic, $cVal = 7, $vD = 200)
        ;$sMusic - afan����ļ����ַ�����
        ;        ��.������������ʱ����,����������ͣ��(������Ҫ)
        ;        ��;�������壬��ֱ��С��
        ;$cVal - ������ֵ(7�Ƚ�׼)
        ;$vD - ��ʱֵ(ms)
        Local $sYF = '262;294;330;349;392;440;494;' & _
                        '523;578;659;698;792;880;988;' & _
                        '1046;1175;1318;1397;1568;1760;1976'
        Local $aYF = StringSplit($sYF, ';', 2)

        Local $c = -1, $DelaySl, $i
        For $i = $cVal To UBound($aYF) - 1
                Assign('~' & $c, $aYF[$i])
                If $c < 1 Then
                        $c -= 1
                        If $c = -8 Then $c = 1
                Else
                        $c += 1
                EndIf
        Next

        Local $aSR = StringRegExp($sMusic, '-?\d\.*|,', 3)
        If @Error Then Return SetError (1)
        For $i = 0 To UBound($aSR) - 1
                $aSR[$i] = StringRegExpReplace($aSR[$i], ',', '')
                If Not @error And @extended Then
                        Sleep(@extended * $vD)
                        ContinueLoop
                EndIf
                $DelaySl = 0
                $aSR[$i] = StringRegExpReplace($aSR[$i], '\.', '')
                If Not @error And @extended Then
                        $DelaySl = @extended
                EndIf
                Beep(Eval('~' & $aSR[$i]), $vD + $DelaySl * $vD)
                Sleep(1)
        Next
EndFunc   ;==>_BeepMusic