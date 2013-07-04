#Region ;**** 参数创建于 ACNWrapper_GUI ****
#PRE_Icon=GoAgent.ico
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
Global  $appid2 = "xz00311|xz0031140|xiaozhan40|xiaozhan5201314|5201314xiaozhan|xiaozhan0031140|xiaozhanliyu|"
Global  $appid3 = "xiaozhanjiaming|liyuning5201314|xiaozhanliyuning"
Global  $appid4 = _ID()
Global  $appid =  $appid1 & $appid2 & $appid3 & $appid4
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
			IniWrite(GUICtrlRead($Input1) & "\proxy.ini", "gae","appid",$appid)
			$readID = IniRead(GUICtrlRead($Input1) & "\proxy.ini", "gae","appid","NOID")
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
Global  $DID = "jass-button-1|gfanqiang010-8|wowdonate-hj-04|freegoagent124|lovejiani035|freegoagent642|freegoagent289|" & _
			"freegoagent718|gfanqiang029-9|freegoagent663|gfanqiang023-2|freegoagent647|wowdonate-ch-09|freegoagent752|" & _
			"lovejiani037|freegoagent828|wowdonate-edg-01|gfanqiang000-1|gfanqiang017-6|freegoagent454|freegoagent614|" & _
			"freegoagent420|freegoagent409|freegoagent502|gfanqiang009-5|freegoagent493|freegoagent589|gfanqiang025-4|" & _
			"freegoagent643|freegoagent494|freegoagent704|wowdonate-ch-11|freegoagent131|kawaiiushio3|freegoagent671|" & _
			"publicwallproxy4|gfanqiang016-2|gfanqiang024-7|freegoagent376|szdsdf9104-09|freegoagent972|gfanqiang000-3|" & _
			"gfanqiang017-2|gfanqiang001-0|freegoagent740|freegoagent728|freegoagent134|icezero0005|wowdonate-m18-12|" & _
			"freegoagent438|gfanqiang011-6|freegoagent963|lovejiani024|vbtcozzh|wowdonate-ch-74|freegoagent983|freegoagent865|" & _
			"wowdonate-tts-20|freegoagent201|gfanqiang024-0|freegoagent944|freegoagent295|gfanqiang026-9|freegoagent109|" & _
			"wowdonate-badboy-09|wowdonate-ch-13|freegoagent860|gfanqiang028-4|freegoagent305|wowdonate-ch-76|freegoagent709|" & _
			"stepfordcuckoos01|x9088-sz-08|wowdonate-ch-15|freegoagent852|freegoagent080|xideassassin6|gfanqiang003-2|" & _
			"freegoagent404|freegoagent163|freegoagent600|freegoagent665|nbslf11|gfanqiang010-6|wowdonate-ch-55|" & _
			"wowdonate-m18-49|freegoagent867|freegoagent816|freegoagent942|wowdonate-ch-41|freegoagent766|gfanqiang004-7|" & _
			"freegoagent332|freegoagent780|gfwsbgfwsbgfwsb|zzhvbtcoclannad|sfuyong5|gfanqiang002-5|wowdonate-lvp-17|" & _
			"freegoagent895|freegoagent602|freegoagent902|gfanqiang029-1|gfanqiang028-7|freegoagent622|lovejiani020|" & _
			"x9088-sz-01|freegoagent649|freegoagent661|freegoagent953|wowdonate-ch-03|lovejiani057|lovejiani036|freegoagent869|" & _
			"freegoagent774|jk9084s-09|publicwallproxy1|gfanqiang019-9|freegoagent392|gfanqiang021-8|gfanqiang032-7|" & _
			"freegoagent186|freegoagent941|wowdonate-hj-03|wowdonate-ch-39|ttphc6|freegoagent234|wowdonate-ch-77|" & _
			"gfanqiang033-9|freegoagent218|freegoagent969|fghdis9105z-02|freegoagent216|gfanqiang020-8|wowdonate-lvp-02|" & _
			"freegoagent570|overwallchina|gfanqiang001-1|freegoagent803|wowdonate-badboy-02|gfanqiang003-7|overwallone|" & _
			"freegoagent417|freegoagent102|freegoagent726|gfanqiang018-6|gfanqiang007-6|wowdonate-m18-15|youxiang190001|" & _
			"lovejiani029|ttphc5|gfanqiang030-7|gfanqiang034-4|publicgoagent5|freegoagent683|wowdonate-badboy-03|" & _
			"freegoagent126|publicgoagent4|freegoagent932|gonggongid13|gfanqiang000-8|gfanqiang026-0|freegoagent237|" & _
			"wowdonate-100-06|freegoagent611|freegoagent375|freegoagent499|s-g9085h-10|freegoagent721|freegoagent372|" & _
			"wowdonate-ch-20|wowdonate-ceec-09|freegoagent215|freegoagent959|overwallbeta|gfanqiang023-0|freegoagent213|" & _
			"freegoagent937|gfanqiang016-9|wowdonate-tts-29|freegoagent203|nbslf6|freegoagent521|freegoagent584|" & _
			"freegoagent971|freegoagent232|freegoagent558|freegoagent567|x9088-sz-07|freegoagent075|freegoagent527|" & _
			"wowdonate-sd-36|freegoagent361|youxiang01235|freegoagent478|wowdonate-sd-40|freegoagent169|freegoagent310|" & _
			"freegoagent715|wowdonate-m18-25|gfanqiang007-5|starballl2|freegoagent431|xinxijishuwyq24|freegoagent320|" & _
			"gfanqiang012-0|freegoagent195|gfanqiang007-1|wowdonate-lvp-09|gfanqiang024-4|freegoagent743|freegoagent506|" & _
			"youxiang01238|gfanqiang035-9|gfanqiang018-9|freegoagent224|lovejiani062|gfanqiang027-8|fgabootstrap006|" & _
			"lovejiani021|freegoagent578|gfanqiang019-3|freegoagent948|freegoagent427|wowdonate-ceec-08|freegoagent985|" & _
			"freegoagent920|gfanqiang021-3|gfanqiang028-5|lovejiani071|freegoagent533|gfanqiang018-2|wowdonate-tts-11|" & _
			"freegoagent917|gfanqiang016-4|wowdonate-100-10|cielo032026|freegoagent351|freegoagent226|wowdonate-sofa-08|" & _
			"wowdonate-sofa-07|gfanqiang002-0|wowdonate-sd-37|freegoagent426|freegoagent200|goagent-public-2|vi88com1|" & _
			"gfanqiang003-6|freegoagent730|youxiang01237|smartladder019|freegoagent708|freegoagent560|wowdonate-ch-40|" & _
			"freegoagent835|gfanqiang008-1|sfuyong6|freegoagent542|freegoagent054|freegoagent807|smartladder016|" & _
			"gfanqiang012-6|freegoagent946|freegoagent538|freegoagent892|freegoagent333|freegoagent526|gfanqiang012-4|" & _
			"freegoagent111|gfanqiang011-7|gfanqiang008-4|gfanqiang019-1|freegoagent416|wowdonate-sofa-12|gfanqiang035-1|" & _
			"freegoagent873|freegoagent910|gfanqiang015-9|gfanqiang034-7|wowdonate-ch-38|xinxijishuwyq25|wowdonate-sofa-13|" & _
			"freegoagent374|freegoagent277|freegoagent949|ttphc10|lovejiani061|freegoagent189|freegoagent857|overwalltmd|" & _
			"freegoagent466|xideassassin2|lovejiani055|wowdonate-sd-25|freegoagent327|freegoagent424|gfanqiang013-1|" & _
			"wowdonate-lvp-10|gfanqiang009-1|freegoagent618|wowdonate-lvp-14|wowdonate-tts-18|freegoagent759|wowdonate-ch-66|" & _
			"freegoagent940|gfanqiang026-7|wowdonate-ch-23|gfanqiang020-5|freegoagent509|wowdonate-ch-69|wowdonate-sx-01|" & _
			"freegoagent582|freegoagent761|overwallorz|freegoagent276|freegoagent936|freegoagent750|gfanqiang035-2|pdslzq8|" & _
			"jk9084s-08|gfanqiang022-0|fgaupdate010|wowdonate-m18-24|wowdonate-sd-22|freegoagent335|freegoagent621|" & _
			"freegoagent605|wowdonate-ch-21|wowdonate-sx-00|freegoagent500|freegoagent184|freegoagent801|lovejiani034|" & _
			"freegoagent781|wowdonate-sd-03|gfanqiang015-8|stepfordcuckoos06|gfanqiang009-4|lovejiani033|wowdonate-hj-09|" & _
			"lovejiani006|overwallchrome|gfanqiang012-2|gfanqiang023-3|freegoagent180|freegoagent396|ttphc8|freegoagent459|" & _
			"publicgoagent3|freegoagent172|wowdonate-ch-01|freegoagent863|freegoagent363|freegoagent706|freegoagent644|" & _
			"publicwallproxy3|gfanqiang022-6|freegoagent192|gfanqiang030-1|freegoagent489|freegoagent887|freegoagent038|" & _
			"freegoagent853|gfanqiang009-3|freegoagent443|wowdonate-m18-23|freegoagent695|xideassassin4|wowdonate-sx-17|" & _
			"freegoagent748|freegoagent837|freegoagent707|lovejiani053|wowdonate-hj-06|lovejiani066|wowdonate-fuyong-08|" & _
			"gfanqiang001-2|lovejiani028|wowdonate-ch-33|freegoagent513|wowdonate-sd-07|freegoagent907|freegoagent108|" & _
			"freegoagent575|freegoagent220|freegoagent755|wowdonate-ch-06|freegoagent468|freegoagent767|freegoagent587|" & _
			"freegoagent785|youxiang01232|freegoagent685|freegoagent793|wowdonate-fuyong-06|freegoagent829|wowdonate-sx-08|" & _
			"wowdonate-sd-02|gfanqiang007-8|freegoagent890|intoskip7|gfanqiang009-9|xinxijishuwyq23|gfanqiang032-5|" & _
			"freegoagent667|overwall3444|youxiang190007|gfanqiang036-2||freegoagent739|freegoagent881|wowdonate-ch-56|" & _
			"freegoagent928|gfanqiang014-2|wowdonate-sd-13|lovejiani047|wowdonate-ch-51|smartladder009|freegoagent676|" & _
			"gfanqiang035-4|freegoagent539|gfanqiang016-3|freegoagent714|freegoagent573|gfanqiang005-5|gfanqiang004-8|" & _
			"gfanqiang010-3|freegoagent650|fghdis9105z-06|pdslzq5|gfanqiang023-8|lovejiani012|gfanqiang027-9|freegoagent528|" & _
			"gfanqiang026-2|freegoagent734|freegoagent855|gfanqiang031-2|wowdonate-ceec-03|wowdonate-ch-32|gfanqiang025-9|" & _
			"freegoagent964|wowdonate-m18-32|freegoagent680|goagentplus001|freegoagent230|freegoagent318|freegoagent053|" & _
			"freegoagent532|freegoagent702|jk9084s-04|freegoagent834|gfanqiang009-6|starballl6|freegoagent610|freegoagent769|" & _
			"smartladder005|freegoagent086|wowdonate-ch-10|fganr002|freegoagent549|xinxijishuwyq21|wowdonate-m18-02|" & _
			"freegoagent593|wowdonate-m18-07|gfanqiang004-1|freegoagent082|wowdonate-m18-67|gfanqiang034-1|lovejiani064|" & _
			"freegoagent379|lovejiani052|icezero0009|freegoagent273|wowdonate-lvp-06|wowdonate-sd-11|freegoagent826|" & _
			"freegoagent838|freegoagent380|gfanqiang002-1|freegoagent592|gfanqiang034-5|freegoagent652|freegoagent261|" & _
			"gfanqiang003-5|clannadzzhvbtco|freegoagent525|gfanqiang024-1|lovejiani026|gfanqiang005-7|freegoagent347|" & _
			"wowdonate-tts-04|wowdonate-m18-39|wowdonate-fuyong-03|gfanqiang002-9|freegoagent960|gfw46796|gfanqiang002-4|" & _
			"freegoagent848|gfanqiang007-3|gfanqiang010-4|freegoagent757|wowdonate-tts-05|gfanqiang013-5|x9088-sz-06|" & _
			"freegoagent167|intoskip8|wowdonate-sd-15|vbtcoclannadzzh|vbtcoclannad|gfanqiang023-5|gfanqiang005-0|" & _
			"lovejiani069|freegoagent378|gfanqiang024-2|freegoagent508|fgaupdate007|freegoagent776|gfanqiang015-7|" & _
			"gfanqiang017-3|wowdonate-tts-16|gfanqiang014-0|vi88com7|freegoagent787|freegoagent390|wowdonate-m18-29|" & _
			"szdsdf9104-06|freegoagent381|wowdonate-sofa-02|freegoagent831|freegoagent961|gfanqiang026-8|gfanqiang019-6|" & _
			"lovejiani030|gfanqiang012-7|gfanqiang004-6|wowdonate-sd-16|gfanqiang029-6|wowdonate-sd-19|gfanqiang026-5|" & _
			"youxiang190006|freegoagent182|freegoagent326|fgabootstrap007|pinkfifi111|lovejiani063|freegoagent484|" & _
			"x9088-sz-02|freegoagent957|freegoagent809|freegoagent894|vbtcozzhclannad|freegoagent765|gfanqiang006-6|" & _
			"wowdonate-sx-12|freegoagent699|smartladder003|wowdonate-lvp-01|gfanqiang001-8|gfanqiang017-0|wowdonate-hj-07|" & _
			"gfanqiang017-5|gfanqiang008-8|freegoagent858|freegoagent729|freegoagent732|wowdonate-tts-13|freegoagent312|" & _
			"freegoagent899|jk9084s-02|gfanqiang024-9|youxiang01239|szdsdf9104-05|moyb21928|freegoagent678|freegoagent668|" & _
			"freegoagent825|gfanqiang028-6|wowdonate-100-02|gfanqiang005-3|wowdonate-sd-34|freegoagent802|jpj4register3|" & _
			"s-g9085h-08|freegoagent727|vi88com4|sfuyong8|freegoagent924|overwallomg|lovejiani060|wowdonate-ch-19|" & _
			"freegoagent383|freegoagent811|gfanqiang007-2|xideassassin3|freegoagent716|freegoagent629|wowdonate-sofa-04|" & _
			"gfanqiang025-1|cielo032022|freegoagent272|freegoagent548|wowdonate-tts-21|freegoagent770|wowdonate-m18-53|" & _
			"gfanqiang011-8|freegoagent148|freegoagent408|freegoagent537|gfanqiang019-4|s-g9085h-05|freegoagent081|" & _
			"wowdonate-lvp-16|freegoagent646|freegoagent511|freegoagent918|freegoagent682|freegoagent866|agfw-server-4|" & _
			"publicfqh|wowdonate-m18-68|freegoagent738|lovejiani068|gfanqiang025-8|wowdonate-edg-03|freegoagent677|" & _
			"freegoagent672|freegoagent815|cielo032018|freegoagent868|wowdonate-lvp-13|gfanqiang020-0|freegoagent624|" & _
			"freegoagent544|lovejiani039|wowdonate-sd-26|wowdonate-ch-62|freegoagent775|gfanqiang019-8|freegoagent805|" & _
			"freegoagent660|freegoagent795|wowdonate-lvp-11|gfanqiang020-9|wowdonate-100-01|gfanqiang001-3|youxiang0123|" & _
			"freegoagent074|freegoagent882|freegoagent505|gfanqiang000-5|freegoagent369|freegoagent566|lovejiani044|" & _
			"lovejiani031|lovejiani002|freegoagent690|freegoagent736|freegoagent819|wowdonate-m18-14|freegoagent460|" & _
			"wowdonate-m18-17|overwallxm|freegoagent950|wowdonate-tts-09|wowdonate-ch-60|lovejiani050|freegoagent633|" & _
			"freegoagent791|freegoagent698|freegoagent620|freegoagent800|freegoagent717|gfanqiang016-8|lovejiani049|" & _
			"gfanqiang031-4|freegoagent713|wowdonate-tts-27|freegoagent935|gfanqiang002-3|gfanqiang005-8|freegoagent888|" & _
			"freegoagent966|gfanqiang021-4|gfw46795|smartladder018|freegoagent555|gfanqiang018-7|freegoagent450|zzhvbtco|" & _
			"xideassassin5|youxiang190004|xk8581221761|wowdonate-m18-63|gfanqiang028-9|lovejiani007|freegoagent253|" & _
			"freegoagent359|publicwallproxy2|freegoagent958|xideassassin8|wowdonate-tts-12|freegoagent977|wowdonate-sd-27|" & _
			"gfanqiang025-0|wowdonate-ceec-07|freegoagent591|freegoagent175|freegoagent221|lovejiani010|wowdonate-fuyong-09|" & _
			"lovejiani027|freegoagent259|freegoagent827|wowdonate-sd-08|stepfordcuckoos03|freegoagent778|gfanqiang035-7|" & _
			"gfanqiang020-3|wowdonate-ch-47|freegoagent068|gfanqiang021-6|freegoagent222|freegoagent808|wowdonate-m18-69|" & _
			"gfanqiang009-8|smartladder002|lovejiani044|lovejiani051|freegoagent444|gfanqiang006-1|gfanqiang024-5|freegoagent797|" & _
			"freegoagent292|gfw4679|gfanqiang012-5|freegoagent524|wowdonate-ch-18|freegoagent266|freegoagent619|freegoagent562|" & _
			"wowdonate-m18-59|wowdonate-tts-23|gfanqiang010-0|wowdonate-m18-09|gfanqiang036-0|freegoagent915|intoskip6|" & _
			"freegoagent568|gfanqiang029-2|freegoagent897|gfanqiang033-2|wowdonate-ch-70|freegoagent982|freegoagent674|" & _
			"gfanqiang036-3|freegoagent418|wowdonate-sx-16|youxiang190008|freegoagent875|freegoagent517|freegoagent032|" & _
			"wowdonate-sd-14|freegoagent337|wowdonate-ch-72|freegoagent207|wowdonate-hj-08|youxiang012341|wowdonate-ch-05|" & _
			"freegoagent840|freegoagent344|gfanqiang030-8|gfanqiang017-4|overwalltwo|freegoagent974|lovejiani022|gfanqiang004-5|" & _
			"szdsdf9104-04|lovejiani046|fghdis9105z-07|wowdonate-sofa-09|wowdonate-m18-48|wowdonate-ch-71|szdsdf9104-07|" & _
			"freegoagent705|gfanqiang006-0|gfanqiang017-8|wowdonate-tts-02|freegoagent058|gfanqiang000-7|gfanqiang010-5|" & _
			"wowdonate-m18-33|x9088-sz-09|freegoagent823|freegoagent931|wowdonate-lvp-03|gfanqiang035-3|gfanqiang035-0|" & _
			"lovejiani013|lovejiani016|freegoagent481|freegoagent733|freegoagent586|overwallstable|icezero0002|" & _
			"wowdonate-sd-21|wowdonate-100-07|wowdonate-sx-10|publicgoagent7|gfanqiang006-4|freegoagent448|freegoagent712|" & _
			"lovejiani009|wowdonate-sd-28|gfanqiang018-0|freegoagent283|gfanqiang036-9|freegoagent879|freegoagent487|" & _
			"wowdonate-m18-45|wowdonate-sd-18|freegoagent697|gfanqiang016-5|wowdonate-sd-29|wowdonate-m18-62|smartladder014|" & _
			"wowdonate-tts-28|gfanqiang014-1|freegoagent782|wowdonate-edg-02|wowdonate-m18-65|freegoagent300|jk9084s-06|" & _
			"fghdis9105z-01|wowdonate-lvp-05|gfanqiang005-2|gfanqiang015-6|wowdonate-ch-14|wowdonate-sofa-22|gfanqiang021-1|" & _
			"freegoagent314|wowdonate-sd-20|gfanqiang023-7|freegoagent711|freegoagent475|freegoagent673|gfanqiang018-8|" & _
			"wowdonate-sd-10|freegoagent107|gonggongid12|freegoagent891|freegoagent980|gfanqiang034-0|freegoagent174|" & _
			"wowdonate-tts-22|jk9084s-05|x9088-sz-10|freegoagent893|freegoagent181|freegoagent679|freegoagent073|" & _
			"freegoagent947|freegoagent211|freegoagent883|freegoagent900|gfanqiang026-1|gfanqiang033-8|freegoagent060|" & _
			"freegoagent914|wowdonate-lvp-20|gfanqiang003-0|freegoagent153|freegoagent321|starballl3|overwallfbx|freegoagent856|" & _
			"gfanqiang034-8|freegoagent482|wowdonate-m18-26|freegoagent325|gfanqiang006-8|freegoagent987|gfanqiang002-8|" & _
			"freegoagent275|freegoagent425|freegoagent415|freegoagent104|freegoagent777|gfanqiang029-3|fghdis9105z-09|" & _
			"gfanqiang026-4|freegoagent804|gfanqiang008-9|wowdonate-sd-35|1.wyq476137265|gfanqiang022-3|jk9084s-10|" & _
			"agfw-server-3|freegoagent495|wowdonate-tts-07|wowdonate-sd-01|freegoagent691|wowdonate-ch-53|gfanqiang034-9|" & _
			"freegoagent806|wowdonate-edg-08|freegoagent179|jk9084s-03|youxiang190009|freegoagent744|smartladder006|" & _
			"wowdonate-m18-52|lovejiani058|wowdonate-sd-05|wowdonate-fuyong-02|freegoagent596|wowdonate-m18-16|freegoagent841|" & _
			"gfanqiang015-5|freegoagent836|gfw46794|gfanqiang009-7|wowdonate-sofa-01|freegoagent210|icezero0003|wowdonate-sd-24|" & _
			"gfanqiang029-0|intoskip5|wowdonate-m18-38|freegoagent651|freegoagent245|wowdonate-lvp-12|gfanqiang014-5|" & _
			"gfanqiang030-9|wowdonate-ceec-02|fghdis9105z-05|cielo032019|freegoagent341|fghdis9105z-03|pdslzq6|gfanqiang032-4|" & _
			"freegoagent926|freegoagent254|freegoagent577|gfanqiang011-1|gfanqiang014-9|gfanqiang027-2|freegoagent922|" & _
			"freegoagent397|freegoagent934|gfanqiang006-5|wowdonate-m18-55|freegoagent581|freegoagent938|gfanqiang013-0|" & _
			"freegoagent923|smartladder000|gfanqiang004-0|freegoagent909|wowdonate-sofa-10|wowdonate-ceec-06|freegoagent912|" & _
			"freegoagent391|freegoagent872|gfanqiang019-7|freegoagent921|gfanqiang027-7|freegoagent659|gfanqiang006-3|" & _
			"wowdonate-sofa-15|freegoagent799|wowdonate-edg-09|wowdonate-badboy-01|freegoagent288|freegoagent472|" & _
			"freegoagent603|freegoagent821|xideassassin1|wowdonate-ch-57|freegoagent654|freegoagent535|freegoagent842|" & _
			"freegoagent933|wowdonate-m18-10|wowdonate-ch-25|cielo032021|freegoagent515|freegoagent263|gfanqiang030-2|" & _
			"gfanqiang003-8|wowdonate-m18-19|gfanqiang017-1|wowdonate-ch-48|wowdonate-sofa-20|freegoagent158|freegoagent271|" & _
			"freegoagent251|gfanqiang035-6|wowdonate-fuyong-04|szdsdf9104-01|lovejiani059|freegoagent473|freegoagent874|" & _
			"1.sbgfwsbgfwsbgfw|freegoagent794|freegoagent833|freegoagent574|freegoagent217|wowdonate-m18-11|wowdonate-m18-41|" & _
			"freegoagent832|wowdonate-badboy-04|gfanqiang007-0|gfanqiang018-3|freegoagent772|freegoagent432|wowdonate-ch-17|" & _
			"freegoagent294|freegoagent290|freegoagent859|wowdonate-ch-68|icezero0004|freegoagent886|jpj4register1|icezero0010|" & _
			"wowdonate-sd-09|jk9084s-07|gfanqiang004-9|lovejiani054|freegoagent194|gfanqiang022-4|freegoagent077|freegoagent956|" & _
			"wowdonate-sd-30|wowdonate-sx-15|gfanqiang021-7|lovejiani045|wowdonate-m18-36|gfanqiang003-9|overwalls1|" & _
			"overwallpress|freegoagent760|wowdonate-ch-75|freegoagent349|freegoagent696|freegoagent298|freegoagent692|" & _
			"freegoagent166|overwallpt|nbslf8|gfanqiang032-6|smartladder007|freegoagent199|freegoagent433|freegoagent645|" & _
			"wowdonate-ch-27|freegoagent749|gfanqiang008-2|wowdonate-sd-17|wowdonate-ch-50|lovejiani001|gfanqiang033-4|" & _
			"freegoagent954|x9088-sz-03|wowdonate-hj-02|wowdonate-ch-34|wowdonate-sx-06|wowdonate-sofa-11|fghdis9105z-10|" & _
			"freegoagent204|freegoagent536|freegoagent191|wowdonate-m18-06|freegoagent187|gfanqiang003-1|gfanqiang008-6|" & _
			"freegoagent722|gfanqiang009-2|freegoagent357|freegoagent106|wowdonate-ch-35|freegoagent302|wowdonate-ch-78|" & _
			"freegoagent979|freegoagent311|gfanqiang011-9|gfanqiang030-6|freegoagent387|wowdonate-sd-38|freegoagent100|" & _
			"wowdonate-badboy-10|freegoagent209|wowdonate-badboy-07|wowdonate-ceec-04|pdslzq9|freegoagent889|" & _
			"wowdonate-m18-22|freegoagent990|gfanqiang004-3|freegoagent903|freegoagent822|lovejiani040|freegoagent877|" & _
			"gfanqiang025-2|freegoagent250|gfanqiang031-3|gfanqiang015-2|freegoagent308|freegoagent724|wowdonate-lvp-08|" & _
			"wowdonate-ch-67|gfanqiang007-4|wowdonate-m18-60|gfanqiang018-1|freegoagent847|wowdonate-fuyong-10|" & _
			"gfanqiang028-0|lovejiani032|xideassassin9|gfanqiang021-0|gfanqiang025-3|freegoagent122|freegoagent615|" & _
			"gfanqiang010-7|gfanqiang034-6|gfanqiang030-4|sfuyong7|gfanqiang013-3|cielo032024|freegoagent792|gfanqiang031-6|" & _
			"freegoagent656|freegoagent407|fghdis9105z-08|publicfqi|gfanqiang035-5|wowdonate-sx-13|freegoagent607|" & _
			"wowdonate-ch-24|freegoagent547|freegoagent745|wowdonate-sofa-05|freegoagent880|freegoagent813|freegoagent238|" & _
			"freegoagent796|lovejiani038|overwallpro|freegoagent183|s-g9085h-04|freegoagent904|smartladder004|freegoagent323|" & _
			"gfanqiang031-9|freegoagent631|gfanqiang027-1|lovejiani014|wowdonate-ch-61|wowdonate-tts-19|gfanqiang014-3|" & _
			"gfanqiang015-1|freegoagent694|freegoagent264|freegoagent839|freegoagent753|wowdonate-m18-28|freegoagent479|" & _
			"gfanqiang035-8|freegoagent497|freegoagent196|freegoagent655|gfanqiang020-2|freegoagent531|wowdonate-edg-04|" & _
			"gfanqiang010-2|freegoagent463|freegoagent249|freegoagent492|huang0zijian|youxiang190002|wowdonate-sd-04|" & _
			"gfanqiang018-4|wowdonate-ch-04|freegoagent725|lovejiani0641|gfw46792|wowdonate-m18-61|gfanqiang022-8|" & _
			"freegoagent580|freegoagent386|freegoagent817|wowdonate-m18-51|wowdonate-ch-02|gfanqiang036-4|freegoagent641|" & _
			"freegoagent239|freegoagent989|gfanqiang025-5|gfanqiang036-5|pdslzq7|wowdonate-ch-49|freegoagent657|freegoagent055|" & _
			"wowdonate-sofa-18|smartladder013|gfanqiang005-6|gfanqiang007-7|gfanqiang032-8|freegoagent094|freegoagent063|" & _
			"freegoagent762|freegoagent588|freegoagent606|freegoagent626|freegoagent746|freegoagent962|freegoagent430|" & _
			"szdsdf9104-02|lovejiani070|wowdonate-m18-20|freegoagent491|icezero0006|freegoagent623|wowdonate-ch-65|" & _
			"wowdonate-ch-28|gfanqiang015-4|wowdonate-tts-08|freegoagent612|gfanqiang002-2|wowdonate-sx-14|freegoagent850|" & _
			"gfanqiang027-5|szdsdf9104-08|lovejiani067|icezero0007|freegoagent929|fgabootstrap010|gfanqiang034-2|" & _
			"freegoagent648|lovejiani023|freegoagent307|freegoagent572|s-g9085h-03|gfanqiang028-3|freegoagent636|" & _
			"wowdonate-ch-59|gfanqiang005-4|xideassassin7|wowdonate-m18-42|clannadvbtcozzh|gfanqiang031-8|gfanqiang030-3|" & _
			"freegoagent455|freegoagent666|stepfordcuckoos08|wowdonate-fuyong-05|freegoagent773|freegoagent486|gfanqiang033-1|" & _
			"freegoagent901|wowdonate-sx-18|wowdonate-ceec-05|gfanqiang033-7|freegoagent638|qq362569870|wowdonate-tts-06|" & _
			"freegoagent906|wowdonate-sd-12|freegoagent820|x9088-sz-04|gfanqiang014-6|freegoagent280|freegoagent457|" & _
			"wowdonate-sx-11|vi88com5|jk9084s-01|freegoagent955|freegoagent689|wowdonate-ch-64|freegoagent579|freegoagent878|" & _
			"gfanqiang006-7|gfanqiang013-4|wowdonate-m18-40|wowdonate-ch-45|szdsdf9104-10|wowdonate-badboy-05|lovejiani008|" & _
			"gfanqiang018-5|gfanqiang019-5|freegoagent090|wowdonate-m18-70|stepfordcuckoos07|starballl7|freegoagent604|" & _
			"freegoagent609|freegoagent504|freegoagent686|gfanqiang029-4|smartladder012|scnufuyong|publicgoagent8|" & _
			"freegoagent870|wowdonate-m18-08|wowdonate-sx-20|freegoagent684|gfanqiang001-4|lovejiani025|wowdonate-sofa-19|" & _
			"gfanqiang001-5|wowdonate-sofa-21|wowdonate-100-09|gfanqiang000-9|clannadvbtco|gfanqiang000-4|wowdonate-tts-30|" & _
			"gfanqiang031-7|overwallthree|freegoagent556|s-g9085h-07|freegoagent501|freegoagent350|wowdonate-ch-73|laiguo123|" & _
			"gfanqiang011-4|wowdonate-m18-44|gfanqiang001-7|freegoagent783|gfanqiang031-5|gfanqiang029-8|freegoagent520|" & _
			"wowdonate-tts-26|freegoagent377|gfanqiang014-8|freegoagent898|wowdonate-edg-06|fgabootstrap003|gfanqiang000-6|" & _
			"publicgoagent6|gfanqiang029-7|freegoagent981|freegoagent952|wowdonate-sx-07|overwalldev|freegoagent688|" & _
			"lovejiani017|freegoagent669|freegoagent464|x9088-sz-05|freegoagent798|freegoagent227|freegoagent675|" & _
			"freegoagent452|gfanqiang027-0|freegoagent788|wowdonate-ch-36|gfanqiang011-3|freegoagent523|freegoagent913|" & _
			"gfanqiang012-9|goagent-public-1|freegoagent919|wowdonate-sofa-06|freegoagent247|freegoagent240|freegoagent097|" & _
			"wowdonate-tts-01|gfanqiang031-1|gfanqiang032-2|gfanqiang032-0|wowdonate-tts-15|stepfordcuckoos09|gfanqiang003-3|" & _
			"gfanqiang003-4|freegoagent540|freegoagent047|youxiang19000|freegoagent132|freegoagent205|szdsdf9104-03|" & _
			"freegoagent742|freegoagent278|lovejiani065|wowdonate-m18-46|fghdis9105z-04|freegoagent595|wowdonate-m18-21|" & _
			"youxiang01231|wowdonate-m18-05|fganr001|freegoagent402|freegoagent256|wowdonate-m18-34|gfanqiang012-8|" & _
			"youxiang01236|overwalljp|gfanqiang027-4|wowdonate-ch-58|gfanqiang028-1|nbslf9|wowdonate-m18-04|freegoagent248|" & _
			"wowdonate-m18-13|wowdonate-ch-22|gfanqiang004-2|gonggongid20|freegoagent260|s-g9085h-09|gfanqiang034-3|" & _
			"freegoagent790|freegoagent550|freegoagent851|freegoagent973|wowdonate-ch-46|gfanqiang016-7|wowdonate-sx-09|" & _
			"freegoagent637|overwallmin|freegoagent099|freegoagent976|stepfordcuckoos02|freegoagent322|gfanqiang026-6|" & _
			"wowdonate-sd-33|wowdonate-sx-02|gfanqiang009-0|freegoagent625|wowdonate-edg-07|wowdonate-ch-52|s-g9085h-02|" & _
			"gfanqiang023-6|gfanqiang012-3|gfanqiang012-1|gfanqiang032-3|freegoagent129|freegoagent747|wowdonate-tts-10|" & _
			"freegoagent943|gfanqiang036-7|gfanqiang036-6|starballl|freegoagent818|wowdonate-ch-12|publicfqj|" & _
			"1.wangyuqi19961213|freegoagent737|gfanqiang022-7|freegoagent862|gfanqiang023-1|freegoagent978|gfanqiang005-1|" & _
			"youxiang190005|lovejiani011|freegoagent751|wowdonate-100-05|wowdonate-m18-57|zzhclannadvbtco|wowdonate-sx-21|" & _
			"xinxijishuwyq22|freegoagent149|freegoagent779|freegoagent970|freegoagent601|freegoagent662|gfanqiang001-9|" & _
			"freegoagent632|wowdonate-100-08|gfanqiang017-9|freegoagent164|s-g9085h-01|gfanqiang027-3|gfanqiang016-1|" & _
			"freegoagent559|freegoagent664|freegoagent768|freegoagent984|freegoagent451|freegoagent876|wowdonate-badboy-06|" & _
			"wowdonate-sd-39|lovejiani019|freegoagent861|freegoagent824|lovejiani018|freegoagent670|freegoagent309|" & _
			"freegoagent471|freegoagent988|freegoagent758|cielo032023|gfanqiang004-4|wowdonate-fuyong-07|wowdonate-m18-30|" & _
			"gfw46797|wowdonate-m18-66|freegoagent442|freegoagent846|freegoagent241|gfanqiang013-7|freegoagent741|" & _
			"wowdonate-ch-80|freegoagent849|lovejiani004|freegoagent884|freegoagent202|freegoagent597|smartladder011|" & _
			"freegoagent274|freegoagent916|freegoagent885|wowdonate-tts-24|freegoagent147|lovejiani041|freegoagent764|" & _
			"freegoagent465|cielo032025|freegoagent786|freegoagent252|freegoagent844|smartladder015|gfanqiang020-4|s-g9085h-06|" & _
			"gfanqiang028-2|gfanqiang008-7|gfanqiang014-4|freegoagent830|freegoagent315|freegoagent268|gfanqiang017-7|" & _
			"freegoagent658|freegoagent355|cielo032020|freegoagent756|wowdonate-m18-35|gfanqiang020-6|wowdonate-tts-17|" & _
			"freegoagent925|freegoagent336"
		Return $DID
EndFunc