#Region ;**** 参数创建于 ACNWrapper_GUI ****
#PRE_Icon=N:\翻墙\谷歌浏览器\GoAgent.ico
#PRE_Outfile=GoAgent写帐号.exe
#PRE_UseUpx=n
#PRE_Res_requestedExecutionLevel=None
#EndRegion ;**** 参数创建于 ACNWrapper_GUI ****
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <GuiIPAddress.au3>
#include <Process.au3>
#include <APIConstants.au3>
#include <GuiButton.au3>
#include <WindowsConstants.au3>
#include <GuiConstants.au3>

Global  $appid1 = " zhqf2001|zhqf2002|zhqf2003|zhqf2004|zhqf2005|zhqf2007|zhqf2008|zhqf2009|zhqf2010|zhqf2011|"
Global  $appid2 = "zhqf2012|zhqf2014|zhqf2015|zhqf2016|zhqf2017|zhqf2019|zhqf2021|zhqf2022|zhqf2023|zhqf2024|"
Global  $appid3 = "zhqf2025|zhqf2026|zhqf2027|zhqf2028|zhqf2029|"
Global  $appid4 = "xz00311|xz0031140|xiaozhan40|xiaozhan5201314|5201314xiaozhan|xiaozhan0031140|xiaozhanliyu|"
Global  $appid5 = "xiaozhanjiaming|liyuning5201314|xiaozhanliyuning|"
Global  $appid6 = "xzxiaozhan|zxxiaozhan|xz0031158|xzhanxiao|zxzhanxiao|zxc0031140|xx0031140|xx0031158|zz0031140|"
Global  $appid7 = "zz0031158|cc0031140|cc0031158|vv0031140|vv0031158|sb0031140|"
Global  $appid8 = _ID()
Global  $appid9 = _ID1()
Global  $appid10 = _ID2()
Global  $appid11 = _ID3()
Global  $appid =  $appid1 & $appid2 & $appid3 & $appid4 & $appid5 & $appid6 & $appid7; & $appid8 & $appid9 & $appid10 & $appid11
Global  $MARk_1     = 0
Global $DEFAULTINPUTDATA_1   = "点击这里输入proxy.ini路径"
Global $NONEAACTIVECOLOR    = 0x989898
$GUI_1 = GUICreate("GoAgent写帐号", 251, 106, 192, 125)
$Button1 = GUICtrlCreateButton("确定", 50, 58, 150, 35,$WS_GROUP)
$Input1 = GUICtrlCreateInput($DEFAULTINPUTDATA_1, 32, 16, 185, 25)
GUICtrlSetColor(-1, $NONEAACTIVECOLOR)

GUISetState(@SW_SHOW)

While 1
	_CheckInput($GUI_1, $Input1, "点击这里输入proxy.ini路径", $DEFAULTINPUTDATA_1, $MARK_1)
	$nMsg = GUIGetMsg()
	Select
		Case $nMsg = $GUI_EVENT_CLOSE
			Exit
		Case $nMsg = $Button1
			IniWrite(GUICtrlRead($Input1) & "\proxy.ini", "gae","validate "," 1")
			IniWrite(GUICtrlRead($Input1) & "\proxy.ini", "php","validate "," 1")
			FileDelete(GUICtrlRead($Input1) & "\CA.crt")
			IniWrite(GUICtrlRead($Input1) & "\proxy.ini", "gae","appid",$appid)
			$readID = _IniRead(GUICtrlRead($Input1) & "\proxy.ini", "gae","appid","NOID")
			$ID = " " & $readID
			If $ID = $appid Then
				Exit
			EndIf	
	EndSelect
WEnd
	
Func _CheckInput($hWnd, $ID, $InputDefText, ByRef $DefaultInputData, ByRef $Mark)
    If $Mark = 0 And _IsFocused($hWnd, $ID) And $DefaultInputData = $InputDefText Then
        $Mark = 1
        GUICtrlSetData($ID, "")
        GUICtrlSetColor($ID, 0x000000)
        $DefaultInputData = ""
    ElseIf $Mark = 1 And Not _IsFocused($hWnd, $ID) And $DefaultInputData = "" And GUICtrlRead($ID) = "" Then
        $Mark = 0
        $DefaultInputData = $InputDefText
        GUICtrlSetData($ID, $DefaultInputData)
        GUICtrlSetColor($ID, $NONEAACTIVECOLOR)
    EndIf
EndFunc

Func _IsFocused($hWnd, $nCID)
    Return ControlGetHandle($hWnd, '', $nCID) = ControlGetHandle($hWnd, '', ControlGetFocus($hWnd))
EndFunc



Func _ID()
Global  $DID = "wowdonate-edg-01|wowdonate-edg-03|wowdonate-edg-04|wowdonate-edg-05|wowdonate-edg-06|wowdonate-edg-07|wowdonate-edg-09|" & _
			   "wowdonate-hj-01|wowdonate-hj-03|wowdonate-hj-05|wowdonate-hj-08|wowdonate-hj-09|youxiang0123|youxiang01231|youxiang012310|" & _
			   "youxiang01232|youxiang012341|youxiang01235|youxiang01236|youxiang01238|youxiang01239|youxiang19000|youxiang190001|youxiang190002|" & _
			   "youxiang190003|youxiang190004|youxiang190005|youxiang190007|youxiang190008|youxiang190009|wowdonate-badboy-01|wowdonate-badboy-02|" & _
			   "wowdonate-badboy-03|wowdonate-badboy-04|wowdonate-badboy-05|wowdonate-badboy-06|wowdonate-badboy-07|wowdonate-badboy-08|" & _
			   "wowdonate-badboy-09|wowdonate-badboy-10|wowdonate-ceec-01|wowdonate-ceec-02|wowdonate-ceec-03|wowdonate-ceec-04|wowdonate-ceec-05|" & _
			   "wowdonate-ceec-06|wowdonate-ceec-07|wowdonate-ceec-08|wowdonate-ceec-09|wowdonate-ceec-10|wowdonate-100-01|wowdonate-100-02|" & _
			   "wowdonate-100-00|wowdonate-100-04|wowdonate-100-05|wowdonate-100-06|wowdonate-100-07|wowdonate-100-08|wowdonate-100-09|wowdonate-100-10|" & _
			   "wowdonate-sx-00|wowdonate-sx-01|wowdonate-sx-02|wowdonate-sx-03|wowdonate-sx-04|wowdonate-sx-06|wowdonate-sx-07|wowdonate-sx-08|" & _
			   "wowdonate-sx-09|wowdonate-sx-11|wowdonate-sx-12|wowdonate-sx-13|wowdonate-sx-16|wowdonate-sx-17|wowdonate-sx-18|wowdonate-sx-20|" & _
			   "wowdonate-sx-21|wowdonate-sofa-01|wowdonate-sofa-02|wowdonate-sofa-03|wowdonate-sofa-04|wowdonate-sofa-05|wowdonate-sofa-06|" & _
			   "wowdonate-sofa-07|wowdonate-sofa-08|wowdonate-sofa-09|wowdonate-sofa-10|wowdonate-sofa-11|wowdonate-sofa-12|wowdonate-sofa-13|" & _
			   "wowdonate-sofa-14|wowdonate-sofa-15|wowdonate-sofa-16|wowdonate-sofa-17|wowdonate-sofa-19|wowdonate-sofa-20|wowdonate-sofa-21|" & _
			   "wowdonate-sofa-22|wowdonate-lvp-01|wowdonate-lvp-02|wowdonate-lvp-03|wowdonate-lvp-04|wowdonate-lvp-05|wowdonate-lvp-06|wowdonate-lvp-07|" & _
			   "wowdonate-lvp-08|wowdonate-lvp-09|wowdonate-lvp-11|wowdonate-lvp-13|wowdonate-lvp-14|wowdonate-lvp-15|wowdonate-lvp-16|wowdonate-lvp-17|" & _
			   "wowdonate-lvp-18|wowdonate-lvp-19|wowdonate-lvp-20|wowdonate-fuyong-01|wowdonate-fuyong-02|wowdonate-fuyong-04|wowdonate-fuyong-05|" & _
			   "wowdonate-fuyong-06|wowdonate-fuyong-07|wowdonate-fuyong-08|wowdonate-fuyong-09|wowdonate-fuyong-10|sfuyong6|sfuyong8|wowdonate-tts-01|" & _
			   "wowdonate-tts-02|wowdonate-tts-03|wowdonate-tts-04|wowdonate-tts-05|wowdonate-tts-06|wowdonate-tts-07|wowdonate-tts-08|wowdonate-tts-09|" & _
			   "wowdonate-tts-10|wowdonate-tts-11|wowdonate-tts-13|wowdonate-tts-14|wowdonate-tts-15|wowdonate-tts-16|wowdonate-tts-17|wowdonate-tts-18|" & _
			   "wowdonate-tts-19|wowdonate-tts-20|wowdonate-tts-21|wowdonate-tts-22|wowdonate-tts-23|wowdonate-tts-24|wowdonate-tts-25|wowdonate-tts-26|" & _
			   "wowdonate-tts-27|wowdonate-tts-28|wowdonate-tts-29|wowdonate-tts-30|wowdonate-sd-01|wowdonate-sd-02|wowdonate-sd-03|wowdonate-sd-04|" & _
			   "wowdonate-sd-05|wowdonate-sd-06|wowdonate-sd-07|wowdonate-sd-08|wowdonate-sd-09|wowdonate-sd-10|wowdonate-sd-11|wowdonate-sd-12|" & _
			   "wowdonate-sd-13|wowdonate-sd-14|wowdonate-sd-15|wowdonate-sd-16|wowdonate-sd-17|wowdonate-sd-18|wowdonate-sd-19|wowdonate-sd-20|" & _
			   "wowdonate-sd-21|wowdonate-sd-22|wowdonate-sd-24|wowdonate-sd-25|wowdonate-sd-26|wowdonate-sd-27|wowdonate-sd-28|wowdonate-sd-29|" & _
			   "wowdonate-sd-30|wowdonate-sd-31|wowdonate-sd-32|wowdonate-sd-33|wowdonate-sd-34|wowdonate-sd-35|wowdonate-sd-36|wowdonate-sd-37|" & _
			   "wowdonate-sd-38|wowdonate-sd-39|wowdonate-sd-40|wowdonate-ch-01|wowdonate-ch-02|wowdonate-ch-03|wowdonate-ch-04|wowdonate-ch-05|" & _
			   "wowdonate-ch-06|wowdonate-ch-07|wowdonate-ch-08|wowdonate-ch-09|wowdonate-ch-10|wowdonate-ch-11|wowdonate-ch-12|wowdonate-ch-13|" & _
			   "wowdonate-ch-14|wowdonate-ch-15|wowdonate-ch-16|wowdonate-ch-17|wowdonate-ch-18|wowdonate-ch-19|wowdonate-ch-20|wowdonate-ch-21|" & _
			   "wowdonate-ch-22|wowdonate-ch-24|wowdonate-ch-25|wowdonate-ch-26|wowdonate-ch-27|wowdonate-ch-28|wowdonate-ch-29|wowdonate-ch-30|" & _
			   "wowdonate-ch-31|wowdonate-ch-32|wowdonate-ch-33|wowdonate-ch-34|wowdonate-ch-35|wowdonate-ch-36|wowdonate-ch-37|wowdonate-ch-38|" & _
			   "wowdonate-ch-39|wowdonate-ch-40|wowdonate-ch-41|wowdonate-ch-42|wowdonate-ch-43|wowdonate-ch-44|wowdonate-ch-45|wowdonate-ch-46|" & _
			   "wowdonate-ch-47|wowdonate-ch-48|wowdonate-ch-49|wowdonate-ch-50|wowdonate-ch-51|wowdonate-ch-52|wowdonate-ch-53|wowdonate-ch-54|" & _
			   "wowdonate-ch-55|wowdonate-ch-56|wowdonate-ch-57|wowdonate-ch-58|wowdonate-ch-59|wowdonate-ch-60|wowdonate-ch-61|wowdonate-ch-62|" & _
			   "wowdonate-ch-63|wowdonate-ch-64|wowdonate-ch-65|wowdonate-ch-66|wowdonate-ch-67|wowdonate-ch-68|wowdonate-ch-69|wowdonate-ch-70|" & _
			   "wowdonate-ch-71|wowdonate-ch-72|wowdonate-ch-73|wowdonate-ch-74|wowdonate-ch-75|wowdonate-ch-76|wowdonate-ch-77|wowdonate-ch-78|" & _
			   "wowdonate-ch-79|wowdonate-ch-80|wowdonate-m18-01|wowdonate-m18-02|wowdonate-m18-03|wowdonate-m18-05|wowdonate-m18-06|wowdonate-m18-07|" & _
			   "wowdonate-m18-08|wowdonate-m18-09|wowdonate-m18-10|wowdonate-m18-11|wowdonate-m18-12|wowdonate-m18-13|wowdonate-m18-14|wowdonate-m18-15|" & _
			   "wowdonate-m18-16|wowdonate-m18-17|wowdonate-m18-18|wowdonate-m18-19|wowdonate-m18-20|wowdonate-m18-21|wowdonate-m18-22|wowdonate-m18-23|" & _
			   "wowdonate-m18-24|wowdonate-m18-25|wowdonate-m18-26|wowdonate-m18-27|wowdonate-m18-28|wowdonate-m18-29|wowdonate-m18-30|wowdonate-m18-31|" & _
			   "wowdonate-m18-32|wowdonate-m18-33|wowdonate-m18-34|wowdonate-m18-35|wowdonate-m18-36|wowdonate-m18-37|wowdonate-m18-38|wowdonate-m18-39|" & _
			   "wowdonate-m18-40|wowdonate-m18-41|wowdonate-m18-42|wowdonate-m18-43|wowdonate-m18-44|wowdonate-m18-45|wowdonate-m18-46|wowdonate-m18-47|" & _
			   "wowdonate-m18-48|wowdonate-m18-49|wowdonate-m18-50|wowdonate-m18-51|wowdonate-m18-52|wowdonate-m18-53|wowdonate-m18-54|wowdonate-m18-55|" & _
			   "wowdonate-m18-56|wowdonate-m18-57|wowdonate-m18-58|wowdonate-m18-59|wowdonate-m18-60|wowdonate-m18-61|wowdonate-m18-62|wowdonate-m18-63|" & _
			   "wowdonate-m18-64|wowdonate-m18-65|wowdonate-m18-66|wowdonate-m18-67|wowdonate-m18-68|wowdonate-m18-69|wowdonate-m18-70|ttphc10|ttphc9|ttphc8|" & _
			   "ttphc7|ttphc6|ttphc5|nbslf11|nbslf9|nbslf8|nbslf7|nbslf6|intoskip5|intoskip6|intoskip7|intoskip8|intoskip9|pdslzq5|pdslzq6|pdslzq7|pdslzq8|" & _
			   "pdslzq9|1.sbgfwsbgfwsbgfw|agfw-server-2|agfw-server-3|agfw-server-4|clannadvbtco|clannadvbtcozzh|clannadzzhvbtco|gfwsbgfwsbgfwsb|goagent-go-1" & _
			   "|goagent-public-2|gonggongid02|gonggongid16|huang0zijian|icezero0003|icezero0005|icezero0006|icezero0008|icezero0010|jass-button-1|jk9084s-01|" & _
			   "jk9084s-02|jk9084s-07|jk9084s-08|jk9084s-10|jpj4register3|kawaiiushio3|laiguo123|mhyeah-comeforu-006|mhyeah-comeforu-009|moya21928|moyc21928|" & _
			   "ok126-comeforu-010|okadm-comeforu-005|okadm-comeforu-009|okp163-comeforu-007|okp163-comeforu-008|overwall3444|overwallbeta|overwallchina|" & _
			   "overwallchrome|overwallcnzz|overwalldev|overwallfbx|overwallfour|overwallgo|overwalljp|overwallmax|overwallomg|overwallone|overwallorz|" & _
			   "overwallpress|overwallpro|overwallproz|overwallpt|overwalls1|overwalls3444|overwallstable|overwallthree|overwalltmd|overwalltwo|overwallxm|" & _
			   "pbgly-comeforu-008|publicgoagent3|publicgoagent4|publicgoagent5|publicgoagent6|publicgoagent7|publicgoagent8|publicwallproxy1|publicwallproxy2|" & _
			   "publicwallproxy3|publicwallproxy4|qq997-comeforu-006|qq997-comeforu-007|rest126-comeforu-002|s-g9085h-02|s-g9085h-03|s-g9085h-04|s-g9085h-06|" & _
			   "s-g9085h-07|s-g9085h-10|starballl2|starballl3|starballl4|starballl7|vbtcoclannad|vbtcoclannadzzh|vbtcozzh|vbtcozzhclannad|vi88com1|vi88com2|" & _
			   "vi88com3|vi88com6|vi88com7|vi88com|x9088-sz-02|x9088-sz-03|x9088-sz-04|x9088-sz-05|x9088-sz-06|x9088-sz-08|x9088-sz-09|x9088-sz-10|" & _
			   "xinxijishuwyq22|xinxijishuwyq23|zzhclannadvbtco|zzhvbtco|zzhvbtcoclannad|cielo032018|cielo032019|cielo032020|cielo032021|cielo032022|" & _
			   "cielo032023|cielo032024|cielo032025|cielo032026|xideassassin1|xideassassin2|xideassassin3|xideassassin4|xideassassin5|xideassassin6|" & _
			   "xideassassin7|xideassassin8|xideassassin9|goagentplus001|lovejiani001|lovejiani002|lovejiani004|lovejiani005|lovejiani006|lovejiani007|" & _
			   "lovejiani008|lovejiani009|lovejiani010|lovejiani011|lovejiani012|lovejiani013|lovejiani014|lovejiani016|lovejiani017|lovejiani018|lovejiani019|" & _
			   "lovejiani020|lovejiani021|lovejiani022|lovejiani023|lovejiani024|lovejiani025|lovejiani026|lovejiani027|lovejiani028|lovejiani029|lovejiani030|" & _
			   "lovejiani031|lovejiani032|lovejiani033|lovejiani034|lovejiani035|lovejiani036|lovejiani037|lovejiani038|lovejiani039|lovejiani040|lovejiani041|" & _
			   "lovejiani043|lovejiani044|lovejiani044|lovejiani045|lovejiani046|lovejiani047|lovejiani048|lovejiani049|lovejiani050|lovejiani051|lovejiani052|" & _
			   "lovejiani053|lovejiani054|lovejiani055|lovejiani056|lovejiani057|lovejiani058|lovejiani059|lovejiani060|lovejiani061|lovejiani062|lovejiani063|" & _
			   "lovejiani0641|lovejiani064|lovejiani065|lovejiani066|lovejiani067|lovejiani068|lovejiani069|lovejiani070|lovejiani071|gfw4679|gfw46792|gfw46793|" & _
			   "gfw46794|gfw46795|gfw46796|gfw46797|smartladder000|smartladder001|smartladder002|smartladder003|smartladder004|smartladder005|smartladder006|" & _
			   "smartladder007|smartladder008|smartladder009|smartladder010|smartladder012|smartladder013|smartladder014|smartladder015|smartladder016|" & _
			   "smartladder017|smartladder018|smartladder019|xk8581221761|qq362569870|stepfordcuckoos01|stepfordcuckoos02|stepfordcuckoos03|stepfordcuckoos05|" & _
			   "stepfordcuckoos06|stepfordcuckoos07|stepfordcuckoos08|stepfordcuckoos09|ccinter0001|ccinter0002|ccinter0003|ccinter0004|ccinter0005|ccinter0006|" & _
			   "ccinter0007|ccinter0008|ccinter0009|ccinterccinter01|ccinterccinter02|ccinterccinter03|ccinterccinter04|ccinterccinter05|ccinterccinter06|" & _
			   "ccinterccinter07|ccinterccinter08|ccinterccinter09|ccinterccinter10|adreno301|firefox16tnzi7cny|firefox44xtm6vq41|firefox534lmhb381|" & _
			   "firefox76934jhr78|firefox91m5kw7yl8|firefoxe5z75o5738|firefoxg3aevis61x|firefoxgw3ca2iyyu|firefoxturlzxw3q8|firefoxqwitsu932v|" & _
			   "firefoxsxl8659r6s|firefoxi1o5x14b65|firefoxpp33yn817l|firefoxya33sd1x8s|firefoxyht2i2252b|sim381563875|simpleyeah10|adreno301|" & _
			   "zha134501|zha134502|zha134503|zha134504|zha134505|zha134506|zha134507|zha134508|zha134509|avalonbbb|avalonbbbb|avalonbbbbb|avalonbbbbbb|" & _
			   "avalonbbbbbbb|jzzzz3|jzzzz333|jzzzz333333|jzzzz3333333|jzzzz33333333|akajoe000|akajoe001|akajoe002|akajoe003|akajoe004|akajoe005|akajoe006|" & _
			   "akajoe007|akajoe008|akajoe009|yimadeaq|yimadeaw|yimadeae|yimadear|yimadeat|yimadeay|yimadeau|yimadeai|yimadeao|yimadeap|pp19900521|" & _
			   "pp19900621|freegoagent001|freegoagent002|freegoagent003|freegoagent004|freegoagent005|freegoagent006|freegoagent007|freegoagent008|" 
		Return $DID
EndFunc		
	
Func _ID1()
Global  $DID1 = "freegoagent009|freegoagent010|freegoagent011|freegoagent012|freegoagent013|freegoagent014|freegoagent015|freegoagent016|freegoagent017|" & _
			   "freegoagent018|freegoagent019|freegoagent020|freegoagent021|freegoagent022|freegoagent023|freegoagent024|freegoagent025|freegoagent026|" & _
			   "freegoagent027|freegoagent028|freegoagent029|freegoagent030|freegoagent031|freegoagent032|freegoagent033|freegoagent034|freegoagent035|" & _
			   "freegoagent036|freegoagent037|freegoagent038|freegoagent039|freegoagent040|freegoagent041|freegoagent042|freegoagent043|freegoagent044|" & _
			   "freegoagent045|freegoagent046|freegoagent047|freegoagent048|freegoagent049|freegoagent050|freegoagent051|freegoagent052|freegoagent053|" & _
			   "freegoagent054|freegoagent055|freegoagent056|freegoagent057|freegoagent058|freegoagent059|freegoagent060|freegoagent061|freegoagent062|" & _
			   "freegoagent063|freegoagent064|freegoagent065|freegoagent066|freegoagent067|freegoagent068|freegoagent069|freegoagent070|freegoagent071|" & _
			   "freegoagent072|freegoagent073|freegoagent074|freegoagent075|freegoagent076|freegoagent077|freegoagent078|freegoagent079|freegoagent080|" & _
			   "freegoagent081|freegoagent082|freegoagent083|freegoagent084|freegoagent085|freegoagent086|freegoagent087|freegoagent088|freegoagent089|" & _
			   "freegoagent090|freegoagent091|freegoagent092|freegoagent093|freegoagent094|freegoagent095|freegoagent096|freegoagent097|freegoagent098|" & _
			   "freegoagent099|freegoagent100|freegoagent101|freegoagent102|freegoagent103|freegoagent104|freegoagent105|freegoagent106|freegoagent107|" & _
			   "freegoagent108|freegoagent109|freegoagent110|freegoagent121|freegoagent122|freegoagent124|freegoagent125|freegoagent126|freegoagent127|" & _
			   "freegoagent128|freegoagent129|freegoagent130|freegoagent131|freegoagent132|freegoagent133|freegoagent134|freegoagent135|freegoagent136|" & _
			   "freegoagent137|freegoagent138|freegoagent139|freegoagent140|freegoagent141|freegoagent142|freegoagent143|freegoagent144|freegoagent145|" & _
			   "freegoagent146|freegoagent147|freegoagent148|freegoagent149|freegoagent150|freegoagent151|freegoagent152|freegoagent153|freegoagent154|" & _
			   "freegoagent155|freegoagent156|freegoagent157|freegoagent158|freegoagent159|freegoagent160|freegoagent161|freegoagent162|freegoagent163|" & _
			   "freegoagent164|freegoagent165|freegoagent166|freegoagent167|freegoagent168|freegoagent169|freegoagent170|freegoagent171|freegoagent172|" & _
			   "freegoagent173|freegoagent174|freegoagent175|freegoagent176|freegoagent177|freegoagent178|freegoagent179|freegoagent180|freegoagent181|" & _
			   "freegoagent182|freegoagent183|freegoagent184|freegoagent185|freegoagent186|freegoagent187|freegoagent188|freegoagent189|freegoagent190|" & _
			   "freegoagent191|freegoagent192|freegoagent193|freegoagent194|freegoagent195|freegoagent196|freegoagent197|freegoagent198|freegoagent199|" & _
			   "freegoagent200|freegoagent201|freegoagent202|freegoagent203|freegoagent204|freegoagent205|freegoagent206|freegoagent207|freegoagent208|" & _
			   "freegoagent209|freegoagent210|freegoagent211|freegoagent212|freegoagent213|freegoagent214|freegoagent215|freegoagent216|freegoagent217|" & _
			   "freegoagent218|freegoagent219|freegoagent220|freegoagent221|freegoagent222|freegoagent223|freegoagent224|freegoagent225|freegoagent226|" & _
			   "freegoagent227|freegoagent228|freegoagent229|freegoagent230|freegoagent231|freegoagent232|freegoagent233|freegoagent234|freegoagent235|" & _
			   "freegoagent236|freegoagent237|freegoagent238|freegoagent239|freegoagent240|freegoagent241|freegoagent242|freegoagent243|freegoagent244|" & _
			   "freegoagent245|freegoagent246|freegoagent247|freegoagent248|freegoagent249|freegoagent250|freegoagent251|freegoagent252|freegoagent253|" & _
			   "freegoagent254|freegoagent255|freegoagent256|freegoagent257|freegoagent258|freegoagent259|freegoagent260|freegoagent261|freegoagent262|" & _
			   "freegoagent263|freegoagent264|freegoagent265|freegoagent266|freegoagent267|freegoagent268|freegoagent269|freegoagent270|freegoagent271|" & _
			   "freegoagent272|freegoagent273|freegoagent274|freegoagent275|freegoagent276|freegoagent277|freegoagent278|freegoagent279|freegoagent280|" & _
			   "freegoagent281|freegoagent282|freegoagent283|freegoagent284|freegoagent285|freegoagent286|freegoagent287|freegoagent288|freegoagent289|" & _
			   "freegoagent290|freegoagent291|freegoagent292|freegoagent293|freegoagent294|freegoagent295|freegoagent296|freegoagent297|freegoagent298|" & _
			   "freegoagent299|freegoagent300|freegoagent301|freegoagent302|freegoagent303|freegoagent304|freegoagent305|freegoagent306|freegoagent307|" & _
			   "freegoagent308|freegoagent309|freegoagent310|freegoagent311|freegoagent312|freegoagent313|freegoagent314|freegoagent315|freegoagent316|" & _
			   "freegoagent317|freegoagent318|freegoagent319|freegoagent320|freegoagent321|freegoagent322|freegoagent323|freegoagent324|freegoagent325|" & _
			   "freegoagent326|freegoagent327|freegoagent328|freegoagent329|freegoagent330|freegoagent331|freegoagent332|freegoagent333|freegoagent334|" & _
			   "freegoagent335|freegoagent336|freegoagent337|freegoagent338|freegoagent339|freegoagent340|freegoagent341|freegoagent342|freegoagent343|" & _
			   "freegoagent344|freegoagent345|freegoagent346|freegoagent347|freegoagent348|freegoagent349|freegoagent350|freegoagent351|freegoagent352|" & _
			   "freegoagent353|freegoagent354|freegoagent355|freegoagent356|freegoagent357|freegoagent358|freegoagent359|freegoagent360|freegoagent361|" & _
			   "freegoagent362|freegoagent363|freegoagent364|freegoagent365|freegoagent366|freegoagent367|freegoagent368|freegoagent369|freegoagent370|" & _
			   "freegoagent371|freegoagent372|freegoagent373|freegoagent374|freegoagent375|freegoagent376|freegoagent377|freegoagent378|freegoagent379|" & _
			   "freegoagent380|freegoagent381|freegoagent382|freegoagent383|freegoagent384|freegoagent385|freegoagent386|freegoagent387|freegoagent388|" & _
			   "freegoagent389|freegoagent390|freegoagent391|freegoagent392|freegoagent393|freegoagent394|freegoagent395|freegoagent396|freegoagent397|" & _
			   "freegoagent398|freegoagent399|freegoagent400|freegoagent401|freegoagent402|freegoagent403|freegoagent404|freegoagent405|freegoagent406|" & _
			   "freegoagent407|freegoagent408|freegoagent409|freegoagent410|freegoagent411|freegoagent412|freegoagent413|freegoagent414|freegoagent415|" & _
			   "freegoagent416|freegoagent417|freegoagent418|freegoagent419|freegoagent420|freegoagent421|freegoagent422|freegoagent423|freegoagent424|" & _
			   "freegoagent425|freegoagent426|freegoagent427|freegoagent428|freegoagent429|freegoagent430|freegoagent431|freegoagent432|freegoagent433|" & _
			   "freegoagent434|freegoagent435|freegoagent436|freegoagent437|freegoagent438|freegoagent439|freegoagent440|freegoagent441|freegoagent442|" & _
			   "freegoagent443|freegoagent444|freegoagent445|freegoagent446|freegoagent447|freegoagent448|freegoagent449|freegoagent450|freegoagent451|" & _
			   "freegoagent452|freegoagent453|freegoagent454|freegoagent455|freegoagent456|freegoagent457|freegoagent458|freegoagent459|freegoagent460|" & _
			   "freegoagent461|freegoagent462|freegoagent463|freegoagent464|freegoagent465|freegoagent466|freegoagent467|freegoagent468|freegoagent469|" & _
			   "freegoagent470|freegoagent471|freegoagent472|freegoagent473|freegoagent474|freegoagent475|freegoagent476|freegoagent477|freegoagent478|" & _
			   "freegoagent479|freegoagent480|freegoagent481|freegoagent482|freegoagent483|freegoagent484|freegoagent485|freegoagent486|freegoagent487|" & _
			   "freegoagent488|freegoagent489|freegoagent490|freegoagent491|freegoagent492|freegoagent493|freegoagent494|freegoagent495|freegoagent496|" & _
			   "freegoagent497|freegoagent498|freegoagent499|freegoagent500|freegoagent501|freegoagent502|freegoagent503|freegoagent504|freegoagent505|" & _
			   "freegoagent506|freegoagent507|freegoagent508|freegoagent509|freegoagent510|freegoagent511|freegoagent512|freegoagent513|freegoagent514|" & _
			   "freegoagent515|freegoagent516|freegoagent517|freegoagent518|freegoagent519|freegoagent520|freegoagent521|freegoagent522|freegoagent523|" & _
			   "freegoagent524|freegoagent525|freegoagent526|freegoagent527|freegoagent528|freegoagent529|freegoagent530|freegoagent531|freegoagent532|" & _
			   "freegoagent533|freegoagent534|freegoagent535|freegoagent536|freegoagent537|freegoagent538|freegoagent539|freegoagent540|freegoagent541|" & _
			   "freegoagent542|freegoagent543|freegoagent544|freegoagent545|freegoagent546|freegoagent547|freegoagent548|freegoagent549|freegoagent550|" & _
			   "freegoagent551|freegoagent552|freegoagent553|freegoagent554|freegoagent555|freegoagent556|freegoagent557|freegoagent558|freegoagent559|" & _
			   "freegoagent560|freegoagent561|freegoagent562|freegoagent563|freegoagent564|freegoagent565|freegoagent566|freegoagent567|freegoagent568|" & _
			   "freegoagent569|freegoagent570|freegoagent571|freegoagent572|freegoagent573|freegoagent574|freegoagent575|freegoagent576|freegoagent577|" & _
			   "freegoagent578|freegoagent579|freegoagent580|freegoagent581|freegoagent582|freegoagent583|freegoagent584|freegoagent585|freegoagent586|" & _
			   "freegoagent587|freegoagent588|freegoagent589|freegoagent590|freegoagent591|freegoagent592|freegoagent593|freegoagent594|freegoagent595|" & _
			   "freegoagent596|freegoagent597|freegoagent598|freegoagent599|freegoagent600|freegoagent601|freegoagent602|freegoagent603|freegoagent604|" & _
			   "freegoagent605|freegoagent606|freegoagent607|freegoagent608|freegoagent609|freegoagent610|freegoagent611|freegoagent612|freegoagent613|" & _
			   "freegoagent614|freegoagent615|freegoagent616|freegoagent617|freegoagent618|freegoagent619|freegoagent620|freegoagent621|freegoagent622|" & _
			   "freegoagent623|freegoagent624|freegoagent625|freegoagent626|freegoagent627|freegoagent628|freegoagent629|freegoagent630|freegoagent631|" & _
			   "freegoagent632|freegoagent633|freegoagent634|freegoagent635|freegoagent636|freegoagent637|freegoagent638|freegoagent639|freegoagent640|" & _
			   "freegoagent641|freegoagent642|freegoagent643|freegoagent644|freegoagent645|freegoagent646|freegoagent647|freegoagent648|freegoagent649|" & _
			   "freegoagent650|freegoagent651|freegoagent652|freegoagent653|freegoagent654|freegoagent655|freegoagent656|freegoagent657|freegoagent658|" & _
			   "freegoagent659|freegoagent660|freegoagent661|freegoagent662|freegoagent663|freegoagent664|freegoagent665|freegoagent666|freegoagent667|" & _
			   "freegoagent668|freegoagent669|freegoagent670|freegoagent671|freegoagent672|freegoagent673|freegoagent674|freegoagent675|freegoagent676|" & _
			   "freegoagent677|freegoagent678|freegoagent679|freegoagent680|freegoagent681|freegoagent682|freegoagent683|freegoagent684|freegoagent685|" & _
			   "freegoagent686|freegoagent687|freegoagent688|freegoagent689|freegoagent690|freegoagent691|freegoagent692|freegoagent693|freegoagent694|" & _
			   "freegoagent695|freegoagent696|freegoagent697|freegoagent698|freegoagent699|freegoagent700|freegoagent701|freegoagent702|freegoagent703|" & _
			   "freegoagent704|freegoagent705|freegoagent706|freegoagent707|freegoagent708|freegoagent709|freegoagent710|freegoagent711|freegoagent712|" & _
			   "freegoagent713|freegoagent714|freegoagent715|freegoagent716|freegoagent717|freegoagent718|freegoagent719|freegoagent720|freegoagent721|" & _
			   "freegoagent722|freegoagent723|freegoagent724|freegoagent725|freegoagent726|freegoagent727|freegoagent728|freegoagent729|freegoagent730|" & _
			   "freegoagent731|freegoagent732|freegoagent733|freegoagent734|freegoagent735|freegoagent736|freegoagent737|freegoagent738|freegoagent739|" & _
			   "freegoagent740|freegoagent741|freegoagent742|freegoagent743|freegoagent744|freegoagent745|freegoagent746|freegoagent747|freegoagent748|" & _
			   "freegoagent749|freegoagent750|freegoagent751|freegoagent752|freegoagent753|freegoagent754|freegoagent755|freegoagent756|freegoagent757|" & _
			   "freegoagent758|freegoagent759|freegoagent760|freegoagent761|freegoagent762|freegoagent763|freegoagent764|freegoagent765|freegoagent766|" & _
			   "freegoagent767|freegoagent768|freegoagent769|freegoagent770|freegoagent771|freegoagent772|freegoagent773|freegoagent774|freegoagent775|" & _
			   "freegoagent776|freegoagent777|freegoagent778|freegoagent779|freegoagent780|freegoagent781|freegoagent782|freegoagent783|freegoagent784|" & _
			   "freegoagent785|freegoagent786|freegoagent787|freegoagent788|freegoagent789|freegoagent790|freegoagent791|freegoagent792|freegoagent793|" & _
			   "freegoagent794|freegoagent795|freegoagent796|freegoagent797|freegoagent798|freegoagent799|freegoagent800|freegoagent801|freegoagent802|" & _
			   "freegoagent803|freegoagent804|freegoagent805|freegoagent806|freegoagent807|freegoagent808|freegoagent809|freegoagent810|freegoagent811|" & _
			   "freegoagent812|freegoagent813|freegoagent814|freegoagent815|freegoagent817|freegoagent818|freegoagent819|freegoagent820|freegoagent821|" & _
			   "freegoagent822|freegoagent823|freegoagent824|freegoagent825|freegoagent826|freegoagent827|freegoagent828|freegoagent829|freegoagent830|" & _
			   "freegoagent831|freegoagent832|freegoagent833|freegoagent834|freegoagent835|freegoagent836|freegoagent837|freegoagent838|freegoagent839|" & _
			   "freegoagent840|freegoagent841|freegoagent842|freegoagent843|freegoagent844|freegoagent845|freegoagent846|freegoagent847|freegoagent848|" & _
			   "freegoagent849|freegoagent850|freegoagent851|freegoagent852|freegoagent853|freegoagent854|freegoagent855|freegoagent856|freegoagent857|" & _
			   "freegoagent858|freegoagent859|freegoagent860|freegoagent861|freegoagent862|freegoagent863|freegoagent864|freegoagent865|freegoagent866|" & _
			   "freegoagent867|freegoagent868|freegoagent869|freegoagent870|freegoagent871|freegoagent872|freegoagent873|freegoagent874|freegoagent875|" & _
			   "freegoagent876|freegoagent877|freegoagent878|freegoagent879|freegoagent880|freegoagent881|freegoagent882|freegoagent883|freegoagent884|" & _
			   "freegoagent885|freegoagent886|freegoagent887|freegoagent888|freegoagent889|freegoagent890|freegoagent891|freegoagent892|freegoagent893|" & _
			   "freegoagent894|freegoagent895|freegoagent896|freegoagent897|freegoagent898|freegoagent899|freegoagent900|freegoagent901|freegoagent902|" & _
			   "freegoagent903|freegoagent904|freegoagent905|freegoagent906|freegoagent907|freegoagent908|freegoagent909|freegoagent910|freegoagent911|" & _
			   "freegoagent912|freegoagent913|freegoagent914|freegoagent915|freegoagent917|freegoagent918|freegoagent919|freegoagent920|freegoagent921|" & _
			   "freegoagent922|freegoagent923|freegoagent924|freegoagent925|freegoagent926|freegoagent927|freegoagent928|freegoagent929|freegoagent930|" & _
			   "freegoagent931|freegoagent932|freegoagent933|freegoagent934|freegoagent935|freegoagent936|freegoagent937|freegoagent938|freegoagent939|" & _
			   "freegoagent940|freegoagent941|freegoagent942|freegoagent943|freegoagent944|freegoagent945|freegoagent946|freegoagent947|freegoagent948|" & _
			   "freegoagent949|freegoagent950|freegoagent951|freegoagent952|freegoagent953|freegoagent954|freegoagent955|freegoagent956|freegoagent957|" & _
			   "freegoagent958|freegoagent959|freegoagent960|freegoagent961|freegoagent962|freegoagent963|freegoagent964|freegoagent965|freegoagent966|" & _
			   "freegoagent967|freegoagent968|freegoagent969|freegoagent970|freegoagent971|freegoagent972|freegoagent973|freegoagent974|freegoagent975|" & _
			   "freegoagent976|freegoagent977|freegoagent978|freegoagent979|freegoagent980|freegoagent981|freegoagent982|freegoagent983|freegoagent984|" & _
			   "freegoagent985|freegoagent986|freegoagent987|freegoagent988|freegoagent989|freegoagent990|freegoagent991|freegoagent992|freegoagent993|" & _
			   "freegoagent994|freegoagent995|freegoagent996|freegoagent997|freegoagent998|freegoagent999|i8964-001-01|i8964-001-02|i8964-001-03|i8964-001-04|" 
		Return $DID1
EndFunc		
	
Func _ID2()
Global  $DID2 = "i8964-001-05|i8964-001-06|i8964-001-07|i8964-001-08|i8964-001-09|i8964-001-10|i8964-002-01|i8964-002-02|i8964-002-03|i8964-002-04|" & _
			   "i8964-002-05|i8964-002-06|i8964-002-07|i8964-002-08|i8964-002-09|i8964-002-10|i8964-003-01|i8964-003-02|i8964-003-03|i8964-003-04|" & _
			   "i8964-003-05|i8964-003-06|i8964-003-07|i8964-003-08|i8964-003-09|i8964-003-10|i8964-004-01|i8964-004-02|i8964-004-03|i8964-004-04|" & _
			   "i8964-004-05|i8964-004-06|i8964-004-07|i8964-004-08|i8964-004-09|i8964-004-10|i8964-005-01|i8964-005-02|i8964-005-03|i8964-005-04|" & _
			   "i8964-005-05|i8964-005-06|i8964-005-07|i8964-005-08|i8964-005-09|i8964-005-10|i8964-006-01|i8964-006-02|i8964-006-03|i8964-006-04|" & _
			   "i8964-006-05|i8964-006-06|i8964-006-07|i8964-006-08|i8964-006-09|i8964-006-10|i8964-007-01|i8964-007-02|i8964-007-03|i8964-007-04|" & _
			   "i8964-007-05|i8964-007-06|i8964-007-07|i8964-007-08|i8964-007-09|i8964-007-10|i8964-008-01|i8964-008-02|i8964-008-03|i8964-008-04|" & _
			   "i8964-008-05|i8964-008-06|i8964-008-07|i8964-008-08|i8964-008-09|i8964-008-10|i8964-009-01|i8964-009-02|i8964-009-03|i8964-009-04|" & _
			   "i8964-009-05|i8964-009-06|i8964-009-07|i8964-009-08|i8964-009-09|i8964-009-10|i8964-010-01|i8964-010-02|i8964-010-03|i8964-010-04|" & _
			   "i8964-010-05|i8964-010-06|i8964-010-07|i8964-010-08|i8964-010-09|i8964-010-10|i8964-011-01|i8964-011-02|i8964-011-03|i8964-011-04|" & _
			   "i8964-011-05|i8964-011-06|i8964-011-07|i8964-011-08|i8964-011-09|i8964-011-10|i8964-012-01|i8964-012-02|i8964-012-03|i8964-012-04|" & _
			   "i8964-012-05|i8964-012-06|i8964-012-07|i8964-012-08|i8964-012-09|i8964-012-10|i8964-013-01|i8964-013-02|i8964-013-03|i8964-013-04|" & _
			   "i8964-013-05|i8964-013-06|i8964-013-07|i8964-013-08|i8964-013-09|i8964-013-10|i8964-014-01|i8964-014-02|i8964-014-03|i8964-014-04|" & _
			   "i8964-014-05|i8964-014-06|i8964-014-07|i8964-014-08|i8964-014-09|i8964-014-10|i8964-015-01|i8964-015-02|i8964-015-03|i8964-015-04|" & _
			   "i8964-015-05|i8964-015-06|i8964-015-07|i8964-015-08|i8964-015-09|i8964-015-10|i8964-016-01|i8964-016-02|i8964-016-03|i8964-016-04|" & _
			   "i8964-016-05|i8964-016-06|i8964-016-07|i8964-016-08|i8964-016-09|i8964-016-10|i8964-017-01|i8964-017-02|i8964-017-03|i8964-017-04|" & _
			   "i8964-017-05|i8964-017-06|i8964-017-07|i8964-017-08|i8964-017-09|i8964-017-10|i8964-018-01|i8964-018-02|i8964-018-03|i8964-018-04|" & _
			   "i8964-018-05|i8964-018-06|i8964-018-07|i8964-018-08|i8964-018-09|i8964-018-10|i8964-019-01|i8964-019-02|i8964-019-03|i8964-019-04|" & _
			   "i8964-019-05|i8964-019-06|i8964-019-07|i8964-019-08|i8964-019-09|i8964-019-10|i8964-020-01|i8964-020-02|i8964-020-03|i8964-020-04|" & _
			   "i8964-020-05|i8964-020-06|i8964-020-07|i8964-020-08|i8964-020-09|i8964-020-10|i8964-022-01|i8964-022-02|i8964-022-03|i8964-022-04|" & _
			   "i8964-022-05|i8964-022-06|i8964-022-07|i8964-022-08|i8964-022-09|i8964-022-10|i8964-021-01|i8964-021-02|i8964-021-03|i8964-021-04|" & _
			   "i8964-021-05|i8964-021-06|i8964-021-07|i8964-021-08|i8964-021-09|i8964-021-10|i8964-023-01|i8964-023-02|i8964-023-03|i8964-023-04|" & _
			   "i8964-023-05|i8964-023-06|i8964-023-07|i8964-023-08|i8964-023-09|i8964-023-10|i8964-025-01|i8964-025-02|i8964-025-03|i8964-025-04|" & _
			   "i8964-025-05|i8964-025-06|i8964-025-07|i8964-025-08|i8964-025-09|i8964-025-10|i8964-024-01|i8964-024-02|i8964-024-03|i8964-024-04|" & _
			   "i8964-024-05|i8964-024-06|i8964-024-07|i8964-024-08|i8964-024-09|i8964-024-10|i8964-026-01|i8964-026-02|i8964-026-03|i8964-026-04|" & _
			   "i8964-026-05|i8964-026-06|i8964-026-07|i8964-026-08|i8964-026-09|i8964-026-10|i8964-027-01|i8964-027-02|i8964-027-03|i8964-027-04|" & _
			   "i8964-027-05|i8964-027-06|i8964-027-07|i8964-027-08|i8964-027-09|i8964-027-10|i8964-028-01|i8964-028-02|i8964-028-03|i8964-028-04|" & _
			   "i8964-028-05|i8964-028-06|i8964-028-07|i8964-028-08|i8964-028-09|i8964-028-10|i8964-029-01|i8964-029-02|i8964-029-03|i8964-029-04|" & _
			   "i8964-029-05|i8964-029-06|i8964-029-07|i8964-029-08|i8964-029-09|i8964-029-10|i8964-030-01|i8964-030-02|i8964-030-03|i8964-030-04|" & _
			   "i8964-030-05|i8964-030-06|i8964-030-07|i8964-030-08|i8964-030-09|i8964-030-10|i8964-031-01|i8964-031-02|i8964-031-03|i8964-031-04|" & _
			   "i8964-031-05|i8964-031-06|i8964-031-07|i8964-031-08|i8964-031-09|i8964-031-10|i8964-032-01|i8964-032-02|i8964-032-03|i8964-032-04|" & _
			   "i8964-032-05|i8964-032-06|i8964-032-07|i8964-032-08|i8964-032-09|i8964-032-10|i8964-033-01|i8964-033-02|i8964-033-03|i8964-033-04|" & _
			   "i8964-033-05|i8964-033-06|i8964-033-07|i8964-033-08|i8964-033-09|i8964-033-10|i8964-034-01|i8964-034-02|i8964-034-03|i8964-034-04|" & _
			   "i8964-034-05|i8964-034-06|i8964-034-07|i8964-034-08|i8964-034-09|i8964-034-10|i8964-035-01|i8964-035-02|i8964-035-03|i8964-035-04|" & _
			   "i8964-035-05|i8964-035-06|i8964-035-07|i8964-035-08|i8964-035-09|i8964-035-10|i8964-036-01|i8964-036-02|i8964-036-03|i8964-036-04|" & _
			   "i8964-036-05|i8964-036-06|i8964-036-07|i8964-036-08|i8964-036-09|i8964-036-10|i8964-037-01|i8964-037-02|i8964-037-03|i8964-037-04|" & _
			   "i8964-037-05|i8964-037-06|i8964-037-07|i8964-037-08|i8964-037-09|i8964-037-10|i8964-038-01|i8964-038-02|i8964-038-03|i8964-038-04|" & _
			   "i8964-038-05|i8964-038-06|i8964-038-07|i8964-038-08|i8964-038-09|i8964-038-10|i8964-039-01|i8964-039-02|i8964-039-03|i8964-039-04|" & _
			   "i8964-039-05|i8964-039-06|i8964-039-07|i8964-039-08|i8964-039-09|i8964-039-10|i8964-040-01|i8964-040-02|i8964-040-03|i8964-040-04|" & _
			   "i8964-040-05|i8964-040-06|i8964-040-07|i8964-040-08|i8964-040-09|i8964-040-10|i8964-041-01|i8964-041-02|i8964-041-03|i8964-041-04|" & _
			   "i8964-041-05|i8964-041-06|i8964-041-07|i8964-041-08|i8964-041-09|i8964-041-10|i8964-042-01|i8964-042-02|i8964-042-03|i8964-042-04|" & _
			   "i8964-042-05|i8964-042-06|i8964-042-07|i8964-042-08|i8964-042-09|i8964-042-10|i8964-043-01|i8964-043-02|i8964-043-03|i8964-043-04|" & _
			   "i8964-043-05|i8964-043-06|i8964-043-07|i8964-043-08|i8964-043-09|i8964-043-10|i8964-045-01|i8964-045-02|i8964-045-03|i8964-045-04|" & _
			   "i8964-045-05|i8964-045-06|i8964-045-07|i8964-045-08|i8964-045-09|i8964-045-10|i8964-044-01|i8964-044-02|i8964-044-03|i8964-044-04|" & _
			   "i8964-044-05|i8964-044-06|i8964-044-07|i8964-044-08|i8964-044-09|i8964-044-10|i8964-046-01|i8964-046-02|i8964-046-03|i8964-046-04|" & _
			   "i8964-046-05|i8964-046-06|i8964-046-07|i8964-046-08|i8964-046-09|i8964-046-10|i8964-047-01|i8964-047-02|i8964-047-03|i8964-047-04|" & _
			   "i8964-047-05|i8964-047-06|i8964-047-07|i8964-047-08|i8964-047-09|i8964-047-10|i8964-048-01|i8964-048-02|i8964-048-03|i8964-048-04|" & _
			   "i8964-048-05|i8964-048-06|i8964-048-07|i8964-048-08|i8964-048-09|i8964-048-10|i8964-049-01|i8964-049-02|i8964-049-03|i8964-049-04|" & _
			   "i8964-049-05|i8964-049-06|i8964-049-07|i8964-049-08|i8964-049-09|i8964-049-10|i8964-050-01|i8964-050-02|i8964-050-03|i8964-050-04|" & _
			   "i8964-050-05|i8964-050-06|i8964-050-07|i8964-050-08|i8964-050-09|i8964-050-10|i8964-051-01|i8964-051-02|i8964-051-03|i8964-051-04|" & _
			   "i8964-051-05|i8964-051-06|i8964-051-07|i8964-051-08|i8964-051-09|i8964-051-10|i8964-052-01|i8964-052-02|i8964-052-03|i8964-052-04|" & _
			   "i8964-052-05|i8964-052-06|i8964-052-07|i8964-052-08|i8964-052-09|i8964-052-10|i8964-053-01|i8964-053-02|i8964-053-03|i8964-053-04|" & _
			   "i8964-053-05|i8964-053-06|i8964-053-07|i8964-053-08|i8964-053-09|i8964-053-10|i8964-054-01|i8964-054-02|i8964-054-03|i8964-054-04|" & _
			   "i8964-054-05|i8964-054-06|i8964-054-07|i8964-054-08|i8964-054-09|i8964-054-10|i8964-055-01|i8964-055-02|i8964-055-03|i8964-055-04|" & _
			   "i8964-055-05|i8964-055-06|i8964-055-07|i8964-055-08|i8964-055-09|i8964-055-10|i8964-056-01|i8964-056-02|i8964-056-03|i8964-056-04|" & _
			   "i8964-056-05|i8964-056-06|i8964-056-07|i8964-056-08|i8964-056-09|i8964-056-10|i8964-057-01|i8964-057-02|i8964-057-03|i8964-057-04|" & _
			   "i8964-057-05|i8964-057-06|i8964-057-07|i8964-057-08|i8964-057-09|i8964-057-10|i8964-058-01|i8964-058-02|i8964-058-03|i8964-058-04|" & _
			   "i8964-058-05|i8964-058-06|i8964-058-07|i8964-058-08|i8964-058-09|i8964-058-10|i8964-059-01|i8964-059-02|i8964-059-03|i8964-059-04|" & _
			   "i8964-059-05|i8964-059-06|i8964-059-07|i8964-059-08|i8964-059-09|i8964-059-10|i8964-060-01|i8964-060-02|i8964-060-03|i8964-060-04|" & _
			   "i8964-060-05|i8964-060-06|i8964-060-07|i8964-060-08|i8964-060-09|i8964-060-10|i8964-061-01|i8964-061-02|i8964-061-03|i8964-061-04|" & _
			   "i8964-061-05|i8964-061-06|i8964-061-07|i8964-061-08|i8964-061-09|i8964-061-10|i8964-062-01|i8964-062-02|i8964-062-03|i8964-062-04|" & _
			   "i8964-062-05|i8964-062-06|i8964-062-07|i8964-062-08|i8964-062-09|i8964-062-10|i8964-063-01|i8964-063-02|i8964-063-03|i8964-063-04|" & _
			   "i8964-063-05|i8964-063-06|i8964-063-07|i8964-063-08|i8964-063-09|i8964-063-10|i8964-064-01|i8964-064-02|i8964-064-03|i8964-064-04|" & _
			   "i8964-064-05|i8964-064-06|i8964-064-07|i8964-064-08|i8964-064-09|i8964-064-10|i8964-065-01|i8964-065-02|i8964-065-03|i8964-065-04|" & _
			   "i8964-065-05|i8964-065-06|i8964-065-07|i8964-065-08|i8964-065-09|i8964-065-10|i8964-066-01|i8964-066-02|i8964-066-03|i8964-066-04|" & _
			   "i8964-066-05|i8964-066-06|i8964-066-07|i8964-066-08|i8964-066-09|i8964-066-10|i8964-067-01|i8964-067-02|i8964-067-03|i8964-067-04|" & _
			   "i8964-067-05|i8964-067-06|i8964-067-07|i8964-067-08|i8964-067-09|i8964-067-10|i8964-068-01|i8964-068-02|i8964-068-03|i8964-068-04|" & _
			   "i8964-068-05|i8964-068-06|i8964-068-07|i8964-068-08|i8964-068-09|i8964-068-10|i8964-069-01|i8964-069-02|i8964-069-03|i8964-069-04|" & _
			   "i8964-069-05|i8964-069-06|i8964-069-07|i8964-069-08|i8964-069-09|i8964-069-10|i8964-070-01|i8964-070-02|i8964-070-03|i8964-070-04|" & _
			   "i8964-070-05|i8964-070-06|i8964-070-07|i8964-070-08|i8964-070-09|i8964-070-10|i8964-071-01|i8964-071-02|i8964-071-03|i8964-071-04|" & _
			   "i8964-071-05|i8964-071-06|i8964-071-07|i8964-071-08|i8964-071-09|i8964-071-10|i8964-072-01|i8964-072-02|i8964-072-03|i8964-072-04|" & _
			   "i8964-072-05|i8964-072-06|i8964-072-07|i8964-072-08|i8964-072-09|i8964-072-10|i8964-073-01|i8964-073-02|i8964-073-03|i8964-073-04|" & _
			   "i8964-073-05|i8964-073-06|i8964-073-07|i8964-073-08|i8964-073-09|i8964-073-10|i8964-074-01|i8964-074-02|i8964-074-03|i8964-074-04|" & _
			   "i8964-074-05|i8964-074-06|i8964-074-07|i8964-074-08|i8964-074-09|i8964-074-10|i8964-075-01|i8964-075-02|i8964-075-03|i8964-075-04|" & _
			   "i8964-075-05|i8964-075-06|i8964-075-07|i8964-075-08|i8964-075-09|i8964-075-10|i8964-076-01|i8964-076-02|i8964-076-03|i8964-076-04|" & _
			   "i8964-076-05|i8964-076-06|i8964-076-07|i8964-076-08|i8964-076-09|i8964-076-10|i8964-077-01|i8964-077-02|i8964-077-03|i8964-077-04|" & _
			   "i8964-077-05|i8964-077-06|i8964-077-07|i8964-077-08|i8964-077-09|i8964-077-10|i8964-078-01|i8964-078-02|i8964-078-03|i8964-078-04|" & _
			   "i8964-078-05|i8964-078-06|i8964-078-07|i8964-078-08|i8964-078-09|i8964-078-10|i8964-079-01|i8964-079-02|i8964-079-03|i8964-079-04|" & _
			   "i8964-079-05|i8964-079-06|i8964-079-07|i8964-079-08|i8964-079-09|i8964-079-10|i8964-080-01|i8964-080-02|i8964-080-03|i8964-080-04|" & _
			   "i8964-080-05|i8964-080-06|i8964-080-07|i8964-080-08|i8964-080-09|i8964-080-10|i8964-081-01|i8964-081-02|i8964-081-03|i8964-081-04|" & _
			   "i8964-081-05|i8964-081-06|i8964-081-07|i8964-081-08|i8964-081-09|i8964-081-10|i8964-082-01|i8964-082-02|i8964-082-03|i8964-082-04|" & _
			   "i8964-082-05|i8964-082-06|i8964-082-07|i8964-082-08|i8964-082-09|i8964-082-10|i8964-083-01|i8964-083-02|i8964-083-03|i8964-083-04|" & _
			   "i8964-083-05|i8964-083-06|i8964-083-07|i8964-083-08|i8964-083-09|i8964-083-10|i8964-084-01|i8964-084-02|i8964-084-03|i8964-084-04|" & _
			   "i8964-084-05|i8964-084-06|i8964-084-07|i8964-084-08|i8964-084-09|i8964-084-10|i8964-085-01|i8964-085-02|i8964-085-03|i8964-085-04|" & _
			   "i8964-085-05|i8964-085-06|i8964-085-07|i8964-085-08|i8964-085-09|i8964-085-10|i8964-086-01|i8964-086-02|i8964-086-03|i8964-086-04|" & _
			   "i8964-086-05|i8964-086-06|i8964-086-07|i8964-086-08|i8964-086-09|i8964-086-10|i8964-087-01|i8964-087-02|i8964-087-03|i8964-087-04|" & _
			   "i8964-087-05|i8964-087-06|i8964-087-07|i8964-087-08|i8964-087-09|i8964-087-10|i8964-088-01|i8964-088-02|i8964-088-03|i8964-088-04|" & _
			   "i8964-088-05|i8964-088-06|i8964-088-07|i8964-088-08|i8964-088-09|i8964-088-10|i8964-089-01|i8964-089-02|i8964-089-03|i8964-089-04|" & _
			   "i8964-089-05|i8964-089-06|i8964-089-07|i8964-089-08|i8964-089-09|i8964-089-20|i8964-090-01|i8964-090-02|i8964-090-03|i8964-090-04|" & _
			   "i8964-090-05|i8964-090-06|i8964-090-07|i8964-090-08|i8964-090-09|i8964-090-10|i8964-091-01|i8964-091-02|i8964-091-03|i8964-091-04|" & _
			   "i8964-091-05|i8964-091-06|i8964-091-07|i8964-091-08|i8964-091-09|i8964-091-10|i8964-092-01|i8964-092-02|i8964-092-03|i8964-092-04|" & _
			   "i8964-092-05|i8964-092-06|i8964-092-07|i8964-092-08|i8964-092-09|i8964-092-10|i8964-093-01|i8964-093-02|i8964-093-03|i8964-093-04|" & _
			   "i8964-093-05|i8964-093-06|i8964-093-07|i8964-093-08|i8964-093-09|i8964-093-10|i8964-094-01|i8964-094-02|i8964-094-03|i8964-094-04|" & _
			   "i8964-094-05|i8964-094-06|i8964-094-07|i8964-094-08|i8964-094-09|i8964-094-10|i8964-095-01|i8964-095-02|i8964-095-03|i8964-095-04|" & _
			   "i8964-095-05|i8964-095-06|i8964-095-07|i8964-095-08|i8964-095-09|i8964-095-10|i8964-096-01|i8964-096-02|i8964-096-03|i8964-096-04|" & _
			   "i8964-096-05|i8964-096-06|i8964-096-07|i8964-096-08|i8964-096-09|i8964-096-10|i8964-097-01|i8964-097-02|i8964-097-03|i8964-097-04|" & _
			   "i8964-097-05|i8964-097-06|i8964-097-07|i8964-097-08|i8964-097-09|i8964-097-10|i8964-098-01|i8964-098-02|i8964-098-03|i8964-098-04|" & _
			   "i8964-098-05|i8964-098-06|i8964-098-07|i8964-098-08|i8964-098-09|i8964-098-10|i8964-099-01|i8964-099-02|i8964-099-03|i8964-099-04|" & _
			   "i8964-099-05|i8964-099-06|i8964-099-07|i8964-099-08|i8964-099-09|i8964-099-10|i8964-100-01|i8964-100-02|i8964-100-03|i8964-100-04|" & _
			   "i8964-100-05|i8964-100-06|i8964-100-07|i8964-100-08|i8964-100-09|i8964-100-10|i8964-101-01|i8964-101-02|i8964-101-03|i8964-101-04|" & _
			   "i8964-101-05|i8964-101-06|i8964-101-07|i8964-101-08|i8964-101-09|i8964-101-10|i8964-102-01|i8964-102-02|i8964-102-03|i8964-102-04|" & _
			   "i8964-102-05|i8964-102-06|i8964-102-07|i8964-102-08|i8964-102-09|i8964-102-10|i8964-103-01|i8964-103-02|i8964-103-03|i8964-103-04|" & _
			   "i8964-103-05|i8964-103-06|i8964-103-07|i8964-103-08|i8964-103-09|i8964-103-10|i8964-104-01|i8964-104-02|i8964-104-03|i8964-104-04|" & _
			   "i8964-104-05|i8964-104-06|i8964-104-07|i8964-104-08|i8964-104-09|i8964-104-10|i8964-105-01|i8964-105-02|i8964-105-03|i8964-105-04|" & _
			   "i8964-105-05|i8964-105-06|i8964-105-07|i8964-105-08|i8964-105-09|i8964-105-10|i8964-106-01|i8964-106-02|i8964-106-03|i8964-106-04|" & _
			   "i8964-106-05|i8964-106-06|i8964-106-07|i8964-106-08|i8964-106-09|i8964-106-10|i8964-107-01|i8964-107-02|i8964-107-03|i8964-107-04|" & _
			   "i8964-107-05|i8964-107-06|i8964-107-07|i8964-107-08|i8964-107-09|i8964-107-10|i8964-108-01|i8964-108-02|i8964-108-03|i8964-108-04|" & _
			   "i8964-108-05|i8964-108-06|i8964-108-07|i8964-108-08|i8964-108-09|i8964-108-10|i8964-109-01|i8964-109-02|i8964-109-03|i8964-109-04|" & _
			   "i8964-109-05|i8964-109-06|i8964-109-07|i8964-109-08|i8964-109-09|i8964-109-10|i8964-110-01|i8964-110-02|i8964-110-03|i8964-110-04|" & _
			   "i8964-110-05|i8964-110-06|i8964-110-07|i8964-110-08|i8964-110-09|i8964-110-10|i8964-111-01|i8964-111-02|i8964-111-03|i8964-111-04|" & _
			   "i8964-111-05|i8964-111-06|i8964-111-07|i8964-111-08|i8964-111-09|i8964-111-10|i8964-112-01|i8964-112-02|i8964-112-03|i8964-112-04|" & _
			   "i8964-112-05|i8964-112-06|i8964-112-07|i8964-112-08|i8964-112-09|i8964-112-10|i8964-113-01|i8964-113-02|i8964-113-03|i8964-113-04|" & _
			   "i8964-113-05|i8964-113-06|i8964-113-07|i8964-113-08|i8964-113-09|i8964-113-10|i8964-114-01|i8964-114-02|i8964-114-03|i8964-114-04|" & _
			   "i8964-114-05|i8964-114-06|i8964-114-07|i8964-114-08|i8964-114-09|i8964-114-10|i8964-115-01|i8964-115-02|i8964-115-03|i8964-115-04|" & _
			   "i8964-115-05|i8964-115-06|i8964-115-07|i8964-115-08|i8964-115-09|i8964-115-10|i8964-116-01|i8964-116-02|i8964-116-03|i8964-116-04|" & _
			   "i8964-116-05|i8964-116-06|i8964-116-07|i8964-116-08|i8964-116-09|i8964-116-010|i8964-117-01|i8964-117-02|i8964-117-03|i8964-117-04|" & _
			   "i8964-117-05|i8964-117-06|i8964-117-07|i8964-117-08|i8964-117-09|i8964-117-10|i8964-118-01|i8964-118-02|i8964-118-03|i8964-118-04|" & _
			   "i8964-118-05|i8964-118-06|i8964-118-07|i8964-118-08|i8964-118-09|i8964-118-10|i8964-119-01|i8964-119-02|i8964-119-03|i8964-119-04|" & _
			   "i8964-119-05|i8964-119-06|i8964-119-07|i8964-119-08|i8964-119-09|i8964-119-10|i8964-120-01|i8964-120-02|i8964-120-03|i8964-120-04|" & _
			   "i8964-120-05|i8964-120-06|i8964-120-07|i8964-120-08|i8964-120-09|i8964-120-10|i8964-121-01|i8964-121-2|i8964-121-03|i8964-121-04|" & _
			   "i8964-121-05|i8964-121-06|i8964-121-07|i8964-121-08|i8964-121-09|i8964-121-10|i8964-122-01|i8964-122-02|i8964-122-03|i8964-122-04|" & _
			   "i8964-122-05|i8964-122-06|i8964-122-07|i8964-122-08|i8964-122-09|i8964-122-10|i8964-123-01|i8964-123-02|i8964-123-03|i8964-123-04|" & _
			   "i8964-123-05|i8964-123-06|i8964-123-07|i8964-123-08|i8964-123-09|i8964-123-10|i8964-124-01|i8964-124-02|i8964-124-03|i8964-124-04|" & _
			   "i8964-124-05|i8964-124-06|i8964-124-07|i8964-124-08|i8964-124-09|i8964-124-10|i8964-125-01|i8964-125-02|i8964-125-03|i8964-125-04|" & _
			   "i8964-125-05|i8964-125-06|i8964-125-07|i8964-125-08|i8964-125-09|i8964-125-10|i8964-126-01|i8964-126-02|i8964-126-03|i8964-126-04|" & _
			   "i8964-126-05|i8964-126-06|i8964-126-07|i8964-126-08|i8964-126-09|i8964-126-10|i8964-127-01|i8964-127-02|i8964-127-03|i8964-127-04|" & _
			   "i8964-127-05|i8964-127-06|i8964-127-07|i8964-127-08|i8964-127-09|i8964-127-10|i8964-128-01|i8964-128-02|i8964-128-03|i8964-128-04|" & _
			   "i8964-128-05|i8964-128-06|i8964-128-07|i8964-128-08|i8964-128-09|i8964-128-10|i8964-129-01|i8964-129-02|i8964-129-03|i8964-129-04|" & _
			   "i8964-129-05|i8964-129-06|i8964-129-07|i8964-129-08|i8964-129-09|i8964-129-10|i8964-131-01|i8964-131-02|i8964-131-03|i8964-131-04|" & _
			   "i8964-131-05|i8964-131-06|i8964-131-07|i8964-131-08|i8964-131-09|i8964-131-10|i8964-130-01|i8964-130-02|i8964-130-03|i8964-130-04|" & _
			   "i8964-130-05|i8964-130-06|i8964-130-07|i8964-130-08|i8964-130-09|i8964-130-10|i8964-133-01|i8964-133-02|i8964-133-03|i8964-133-04|" & _
			   "i8964-133-05|i8964-133-06|i8964-133-07|i8964-133-08|i8964-133-09|i8964-133-10|i8964-132-01|i8964-132-02|i8964-132-03|i8964-132-04|" & _
			   "i8964-132-05|i8964-132-06|i8964-132-07|i8964-132-08|i8964-132-09|i8964-132-10|i8964-134-01|i8964-134-02|i8964-134-03|i8964-134-04|" & _
			   "i8964-134-05|i8964-134-06|i8964-134-07|i8964-134-08|i8964-134-09|i8964-134-10|i8964-135-01|i8964-135-02|i8964-135-03|i8964-135-04|" & _
			   "i8964-135-05|i8964-135-06|i8964-135-07|i8964-135-08|i8964-135-09|i8964-135-10|i8964-136-01|i8964-136-02|i8964-136-03|i8964-136-04|" & _
			   "i8964-136-05|i8964-136-06|i8964-136-07|i8964-136-08|i8964-136-09|i8964-136-10|i8964-137-01|i8964-137-02|i8964-137-03|i8964-137-04|" & _
			   "i8964-137-05|i8964-137-06|i8964-137-07|i8964-137-08|i8964-137-09|i8964-137-10|i8964-138-01|i8964-138-02|i8964-138-03|i8964-138-04|" & _
			   "i8964-138-05|i8964-138-06|i8964-138-07|i8964-138-08|i8964-138-09|i8964-138-10|i8964-140-01|i8964-140-02|i8964-140-03|i8964-140-04|" & _
			   "i8964-140-05|i8964-140-06|i8964-140-07|i8964-140-08|i8964-140-09|i8964-140-10|i8964-139-01|i8964-139-02|i8964-139-03|i8964-139-04|" & _
			   "i8964-139-05|i8964-139-06|i8964-139-07|i8964-139-08|i8964-139-09|i8964-139-10|i8964-141-01|i8964-141-02|i8964-141-03|i8964-141-04|" & _
			   "i8964-141-05|i8964-141-06|i8964-141-07|i8964-141-08|i8964-141-09|i8964-141-10|i8964-142-01|i8964-142-02|i8964-142-03|i8964-142-04|" & _
			   "i8964-142-05|i8964-142-06|i8964-142-07|i8964-142-08|i8964-142-09|i8964-142-10|i8964-143-01|i8964-143-02|i8964-143-03|i8964-143-04|" & _
			   "i8964-143-05|i8964-143-06|i8964-143-07|i8964-143-08|i8964-143-09|i8964-143-10|i8964-144-01|i8964-144-02|i8964-144-03|i8964-144-04|" & _
			   "i8964-144-05|i8964-144-06|i8964-144-07|i8964-144-08|i8964-144-09|i8964-144-10|i8964-145-01|i8964-145-02|i8964-145-03|i8964-145-04|" & _
			   "i8964-145-05|i8964-145-06|i8964-145-07|i8964-145-08|i8964-145-09|i8964-145-10|i8964-147-01|i8964-147-02|i8964-147-03|i8964-147-04|" & _
			   "i8964-147-05|i8964-147-06|i8964-147-07|i8964-147-08|i8964-147-09|i8964-147-10|i8964-146-01|i8964-146-02|i8964-146-03|i8964-146-04|" & _
			   "i8964-146-05|i8964-146-06|i8964-146-07|i8964-146-08|i8964-146-09|i8964-146-10|i8964-148-01|i8964-148-02|i8964-148-03|i8964-148-04|" & _
			   "i8964-148-05|i8964-148-06|i8964-148-07|i8964-148-08|i8964-148-09|i8964-148-10|i8964-149-01|i8964-149-02|i8964-149-03|i8964-149-04|" & _
			   "i8964-149-05|i8964-149-06|i8964-149-07|i8964-149-08|i8964-149-09|i8964-149-10|i8964-150-01|i8964-150-02|i8964-150-03|i8964-150-04|" & _
			   "i8964-150-05|i8964-150-06|i8964-150-07|i8964-150-08|i8964-150-09|i8964-150-10|i8964-151-01|i8964-151-02|i8964-151-03|i8964-151-04|" & _
			   "i8964-151-05|i8964-151-06|i8964-151-07|i8964-151-08|i8964-151-09|i8964-151-10|i8964-152-01|i8964-152-02|i8964-152-03|i8964-152-04|" & _
			   "i8964-152-05|i8964-152-06|i8964-152-07|i8964-152-08|i8964-152-09|i8964-152-10|i8964-153-01|i8964-153-2|i8964-153-002|i8964-153-04|" & _
			   "i8964-153-05|i8964-153-06|i8964-153-07|i8964-153-08|i8964-153-09|i8964-153-10|i8964-154-01|i8964-154-02|i8964-154-03|i8964-154-04|" & _
			   "i8964-154-05|i8964-154-06|i8964-154-07|i8964-154-08|i8964-154-09|i8964-154-10|i8964-155-01|i8964-155-02|i8964-155-03|i8964-155-04|" & _
			   "i8964-155-05|i8964-155-06|i8964-155-07|i8964-155-08|i8964-155-09|i8964-155-10|i8964-157-01|i8964-157-02|i8964-157-03|i8964-157-04|" & _
			   "i8964-157-05|i8964-157-06|i8964-157-07|i8964-157-08|i8964-157-09|i8964-157-10|i8964-156-01|i8964-156-02|i8964-156-03|i8964-156-04|" & _
			   "i8964-156-05|i8964-156-06|i8964-156-07|i8964-156-08|i8964-156-09|i8964-156-10|i8964-158-01|i8964-158-02|i8964-158-03|i8964-158-04|" & _
			   "i8964-158-05|i8964-158-06|i8964-158-07|i8964-158-08|i8964-158-09|i8964-158-10|i8964-159-01|i8964-159-02|i8964-159-03|i8964-159-04|" & _
			   "i8964-159-05|i8964-159-06|i8964-159-07|i8964-159-08|i8964-159-09|i8964-159-10|i8964-160-01|i8964-160-02|i8964-160-03|i8964-160-04|" & _
			   "i8964-160-05|i8964-160-06|i8964-160-07|i8964-160-08|i8964-160-09|i8964-160-10|i8964-161-01|i8964-162-02|i8964-162-03|i8964-162-04|" & _
			   "i8964-162-05|i8964-162-06|i8964-162-07|i8964-162-08|i8964-162-09|i8964-162-10|i8964-162-01|i8964-161-02|i8964-161-03|i8964-161-04|" & _
			   "i8964-161-05|i8964-161-06|i8964-161-07|i8964-161-08|i8964-161-09|i8964-161-10|i8964-163-01|i8964-163-02|i8964-163-03|i8964-163-04|" & _
			   "i8964-163-05|i8964-163-06|i8964-163-07|i8964-163-08|i8964-163-09|i8964-163-10|i8964-164-01|i8964-164-02|i8964-164-03|i8964-164-04|" & _
			   "i8964-164-05|i8964-164-06|i8964-164-07|i8964-164-08|i8964-164-09|i8964-164-10|i8964-165-01|i8964-165-02|i8964-165-03|i8964-165-04|" & _
			   "i8964-165-05|i8964-165-06|i8964-165-07|i8964-165-08|i8964-165-09|i8964-165-10|i8964-166-01|i8964-166-02|i8964-166-03|i8964-166-04|" & _
			   "i8964-166-05|i8964-166-06|i8964-166-07|i8964-166-08|i8964-166-09|i8964-166-10|i8964-167-01|i8964-167-02|i8964-167-03|i8964-167-04|" & _
			   "i8964-167-05|i8964-167-06|i8964-167-07|i8964-167-08|i8964-167-09|i8964-167-10|i8964-168-01|i8964-168-02|i8964-168-03|i8964-168-04|" & _
			   "i8964-168-05|i8964-168-06|i8964-168-07|i8964-168-08|i8964-168-09|i8964-168-10|i8964-169-01|i8964-169-02|i8964-169-03|i8964-169-04|" & _
			   "i8964-169-05|i8964-169-06|i8964-169-07|i8964-169-08|i8964-169-09|i8964-169-10|i8964-170-01|i8964-170-02|i8964-170-03|i8964-170-04|" & _
			   "i8964-170-05|i8964-170-06|i8964-170-07|i8964-170-08|i8964-170-09|i8964-170-10|i8964-171-01|i8964-171-02|i8964-171-03|i8964-171-04|" & _
			   "i8964-171-05|i8964-171-06|i8964-171-07|i8964-171-08|i8964-171-09|i8964-171-10|i8964-172-01|i8964-172-02|i8964-172-03|i8964-172-04|" & _
			   "i8964-172-05|i8964-172-06|i8964-172-07|i8964-172-08|i8964-172-09|i8964-172-10|i8964-173-01|i8964-173-02|i8964-173-03|i8964-173-04|" & _
			   "i8964-173-05|i8964-173-06|i8964-173-07|i8964-173-08|i8964-173-09|i8964-173-10|i8964-174-01|i8964-174-02|i8964-174-03|i8964-174-04|" & _
			   "i8964-174-05|i8964-174-06|i8964-174-07|i8964-174-08|i8964-174-09|i8964-174-10|i8964-175-01|i8964-175-02|i8964-175-03|i8964-175-04|" & _
			   "i8964-175-05|i8964-175-06|i8964-175-07|i8964-175-08|i8964-175-09|i8964-175-10|i8964-176-01|i8964-176-02|i8964-176-03|i8964-176-04|" & _
			   "i8964-176-05|i8964-176-06|i8964-176-07|i8964-176-08|i8964-176-09|i8964-176-10|i8964-177-01|i8964-177-02|i8964-177-03|i8964-177-04|" & _
			   "i8964-177-05|i8964-177-06|i8964-177-07|i8964-177-08|i8964-177-09|i8964-177-10|i8964-178-01|i8964-178-02|i8964-178-03|i8964-178-04|" & _
			   "i8964-178-05|i8964-178-06|i8964-178-07|i8964-178-08|i8964-178-09|i8964-178-10|i8964-179-01|i8964-179-02|i8964-179-03|i8964-179-04|" & _
			   "i8964-179-05|i8964-179-06|i8964-179-07|i8964-179-08|i8964-179-09|i8964-179-10|i8964-180-01|i8964-180-02|i8964-180-03|i8964-180-04|" & _
			   "i8964-180-05|i8964-180-06|i8964-180-07|i8964-180-08|i8964-180-09|i8964-180-10|i8964-181-01|i8964-181-02|i8964-181-03|i8964-181-04|" & _
			   "i8964-181-05|i8964-181-06|i8964-181-07|i8964-181-08|i8964-181-09|i8964-181-10|i8964-182-01|i8964-182-02|i8964-182-03|i8964-182-04|" & _
			   "i8964-182-05|i8964-182-06|i8964-182-07|i8964-182-08|i8964-182-09|i8964-182-10|i8964-183-01|i8964-183-02|i8964-183-03|i8964-183-04|" & _
			   "i8964-183-05|i8964-183-06|i8964-183-07|i8964-183-08|i8964-183-09|i8964-183-10|i8964-184-01|i8964-184-02|i8964-184-03|i8964-184-04|" & _
			   "i8964-184-05|i8964-184-06|i8964-184-07|i8964-184-08|i8964-184-09|i8964-184-10|i8964-185-01|i8964-185-02|i8964-185-03|i8964-185-04|" & _
			   "i8964-185-05|i8964-185-06|i8964-185-07|i8964-185-08|i8964-185-09|i8964-185-10|i8964-186-01|i8964-186-02|i8964-186-03|i8964-186-04|" & _
			   "i8964-186-05|i8964-186-06|i8964-186-07|i8964-186-08|i8964-186-09|i8964-186-10|i8964-187-01|i8964-187-02|i8964-187-03|i8964-187-04|" & _
			   "i8964-187-05|i8964-187-06|i8964-187-07|i8964-187-08|i8964-187-09|i8964-187-10|i8964-188-01|i8964-188-02|i8964-188-03|i8964-188-04|" & _
			   "i8964-188-05|i8964-188-06|i8964-188-07|i8964-188-08|i8964-188-09|i8964-188-10|i8964-189-01|i8964-189-02|i8964-189-03|i8964-189-04|" & _
			   "i8964-189-05|i8964-189-06|i8964-189-07|i8964-189-08|i8964-189-09|i8964-189-10|i8964-190-01|i8964-190-02|i8964-190-03|i8964-190-04|" & _
			   "i8964-190-05|i8964-190-06|i8964-190-07|i8964-190-08|i8964-190-09|i8964-190-10|i8964-191-01|i8964-191-02|i8964-191-03|i8964-191-04|" & _
			   "i8964-191-05|i8964-191-06|i8964-191-07|i8964-191-08|i8964-191-09|i8964-191-10|i8964-192-01|i8964-192-02|i8964-192-03|i8964-192-04|" & _
			   "i8964-192-05|i8964-192-06|i8964-192-07|i8964-192-08|i8964-192-09|i8964-192-10|i8964-193-01|i8964-193-02|i8964-193-03|i8964-193-04|" & _
			   "i8964-193-05|i8964-193-06|i8964-193-07|i8964-193-08|i8964-193-09|i8964-193-10|i8964-194-01|i8964-194-02|i8964-194-03|i8964-194-04|" & _
			   "i8964-194-05|i8964-194-06|i8964-194-07|i8964-194-08|i8964-194-09|i8964-194-10|i8964-195-01|i8964-195-02|i8964-195-03|i8964-195-04|" & _
			   "i8964-195-05|i8964-195-06|i8964-195-07|i8964-195-08|i8964-195-09|i8964-195-10|i8964-197-01|i8964-197-02|i8964-197-03|i8964-197-04|" & _
			   "i8964-197-05|i8964-197-06|i8964-197-07|i8964-197-08|i8964-197-09|i8964-197-10|i8964-196-01|i8964-196-02|i8964-196-03|i8964-196-04|" & _
			   "i8964-196-05|i8964-196-06|i8964-196-07|i8964-196-08|i8964-196-09|i8964-196-10|i8964-198-01|i8964-198-02|i8964-198-03|i8964-198-04|" & _
			   "i8964-198-05|i8964-198-06|i8964-198-07|i8964-198-08|i8964-198-09|i8964-198-10|i8964-199-01|i8964-199-02|i8964-199-03|i8964-199-04|" & _
			   "i8964-199-05|i8964-199-06|i8964-199-07|i8964-199-08|i8964-199-09|i8964-199-10|i8964-200-01|i8964-200-02|i8964-200-03|i8964-200-04|" & _
			   "i8964-200-05|i8964-200-06|i8964-200-07|i8964-200-08|i8964-200-09|i8964-200-10|i8964-201-01|i8964-201-02|i8964-201-03|i8964-201-04|" & _
			   "i8964-201-05|i8964-201-06|i8964-201-07|i8964-201-08|i8964-201-09|i8964-201-10|i8964-202-01|i8964-202-02|i8964-202-03|i8964-202-04|" & _
			   "i8964-202-05|i8964-202-06|i8964-202-07|i8964-202-08|i8964-202-09|i8964-202-10|i8964-203-01|i8964-203-02|i8964-203-03|i8964-203-04|" & _
			   "i8964-203-05|i8964-203-06|i8964-203-07|i8964-203-08|i8964-203-09|i8964-203-10|i8964-204-01|i8964-204-02|i8964-204-03|i8964-204-04|" & _
			   "i8964-204-05|i8964-204-06|i8964-204-07|i8964-204-08|i8964-204-09|i8964-204-10|i8964-205-01|i8964-205-02|i8964-205-03|i8964-205-04|" & _
			   "i8964-205-05|i8964-205-06|i8964-205-07|i8964-205-08|i8964-205-09|i8964-205-10|i8964-206-01|i8964-206-02|i8964-206-03|i8964-206-04|" & _
			   "i8964-206-05|i8964-206-06|i8964-206-07|i8964-206-08|i8964-206-09|i8964-206-10|i8964-207-01|i8964-207-02|i8964-207-03|i8964-207-04|" & _
			   "i8964-207-05|i8964-207-06|i8964-207-07|i8964-207-08|i8964-207-09|i8964-207-10|i8964-208-01|i8964-208-02|i8964-208-03|i8964-208-04|" & _
			   "i8964-208-05|i8964-208-06|i8964-208-07|i8964-208-08|i8964-208-09|i8964-208-10|i8964-209-01|i8964-209-02|i8964-209-03|i8964-209-04|" & _
			   "i8964-209-05|i8964-209-06|i8964-209-07|i8964-209-08|i8964-209-09|i8964-209-10|i8964-210-01|i8964-210-02|i8964-210-03|i8964-210-04|" & _
			   "i8964-210-05|i8964-210-06|i8964-210-07|i8964-210-08|i8964-210-09|i8964-210-10|i8964-211-01|i8964-211-02|i8964-211-03|i8964-211-04|" & _
			   "i8964-211-05|i8964-211-06|i8964-211-07|i8964-211-08|i8964-211-09|i8964-211-10|i8964-212-01|i8964-212-02|i8964-212-03|i8964-212-04|" & _
			   "i8964-212-05|i8964-212-06|i8964-212-07|i8964-212-08|i8964-212-09|i8964-212-10|i8964-213-01|i8964-213-02|i8964-213-03|i8964-213-04|" & _
			   "i8964-213-05|i8964-213-06|i8964-213-07|i8964-213-08|i8964-213-09|i8964-213-10|i8964-214-01|i8964-214-02|i8964-214-03|i8964-214-04|" & _
			   "i8964-214-05|i8964-214-06|i8964-214-07|i8964-214-08|i8964-214-09|i8964-214-10|jzz1946-01|jzz1946-02|jzz1946-03|jzz1946-04|jzz1946-05|" & _
			   "jzz1946-06|jzz1946-07|jzz1946-08|jzz1946-09|jzz1946-10|jzz1947-01|jzz1947-02|jzz1947-03|jzz1947-04|jzz1947-05|jzz1947-06|jzz1947-07|" & _
			   "jzz1947-08|jzz1947-09|jzz1947-10|jzz1948-01|jzz1948-02|jzz1948-03|jzz1948-04|jzz1948-05|jzz1948-06|jzz1948-07|jzz1948-08|jzz1948-09|" & _
			   "jzz1948-10|jzzjzz00101|jzzjzz00102|jzzjzz00103|jzzjzz01|jzzjzz002|jzzjzz003|jzzjzz004|jzzjzz005|jzzjzz006|jzzjzz001|txwgtxwg001-01|"
		Return $DID2
EndFunc	
	
Func _ID3()
Global  $DID3 = "txwgtxwg001-02|txwgtxwg001-03|txwgtxwg001-04|txwgtxwg001-05|txwgtxwg001-06|txwgtxwg001-07|txwgtxwg001-08|txwgtxwg001-09|txwgtxwg001-10|" & _
			   "txwgtxwg002-01|txwgtxwg002-02|txwgtxwg002-03|txwgtxwg002-04|txwgtxwg002-05|txwgtxwg002-06|txwgtxwg002-07|txwgtxwg002-08|txwgtxwg002-09|" & _
			   "txwgtxwg002-10|txwgtxwg003-01|txwgtxwg003-02|txwgtxwg003-03|txwgtxwg003-04|txwgtxwg003-05|txwgtxwg003-06|txwgtxwg003-07|txwgtxwg003-08|" & _
			   "txwgtxwg003-09|txwgtxwg003-10|txwgtxwg004-01|txwgtxwg004-02|txwgtxwg004-03|txwgtxwg004-04|txwgtxwg004-05|txwgtxwg004-06|txwgtxwg004-07|" & _
			   "txwgtxwg004-08|txwgtxwg004-09|txwgtxwg004-10|txwgtxwg005-01|txwgtxwg005-02|txwgtxwg005-03|txwgtxwg005-04|txwgtxwg005-05|txwgtxwg005-06|" & _
			   "txwgtxwg005-07|txwgtxwg005-08|txwgtxwg005-09|txwgtxwg005-10|txwgtxwg006-01|txwgtxwg006-02|txwgtxwg006-03|txwgtxwg006-04|txwgtxwg006-05|" & _
			   "txwgtxwg006-06|txwgtxwg006-07|txwgtxwg006-08|txwgtxwg006-09|txwgtxwg006-10|txwgtxwg007-01|txwgtxwg007-02|txwgtxwg007-03|txwgtxwg007-04|" & _
			   "txwgtxwg007-05|txwgtxwg007-06|txwgtxwg007-07|txwgtxwg007-08|txwgtxwg007-09|txwgtxwg007-10|txwgtxwg008-01|txwgtxwg008-02|txwgtxwg008-03|" & _
			   "txwgtxwg008-04|txwgtxwg008-05|txwgtxwg008-06|txwgtxwg008-07|txwgtxwg008-08|txwgtxwg008-09|txwgtxwg008-10|txwgtxwg009-01|txwgtxwg009-02|" & _
			   "txwgtxwg009-03|txwgtxwg009-04|txwgtxwg009-05|txwgtxwg009-06|txwgtxwg009-07|txwgtxwg009-08|txwgtxwg009-09|txwgtxwg009-10|txwgtxwg010-01|" & _
			   "txwgtxwg010-02|txwgtxwg010-03|txwgtxwg010-04|txwgtxwg010-05|txwgtxwg010-06|txwgtxwg010-07|txwgtxwg010-08|txwgtxwg010-09|txwgtxwg010-10|" & _
			   "txwgtxwg011-01|txwgtxwg011-02|txwgtxwg011-03|txwgtxwg011-04|txwgtxwg011-05|txwgtxwg011-06|txwgtxwg011-07|txwgtxwg011-08|txwgtxwg011-09|" & _
			   "txwgtxwg011-10|txwgtxwg012-01|txwgtxwg012-02|txwgtxwg012-03|txwgtxwg012-04|txwgtxwg012-05|txwgtxwg012-06|txwgtxwg012-07|txwgtxwg012-08|" & _
			   "txwgtxwg012-09|txwgtxwg012-10|txwgtxwg013-01|txwgtxwg013-02|txwgtxwg013-03|txwgtxwg013-04|txwgtxwg013-05|txwgtxwg013-06|txwgtxwg013-07|" & _
			   "txwgtxwg013-08|txwgtxwg013-09|txwgtxwg013-010|txwgtxwg014-01|txwgtxwg014-02|txwgtxwg014-03|txwgtxwg014-04|txwgtxwg014-05|txwgtxwg014-06|" & _
			   "txwgtxwg014-07|txwgtxwg014-08|txwgtxwg014-09|txwgtxwg014-10|txwgtxwg015-01|txwgtxwg015-02|txwgtxwg015-03|txwgtxwg015-04|txwgtxwg015-05|" & _
			   "txwgtxwg015-06|txwgtxwg015-07|txwgtxwg015-08|txwgtxwg015-09|txwgtxwg015-10|txwgtxwg016-01|txwgtxwg016-02|txwgtxwg016-03|txwgtxwg016-04|" & _
			   "txwgtxwg016-05|txwgtxwg016-06|txwgtxwg016-07|txwgtxwg016-08|txwgtxwg016-09|txwgtxwg016-10|txwgtxwg017-01|txwgtxwg017-02|txwgtxwg017-03|" & _
			   "txwgtxwg017-04|txwgtxwg017-05|txwgtxwg017-06|txwgtxwg017-07|txwgtxwg017-08|txwgtxwg017-09|txwgtxwg017-10|txwgtxwg018-01|txwgtxwg018-02|" & _
			   "txwgtxwg018-03|txwgtxwg018-04|txwgtxwg018-05|txwgtxwg018-06|txwgtxwg018-07|txwgtxwg018-08|txwgtxwg018-09|txwgtxwg018-10|txwgtxwg019-01|" & _
			   "txwgtxwg019-02|txwgtxwg019-03|txwgtxwg019-04|txwgtxwg019-05|txwgtxwg019-06|txwgtxwg019-07|txwgtxwg019-08|txwgtxwg019-09|txwgtxwg019-10|" & _
			   "txwgtxwg020-01|txwgtxwg020-02|txwgtxwg020-03|txwgtxwg020-04|txwgtxwg020-05|txwgtxwg020-06|txwgtxwg020-07|txwgtxwg020-08|txwgtxwg020-09|" & _
			   "txwgtxwg020-10|txwgtxwg021-01|txwgtxwg021-02|txwgtxwg021-03|txwgtxwg021-04|txwgtxwg021-05|txwgtxwg021-06|txwgtxwg021-07|txwgtxwg021-08|" & _
			   "txwgtxwg021-09|txwgtxwg021-10|txwgtxwg022-01|txwgtxwg022-02|txwgtxwg022-03|txwgtxwg022-04|txwgtxwg022-05|txwgtxwg022-06|txwgtxwg022-07|" & _
			   "txwgtxwg022-08|txwgtxwg022-09|txwgtxwg022-10|txwgtxwg023-01|txwgtxwg023-02|txwgtxwg023-03|txwgtxwg023-04|txwgtxwg023-05|txwgtxwg023-06|" & _
			   "txwgtxwg023-07|txwgtxwg023-08|txwgtxwg023-09|txwgtxwg023-10|txwgtxwg024-01|txwgtxwg024-02|txwgtxwg024-03|txwgtxwg024-04|txwgtxwg024-05|" & _
			   "txwgtxwg024-06|txwgtxwg024-07|txwgtxwg024-08|txwgtxwg024-09|txwgtxwg024-10|txwgtxwg025-01|txwgtxwg025-02|txwgtxwg025-03|txwgtxwg025-04|" & _
			   "txwgtxwg025-05|txwgtxwg025-06|txwgtxwg025-07|txwgtxwg025-08|txwgtxwg025-09|txwgtxwg025-10|txwgtxwg026-01|txwgtxwg026-02|txwgtxwg026-03|" & _
			   "txwgtxwg026-04|txwgtxwg026-05|txwgtxwg026-06|txwgtxwg026-07|txwgtxwg026-08|txwgtxwg026-09|txwgtxwg026-10|txwgtxwg027-01|txwgtxwg027-02|" & _
			   "txwgtxwg027-03|txwgtxwg027-04|txwgtxwg027-05|txwgtxwg027-06|txwgtxwg027-07|txwgtxwg027-08|txwgtxwg027-09|txwgtxwg027-10|txwgtxwg028-01|" & _
			   "txwgtxwg028-02|txwgtxwg028-03|txwgtxwg028-04|txwgtxwg028-05|txwgtxwg028-06|txwgtxwg028-07|txwgtxwg028-08|txwgtxwg028-09|txwgtxwg028-10|" & _
			   "txwgtxwg029-01|txwgtxwg029-02|txwgtxwg029-03|txwgtxwg029-04|txwgtxwg029-05|txwgtxwg029-06|txwgtxwg029-07|txwgtxwg029-08|txwgtxwg029-09|" & _
			   "txwgtxwg029-10|txwgtxwg030-01|txwgtxwg030-02|txwgtxwg030-03|txwgtxwg030-04|txwgtxwg030-05|txwgtxwg030-06|txwgtxwg030-07|txwgtxwg030-08|" & _
			   "txwgtxwg030-09|txwgtxwg030-10|txwgtxwg031-01|txwgtxwg031-02|txwgtxwg031-03|txwgtxwg031-04|txwgtxwg031-05|txwgtxwg031-06|txwgtxwg031-07|" & _
			   "txwgtxwg031-08|txwgtxwg031-09|txwgtxwg031-10|txwgtxwg032-01|txwgtxwg032-02|txwgtxwg032-03|txwgtxwg032-04|txwgtxwg032-05|txwgtxwg032-06|" & _
			   "txwgtxwg032-07|txwgtxwg032-08|txwgtxwg032-09|txwgtxwg032-10|txwgtxwg033-01|txwgtxwg033-02|txwgtxwg033-03|txwgtxwg033-04|txwgtxwg033-05|" & _
			   "txwgtxwg033-06|txwgtxwg033-07|txwgtxwg033-08|txwgtxwg033-09|txwgtxwg033-10|txwgtxwg034-01|txwgtxwg034-02|txwgtxwg034-03|txwgtxwg034-04|" & _
			   "txwgtxwg034-05|txwgtxwg034-06|txwgtxwg034-07|txwgtxwg034-08|txwgtxwg034-09|txwgtxwg034-10|txwgtxwg035-01|txwgtxwg035-02|txwgtxwg035-03|" & _
			   "txwgtxwg035-04|txwgtxwg035-05|txwgtxwg035-06|txwgtxwg035-07|txwgtxwg035-08|txwgtxwg035-09|txwgtxwg035-10|txwgtxwg036-01|txwgtxwg036-02|" & _
			   "txwgtxwg036-03|txwgtxwg036-04|txwgtxwg036-05|txwgtxwg036-06|txwgtxwg036-07|txwgtxwg036-08|txwgtxwg036-09|txwgtxwg036-10|txwgtxwg037-01|" & _
			   "txwgtxwg037-02|txwgtxwg037-03|txwgtxwg037-04|txwgtxwg037-05|txwgtxwg037-06|txwgtxwg037-07|txwgtxwg037-08|txwgtxwg037-09|txwgtxwg037-10|" & _
			   "txwgtxwg038-01|txwgtxwg038-02|txwgtxwg038-03|txwgtxwg038-04|txwgtxwg038-05|txwgtxwg038-06|txwgtxwg038-07|txwgtxwg038-08|txwgtxwg038-09|" & _
			   "txwgtxwg038-10|txwgtxwg039-01|txwgtxwg039-02|txwgtxwg039-03|txwgtxwg039-04|txwgtxwg039-05|txwgtxwg039-06|txwgtxwg039-07|txwgtxwg039-08|" & _
			   "txwgtxwg039-09|txwgtxwg039-10|txwgtxwg040-01|txwgtxwg040-02|txwgtxwg040-03|txwgtxwg040-04|txwgtxwg040-05|txwgtxwg040-06|txwgtxwg040-07|" & _
			   "txwgtxwg040-08|txwgtxwg040-09|txwgtxwg040-10|txwgtxwg041-01|txwgtxwg041-02|txwgtxwg041-03|txwgtxwg041-04|txwgtxwg041-05|txwgtxwg041-06|" & _
			   "txwgtxwg041-07|txwgtxwg041-08|txwgtxwg041-09|txwgtxwg041-10|txwgtxwg042-01|txwgtxwg042-02|txwgtxwg042-03|txwgtxwg042-04|txwgtxwg042-05|" & _
			   "txwgtxwg042-06|txwgtxwg042-07|txwgtxwg042-08|txwgtxwg042-09|txwgtxwg042-10|txwgtxwg043-01|txwgtxwg043-02|txwgtxwg043-03|txwgtxwg043-04|" & _
			   "txwgtxwg043-05|txwgtxwg043-06|txwgtxwg043-07|txwgtxwg043-08|txwgtxwg043-09|txwgtxwg043-10|txwgtxwg044-01|txwgtxwg044-02|txwgtxwg044-03|" & _
			   "txwgtxwg044-04|txwgtxwg044-05|txwgtxwg044-06|txwgtxwg044-07|txwgtxwg044-08|txwgtxwg044-09|txwgtxwg044-10|txwgtxwg045-01|txwgtxwg045-02|" & _
			   "txwgtxwg045-03|txwgtxwg045-04|txwgtxwg045-05|txwgtxwg045-06|txwgtxwg045-07|txwgtxwg045-08|txwgtxwg045-09|txwgtxwg045-10|txwgtxwg046-01|" & _
			   "txwgtxwg046-02|txwgtxwg046-03|txwgtxwg046-04|txwgtxwg046-05|txwgtxwg046-06|txwgtxwg046-07|txwgtxwg046-08|txwgtxwg046-09|txwgtxwg046-10|" & _
			   "txwgtxwg047-01|txwgtxwg047-02|txwgtxwg047-03|txwgtxwg047-04|txwgtxwg047-05|txwgtxwg047-06|txwgtxwg047-07|txwgtxwg047-08|txwgtxwg047-09|" & _
			   "txwgtxwg047-10|txwgtxwg048-01|txwgtxwg048-02|txwgtxwg048-03|txwgtxwg048-04|txwgtxwg048-05|txwgtxwg048-06|txwgtxwg048-07|txwgtxwg048-08|" & _
			   "txwgtxwg048-09|txwgtxwg048-10|txwgtxwg049-01|txwgtxwg049-02|txwgtxwg049-03|txwgtxwg049-04|txwgtxwg049-05|txwgtxwg049-06|txwgtxwg049-07|" & _
			   "txwgtxwg049-08|txwgtxwg049-09|txwgtxwg049-10|txwgtxwg050-01|txwgtxwg050-02|txwgtxwg050-03|txwgtxwg050-04|txwgtxwg050-05|txwgtxwg050-06|" & _
			   "txwgtxwg050-07|txwgtxwg050-08|txwgtxwg050-09|txwgtxwg050-10|txwgtxwg051-01|txwgtxwg051-02|txwgtxwg051-03|txwgtxwg051-04|txwgtxwg051-05|" & _
			   "txwgtxwg051-06|txwgtxwg051-07|txwgtxwg051-08|txwgtxwg051-09|txwgtxwg051-10|txwgtxwg052-01|txwgtxwg052-02|txwgtxwg052-03|txwgtxwg052-04|" & _
			   "txwgtxwg052-05|txwgtxwg052-06|txwgtxwg052-07|txwgtxwg052-08|txwgtxwg052-09|txwgtxwg052-10|txwgtxwg053-01|txwgtxwg053-02|txwgtxwg053-03|" & _
			   "txwgtxwg053-04|txwgtxwg053-05|txwgtxwg053-06|txwgtxwg053-07|txwgtxwg053-08|txwgtxwg053-09|txwgtxwg053-10|txwgtxwg054-01|txwgtxwg054-02|" & _
			   "txwgtxwg054-03|txwgtxwg054-04|txwgtxwg054-05|txwgtxwg054-06|txwgtxwg054-07|txwgtxwg054-08|txwgtxwg054-09|txwgtxwg054-10|txwgtxwg055-01|" & _
			   "txwgtxwg055-02|txwgtxwg055-03|txwgtxwg055-04|txwgtxwg055-05|txwgtxwg055-06|txwgtxwg055-07|txwgtxwg055-08|txwgtxwg055-09|txwgtxwg055-10|" & _
			   "txwgtxwg056-01|txwgtxwg056-02|txwgtxwg056-03|txwgtxwg056-04|txwgtxwg056-05|txwgtxwg056-06|txwgtxwg056-07|txwgtxwg056-08|txwgtxwg056-09|" & _
			   "txwgtxwg056-10|txwgtxwg057-01|txwgtxwg057-02|txwgtxwg057-03|txwgtxwg057-04|txwgtxwg057-05|txwgtxwg057-06|txwgtxwg057-07|txwgtxwg057-08|" & _
			   "txwgtxwg057-09|txwgtxwg057-10|txwgtxwg058-01|txwgtxwg058-02|txwgtxwg058-03|txwgtxwg058-04|txwgtxwg058-05|txwgtxwg058-06|txwgtxwg058-07|" & _
			   "txwgtxwg058-08|txwgtxwg058-09|txwgtxwg058-10|txwgtxwg059-01|txwgtxwg059-02|txwgtxwg059-03|txwgtxwg059-04|txwgtxwg059-05|txwgtxwg059-06|" & _
			   "txwgtxwg059-07|txwgtxwg059-08|txwgtxwg059-09|txwgtxwg059-10|txwgtxwg060-01|txwgtxwg060-02|txwgtxwg060-03|txwgtxwg060-04|txwgtxwg060-05|" & _
			   "txwgtxwg060-06|txwgtxwg060-07|txwgtxwg060-08|txwgtxwg060-09|txwgtxwg060-10|txwgtxwg061-01|txwgtxwg061-02|txwgtxwg061-03|txwgtxwg061-04|" & _
			   "txwgtxwg061-05|txwgtxwg061-06|txwgtxwg061-07|txwgtxwg061-08|txwgtxwg061-09|txwgtxwg061-10|txwgtxwg062-01|txwgtxwg062-02|txwgtxwg062-03|" & _
			   "txwgtxwg062-04|txwgtxwg062-05|txwgtxwg062-06|txwgtxwg062-07|txwgtxwg062-08|txwgtxwg062-09|txwgtxwg062-10|txwgtxwg063-01|txwgtxwg063-02|" & _
			   "txwgtxwg063-03|txwgtxwg063-04|txwgtxwg063-05|txwgtxwg063-06|txwgtxwg063-07|txwgtxwg063-08|txwgtxwg063-09|txwgtxwg063-10|txwgtxwg064-01|" & _
			   "txwgtxwg064-02|txwgtxwg064-03|txwgtxwg064-04|txwgtxwg064-05|txwgtxwg064-06|txwgtxwg064-07|txwgtxwg064-08|txwgtxwg064-09|txwgtxwg064-10|" & _
			   "txwgtxwg65-01|txwgtxwg65-02|txwgtxwg65-03|txwgtxwg65-04|txwgtxwg65-05|txwgtxwg65-06|txwgtxwg65-07|txwgtxwg65-08|txwgtxwg65-09|txwgtxwg65-10|" & _
			   "txwgtxwg0066-01|txwgtxwg0066-02|txwgtxwg0066-03|txwgtxwg0066-04|txwgtxwg0066-05|txwgtxwg0066-06|txwgtxwg0066-07|txwgtxwg0066-08|" & _
			   "txwgtxwg0066-09|txwgtxwg0066-10|txwgtxwg67-01|txwgtxwg67-02|txwgtxwg67-03|txwgtxwg67-04|txwgtxwg67-05|txwgtxwg67-06|txwgtxwg67-07|" & _
			   "txwgtxwg67-08|txwgtxwg67-09|txwgtxwg67-10|txwgtxwg68-01|txwgtxwg68-02|txwgtxwg68-03|txwgtxwg68-04|txwgtxwg68-05|txwgtxwg68-06|txwgtxwg68-07|" & _
			   "txwgtxwg68-08|txwgtxwg68-09|txwgtxwg68-10|txwgtxwg69-01|txwgtxwg69-02|txwgtxwg69-03|txwgtxwg69-04|txwgtxwg69-05|txwgtxwg69-06|txwgtxwg69-07|" & _
			   "txwgtxwg69-08|txwgtxwg69-09|txwgtxwg69-10|txwgtxwg70-01|txwgtxwg70-02|txwgtxwg70-03|txwgtxwg70-04|txwgtxwg70-05|txwgtxwg70-06|txwgtxwg70-07|" & _
			   "txwgtxwg70-08|txwgtxwg70-09|txwgtxwg70-10|txwgtxwg71-01|txwgtxwg71-02|txwgtxwg71-03|txwgtxwg71-04|txwgtxwg71-05|txwgtxwg71-06|txwgtxwg71-07|" & _
			   "txwgtxwg71-08|txwgtxwg71-09|txwgtxwg71-10|txwgtxwg72-01|txwgtxwg72-02|txwgtxwg72-03|txwgtxwg72-04|txwgtxwg72-05|txwgtxwg72-06|txwgtxwg72-07|" & _
			   "txwgtxwg72-08|txwgtxwg72-09|txwgtxwg72-10|txwgtxwg73-01|txwgtxwg73-02|txwgtxwg73-03|txwgtxwg73-04|txwgtxwg73-05|txwgtxwg73-06|txwgtxwg73-07|" & _
			   "txwgtxwg73-08|txwgtxwg73-09|txwgtxwg73-10|txwgtxwg74-01|txwgtxwg74-02|txwgtxwg74-03|txwgtxwg74-04|txwgtxwg74-05|txwgtxwg74-06|txwgtxwg74-07|" & _
			   "txwgtxwg74-08|txwgtxwg74-09|txwgtxwg74-10|txwgtxwg75-01|txwgtxwg75-02|txwgtxwg75-03|txwgtxwg75-04|txwgtxwg75-05|txwgtxwg75-06|txwgtxwg75-07|" & _
			   "txwgtxwg75-08|txwgtxwg75-09|txwgtxwg75-10|txwgtxwg76-01|txwgtxwg76-02|txwgtxwg76-03|txwgtxwg76-04|txwgtxwg76-05|txwgtxwg76-06|txwgtxwg76-07|" & _
			   "txwgtxwg76-08|txwgtxwg76-09|txwgtxwg76-10|txwgtxwg77-01|txwgtxwg77-02|txwgtxwg77-03|txwgtxwg77-04|txwgtxwg77-05|txwgtxwg77-06|txwgtxwg77-07|" & _
			   "txwgtxwg77-08|txwgtxwg77-09|txwgtxwg77-10|txwgtxwg78-01|txwgtxwg78-02|txwgtxwg78-03|txwgtxwg78-04|txwgtxwg78-05|txwgtxwg78-06|txwgtxwg78-07|" & _
			   "txwgtxwg78-08|txwgtxwg78-09|txwgtxwg78-10|txwgtxwg79-01|txwgtxwg79-02|txwgtxwg79-03|txwgtxwg79-04|txwgtxwg79-05|txwgtxwg79-06|txwgtxwg79-07|" & _
			   "txwgtxwg79-08|txwgtxwg79-09|0txwgtxwg79-10|txwgtxwg80-01|txwgtxwg80-02|txwgtxwg80-03|txwgtxwg80-04|txwgtxwg80-05|txwgtxwg80-06|txwgtxwg80-07|" & _
			   "txwgtxwg80-08|txwgtxwg80-09|txwgtxwg80-10|txwgtxwg81-01|txwgtxwg81-02|txwgtxwg81-03|txwgtxwg81-04|txwgtxwg81-05|txwgtxwg81-06|txwgtxwg81-07|" & _
			   "txwgtxwg81-08|txwgtxwg81-09|txwgtxwg81-10|txwgtxwg82-01|txwgtxwg82-02|txwgtxwg82-03|txwgtxwg82-04|txwgtxwg82-05|txwgtxwg82-06|txwgtxwg82-07|" & _
			   "txwgtxwg82-08|txwgtxwg82-09|txwgtxwg82-10|txwgtxwg83-01|txwgtxwg83-02|txwgtxwg83-03|txwgtxwg83-04|txwgtxwg83-05|txwgtxwg83-06|txwgtxwg83-07|" & _
			   "txwgtxwg83-08|txwgtxwg83-09|txwgtxwg83-10|txwgtxwg84-01|txwgtxwg84-02|txwgtxwg84-03|txwgtxwg84-04|txwgtxwg84-05|txwgtxwg84-06|txwgtxwg84-07|" & _
			   "txwgtxwg84-08|txwgtxwg84-09|txwgtxwg84-10|txwgtxwg85-01|txwgtxwg85-02|txwgtxwg85-03|txwgtxwg85-04|txwgtxwg85-05|txwgtxwg85-06|txwgtxwg85-07|" & _
			   "txwgtxwg85-08|txwgtxwg85-09|txwgtxwg85-10|txwgtxwg86-01|txwgtxwg86-02|txwgtxwg86-03|txwgtxwg86-04|txwgtxwg86-05|txwgtxwg86-06|txwgtxwg86-07|" & _
			   "txwgtxwg86-08|txwgtxwg86-09|txwgtxwg86-10|txwgtxwg87-01|txwgtxwg87-02|txwgtxwg87-03|txwgtxwg87-04|txwgtxwg87-05|txwgtxwg87-06|txwgtxwg87-07|" & _
			   "txwgtxwg87-08|txwgtxwg87-09|txwgtxwg87-10|txwgtxwg88-01|txwgtxwg88-02|txwgtxwg88-03|txwgtxwg88-04|txwgtxwg88-05|txwgtxwg88-06|txwgtxwg88-07|" & _
			   "txwgtxwg88-08|txwgtxwg88-09|txwgtxwg88-10|txwgtxwg89-01|txwgtxwg89-02|txwgtxwg89-03|txwgtxwg89-04|txwgtxwg89-05|txwgtxwg89-06|txwgtxwg89-07|" & _
			   "txwgtxwg89-08|txwgtxwg89-09|txwgtxwg89-10|txwgtxwg90-01|txwgtxwg90-02|txwgtxwg90-03|txwgtxwg90-04|txwgtxwg90-05|txwgtxwg90-06|txwgtxwg90-07|" & _
			   "txwgtxwg90-08|txwgtxwg90-09|txwgtxwg90-10|txwgtxwg91-01|txwgtxwg91-02|txwgtxwg91-03|txwgtxwg91-04|txwgtxwg91-05|txwgtxwg91-06|txwgtxwg91-07|" & _
			   "txwgtxwg91-08|txwgtxwg91-09|txwgtxwg91-10|txwgtxwg92-01|txwgtxwg92-02|txwgtxwg92-03|txwgtxwg92-04|txwgtxwg92-05|txwgtxwg92-06|txwgtxwg92-07|" & _
			   "txwgtxwg92-08|txwgtxwg92-09|txwgtxwg92-10|txwgtxwg93-01|txwgtxwg93-02|txwgtxwg93-03|txwgtxwg93-04|txwgtxwg93-05|txwgtxwg93-06|txwgtxwg93-07|" & _
			   "txwgtxwg93-08|txwgtxwg93-09|txwgtxwg93-10|txwgtxwg94-01|txwgtxwg94-02|txwgtxwg94-03|txwgtxwg94-04|txwgtxwg94-05|txwgtxwg94-06|txwgtxwg94-07|" & _
			   "txwgtxwg94-08|txwgtxwg94-09|txwgtxwg94-10|txwgtxwg95-01|txwgtxwg95-02|txwgtxwg95-03|txwgtxwg95-04|txwgtxwg95-05|txwgtxwg95-06|txwgtxwg95-07|" & _
			   "txwgtxwg95-08|txwgtxwg95-09|txwgtxwg95-10|txwgtxwg96-01|txwgtxwg96-02|txwgtxwg96-03|txwgtxwg96-04|txwgtxwg96-05|txwgtxwg96-06|txwgtxwg96-07|" & _
			   "txwgtxwg96-08|txwgtxwg96-09|txwgtxwg96-10|txwgtxwg97-01|txwgtxwg97-02|txwgtxwg97-03|txwgtxwg97-04|txwgtxwg97-05|txwgtxwg97-06|txwgtxwg97-07|" & _
			   "txwgtxwg97-08|txwgtxwg97-09|txwgtxwg97-10|txwgtxwg98-01|txwgtxwg98-02|txwgtxwg98-03|txwgtxwg98-04|txwgtxwg98-05|txwgtxwg98-06|txwgtxwg98-07|" & _
			   "txwgtxwg98-08|txwgtxwg98-09|txwgtxwg98-10|txwgtxwg99-01|txwgtxwg99-02|txwgtxwg99-03|txwgtxwg99-04|txwgtxwg99-05|txwgtxwg99-06|txwgtxwg99-07|" & _
			   "txwgtxwg99-08|txwgtxwg99-09|txwgtxwg99-10|txwgtxwg0100-01|txwgtxwg0100-02|txwgtxwg0100-03|txwgtxwg0100-04|txwgtxwg0100-05|txwgtxwg0100-06|" & _
			   "txwgtxwg0100-07|txwgtxwg0100-08|txwgtxwg0100-09|txwgtxwg0100-10|txwgtxwg0101-01|txwgtxwg0101-02|txwgtxwg0101-03|txwgtxwg0101-04|txwgtxwg0101-05|" & _
			   "txwgtxwg0101-06|txwgtxwg0101-07|txwgtxwg0101-08|txwgtxwg0101-09|txwgtxwg0101-10|txwgtxwg0102-01|txwgtxwg0102-02|txwgtxwg0102-03|txwgtxwg0102-04|" & _
			   "txwgtxwg0102-05|txwgtxwg0102-06|txwgtxwg0102-07|txwgtxwg0102-08|txwgtxwg0102-09|txwgtxwg0102-10|fantuqiang0000|fantuqiang0001|fantuqiang0002|" & _
			   "fantuqiang0003|fantuqiang0004|fantuqiang0005|fantuqiang0006|fantuqiang0007|fantuqiang0008|fantuqiang0009|fantuqiang0010|fantuqiang0011|" & _
			   "fantuqiang0012|fantuqiang0013|fantuqiang0014|fantuqiang0015|fantuqiang0016|rockben11051|rockben87259|rockben872591|rockben872592|rockben872593|" & _
			   "rockben872594|rockben872595|rockben872596|fantuqiang0017|fantuqiang0018|fantuqiang0019|fantuqiang0020|fantuqiang0021|fantuqiang0022|" & _
			   "fantuqiang0023|fantuqiang0024|fantuqiang0025|fantuqiang0026|fantuqiang0027|fantuqiang0028|fantuqiang0029|fantuqiang0030|fantuqiang0031"
		Return $DID3
	EndFunc
	
	
#cs\\\\\\\\\\\\\\\\\\\\\\\\\\\\ #include <_Ini.au3> \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
	
	　　编写本函数库的原因：
	　　1，内置函数对于某些ini文件由于编码问题读写错误，本库系列函数增加打开模式(如32)，以正确读写。
	　　2，内置函数有效数据仅有32767字符可以被正常返回，本库系列函数无此限制。

	　　当前版本：v1.2.0.0
	
	　　函数说明：
	　　_IniDelete-----------;从INI结构文件中删除某个键值.
	　　_IniRead-------------;从INI结构文件中读取某个键值.
	　　_IniReadSection------;从INI结构文件中读取某个字段中的所有关键字及值.
	　　_IniReadSectionNames-;从INI结构文件中读取所有字段名.
	　　_IniRenameSection----;重命名INI结构文件里面的字段名.
	　　_IniRenameKey--------;重命名INI结构文件里面的关键字.
	　　_IniWrite------------;写入一个键值到INI结构文件.
	　　_IniWriteSection-----;将数据写入到INI结构文件的一个字段.
	
	　　_IniReadSection_str--;从(非)标准INI结构文件中读取某个字段中的所有字符.
	　　_IniReadSection_line-;从(非)标准INI结构文件中读取某个字段中的行字符串.
	　　_FileRead------------;用指定的FileOpen打开模式返回读取文件的字符串.
	　　_IniDelete_line------;从(非)标准INI结构文件中删除(含有)关键字的行.

	　　注意：
	　　对于特殊的键与值，如“abc=123=AAA” 原则上“abc”应该才为关键字，“123=AAA”为值，
	　　本想规范之，但觉得有时候可能会有“abc=123”为关键字，“AAA”为值的需求（内置函数是没得选的），
	　　因此，这里不强制为第一种情况，只需注意如下几点（当然，只有1个等号就无需注意这些了）：
	　　1，_IniReadSection 这个将保持为仅适用第一种情况，“abc”为关键字，“123=AAA”为值
	　　2，_IniDelete、_IniRead、_IniRenameKey、_IniWrite 可同时适用两种情况。
	
	　　　　　　　　　　-- Afan -- http://www.autoitx.com -- 2010-6-28 --更新于 2014-02-28
#ce\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\


; 函数名:_IniDelete;=============================================================================
; 说明:　从INI结构文件中删除某个数值。
; 语法:　_IniDelete('ini文件路径', '字段名'[, '关键字'[, 打开模式]])
; 参数:　可选参数'关键字'，要删除的关键字，若不指定关键字或使用Default关键字则整个字段将被删除。
; 返回值:成功: 返回1。
;　　　　失败: 返回0。并设置 @Error 为以下值：
;　　　　　　　　　　　　　　@Error=1 文件不存在；
;　　　　　　　　　　　　　　@Error=2 字段不存在；
;　　　　　　　　　　　　　　@Error=3 关键字不存在
;　　　　　　　　　　　　　　@Error=4 文件具有只读属性或者无法写入数据设置。
;==========================================================================================start
Func _IniDelete($iFile, $Section, $key = '', $mode = 0)
	If Not FileExists($iFile) Then Return SetError(1, 0, 0)
	Local $s_File = _FileRead($iFile, $mode)
	Local $_Section = StringRegExpReplace($Section, '^\h*(.+?)\h*$', '$1')
	Local $_key = StringRegExpReplace($key, '^\h*(.+?)\h*$', '$1')
	$_Section = StringRegExpReplace($_Section, '(\.|\||\*|\?|\+|\(|\)|\{|\}|\[|\]|\^|\$|\\)', '\\$1')
	$_Section = '\[\h*' & $_Section & '\h*\]'
	$_key = StringRegExpReplace($_key, '(\.|\||\*|\?|\+|\(|\)|\{|\}|\[|\]|\^|\$|\\|\=)', '\\$1')
	If Not StringRegExp(@CRLF & $s_File, '\r?\n\h*' & $_Section & '\s*') Then Return SetError(2, 0, 0)
	If $key <> '' And $key <> Default Then
		Local $vr = _IniRead($iFile, $Section, $key, @LF, $mode)
		If $vr = @LF Then Return SetError(3, 0, 0)
		Local $s_data = StringRegExpReplace(@CRLF & $s_File & @CRLF & ' ', '(?si)(.*?\r?\n\h*' & $_Section & '\h*\r?\n.*?)(\h*' & $_key & '\h*\=.*?\r?\n)(.*)', '$1$3')
	Else
		Local $s_data = StringRegExpReplace(@CRLF & $s_File & @CRLF & '[', '(?si)(.*?\r?\n)(\h*' & $_Section & '.*?)(\r?\n\h*\[.*)', '$1$3')
	EndIf
	$s_data = StringTrimLeft($s_data, 2)
	$s_data = StringTrimRight($s_data, 3)
	Local $FO = FileOpen($iFile, $mode + 2)
	Local $Write = FileWrite($FO, $s_data)
	FileClose($FO)
	If $Write = 0 Then Return SetError(4, 0, 0)
	Return 1
EndFunc   ;==>_IniDelete


; 函数名:_IniRead;=============================================================================
; 说明:　从INI结构文件中读取某个数值。
; 语法:　_IniRead('ini文件路径', '字段名', '关键字'[, '默认值'[, 打开模式]])
; 返回值:成功: 返回指定的关键字的值。
;　　　　失败: 返回默认值。如INI文件或字段不存在或读取错误 将设置 @error=1；@Error=2 关键字不存在。
;==========================================================================================start
Func _IniRead($iFile, $Section, $key, $default = '', $mode = 0)
	Local $s_Sec = _IniReadSection_str($iFile, $Section, $mode)
	If @error = 1 Then Return SetError(1, 0, $default)
	If @error = 2 Then Return SetError(3, 0, $default)
	Local $_key = StringRegExpReplace($key, '^\h*|\h*$', '')
	Local $aVal = StringRegExp(@LF & $s_Sec & @LF, '(?i)\n\h*\Q' & $_key & '\E\h*\=\h*(\V*?)\h*\v', 1)
	If @error Then Return SetError(2, 0, $default)
	Return $aVal[0]
EndFunc   ;==>_IniRead


; 函数名:_IniReadSection;======================================================================
; 说明:　从INI结构文件中读取某个字段中的所有关键字或值。
;　　　　原IniReadSection函数只有在字段中的前32767字符可以被正常返回,本函数无此限制(初衷在于此)。
;　　　　原IniReadSection函数遇到某些文件特殊的回车及换行组合会停止继续而返回，本函数会完整读出。
;　　　　其它与原IniReadSection函数不同：不返回无关键字的值;既无关键字又无值只有等号的也不被返回。
; 语法:　_IniReadSection('ini文件路径', '字段名'[, 打开模式])
; 返回值:成功: 返回一个二维数组,其中：元素[0][0]=大小、元素[n][0]=关键字、元素[n][1]=对应的数值。
;　　　　失败: 返回0。如INI文件读取错误或字段不存在将设置 @error=1；字段内容为空将设置 @error=2
;==========================================================================================start
Func _IniReadSection($iFile, $Section, $mode = 0)
	Local $s_Sec, $a_1, $ii = 1, $i
	$s_Sec = _IniReadSection_str($iFile, $Section, $mode)
	If @error Then Return SetError(@error, 0, 0)
	$a_1 = StringRegExp($s_Sec & @LF, '\n\h*([^=;\s][^=\v]*?)\h*\=\h*(\V*?)\h*(?=\v)', 3)
	If @error Then Return SetError(2, 0, 0)
	Local $2_array[UBound($a_1) / 2 + 1][2] = [[UBound($a_1) / 2]]
	For $i = 0 To UBound($a_1) - 1 Step 2
		$2_array[$ii][0] = $a_1[$i]
		$2_array[$ii][1] = $a_1[$i + 1]
		$ii += 1
	Next
	Return $2_array
EndFunc   ;==>_IniReadSection


; 函数名:_IniReadSectionNames;===============================================================
; 说明:　从INI结构文件中读取所有字段的信息。
;　　　　原IniReadSectionNames函数只有前32767字符有效,本函数无此限制。
;　　　　其它与原IniReadSectionNames函数不同：
;　　　　    - 本函数可选择打开模式，以便完整读出所有字段名。
;　　　　    - 不返回外面无"]"包括的字段名;
;　　　　    - 不返回空的字段名（即"[]"）;
;　　　　    - 可返回由"[]"包括的行内所有字符为字段名，可包含[]，如"[a[b]]"返回名为"a[b]"的字段名，
;　　　　      如需读取"a[b]"之类包含"["或"]"字段的关键字或值，需使用 _IniReadSection() 函数。
; 语法:　_IniReadSectionNames('ini文件路径'[, 打开模式[, 标志]])
; 参数:　可选参数“标志”，标志=1时返回的数组0号元素为数组的元素数量(默认)；标志=0时关闭0元素返回数量
; 返回值:成功: 返回一个含有所有字段名的数组。
;　　　　失败: 返回0。如INI文件读取错误或字段不存在将设置 @error=1
;=====================================================================================start
Func _IniReadSectionNames($iFile, $mode = 0, $flag = 1)
	Local $s_File = _FileRead($iFile, $mode)
	Local $Section = StringRegExp(@LF & $s_File, '\n\h*\[\h*(.*[^\h])\h*\]', 3)
	If @error Then Return SetError(1, 0, 0)
	If $flag = 0 Then Return $Section
	Local $_Section[UBound($Section) + 1], $i
	$_Section[0] = UBound($Section)
	For $i = 0 To $_Section[0] - 1
		$_Section[$i + 1] = $Section[$i]
	Next
	Return $_Section
EndFunc   ;==>_IniReadSectionNames


; 函数名:_IniRenameSection;=====================================================================
; 说明:　重命名INI结构文件里面的字段。
; 语法:　_IniRenameSection('ini文件路径', '原字段名', '新字段名'[, 打开模式])
; 返回值:成功: 返回1。
;　　　　失败: 返回0。并设置 @Error 为以下值：
;　　　　　　　　　　　　　　@Error=1 原字段不存在；
;　　　　　　　　　　　　　　@Error=2 新字段已存在；
;　　　　　　　　　　　　　　@Error=3 文件具有只读属性或者无法写入数据。
;==========================================================================================start
Func _IniRenameSection($iFile, $Section, $new_Section, $mode = 0)
	Local $s_File = _FileRead($iFile, $mode)
	Local $_Section = StringRegExpReplace($Section, '^\h*(.+?)\h*$', '$1')
	$_Section = StringRegExpReplace($_Section, '(\.|\||\*|\?|\+|\(|\)|\{|\}|\[|\]|\^|\$|\\)', '\\$1')
	$_Section = '\[\h*' & $_Section & '\h*\]'
	If Not StringRegExp(@CRLF & $s_File, '\r?\n\h*' & $_Section & '\s*') Then Return SetError(1, 0, 0)
	Local $_new_Section = StringRegExpReplace($new_Section, '^\h*(.+?)\h*$', '$1')
	$_new_Section = StringRegExpReplace($_new_Section, '(\.|\||\*|\?|\+|\(|\)|\{|\}|\[|\]|\^|\$|\\)', '\\$1')
	$_new_Section = '\[\h*' & $_new_Section & '\h*\]'
	If StringRegExp(@CRLF & $s_File, '\r?\n\h*' & $_new_Section & '\s*') Then Return SetError(2, 0, 0)
	Local $resdata = StringRegExpReplace(@CRLF & $s_File, '(?si)(.*\r?\n\h*)(' & $_Section & '\h*)(.*)', '${1}[' & $new_Section & ']$3')
	$resdata = StringTrimLeft($resdata, 2)
	Local $FO = FileOpen($iFile, $mode + 2)
	Local $Write = FileWrite($FO, $resdata)
	FileClose($FO)
	If $Write = 0 Then Return SetError(3, 0, 0)
	Return 1
EndFunc   ;==>_IniRenameSection


; 函数名:_IniRenameKey;========================================================================
; 说明:　重命名INI结构文件里面的关键字。
; 语法:　_IniRenameKey('ini文件路径', '字段名', '原关键字', '新关键字'[, 打开模式])
; 返回值:成功: 返回1。
;　　　　失败: 返回0。并设置 @Error 为以下值：
;　　　　　　　　　　　　　　@Error=1 原关键字不存在；
;　　　　　　　　　　　　　　@Error=2 新关键字已存在；
;　　　　　　　　　　　　　　@Error=3 新关键字为空或仅含有空格或首个非空格字符为“[”
;　　　　　　　　　　　　　　@Error=4 文件具有只读属性或者无法写入数据。
;==========================================================================================start
Func _IniRenameKey($iFile, $Section, $Key, $new_key, $mode = 0)
	If StringRegExp($new_key, '^\s*(?:\[.*)?$') Then Return SetError(3, 0, 0)
	_IniRead($iFile, $Section, $Key, @LF, $mode)
	If @error Then Return SetError(1, 0, 0)
	_IniRead($iFile, $Section, $new_key, @LF, $mode)
	If Not @error Then Return SetError(2, 0, 0)
	Local $s_File = _FileRead($iFile, $mode)
	Local $_Section = StringRegExpReplace($Section, '^\h*(.+?)\h*$', '$1')
	$_Section = StringRegExpReplace($_Section, '(\.|\||\*|\?|\+|\(|\)|\{|\}|\[|\]|\^|\$|\\)', '\\$1')
	$_Section = '\[\h*' & $_Section & '\h*\]'
	Local $_key = StringRegExpReplace($Key, '^\h*(.+?)\h*$', '$1')
	$_key = StringRegExpReplace($_key, '(\.|\||\*|\?|\+|\(|\)|\{|\}|\[|\]|\^|\$|\\|\=)', '\\$1')
	Local $_new_key = StringRegExpReplace($new_key, '^\h*(.+?)\h*$', '$1')
	$_new_key = StringRegExpReplace($_new_key, '(\.|\||\*|\?|\+|\(|\)|\{|\}|\[|\]|\^|\$|\\|\=)', '\\$1')
	Local $resdata = StringRegExpReplace(@CRLF & $s_File, '(?si)(.*\r?\n\h*' & $_Section & '.*?\r?\n)\h*(' & $_key & ')\h*(\=.*)', '${1}' & $_new_key & '$3')
	$resdata = StringTrimLeft($resdata, 2)
	Local $FO = FileOpen($iFile, $mode + 2)
	Local $Write = FileWrite($FO, $resdata)
	FileClose($FO)
	If $Write = 0 Then Return SetError(4, 0, 0)
	Return 1
EndFunc   ;==>_IniRenameKey


; 函数名:_IniWrite;=============================================================================
; 说明:　写入一个值到INI结构文件。
; 语法:　_IniWrite('ini文件路径', '字段名', '关键字', '值'[, 打开模式])
; 返回值:成功: 正常写入返回1；已存在相同的关键字及值则不写入，返回2。
;　　　　失败: 返回0。文件具有只读属性或者无法写入数据。
;==========================================================================================start
Func _IniWrite($iFile, $Section, $key, $Val, $mode = 0)
	Local $_Val = StringRegExpReplace($Val, '^\h*(.+?)\h*$', '$1')
	$vr = _IniRead($iFile, $Section, $key, @LF, $mode)
	Local $Error = @error, $s_data, $Write
	If $vr = $_Val Then Return 2
	Local $s_File = _FileRead($iFile, $mode)
	Local $_Section = StringRegExpReplace($Section, '^\h*(.+?)\h*$', '$1')
	Local $_key = StringRegExpReplace($key, '^\h*(.+?)\h*$', '$1')
	Local $data = '[' & $_Section & ']' & @CRLF & $_key & '=' & $_Val
	Local $FO = FileOpen($iFile, $mode + 2)
	$_Section = StringRegExpReplace($_Section, '(\.|\||\*|\?|\+|\(|\)|\{|\}|\[|\]|\^|\$|\\)', '\\$1')
	$_Section = '\[\h*' & $_Section & '\h*\]'
	$_key = StringRegExpReplace($_key, '(\.|\||\*|\?|\+|\(|\)|\{|\}|\[|\]|\^|\$|\\|\=)', '\\$1')
	$_Val = StringRegExpReplace($_Val, '(\.|\||\*|\?|\+|\(|\)|\{|\}|\[|\]|\^|\$|\\|\=)', '\\$1')
	Switch $Error
		Case 0
			$s_data = StringRegExpReplace(@CRLF & $s_File & @CRLF & '[', '(?si)(.*?\r?\n\h*' & $_Section & '.*?\r?\n\h*' & $_key & '\h*\=)(\V*)(.*)', '${1}' & $_Val & '$3')
			$s_data = StringTrimLeft($s_data, 2)
			$s_data = StringTrimRight($s_data, 3)
			$Write = FileWrite($FO, $s_data)
		Case 1
			If $s_File <> '' Then $s_File = StringRegExpReplace($s_File, '(\r?\n)*$', '') & @CRLF
			$Write = FileWrite($FO, $s_File & $data & @CRLF)
		Case 2, 3
			$s_data = StringRegExpReplace(@CRLF & $s_File & @CRLF & '[', '(?si)(.*?\r?\n\h*' & $_Section & '.*?)((?:\r?\n)+)(\h*\[.*)', '$1' & @CRLF & $_key & '=' & $_Val & '$2$3')	;131022修正*为+
			$s_data = StringTrimLeft($s_data, 2)
			$s_data = StringTrimRight($s_data, 3)
			$Write = FileWrite($FO, $s_data)
	EndSwitch
	FileClose($FO)
	If $Write = 0 Then Return 0
	Return 1
EndFunc   ;==>_IniWrite


; 函数名:_IniWriteSection;=====================================================================
; 说明:　将数据写入到INI结构文件的一个字段。
;　　　　且本函数在写入前会先对数据进行整理，去除无效的键值及多余的首尾空格，而非原IniWriteSection
;　　　　函数不加分析的全部写入。
; 语法:　_IniWriteSection('ini文件路径', '字段名', '数据'[, '索引'[, 打开模式]])
; 参数:　可选参数'索引'，此参数仅在数据为数组时有效, 指定开始写入的索引，默认为 1。
; 返回值:成功: 返回1。
;　　　　失败: 返回0。并设置 @Error 为以下值：
;　　　　　　　　　　　　　　@Error=1 数组非2维或第2维非2；
;　　　　　　　　　　　　　　@Error=2 数据格式错误；
;　　　　　　　　　　　　　　@Error=3 文件具有只读属性或者无法写入数据设置。
; 注意:　如果字段已存在，将会先清空原键值。
;==========================================================================================start
Func _IniWriteSection($iFile, $Section, $data, $index = 1, $mode = 0)
	Local $_data, $s_data = '', $s_Section = '', $key, $i, $FO, $Write, $CRLF = @CRLF
	If IsArray($data) Then
		If UBound($data, 0) <> 2 Or UBound($data, 2) <> 2 Then Return SetError(1, 0, 0)
		For $i = $index To UBound($data) - 1
			$key = StringRegExpReplace($data[$i][0], '^\h*([^=;\s].+?)\h*$', '$1')
			If Not StringRegExp($key, '^\s*$') Then $s_Section &= $key & '=' & StringRegExpReplace($data[$i][1], '^\h*([^=;\s].+?)\h*$', '$1') & @CRLF
		Next
		If $s_Section = '' Then Return SetError(2, 0, 0)
	Else
		$_data = StringRegExp(@CRLF & $data & @CRLF, '\n\h*([^=;\s].*?)\h*\=\h*(.*?)\h*(?=\r?\n)', 3)
		If @error Then Return SetError(2, 0, 0)
		For $i = 0 To UBound($_data) - 1 Step 2
			$s_Section &= $_data[$i] & '=' & $_data[$i + 1] & @CRLF
		Next
	EndIf
	Local $s_File = _FileRead($iFile, $mode)
	Local $_Section = StringRegExpReplace($Section, '^\h*(.+?)\h*$', '$1')
	$Section = '[' & $_Section & ']' & @CRLF
	$_Section = StringRegExpReplace($_Section, '(\.|\||\*|\?|\+|\(|\)|\{|\}|\[|\]|\^|\$|\\)', '\\$1')
	$_Section = '\[\h*' & $_Section & '\h*\]'
	$s_data = StringRegExpReplace(@CRLF & $s_File & @CRLF & '[', '(?si)(.*?\r?\n)\h*' & $_Section & '.*?(\[.*)', '${1}' & $Section & $s_Section & '$2')
	If @extended > 0 Then
		$s_data = StringTrimLeft($s_data, 2)
		$s_data = StringTrimRight($s_data, 3)
	Else
		If $s_File = '' Then $CRLF = ''
		$s_data = StringRegExpReplace($s_File, '(\r?\n)*$', '') & $CRLF & $Section & $s_Section
	EndIf
	$FO = FileOpen($iFile, $mode + 2)
	$Write = FileWrite($FO, $s_data)
	FileClose($FO)
	If $Write = 0 Then Return SetError(3, 0, 0)
	Return 1
EndFunc   ;==>_IniWriteSection


; 函数名:_IniReadSection_str;===================================================================
; 说明:　从(非)标准INI结构文件中读取某个字段(可选重复字段名)中的所有字符。
; 语法:　_IniReadSection_str('ini文件路径', '字段名'[, 打开模式[, 重复标志]])
; 参数:　重复标志 - [可选]，有些inf文件会有重复的字段名，设置此标志为1时可读取所有内容。
; 返回值:成功: 返回字段中的所有字符。
;　　　　失败: 返回0。如INI文件读取错误或字段不存在将设置 @error=1；字段内容为空将设置 @error=2
;==========================================================================================start
Func _IniReadSection_str($iFile, $Section, $mode = 0, $nFlag = 0)
	Local $s_File = _FileRead($iFile, $mode), $line_all
	Local $_Section = StringRegExpReplace($Section, '^\h*|\h*$', '')
        Local $s_Sec = StringRegExp($s_File, '(?si)(?:^|\n)\h*\[\h*\Q' & $_Section & '\E\h*\](.+?)(?=\r?\n\h*\[|$)', 3)
	If @error Then Return SetError(1, 0, 0)
	$line_all = $s_Sec[0]
	If $nFlag Then
        	For $i = 1 To UBound($s_Sec) - 1
                	$line_all &= $s_Sec[$i]
        	Next
	Endif
	If Not StringRegExp($line_all, '\V') Then Return SetError(2, 0, 0)
	Return $line_all
EndFunc   ;==>_IniReadSection_str


; 函数名:_IniReadSection_line;===================================================================
; 说明:　从(非)标准INI结构文件中逐行读取某个字段中的字符到一个1维数组。
; 语法:　_IniReadSection_line('ini文件路径', '字段名'[, 打开模式[, 重复标志]])
; 参数:　重复标志 - [可选]，有些inf文件会有重复的字段名，设置此标志为1时可读取所有内容。
; 返回值:成功: 返回一个1维数组，每个元素为字段中一行字符。
;　　　　失败: 返回0。如INI文件读取错误或字段不存在将设置 @error=1；字段内容为空将设置 @error=2
; 注意:　每行字符串的首尾空格均会排除；不会返回第一个非空格字符为“;”的注释行。
;==========================================================================================start
Func _IniReadSection_line($iFile, $Section, $mode = 0, $nFlag = 0)
	Local $s_Sec = _IniReadSection_str($iFile, $Section, $mode, $nFlag)
	If @error Then Return SetError(@error, 0, 0)
        Local $s_line = StringRegExp($s_Sec, '\n\h*([^;\s].*?)\h*(?=\r?\n|$)', 3)
	If @error Then Return SetError(2, 0, 0)
	Return $s_line
EndFunc   ;==>_IniReadSection_line


; 函数名:_FileRead;============================================================================
; 说明:　用FileOpen的打开模式返回读取文件的字符串
;==========================================================================================start
Func _FileRead($iFile, $mode = 0)
	Local $o_File = FileOpen($iFile, $mode)
	Local $s_File = String(FileRead($o_File))
	FileClose($o_File)
	Return $s_File
EndFunc   ;==>_FileRead


; 函数名:_IniDelete_line;=============================================================================
; 说明:　从(非)标准INI结构文件中删除(含有)关键字的行。
; 语法:　_IniDelete_line('ini文件路径', '字段名', '关键字'[, 匹配标志[, 打开模式]])
; 参数:　可选参数 匹配标志，= 0 含有要删除的关键字(默认)； = 1 完整匹配关键字。
; 返回值:成功: 返回1。
;　　　　失败: 返回0。并设置 @Error 为以下值：
;　　　　　　　　　　　　　　@Error=1 文件或字段不存在；
;　　　　　　　　　　　　　　@Error=3 根据匹配标志未匹配到关键字(不存在)；
;　　　　　　　　　　　　　　@Error=4 文件具有只读属性或者无法写入数据设置。
; 注意:　该函数仅执行一次删除行，如有多行(含有)关键字的行需要删除，可多次执行。
;==========================================================================================start
Func _IniDelete_line($iFile, $Section, $key, $flag = 0, $mode = 0)
	Local $s_File = _FileRead($iFile, $mode)
	Local $_Section = StringRegExpReplace($Section, '^\h*(.+?)\h*$', '$1')
	$_Section = StringRegExpReplace($_Section, '(\.|\||\*|\?|\+|\(|\)|\{|\}|\[|\]|\^|\$|\\)', '\\$1')
	$_Section = '\[\h*' & $_Section & '\h*\]'
	If Not StringRegExp(@CRLF & $s_File, '\r?\n\h*' & $_Section & '\s*') Then Return SetError(1, 0, 0)
	Local $_key = StringRegExpReplace($key, '(\.|\||\*|\?|\+|\(|\)|\{|\}|\[|\]|\^|\$|\\|\=)', '\\$1')
	If $flag = 0 Then $_key = '[^\r?\n]*?' & $_key & '.*?'
	Local $s_data = StringRegExpReplace(@CRLF & $s_File & @CRLF, '(?si)(.*?\r?\n\h*' & $_Section & '\h*\r?\n(?:\h*[^\[\r\n]*\r?\n)*?)' & $_key & '\r?\n(.*)', '${1}$2')
	If @Extended = 0 Then Return SetError(3, 0, 0)
	$s_data = StringTrimRight(StringTrimLeft($s_data, 2), 2)
	Local $FO = FileOpen($iFile, $mode + 2)
	Local $Write = FileWrite($FO, $s_data)
	FileClose($FO)
	If $Write = 0 Then Return SetError(4, 0, 0)
	Return 1
EndFunc   ;==>_IniDelete_line

	
	