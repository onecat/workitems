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

;C:\Users\chtyfox\Desktop\���\11\222\333\4444\55555\666666
  #Include <File.au3>
  #Include <Array.au3>
  Local $var ,$pathfile,$pa,$FILE2
  $_Path = "C:\Users\chtyfox\Desktop\���"
  $_Pathsl = StringLen($_Path)+1
 _FileReadDir($_Path)
 $jg =StringMid($pathfile,$_Pathsl)
 DirCreate("C:\Users\chtyfox\Desktop\������" & $jg)
Func _FileReadDir($_Path)
        $Folder = _FileListToArray($_Path, "*", 2)
        If Not IsArray($Folder) Then Return 0
        For $i = 1 To $Folder[0]
				$pathfile =$_Path & "\" & $Folder[$i]
               _FileReadDir($_Path & "\" & $Folder[$i]) 
			   Return $pathfile
			   ExitLoop
			Next
EndFunc			
		
;~   $FILE2 = StringRight($pathfile, StringLen($pathfile) - StringInStr($pathfile, "\", 1, -1))
;~   MsgBox(0,"1",$FILE2)
;~   $1 = StringLen($FILE2)+1
;~   $2 = StringLen($pathfile) -$1
;~   $3 = StringLeft($pathfile,$2)
;~   $FILE3 = StringRight($3, StringLen($3) - StringInStr($3, "\", 1, -1) )
;~   MsgBox(0,"2",$FILE3)
;~   $4 = StringLen($FILE3)+1
;~   $5 = StringLen($3) -$4
;~   $6 = StringLeft($3,$5)
;~   $FILE4 = StringRight($6, StringLen($6) - StringInStr($6, "\", 1, -1) )
;~   MsgBox(0,"3",$FILE4)
;~   $7 = StringLen($FILE4)+1
;~   $8 = StringLen($6) -$7
;~   $9 = StringLeft($6,$8)
;~   $FILE5 = StringRight($9, StringLen($9) - StringInStr($9, "\", 1, -1) )
;~   MsgBox(0,"4",$FILE5)
;~   $10 = StringLen($FILE5)+1
;~   $11 = StringLen($9) -$10
;~   $12= StringLeft($9,$11)
;~   $FILE6 = StringRight($12, StringLen($12) - StringInStr($12, "\", 1, -1) )
;~   MsgBox(0,"5",$FILE6)
;~   $13 = StringLen($FILE6)+1
;~   $14= StringLen($12) -$13
;~   $15= StringLeft($12,$14)
;~   $FILE7 = StringRight($15, StringLen($15) - StringInStr($15, "\", 1, -1) )
;~   MsgBox(0,"6",$FILE7)