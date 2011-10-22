
;定时录像
WinActivate("RVMS平台--管理端")
ControlTreeView ("RVMS平台--管理端", "", "SysTreeView324", "Expand", "通道列表|D9104B01")
  $1= ControlGetHandle("RVMS平台--管理端", "", "SysTreeView321")
   $2 =_GUICtrlTreeView_FindItem($1, "录像服务器")
  _GUICtrlTreeView_ClickItem($1,$2,"left",True,1,2)
WinActivate("RVMS平台--管理端")
ControlClick( "RVMS平台--管理端", "时间段一:", "Button15")
ControlClick( "RVMS平台--管理端", "时间段二:", "Button16")
ControlClick( "RVMS平台--管理端", "时间段三:", "Button17")
ControlClick( "RVMS平台--管理端", "时间段四:", "Button18")
ControlClick( "RVMS平台--管理端", "应用于每一天", "Button27")

WinWait("RVMS平台--管理端提示信息")
ControlClick("RVMS平台--管理端提示信息","确定","Button1")

ControlClick( "RVMS平台--管理端", "时间段一:", "Button19")
ControlClick( "RVMS平台--管理端", "时间段二:", "Button20")
ControlClick( "RVMS平台--管理端", "时间段三:", "Button21")
ControlClick( "RVMS平台--管理端", "时间段四:", "Button22")
ControlClick( "RVMS平台--管理端", "应用于每一天", "Button28")

WinWait("RVMS平台--管理端提示信息")
ControlClick("RVMS平台--管理端提示信息","确定","Button1")
ControlClick( "RVMS平台--管理端", "确定:", "Button28")