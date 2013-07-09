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

#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <ListViewConstants.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <GUIListView.au3>
#include <Access.au3>
#include <Excel.au3>

#Region ### START Koda GUI section ### Form=c:\users\administrator\desktop\新建文件夹\form.kxf
$Form1 = GUICreate("车辆拍照系统", 782, 567, 316, 304)
$Label1 = GUICtrlCreateLabel("车牌号码", 16, 16, 68, 25)
GUICtrlSetFont(-1, 12, 400, 0, "微软雅黑")
$Input1 = GUICtrlCreateInput("", 88, 16, 97, 21)
$Label2 = GUICtrlCreateLabel("号牌种类", 248, 16, 68, 25)
GUICtrlSetFont(-1, 12, 400, 0, "微软雅黑")
$Input2 = GUICtrlCreateInput("", 320, 16, 97, 21)
$Label3 = GUICtrlCreateLabel("车主名字", 480, 16, 68, 25)
GUICtrlSetFont(-1, 12, 400, 0, "微软雅黑")
$Input3 = GUICtrlCreateInput("", 560, 16, 209, 21)
$Label4 = GUICtrlCreateLabel("品牌种类", 16, 55, 68, 25)
GUICtrlSetFont(-1, 12, 400, 0, "微软雅黑")
$Input4 = GUICtrlCreateInput("", 88, 55, 97, 21)
$Label5 = GUICtrlCreateLabel("发动机号", 248, 55, 68, 25)
GUICtrlSetFont(-1, 12, 400, 0, "微软雅黑")
$Input5 = GUICtrlCreateInput("", 320, 55, 145, 21)
$Label6 = GUICtrlCreateLabel("车识别架码", 479, 55, 84, 25)
GUICtrlSetFont(-1, 12, 400, 0, "微软雅黑")
$Input6 = GUICtrlCreateInput("", 568, 55, 201, 21)
$Label7 = GUICtrlCreateLabel("手机号码", 16, 90, 84, 25)
GUICtrlSetFont(-1, 12, 400, 0, "微软雅黑")
$Input7 = GUICtrlCreateInput("", 88, 90, 130, 21)
$Label8 = GUICtrlCreateLabel("录入时间", 248, 90, 84, 25)
GUICtrlSetFont(-1, 12, 400, 0, "微软雅黑")
$Input8 = GUICtrlCreateInput("", 320, 90, 145, 21)
$Button1 = GUICtrlCreateButton("创 建", 23, 118, 73, 25)
GUICtrlSetFont(-1, 12, 400, 0, "微软雅黑")
$Button2 = GUICtrlCreateButton("查 看", 100, 118, 73, 25)
GUICtrlSetFont(-1, 12, 400, 0, "微软雅黑")
$Button3 = GUICtrlCreateButton("", 177, 118, 73, 25)
GUICtrlSetFont(-1, 12, 400, 0, "微软雅黑")
$Button4 = GUICtrlCreateButton("", 254, 118, 73, 25)
GUICtrlSetFont(-1, 12, 400, 0, "微软雅黑")
$Button5 = GUICtrlCreateButton("发  送", 331, 118, 73, 25)
GUICtrlSetFont(-1, 12, 400, 0, "微软雅黑")
$Button6 = GUICtrlCreateButton("导出Excel", 408, 118, 75, 25)
GUICtrlSetFont(-1, 12, 400, 0, "微软雅黑")
$ListView1 = GUICtrlCreateListView("序号|车牌号码|号牌种类|车主名字|发动机号|车识别架码|手机号码|录入时间", 4, 150, 775, 413 ,BitOR($LVS_SHOWSELALWAYS, $LVS_NOSORTHEADER, $LVS_REPORT))
GUICtrlSendMsg(-1, 0x101E, 0, 40)
GUICtrlSendMsg(-1, 0x101E, 1, 90)
GUICtrlSendMsg(-1, 0x101E, 2, 90)
GUICtrlSendMsg(-1, 0x101E, 3, 100)
GUICtrlSendMsg(-1, 0x101E, 4, 140)
GUICtrlSendMsg(-1, 0x101E, 5, 170)
GUICtrlSendMsg(-1, 0x101E, 6, 110)
GUICtrlSendMsg(-1, 0x101E, 7, 110)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

$mdb_data_path = @ScriptDir & "\DetectData.mdb"
$mdb_data_pwd='vpte'
$adTable = "Receipt"
$t='*'

shuaxin()

While 1
        $nMsg = GUIGetMsg()
        Switch $nMsg
                            Case $Button1       ;新建数据库
                   If Not FileExists($mdb_data_path) Then
                           new()
                   Else
                           MsgBox(0,'关于···','本系统由云腾科技自主开发'&@CR&''&@CR&'版本:KF-0378-T1'&@CR&''&@CR&'@ 版权公有 传播不究')
                                        EndIf
                                Case $Button2  ;查看
                                        chakan()
                                Case $Button5  ;写入新的记录
                                        xieru()
                                Case $Button6  ;导出Excel表
                                $LL=_GUICtrlListView_GetSelectedCount($ListView1)
                        If $LL=0 Then
                                MsgBox(48,'提示:','请至少选定一条记录,按 Ctrl 或 Shift 可以多选')
                        Else
                                newxls()
                        EndIf
                                
                        EndSwitch
WEnd
                
Func shuaxin()  ;刷新选择框
                If Not FileExists($mdb_data_path) Then
                $msg=MsgBox(1,'欢迎使用','没有找到数据库文件,是否创建?')
                If $msg=1 Then
                        new()
                Else
                        Exit
                EndIf
        EndIf                
EndFunc 

Func new()   ;新建数据库和表
        $time=@MIN&@SEC&'-'&@MDAY&@HOUR&'-'&@YEAR
        $newMdb = ObjCreate('ADOX.Catalog')
        $newMdb.Create("Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & $mdb_data_path & ";Jet Oledb:Database Password=" & $mdb_data_pwd)
        $newmdb.ActiveConnection.Close;建数据库
        $addtbl = ObjCreate("ADODB.Connection")
        $addTbl.Open("Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & $mdb_data_path & ";Jet Oledb:Database Password=" & $mdb_data_pwd)
        $addTbl.Execute("CREATE TABLE " & $adTable)
        $addtbl.Close;建表
        $addfld = ObjCreate("ADODB.Connection")
        $addfld.Open("Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & $mdb_data_path & ";Jet Oledb:Database Password=" & $mdb_data_pwd)
        $addfld.Execute("ALTER TABLE " & $adTable & " ADD ID identity(1, 1) primary key,DET_PLATE text(255),DET_PCLASS text(255),DET_MINGZI text(255),DET_PINGPAI text(255),DET_FADONGJIHAO text(255),DET_VIN text(255),DET_HAOMA text(255),DET_DATE text(255)")
        $addfld.Close;建列表名
        MsgBox(0,'提示','数据库创建成功!'&@CR&''&@CR&'系统授权号:KF-'&$time&@CR&''&@CR&'@ 版权公有 传播不究')
EndFunc

Func xieru() ;往数据库中添加新的条目
        If GUICtrlRead($Input1)<>'' And GUICtrlRead($Input3)<>'' And GUICtrlRead($Input4)<>'' And GUICtrlRead($Input5)<>'' And GUICtrlRead($Input6)<>'' And GUICtrlRead($Input7)<>'' And GUICtrlRead($Input8)<>'' Then
                $read1=GUICtrlRead($Input1)
                $read2=GUICtrlRead($Input2)
                $read3=GUICtrlRead($Input3)
                $read4=GUICtrlRead($Input4)
                $read5=GUICtrlRead($Input5)
                $read6=GUICtrlRead($Input6)
                $read7=GUICtrlRead($Input7)
                $read8=GUICtrlRead($Input8)
                $addfld = ObjCreate("ADODB.Connection")
                $addfld.Open("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & $mdb_data_path & ";Jet Oledb:Database Password=" & $mdb_data_pwd)  ;要写数据，首先要连接到数据库
                $addfld.Execute("insert into "&$adTable&" (DET_PLATE,DET_PCLASS,DET_MINGZI,DET_PINGPAI,DET_FADONGJIHAO,DET_VIN,DET_HAOMA,DET_DATE) values('"&$read1&"','"&$read2&"','"&$read3&"','"&$read4&"','"&$read5&"','"&$read6&"','"&$read7&"','"&$read8&"')")  ;这里是告诉数据库要写到什么位置。要写什么值，
                $addfld.close  ;写完结束所有的连接
                                MsgBox(48,'提示','添加和发送记录成功！')
                                GUICtrlSetData($Input1,'')
                                GUICtrlSetData($Input2,'')
                                GUICtrlSetData($Input3,'')
                                GUICtrlSetData($Input4,'')
                                GUICtrlSetData($Input5,'')
                                GUICtrlSetData($Input6,'')
                                GUICtrlSetData($Input7,'')
                                GUICtrlSetData($Input8,'')
                                GUICtrlSetState($Input1,$GUI_FOCUS)
                        Else
                MsgBox(48, "提示", "添加失败,请检查项目填写格式是否正确!请输入完整或车牌号")
                GUICtrlSetState($Input5,$GUI_FOCUS)
        EndIf
        
EndFunc
        
Func chakan() ;查看数据库中所有的记录
        GUICtrlSendMsg($ListView1, $LVM_DELETEALLITEMS, 0, 0)
         $addfld = ObjCreate("ADODB.Connection")
     $addfld.Open("Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" &$mdb_data_path & ";Jet Oledb:Database Password=" & $mdb_data_pwd)  ;这句话和上一句一起是连接到数据库
     $RS =ObjCreate("ADODB.Recordset")
         $RS.ActiveConnection = $addfld
         $RS.Open ("Select "&$t & " From " & $adTable )     ;$t : 表示一个连接  $adtable :表示的是这个表的名称   这句话是：从$adtable表的第一条开始读取，直到结束  $t的星号是所有的意思
      while Not $RS.eof And Not $RS.bof
           if @error =1 Then ExitLoop
            GUICtrlCreateListViewItem ( $RS.Fields (0).value&"|"& $RS.Fields (1).value&"|"& $RS.Fields (2).value&"|"& $RS.Fields (3).value&"|"& $RS.Fields (4).value&"|"& $RS.Fields (5).value&"|"& $RS.Fields (6).value&"|"& $RS.Fields (7).value&"|"& $RS.Fields (8).value,$ListView1 ) 
              ; $RS.Fields (0).value;表示的是第一个数据，往后依此类推，第二个第三个···把读取到的值用 | 隔开，并把他们放到对应的ListView下面。
             $rs.movenext  ;
              WEnd
               $rs.close
              $addfld.Close  ;读取结束后结束所有的连接，并把缓存的数据清空。
EndFunc

Func newxls()  
        Local $array[1],$L
        $L='序号|车牌号码|号牌种类|车主名字|发动机号|车识别架码|手机号码|录入时间'
        $Selected = _GUICtrlListView_GetSelectedIndices($ListView1, 1)
        _ArrayAdd($array,$L)
        For $I = 1 To $Selected[0]
                $SelectedItem = _GUICtrlListView_GetItemTextString($ListView1, $Selected[$I])
                ;MsgBox(0, 0, $SelectedItem)
                _ArrayAdd($array,$SelectedItem)
        Next
        $excel=_ExcelBookNew(1)  ;创建一个新的工作表并设置显示，(0=不可见, 1=可见)
        For $i=0 To UBound($array)-1   ;返回数组维度的大小
                $htest=StringSplit($array[$i],'|')  ;以指定分隔符把字符串拆分成若干子串
                For $ii=0 To $htest[0]
                        _ExcelWriteCell($excel,$htest[$ii],$i,$ii)  ;添加一个数据到打开的EXCEL(打开的excel,要添加的数据,要写入的行,要写入的列)
                Next
        Next
EndFunc