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

GUICtrlSetBkColor($Label1,$GUI_BKCOLOR_TRANSPARENT )

Func _SendTextTOWallpaper($Text, $Color, $Fonst, $FontCreate, $FontStyle, $Width, $Height, $Align);������д��ͼƬ��ָ��λ�ã����֡���ɫ�����塢��С����ʽ��X���ꡢY���ꡢ����
; ����:                        $Text       - Ҫд��ͼƬ������
;                                $Color      - ���ֵ���ɫ
;                                $Fonst      - ���ֵ�����
;                                $FonstCreate- ���ֵĴ�С
;                                $FontStyle  - ������ʽ 0=��ͨ���������� 1=���� 2=б�� 4=�»��� 8=ɾ����
;                                $Width      - ��ͼƬ�е�X����
;                                $Height     - ��ͼƬ�е�Y����
;                                $Align      - ���뷽ʽ 0����1���У�2����        
        $hBrush  = _GDIPlus_BrushCreateSolid($Color)                                                  ;����ʵ�Ļ��ʶ�������Alphaͨ��ֵΪ255��RGBֵΪ0xff00ff
        $hFormat = _GDIPlus_StringFormatCreate()                                                      ;�����ַ�����ʽ����
        $hFamily = _GDIPlus_FontFamilyCreate($Fonst)                                                  ;��������Ϊ"΢���ź�"�����������
        $hFont   = _GDIPlus_FontCreate($hFamily, $FontCreate, $FontStyle, 2)                          ;�����洴���������崴��һ�������СΪ20������+б�壬�������Ϊ���ص��������������պ���Ҫ����Ӱ�쵽������ͼ���ϵ�λ��
        $tLayout = _GDIPlus_RectFCreate($Width, $Height, 0, 0)                                        ;���� $tagGDIPRECTF ���ݽṹ
        _GDIPlus_StringFormatSetAlign($hFormat, $Align)
        $TestText = _GDIPlus_GraphicsMeasureString($hGraphic, $Text, $hFont, $tLayout, $hFormat)      ;�������洴�������塢�ַ�������Ϣ�����ַ�����ͼ���еĳߴ磬�Ա���ͼ���л���
        _GDIPlus_GraphicsDrawStringEx($hGraphic, $Text, $hFont, $TestText[0], $hFormat, $hBrush)      ;��ͼ���л������洴�����ַ�������
EndFunc   ;==>_SendTextTOWallpaper
