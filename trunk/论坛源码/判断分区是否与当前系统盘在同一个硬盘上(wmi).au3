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
;��  �ܣ��жϷ����Ƿ��뵱ǰϵͳ����ͬһ��Ӳ����(�����ͬһ��Ӳ�����ҷ���δ��ʽ�����ʽ��Ϊ"NTFS")
;��  ����$Temp  - ��ʹ����"*:"��ͷ�ľ��Ե�ַ
;����ֵ��0 = �����뵱ǰϵͳ�̲���ͬһ��Ӳ���ϻ���������
;        1 = �����뵱ǰϵͳ����ͬһ��Ӳ����,(�������δ��ʽ�����ʽ��Ϊ"NTFS")
;��  �ߣ�����ʹ��
;��  ����2009.02.02.0
Func thisDisk($Temp)
    $Temp = StringLeft($Temp, 2)
    If StringRight($Temp, 1)<>":" Then Return 0
    If StringIsLower(StringLeft($Temp, 1))=0 And StringIsUpper(StringLeft($Temp, 1))=0 Then Return 0;�ж����������Ƿ�ΪӢ��
 
    Local $ThisDisk = "";ϵͳ��������Ӳ�̺�
    Local $objWMIService = ObjGet("winmgmts:\\.\root\CIMV2")
    ;�ж�ϵͳ��������Ӳ�̺�
    Local $colDiskDrives = $objWMIService.ExecQuery("Associators of {win32_LogicalDisk.DeviceID='" & @HomeDrive & "'} where ResultClass = Win32_DiskPartition")
    For $objDrive In $colDiskDrives
        $ThisDisk = $objDrive.DiskIndex
    Next
    ;�ж�"$Temp"�Ƿ��ڵ�ǰϵͳ��������Ӳ����
    $colDiskDrives = $objWMIService.ExecQuery("Associators of {win32_LogicalDisk.DeviceID='" & StringLeft($Temp, 2) & "'} where ResultClass = Win32_DiskPartition")
    For $objDrive In $colDiskDrives
        If $ThisDisk = $objDrive.DiskIndex Then
            If DriveStatus($Temp)="UNKNOWN" Then RunWait(@ComSpec & " /c FORMAT " &$Temp& " /FS:NTFS /Q /Y", "", @SW_HIDE);�жϷ����Ƿ��ʽ��
            If DriveStatus($Temp)="READY" Then Return 1
        EndIf
    Next
    Return 0
EndFunc   ;==>thisDisk

