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
#include <GUIConstantsEx.au3>
#include <ListViewConstants.au3>
#include <WindowsConstants.au3>
$mdb_data_path="sky.mdb"
$mdb_data_pwd=""
$name="天生我才"
$pass="过去"
$qq=25359272
$e_mail="xtybfgu@163.com"
$T="*"
$tblname="tywb"
#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("数据库操作例子", 633, 454, 193, 115)
$ListView1 = GUICtrlCreateListView("   ID  |      姓名  |    密码  |     QQ    |        E_mail ", 8, 24, 617, 361)
$Button0 = GUICtrlCreateButton("创建数据库", 20, 408, 97, 25, 0)
$Button1 = GUICtrlCreateButton("写入1000条数据", 130, 408, 130, 25, 0)
$Button2 = GUICtrlCreateButton("更新数据", 400, 408, 97, 25, 0)
$Button3 = GUICtrlCreateButton("删除数据",510, 408, 113, 25, 0);280, 408, 113, 25, 0)
$Button4 = GUICtrlCreateButton("读取数据", 280, 408, 113, 25, 0)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
;du()
While 1
        $nMsg = GUIGetMsg()
        Switch $nMsg
                Case $GUI_EVENT_CLOSE
                        Exit
         Case  $Button0
            data($mdb_data_path, $tblname)
         Case  $Button1;写入
            sx()
                   du()
        Case $Button2 ;更新
                up()
                du()
 
    Case $Button3 ;删除
               del()
              du()
 
    Case $Button4 ;读取
 
              du()
 
 
 
        EndSwitch
WEnd
 
Func du()
     GUICtrlSendMsg($ListView1, $LVM_DELETEALLITEMS, 0, 0)
          $addfld = ObjCreate("ADODB.Connection")
            $addfld.Open("Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" &$mdb_data_path)
         $RS =ObjCreate("ADODB.Recordset")
          $RS.ActiveConnection = $addfld
            $RS.Open ("Select "&$T & " From " & $tblname )
           while Not $RS.eof And Not $RS.bof
           if @error =1 Then ExitLoop
            GUICtrlCreateListViewItem ( $RS.Fields (0).value&"|"& $RS.Fields (1).value&"|"& $RS.Fields (2).value&"|"& $RS.Fields (3).value&"|"& $RS.Fields (4).value,$ListView1 )
 
              ; MsgBox(0, "", $RS.Fields (1).value);显示表第一个数据
             $rs.movenext
              WEnd
               $rs.close
              $addfld.Close
EndFunc
 
Func del()
                $Strn=GUICtrlRead(GUICtrlRead($ListView1))
                $Strnspin=StringSplit($Strn,"|")                
            $addfld = ObjCreate("ADODB.Connection")
            $addfld.Open("Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" &$mdb_data_path)
                        $sQuery ="DELETE FROM " & $tblname & " IN '" & $mdb_data_path & "' WHERE id" & " = " & $Strnspin[1] 
         ; MsgBox(0,"",$sQuery)
           $addfld.execute($sQuery)
           $addfld.close
 MsgBox(4096, "提示:",$Strnspin[1]&"    删除成功!!!")
 
EndFunc
 
 
Func up()
         $Strn=GUICtrlRead(GUICtrlRead($ListView1))
                $Strnspin=StringSplit($Strn,"|")                
            $addfld = ObjCreate("ADODB.Connection")
            $addfld.Open("Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" &$mdb_data_path)
                        $sQuery ="update " & $tblname & " set  name='小黑Sky',pass='good',e_mail='25359272@qq.com' WHERE id" & " = " & $Strnspin[1] 
         ;  MsgBox(0,"",$sQuery)
           $addfld.execute($sQuery)
           $addfld.close
    MsgBox(4096, "提示:",$Strnspin[1]&"    更新成功!!!")
EndFunc
 
 
Func sx()
         $addfld = ObjCreate("ADODB.Connection")
      
       $addfld.Open("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & $mdb_data_path & ";Jet Oledb:Database Password=" & $mdb_data_pwd)
      $x=0
       While 1
        $x+=1
       if $x >1000 Then ExitLoop
      $addfld.Execute("insert into tywb (name,pass,qq,e_mail) values('"&$name&"','"&$pass&"','"&$qq&"','"&$e_mail&"')")
     WEnd
      ; $conn.Execute("insert into tywb (name,pass,qq,e_mail) values('"&$name&"','"&$pass&"','"&$qq&"','"&$e_mail&"')")
     ;  $RS.close
          $addfld.close
         MsgBox(4096, "提示:"," 成功写入数据库！")  
EndFunc
 
Func data($mdb_data_path, $tblname)
if not FileExists($mdb_data_path) Then
$newMdb = ObjCreate("ADOX.Catalog")
$newMdb.Create("Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & $mdb_data_path)
$newmdb.ActiveConnection.Close;建数据库
$addtbl = ObjCreate("ADODB.Connection")
$addTbl.Open("Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & $mdb_data_path)
$addTbl.Execute("CREATE TABLE " & $tblname)
$addtbl.Close;建表
 
$addfld = ObjCreate("ADODB.Connection")
$addfld.Open("Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & $mdb_data_path)
$addfld.Execute("ALTER TABLE " & $tblname & " ADD id identity(1, 1) primary key,name char ,pass char ,qq int,e_mail char");id identity(1, 1) primary key为自动编号和主键
$addfld.Close;建列表名
MsgBox(64,"提示","建立数据库成功",5)
Else
MsgBox(64,"提示","你已经建立了一个数据库了",5)
EndIf
EndFunc
