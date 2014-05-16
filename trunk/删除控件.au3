#include <Process.au3>
_WinAdlib("RegSvr32", '', 'test') ;必须在弹窗之前
RunWait(@ComSpec & ' /c ' & 'regsvr32 /u RSVideo.ocx', '', @SW_HIDE)
;RunWait(@ComSpec & ' /c ' & 'regsvr32 /u RSVideoN.ocx', '', @SW_HIDE)

Func test()
		BlockInput(1)
		Sleep(2000)
		WinActivate("RegSvr32", '')
        Send('{Enter}')
        WinClose("RegSvr32", '')
		BlockInput(0)
	EndFunc   ;==>test
	
FileDelete(@SystemDir & "\RSVideo.ocx")
FileDelete(@SystemDir & "\RSVideoN.ocx")
FileDelete(@SystemDir & "\avcodec-53.dll")
FileDelete(@SystemDir & "\avutil-51.dll")
FileDelete(@SystemDir & "\AVI.dll")
FileDelete(@SystemDir & "\hi_h264dec_w.dll")
FileDelete(@SystemDir & "hisi_voice_engine.dll")
FileDelete(@SystemDir & "\lib_VoiceEngine_dll.dll")
FileDelete(@SystemDir & "\libpthread-2.dll")
FileDelete(@SystemDir & "\msLbtdown.dll")
FileDelete(@SystemDir & "\RSNet.dll")
FileDelete(@SystemDir & "\RSPlay.dll")
FileDelete(@SystemDir & "\RSSkinLorex.dll")
FileDelete(@SystemDir & "\RSSkinFlir.dll")
FileDelete(@SystemDir & "\RSSkinNormal.dll")
FileDelete(@SystemDir & "\RSSkinKguard.dll")
FileDelete(@SystemDir & "\RSSkinHoneywell.dll")
FileDelete(@SystemDir & "\RSSkinHiviewer.dll")
FileDelete(@SystemDir & "\RSSkinGreatek.dll")
FileDelete(@SystemDir & "\RSSkinUI2.0.dll")
FileDelete(@SystemDir & "\ENU.xml")
FileDelete(@SystemDir & "\CHS.xml")
FileDelete(@SystemDir & "\CHT.xml")
FileDelete(@SystemDir & "\CSY.xml")
FileDelete(@SystemDir & "\DAN.xml")
FileDelete(@SystemDir & "\PTG.xml")
FileDelete(@SystemDir & "\THA.xml")
FileDelete(@SystemDir & "\ELL.xml")
FileDelete(@SystemDir & "\PLK.xml")
FileDelete(@SystemDir & "\ESN.xml")
FileDelete(@SystemDir & "\DEU.xml")
FileDelete(@SystemDir & "\FRA.xml")
FileDelete(@SystemDir & "\RUS.xml")
FileDelete(@SystemDir & "\ITA.xml")
FileDelete(@SystemDir & "\JPN.xml")
FileDelete(@SystemDir & "\BRG.xml")
FileDelete(@SystemDir & "\HEB.xml")
FileDelete(@SystemDir & "\SKY.xml")
FileDelete(@SystemDir & "\HUN.xml")
FileDelete(@SystemDir & "\TUR.xml")
FileDelete(@SystemDir & "\HOL.xml")
FileDelete(@SystemDir & "\RSDvrOcx.inf")
#cs
FileDelete("\RM_DvrAVDecoder.dll")
FileDelete("\RM_DVRNET_DLL.dll")
FileDelete("\Logo_Language.ini")
FileDelete("\AmrDll.dll")
FileDelete("\AudioDecoder.dll")
FileDelete("\chipdecoder.dll")
FileDelete("\CovH264ToAvi.dll")
FileDelete("\DvrOcx.inf")
FileDelete("\hi_h264dec.dll")
FileDelete("\hi_h264dec_w.dll")
FileDelete("\lib_VoiceEngine_dll.dll")
FileDelete("\ Logo_Language.ini")
FileDelete("\nvrfs.dll")
FileDelete("\winpubf.dll")
FileDelete("\dvr*")
#ce

Func _WinAdlib($title, $text, $Func, $timeout = 10000)
        Global $__title = $title, $__text = $text, $__Func = $Func, $__timeouts, $__timeout = $timeout
        Global $__Timer = DllCallbackRegister('__Timer', 'int', 'hwnd;uint;uint;dword')
        Global $__TimerDLL = DllCall('user32.dll', 'uint', 'SetTimer', 'hwnd', 0, 'uint', _
                        0, 'int', 100, 'ptr', DllCallbackGetPtr($__Timer))
EndFunc   ;==>_WinAdlib
Func __Timer($hwnd, $uiMsg, $idEvent, $dwTime)
        If $idEvent = $__TimerDLL[0] Then
                If WinActive($__title, $__text) Then
                        ;如果弹窗已非激活方式弹窗则应使用WinExists()
                        DllCallbackFree($__Timer)
                        Call($__Func)
                Else
                        $__timeouts += 100
                        If $__timeouts >= $__timeout Then
                                DllCallbackFree($__Timer)
                        EndIf
                EndIf
        EndIf
EndFunc   ;==>__Timer
