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

#include-once
#include <Process.au3>
; #FUNCTION# ====================================================================================================================
; Name...........: _FileRename
; Description ...: Rename a file 
; Syntax.........: _FileRename($sFilePath,$sFileName,[$sExtName = ""])
; Parameters ....: $sFilePath - Path and filename of the file to be read
;                  $sFileName - a new filename to be changed
;                  $sExtName  - [optional] a extension of file to be given
; Return values .: Success - Returns a 1.
;                  Failure - Returns a 0
;                  @Error  - 1 =  the specified file cannot be found .
; Author ........: lujd0429 <[url]www.autoitx.com[/url] >
; Remarks .......: This function is not profect currently , and hope someone can continue to modify it.
; Related .......:
; Link ..........: Inspiration from <[url]http://www.autoitx.com/thread-10110-1-1.html[/url] (Author: �֡��z����)>
; Example .......: Yes

;˵��...��         �������ļ� 
;�﷨.........��   _FileRename��$ sFilePath��$ sFileName��[$ sExtName=����]�� 
;����....��        $ sFilePath - ·����Ҫ��ȡ���ļ����ļ��� 
                  ; $ sFileName - һ���µ��ļ������ı� 
                  ;$ sExtName  Ӧ����[��ѡ]һ���ļ�����չ�� - 
                  ;����ֵ���ɹ� - ����1�� 
				  ;ʧ�� - ����0 
				  ; @���� - 1=ָ�����ļ��޷��ҵ��� 
				  ;����........��lujd0429<[URL] www.autoitx.com[/ URL]> 
				  ;��ע.......���˹��ܲ�����������Ŀǰ����ϣ�������ܼ����޸����� 
				  ;���.......�� 
				  ;����..........�������<[URL] http://www.autoitx.com/thread-10110-1-1.html[/ URL]�����ߣ��֡��z���֣� > 
				  ;����.......���ǵ�


; ===============================================================================================================================
 _FileRename("C:\Users\chtyfox\Desktop\1.txt","2")
Func _FileRename($sFullPath, $sFileName,$sExtName = "")
    If Not FileExists($sFullpath) Then
        SetError(1,0,0)
    Else
                If $sExtName = "" Then
                    Local $ext = StringSplit($sFullpath, "." ,1)
                        $sExt = $ext[2]
                Else
                        $sExt = $sExtName
                Endif
            $result =  _RunDOS("ren """& $sFullPath &""" """& $sFileName &""""&"."&$sExt&"""")
                        If $result = 0 And @error <> 0 Then 
                                 Return 0
                    Else
                             Return 1
                    EndIf
        EndIf
Endfunc
