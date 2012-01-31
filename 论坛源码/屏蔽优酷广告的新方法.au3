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

$Str = _
                '#以下为屏蔽广告项  制作：LPXX' & @CRLF  & _
                '------ 屏蔽迅雷看看广告 ------' & @CRLF & _
                '0.0.0.0   pubstat.sandai.net' & @CRLF & _
                '0.0.0.0   mcfg.sandai.net' & @CRLF & _
                '0.0.0.0   biz5.sandai.net' & @CRLF & _
                '0.0.0.0   float.sandai.net' & @CRLF & _
                '0.0.0.0   recommend.xunlei.com' & @CRLF & _
                '0.0.0.0   cl.kankan.xunlei.com' & @CRLF & _
                '#优酷' & @CRLF & _
                '127.0.0.1 atm.youku.com' & @CRLF & _
                '127.0.0.1 Fvid.atm.youku.com' & @CRLF & _
                '127.0.0.1 html.atm.youku.com' & @CRLF & _
                '127.0.0.1 valb.atm.youku.com' & @CRLF & _
                '127.0.0.1 valf.atm.youku.com' & @CRLF & _
                '127.0.0.1 valo.atm.youku.com' & @CRLF & _
                '127.0.0.1 valp.atm.youku.com' & @CRLF & _
                '127.0.0.1 lstat.youku.com' & @CRLF & _
                '127.0.0.1 speed.lstat.youku.com' & @CRLF & _
                '127.0.0.1 urchin.lstat.youku.com' & @CRLF & _
                '127.0.0.1 stat.youku.com' & @CRLF & _
                '127.0.0.1 static.lstat.youku.com' & @CRLF & _
                '127.0.0.1 valc.atm.youku.com' & @CRLF & _
                '127.0.0.1 vid.atm.youku.com' & @CRLF & _
                '127.0.0.1 walp.atm.youku.com' & @CRLF & _
                '#百度：' & @CRLF & _
                '127.0.0.1 a.baidu.com' & @CRLF & _
                '127.0.0.1 baidutv.baidu.com' & @CRLF & _
                '127.0.0.1 bar.baidu.com' & @CRLF & _
                '127.0.0.1 c.baidu.com' & @CRLF & _
                '127.0.0.1 cjhq.baidu.com' & @CRLF & _
                '127.0.0.1 cpro.baidu.com' & @CRLF & _
                '127.0.0.1 drmcmm.baidu.com' & @CRLF & _
                '127.0.0.1 e.baidu.com' & @CRLF & _
                '127.0.0.1 eiv.baidu.com' & @CRLF & _
                '127.0.0.1 hc.baidu.com' & @CRLF & _
                '127.0.0.1 hm.baidu.com' & @CRLF & _
                '127.0.0.1 ma.baidu.com' & @CRLF & _
                '127.0.0.1 nsclick.baidu.com' & @CRLF & _
                '127.0.0.1 spcode.baidu.com' & @CRLF & _
                '127.0.0.1 tk.baidu.com' & @CRLF & _
                '127.0.0.1 union.baidu.com' & @CRLF & _
                '127.0.0.1 ucstat.baidu.com' & @CRLF & _
                '127.0.0.1 utility.baidu.com' & @CRLF & _
                '127.0.0.1 utk.baidu.com' & @CRLF & _
                '127.0.0.1 focusbaiduafp.allyes.com' & @CRLF & _
                '#奇艺' & @CRLF & _
                '127.0.0.1 afp.qiyi.com' & @CRLF & _
                '127.0.0.1 focusbaiduafp.allyes.com' & @CRLF & _
                '#CNTV' & @CRLF & _
                '127.0.0.1 a.cctv.com' & @CRLF & _
                '127.0.0.1 a.cntv.cn' & @CRLF & _
                '127.0.0.1 ad.cctv.com' & @CRLF & _
                '127.0.0.1 d.cntv.cn' & @CRLF & _
                '127.0.0.1 adguanggao.eee114.com' & @CRLF & _
                '127.0.0.1 cctv.adsunion.com' & @CRLF & _
                '#新浪视频' & @CRLF & _
                '127.0.0.1 dcads.sina.com.cn' & @CRLF & _
                '#pptv' & @CRLF & _
                '127.0.0.1 pp2.pptv.com' & @CRLF & _
                '#乐视' & @CRLF & _
                '127.0.0.1 pro.letv.com' & @CRLF & _
                '#搜狐高清' & @CRLF & _
                '127.0.0.1 images.sohu.com' & @CRLF & _
                '@HostsX 国内站点广告/视频类网站' & @CRLF & _
                '#CNTV' & @CRLF & _
                '127.0.0.1 a.cctv.com' & @CRLF & _
                '127.0.0.1 a.cntv.cn' & @CRLF & _
                '127.0.0.1 ad.cctv.com' & @CRLF & _
                '127.0.0.1 d.cntv.cn' & @CRLF & _
                '127.0.0.1 adguanggao.eee114.com' & @CRLF & _
                '127.0.0.1 cctv.adsunion.com' & @CRLF & _
                '#我乐网' & @CRLF & _
                '127.0.0.1 acs.56.com' & @CRLF & _
                '127.0.0.1 acs.agent.56.com' & @CRLF & _
                '127.0.0.1 acs.agent.v-56.com' & @CRLF & _
                '127.0.0.1 bill.agent.56.com' & @CRLF & _
                '127.0.0.1 bill.agent.v-56.com' & @CRLF & _
                '127.0.0.1 stat.56.com' & @CRLF & _
                '127.0.0.1 stat2.corp.56.com' & @CRLF & _
                '127.0.0.1 union.56.com' & @CRLF & _
                '127.0.0.1 uvimage.56.com' & @CRLF & _
                '127.0.0.1 v16.56.com' & @CRLF & _
                '#6间房' & @CRLF & _
                '127.0.0.1 pole.6rooms.com' & @CRLF & _
                '127.0.0.1 shrek.6.cn' & @CRLF & _
                '127.0.0.1 simba.6.cn' & @CRLF & _
                '127.0.0.1 union.6.cn' & @CRLF & _
                '#土豆网' & @CRLF & _
                '127.0.0.1 adextensioncontrol.tudou.com' & @CRLF & _
                '127.0.0.1 iwstat.tudou.com' & @CRLF & _
                '127.0.0.1 nstat.tudou.com' & @CRLF & _
                '127.0.0.1 stats.tudou.com' & @CRLF & _
                '127.0.0.1 *.p2v.tudou.com*' & @CRLF & _
                '127.0.0.1 at-img1.tdimg.com' & @CRLF & _
                '127.0.0.1 at-img2.tdimg.com' & @CRLF & _
                '127.0.0.1 at-img3.tdimg.com' & @CRLF & _
                '127.0.0.1 adplay.tudou.com' & @CRLF & _
                '127.0.0.1 adcontrol.tudou.com' & @CRLF & _
                '127.0.0.1 stat.tudou.com' & @CRLF & _
                '#酷6网' & @CRLF & _
                '127.0.0.1 1.allyes.com.cn' & @CRLF & _
                '127.0.0.1 analytics.ku6.com' & @CRLF & _
                '127.0.0.1 gug.ku6cdn.com' & @CRLF & _
                '127.0.0.1 ku6.allyes.com' & @CRLF & _
                '127.0.0.1 ku6afp.allyes.com' & @CRLF & _
                '127.0.0.1 pq.stat.ku6.com' & @CRLF & _
                '127.0.0.1 st.vq.ku6.cn' & @CRLF & _
                '127.0.0.1 stat0.888.ku6.com' & @CRLF & _
                '127.0.0.1 stat1.888.ku6.com' & @CRLF & _
                '127.0.0.1 stat2.888.ku6.com' & @CRLF & _
                '127.0.0.1 stat3.888.ku6.com' & @CRLF & _
                '127.0.0.1 static.ku6.com' & @CRLF & _
                '127.0.0.1 v0.stat.ku6.com' & @CRLF & _
                '127.0.0.1 v1.stat.ku6.com' & @CRLF & _
                '127.0.0.1 v2.stat.ku6.com' & @CRLF & _
                '127.0.0.1 v3.stat.ku6.com' & @CRLF & _
                '#激动网' & @CRLF & _
                '127.0.0.1 86file.megajoy.com' & @CRLF & _
                '127.0.0.1 86get.joy.cn' & @CRLF & _
                '127.0.0.1 86log.joy.cn' & @CRLF & _
                '#天线视频' & @CRLF & _
                '127.0.0.1 casting.openv.com' & @CRLF & _
                '127.0.0.1 m.openv.tv' & @CRLF & _
                '127.0.0.1 uniclick.openv.com' & @CRLF & _
                '#迅雷看看屏蔽：' & @CRLF & _
                '127.0.0.1 mcfg.sandai.net' & @CRLF & _
                '127.0.0.1 biz5.sandai.net' & @CRLF & _
                '127.0.0.1 server1.adpolestar.net' & @CRLF & _
                '127.0.0.1 advstat.xunlei.com' & @CRLF & _
                '127.0.0.1 mpv.sandai.net' & @CRLF
MsgBox(0, '以下为要屏蔽广告地址', $Str, 3)
_s_host(@SystemDir & "\drivers\etc\hosts")
_static(@AppDataDir & "\Macromedia\Flash Player\#SharedObjects")
Run(@ProgramFilesDir & "\Internet Explorer\iexplore.exe http://v.youku.com/v_show/id_XMjI0Njc0MzY0.html")
 
Func _s_host($t0)
        If $t0 = -1 Then Return -1
        FileSetAttrib($t0, "-RSAH")
        $String = FileRead($t0)
        FileWrite($t0, @CRLF & $Str)
        FileClose($t0)
        FileSetAttrib($t0, "+RSAH")
EndFunc   ;==>_s_host
 
Func _static($t2)
        $tt = FileFindFirstFile($t2 & "\*.*")
        If $tt = -1 Then Return -1
        While 1
                $t1 = FileFindNextFile($tt)
                If @error Then
                        FileClose($tt)
                        Return
                ElseIf $t1 = "." Or $t1 = ".." Then
                        ContinueLoop
                ElseIf StringInStr(FileGetAttrib($t2 & "\" & $t1), "D") Then
                        _static($t2 & "\" & $t1)
                EndIf
                If StringInStr($t1, "static.youku.com") Then
                        $t3 = $t2 & "\" & $t1
                        DirRemove($t3, 1)
                        FileCopy("C:\boot.ini", $t3)
                        FileSetAttrib($t3, "+RHS")
                EndIf
        WEnd
EndFunc   ;==>_static