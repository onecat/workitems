#Region ACN预处理程序参数(常用参数)
#PRE_Icon= 										;图标,支持EXE,DLL,ICO
#PRE_OutFile=									;输出文件名
#PRE_OutFile_Type=exe							;文件类型
#PRE_Compression=4								;压缩等级
#PRE_UseUpx=y 									;使用压缩
#PRE_Res_Comment= 								;程序注释
#PRE_Res_Description=							;详细信息
#PRE_Res_Fileversion=							;文件版本
#PRE_Res_FileVersion_AutoIncrement=p			;自动更新版本
#PRE_Res_LegalCopyright= 						;版权
#PRE_Change2CUI=N                   			;修改输出的程序为CUI(控制台程序)
;#PRE_Res_Field=AutoIt Version|%AutoItVer%		;自定义资源段
;#PRE_Run_Tidy=                   				;脚本整理
;#PRE_Run_Obfuscator=      						;代码迷惑
;#PRE_Run_AU3Check= 							;语法检查
;#PRE_Run_Before= 								;运行前
;#PRE_Run_After=								;运行后
;#PRE_UseX64=n									;使用64位解释器
;#PRE_Compile_Both								;进行双平台编译
#EndRegion ACN预处理程序参数设置完成
#cs ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿

 Au3 版本: 
 脚本作者: 
 电子邮件: 
	QQ/TM: 
 脚本版本: 
 脚本功能: 

#ce ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿脚本开始＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿

GUICtrlSetBkColor($Label1,$GUI_BKCOLOR_TRANSPARENT )

Func _SendTextTOWallpaper($Text, $Color, $Fonst, $FontCreate, $FontStyle, $Width, $Height, $Align);将文字写入图片的指定位置：文字、颜色、字体、大小、样式、X坐标、Y坐标、对齐
; 参数:                        $Text       - 要写进图片的文字
;                                $Color      - 文字的颜色
;                                $Fonst      - 文字的字体
;                                $FonstCreate- 文字的大小
;                                $FontStyle  - 字体样式 0=普通或字体自量 1=粗体 2=斜体 4=下划线 8=删除线
;                                $Width      - 在图片中的X坐标
;                                $Height     - 在图片中的Y坐标
;                                $Align      - 对齐方式 0靠左，1居中，2靠右        
        $hBrush  = _GDIPlus_BrushCreateSolid($Color)                                                  ;创建实心画笔对象，其中Alpha通道值为255，RGB值为0xff00ff
        $hFormat = _GDIPlus_StringFormatCreate()                                                      ;创建字符串格式对象
        $hFamily = _GDIPlus_FontFamilyCreate($Fonst)                                                  ;创建字体为"微软雅黑"的字体族对象
        $hFont   = _GDIPlus_FontCreate($hFamily, $FontCreate, $FontStyle, 2)                          ;用上面创建的字体族创建一个字体大小为20，粗体+斜体，坐标参照为像素的字体对象，坐标参照很重要，会影响到字体在图形上的位置
        $tLayout = _GDIPlus_RectFCreate($Width, $Height, 0, 0)                                        ;创建 $tagGDIPRECTF 数据结构
        _GDIPlus_StringFormatSetAlign($hFormat, $Align)
        $TestText = _GDIPlus_GraphicsMeasureString($hGraphic, $Text, $hFont, $tLayout, $hFormat)      ;根据上面创建的字体、字符串等信息测量字符串在图形中的尺寸，以便在图形中绘制
        _GDIPlus_GraphicsDrawStringEx($hGraphic, $Text, $hFont, $TestText[0], $hFormat, $hBrush)      ;在图形中绘制上面创建的字符串对象
EndFunc   ;==>_SendTextTOWallpaper
