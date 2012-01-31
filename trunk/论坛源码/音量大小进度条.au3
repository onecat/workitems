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

#include <WindowsConstants.au3>
TraySetIcon("shell32.dll", 277)
Const $MMSYSERR_NOERROR = 0
Const $WAVERR_BASE = 32
Const $WAVERR_BADFORMAT = ($WAVERR_BASE + 0)
Const $MAXPNAMELEN = 32
 
Const $MIXERLINE_COMPONENTTYPE_DST_FIRST = 0
Const $MIXER_GETLINEINFOF_COMPONENTTYPE = 3
Const $MIXERLINE_COMPONENTTYPE_DST_UNDEFINED = ($MIXERLINE_COMPONENTTYPE_DST_FIRST + 0)
Const $MIXERLINE_COMPONENTTYPE_DST_DIGITAL = ($MIXERLINE_COMPONENTTYPE_DST_FIRST + 1)
Const $MIXERLINE_COMPONENTTYPE_DST_LINE = ($MIXERLINE_COMPONENTTYPE_DST_FIRST + 2)
Const $MIXERLINE_COMPONENTTYPE_DST_MONITOR = ($MIXERLINE_COMPONENTTYPE_DST_FIRST + 3)
Const $MIXERLINE_COMPONENTTYPE_DST_SPEAKERS= ($MIXERLINE_COMPONENTTYPE_DST_FIRST + 4)
Const $MIXERLINE_COMPONENTTYPE_DST_HEADPHONES = ($MIXERLINE_COMPONENTTYPE_DST_FIRST + 5)
Const $MIXERLINE_COMPONENTTYPE_DST_TELEPHONE = ($MIXERLINE_COMPONENTTYPE_DST_FIRST + 6)
Const $MIXERLINE_COMPONENTTYPE_DST_WAVEIN = ($MIXERLINE_COMPONENTTYPE_DST_FIRST + 7)
Const $MIXERLINE_COMPONENTTYPE_DST_VOICEIN = ($MIXERLINE_COMPONENTTYPE_DST_FIRST + 8)
Const $MIXERLINE_COMPONENTTYPE_DST_LAST = ($MIXERLINE_COMPONENTTYPE_DST_FIRST + 8)
 
Const $MIXERLINE_COMPONENTTYPE_SRC_FIRST = 0x1000
Const $MIXERLINE_COMPONENTTYPE_SRC_UNDEFINED = ($MIXERLINE_COMPONENTTYPE_SRC_FIRST + 0)
Const $MIXERLINE_COMPONENTTYPE_SRC_DIGITAL = ($MIXERLINE_COMPONENTTYPE_SRC_FIRST + 1)
Const $MIXERLINE_COMPONENTTYPE_SRC_LINE = ($MIXERLINE_COMPONENTTYPE_SRC_FIRST + 2)
Const $MIXERLINE_COMPONENTTYPE_SRC_MICROPHONE= ($MIXERLINE_COMPONENTTYPE_SRC_FIRST + 3)
Const $MIXERLINE_COMPONENTTYPE_SRC_SYNTHESIZER = ($MIXERLINE_COMPONENTTYPE_SRC_FIRST + 4)
Const $MIXERLINE_COMPONENTTYPE_SRC_COMPACTDISC = ($MIXERLINE_COMPONENTTYPE_SRC_FIRST + 5)
Const $MIXERLINE_COMPONENTTYPE_SRC_TELEPHONE = ($MIXERLINE_COMPONENTTYPE_SRC_FIRST + 6)
Const $MIXERLINE_COMPONENTTYPE_SRC_PCSPEAKER = ($MIXERLINE_COMPONENTTYPE_SRC_FIRST + 7)
Const $MIXERLINE_COMPONENTTYPE_SRC_WAVEOUT = ($MIXERLINE_COMPONENTTYPE_SRC_FIRST + 8)
Const $MIXERLINE_COMPONENTTYPE_SRC_AUXILIARY = ($MIXERLINE_COMPONENTTYPE_SRC_FIRST + 9)
Const $MIXERLINE_COMPONENTTYPE_SRC_ANALOG = ($MIXERLINE_COMPONENTTYPE_SRC_FIRST + 10)
Const $MIXERLINE_COMPONENTTYPE_SRC_LAST = ($MIXERLINE_COMPONENTTYPE_SRC_FIRST + 10)
 
Const $MIXER_GETLINEINFOF_SOURCE = 1
 
Const $MIXER_GETLINEINFOF_DESTINATION = 0
Const $MIXER_GETLINEINFOF_LINEID = 2
Const $MIXERCONTROL_CT_SC_LIST_SINGLE = 0x00000000
Const $MIXERCONTROL_CT_CLASS_LIST = 0x70000000
Const $MIXERCONTROL_CT_SC_LIST_MULTIPLE = 0x01000000
Const $MIXERCONTROL_CT_UNITS_BOOLEAN = 0x00010000
Const $MIXERCONTROL_CT_CLASS_MASK = 0xF0000000
Const $MIXERCONTROL_CONTROLTYPE_MULTIPLESELECT = BitOR($MIXERCONTROL_CT_CLASS_LIST, $MIXERCONTROL_CT_SC_LIST_MULTIPLE, $MIXERCONTROL_CT_UNITS_BOOLEAN)
Const $MIXERCONTROL_CONTROLTYPE_MIXER = ($MIXERCONTROL_CONTROLTYPE_MULTIPLESELECT + 1)
Const $MIXERCONTROL_CONTROLTYPE_SINGLESELECT = BitOR($MIXERCONTROL_CT_CLASS_LIST, $MIXERCONTROL_CT_SC_LIST_SINGLE, $MIXERCONTROL_CT_UNITS_BOOLEAN)
Const $MIXERCONTROL_CONTROLTYPE_MUX = ($MIXERCONTROL_CONTROLTYPE_SINGLESELECT + 1)
Const $MIXER_GETCONTROLDETAILSF_VALUE = 0
Const $MIXER_SETCONTROLDETAILSF_VALUE = 0
Const $MIXERCONTROL_CONTROLF_UNIFORM = 1
Const $MIXERCONTROL_CONTROLF_MULTIPLE = 2
 
Const $MIXERCONTROL_CT_SC_METER_POLLED = 0
Const $MIXERCONTROL_CT_CLASS_METER = 0x10000000
Const $MIXERCONTROL_CT_UNITS_SIGNED = 0x20000
Const $MIXERCONTROL_CT_UNITS_UNSIGNED = 0x30000
Const $MIXERCONTROL_CT_CLASS_FADER = 0x50000000
Const $MIXERCONTROL_CT_CLASS_NUMBER = 0x30000000
Const $MIXERCONTROL_CONTROLTYPE_FADER = BitOR($MIXERCONTROL_CT_CLASS_FADER, $MIXERCONTROL_CT_UNITS_UNSIGNED)
Const $MIXERCONTROL_CONTROLTYPE_VOLUME= ($MIXERCONTROL_CONTROLTYPE_FADER + 1)
Const $MIXERCONTROL_CONTROLTYPE_UNSIGNEDMETER = BitOR($MIXERCONTROL_CT_CLASS_METER, $MIXERCONTROL_CT_SC_METER_POLLED, $MIXERCONTROL_CT_UNITS_UNSIGNED)
Const $MIXERCONTROL_CONTROLTYPE_UNSIGNED = BitOR($MIXERCONTROL_CT_CLASS_NUMBER, $MIXERCONTROL_CT_UNITS_UNSIGNED)
Const $MIXERCONTROL_CONTROLTYPE_SIGNED = BitOR($MIXERCONTROL_CT_CLASS_NUMBER, $MIXERCONTROL_CT_UNITS_SIGNED)
 
Const $MIXER_OBJECTF_WAVEIN = 0x20000000
Const $MIXER_SHORT_NAME_CHARS = 16
Const $MIXER_LONG_NAME_CHARS = 64
Const $MIXER_GETLINECONTROLSF_ALL = 0
Const $MIXER_GETLINECONTROLSF_ONEBYID = 1
Const $MIXER_GETLINECONTROLSF_ONEBYTYPE = 2
Const $MIXER_OBJECTF_HANDLE = 0x80000000
Const $MIXER_OBJECTF_MIXER = 0
Const $MIXER_OBJECTF_HMIXER = BitOR($MIXER_OBJECTF_HANDLE, $MIXER_OBJECTF_MIXER)
Const $MIXER_GETCONTROLDETAILSF_LISTTEXT = 1
Const $CALLBACK_NULL = 0
Const $WAVE_MAPPED = 4
 
Const $wMid = 1
Const $wPid = 2
Const $vDriverVersion = 3
Const $szPname = 4
Const $dwFormats = 5
Const $wChannels = 6
Const $wReserved1 = 7
Const $AWICAPS_SIZEOF = $wReserved1 + 1
 
;mixer
Const $fdwSupport = 5
Const $cDestinations = 6
Const $AMXCAPS_SIZEOF = $cDestinations + 2 ;leave room for num cells
 
;line struct
Const $cbStruct = 1
Const $dwDestination = 2
Const $dwSource = 3
Const $dwLineID = 4
Const $fdwLine = 5
Const $dwUser = 6
Const $dwComponentType = 7
Const $cChannels = 8
Const $cConnections = 9
Const $cControls = 10
Const $szShortName = 11
Const $szName = 12
Const $dwType = 13
Const $dwDeviceID = 14
Const $wMMid = 15
Const $wMPid = 16
Const $vMDriverVersion = 17
Const $szMPname = 18
$AMXLINE_SIZEOF = $szMPname + 2
 
Const $cbCStruct = 1
Const $dwCLineID = 2
Const $dwControlID = 3
Const $dwControlType = 4
Const $cCControls = 5
Const $cbmxctrl = 6
Const $pamxctrl = 7
Const $MXXTRLS_SIZEOF = $pamxctrl + 2
 
Const $lst_destname = 1
Const $lst_dwComponentType = 2
Const $lst_ctrid = 3
 
Const $MIX_HMXOBJ = 1
Const $MIX_DEVNAME = 2
Const $MIX_CAPCDEST = 3
Const $MIX_RECNAME = 4
Const $MIX_CCONNECTIONS = 5
Const $MIX_INCCONTROLS = 6
Const $MIX_DWLINEID = 7
Const $MIX_INCHANNELS = 8
Const $MIX_INMULTIITEMS = 9
Const $MIX_INCTRLID = 10
Const $MIX_OUTCHANNELS = 11
Const $MIX_OUTMULTIEMS = 12
Const $MIX_OUTCTRLID = 13
Const $MIX_LAST = $MIX_OUTCTRLID + 1
Const $AMIX_SIZEOF = $MIX_LAST + 1
Dim $mxline[$AMXLINE_SIZEOF]
Dim $mixers[1][$AMIX_SIZEOF]
Dim $mxInList[2][4]
$mixernames = ""
$FormSelectInput = 0
$TV_SelectInput = 0
$CMB_DevName = 0
$CKB_EnableLinefocus = 0
$defaultmixer = 0
$lastlinesrc = -1
$curmixer = $defaultmixer
 
Func _SetMixerVolume($MixerDevice, $percent)
    ;default mixer is always 0 (so far) which is last audio device installed or prefered deviced selected by user
    $curmixer = 0
    Const $MM_MIXM_CONTROL_CHANGE = 0x3D1
    Const $CALLBACK_WINDOW = 0x10000
    OpenAllMixers($mixers)
    If @error Then Exit
    $hmxobj = MixerOpen($curmixer, 0, $MM_MIXM_CONTROL_CHANGE, BitOR($CALLBACK_WINDOW, $MIXER_OBJECTF_MIXER))
    GetMXWaveoutID($mixers, $curmixer, $MixerDevice)
    _SetVolume($mixers, $curmixer, $percent)
    MixerClose($hmxobj)
    CloseAllMixers($mixers)
EndFunc   ;==>_SetMixerVolume
 
Func _GetMixerVolume($MixerDevice)
    ;default mixer is always 0 (so far) which is last audio device installed or prefered deviced selected by user
    $curmixer = 0
    Const $MM_MIXM_CONTROL_CHANGE = 0x3D1
    Const $CALLBACK_WINDOW = 0x10000
    OpenAllMixers($mixers)
    If @error Then Exit
    $hmxobj = MixerOpen($curmixer, 0, $MM_MIXM_CONTROL_CHANGE, BitOR($CALLBACK_WINDOW, $MIXER_OBJECTF_MIXER))
    GetMXWaveoutID($mixers, $curmixer, $MixerDevice)
    $savevolume = GetSetOutVolume($mixers, $curmixer, 0, 0)
    $savevolume = BitAND($savevolume / 0xFFFF * 100, 0xffff)
 
    MixerClose($hmxobj)
    CloseAllMixers($mixers)
    Return $savevolume
EndFunc   ;==>_GetMixerVolume
 
Func _SetVolume(ByRef $mixers, ByRef $curmixer, ByRef $percent)
    $x = Mod($percent * 0xffff, 100)
    $percent = BitAND($percent * 0xffff / 100, 0xffff)
    $percent = $percent + $x
    GetSetOutVolume($mixers, $curmixer, $percent) ;this will also trigger callback routine
EndFunc   ;==>_SetVolume
 
Func GetSetOutVolume($mixers, $index, $vol = 0, $doset = 1)
    Local $i, $x, $arraysize, $channels, $mtiems
    Const $MIXERCONTROLDETAILS_UNSIGNED_SIZEOF = 4
    Local $mixercontroldetails = DllStructCreate( _
            "dword;" & _    ;DWORD cbStruct
    "dword;" & _    ;DWORD dwControlID
    "dword;" & _    ;DWORD cChannels;
    "dword;" & _    ;HWND  hwndOwner  DWORD cMultipleItems;
    "dword;" & _    ;DWORD  cbDetails;
    "dword")    ;LPVOID paDetails;
    If @error Then Return False
    $mitems = $mixers[$index][$MIX_OUTMULTIEMS]
    $channels = $mixers[$index][$MIX_OUTCHANNELS]
    $arraysize = $channels
    If $mitems Then $arraysize = $channels * $mitems
    Local $plistbool = DllStructCreate("dword[" & $arraysize + 1 & "]") ;give me one mroe than needed
    If @error Then Return False
    $hmxobj = $mixers[$index][$MIX_HMXOBJ]
    $mxcd = $mixercontroldetails
    DllStructSetData($mxcd, $cbStruct, DllStructGetSize($mxcd))
    DllStructSetData($mxcd, 2, $mixers[$index][$MIX_OUTCTRLID])
    DllStructSetData($mxcd, 3, $mixers[$index][$MIX_OUTCHANNELS])
    DllStructSetData($mxcd, 4, $mixers[$index][$MIX_OUTMULTIEMS])
    DllStructSetData($mxcd, 5, $MIXERCONTROLDETAILS_UNSIGNED_SIZEOF) ;cbDetails to sizeof one unsigned struct
    DllStructSetData($mxcd, 6, DllStructGetPtr($plistbool)) ;paDetails set ptr
    $ret = DllCall("winmm.dll", "long", "mixerGetControlDetails", "hwnd", $hmxobj, "ptr", DllStructGetPtr($mxcd), "long", BitOR($MIXER_OBJECTF_HMIXER, $MIXER_GETCONTROLDETAILSF_VALUE))
    If @error Then Return False
    If $ret[0] = $MMSYSERR_NOERROR Then
        $x = DllStructGetData($plistbool, 1, 1)     ;just return right channel
        For $i = 1 To $arraysize
            DllStructSetData($plistbool, 1, $vol, $i) ;set left right to same value
        Next ;i
        If $doset Then $ret = DllCall("winmm.dll", "long", "mixerSetControlDetails", "hwnd", $hmxobj, "ptr", DllStructGetPtr($mxcd), "long", BitOR($MIXER_OBJECTF_HMIXER, $MIXER_SETCONTROLDETAILSF_VALUE))
        Return $x
    EndIf
    Return False
EndFunc   ;==>GetSetOutVolume
 
Func GetMXWaveoutID(ByRef $mixers, $index, $linetype)
    Local $mitems, $chans, $hmxobj, $x, $ret, $lineid
    ;local structures are nuked on exit...so i have read..LOL
    Local $mixercontrol = DllStructCreate( _
            "dword;" & _ ; DWORD cbStruct;
    "dword;" & _ ;   DWORD dwControlID;
    "dword;" & _ ;   DWORD dwControlType;
    "dword;" & _ ;   DWORD fdwControl;
    "dword;" & _ ;   DWORD cMultipleItems;
    "char[16];" & _ ;szShortName[MIXER_SHORT_NAME_CHARS];
    "char[64];" & _ ;szName[MIXER_LONG_NAME_CHARS];
    "dword;" & _    ;lMinimum
    "dword;" & _    ;lMaximum
    "dword[4];" & _ ;dwReserved[4];
    "dword;" & _    ;cSteps
    "dword[5]") ;   DWORD dwReserved[6];
    If @error Then Return False
    Local $mixerlinecontrols = DllStructCreate( _
            "dword;" & _ ;    cbStruct;
    "dword;" & _ ;    DWORD dwLineID;
    "dword;" & _ ;    DWORD dwControlID     DWORD dwControlType;
    "dword;" & _ ;    DWORD  cControls;
    "dword;" & _ ;    DWORD cbmxctrl;
    "ptr") ;          LPMIXERCONTROL pamxctrl;
    If @error Then Return False
    $hmxobj = $mixers[$index][$MIX_HMXOBJ]
    zeroline($mxline)
    $mxline[$dwLineID] = BitOR($index, 0xFFFF0000)
    $mxline[$dwComponentType] = $linetype
    MixerGetLineInfo($hmxobj, $mxline, $MIXER_GETLINEINFOF_COMPONENTTYPE)
    $lineid = $mxline[$dwLineID]
    DllStructSetData($mixerlinecontrols, $cbStruct, DllStructGetSize($mixerlinecontrols))
    DllStructSetData($mixerlinecontrols, 2, $lineid)
    DllStructSetData($mixerlinecontrols, 3, $MIXERCONTROL_CONTROLTYPE_VOLUME)
    DllStructSetData($mixerlinecontrols, 4, 1)
    DllStructSetData($mixerlinecontrols, 5, DllStructGetSize($mixercontrol))
    DllStructSetData($mixerlinecontrols, 6, DllStructGetPtr($mixercontrol))
    $ret = DllCall("winmm.dll", "long", "mixerGetLineControls", "hwnd", $hmxobj, "ptr", DllStructGetPtr($mixerlinecontrols), "long", BitOR($MIXER_OBJECTF_HMIXER, $MIXER_GETLINECONTROLSF_ONEBYTYPE))
    If $ret[0] <> $MMSYSERR_NOERROR Then Return False
    $chans = $mxline[$cChannels]
    $x = DllStructGetData($mixercontrol, 4) ;fwControl
    If BitAND($x, $MIXERCONTROL_CONTROLF_UNIFORM) Then $chans = 1
    $mitems = 0
    If BitAND($x, $MIXERCONTROL_CONTROLF_MULTIPLE) Then $mitems = DllStructGetData($mixercontrol, 5)
    $x = DllStructGetData($mixercontrol, 3) ;fwControl
    If BitAND($x, $MIXERCONTROL_CT_CLASS_FADER) Then
        $mixers[$index][$MIX_OUTCHANNELS] = $chans
        $mixers[$index][$MIX_OUTMULTIEMS] = $mitems
        $mixers[$index][$MIX_OUTCTRLID] = DllStructGetData($mixercontrol, 2)
        Return True
    EndIf
    Return False
EndFunc   ;==>GetMXWaveoutID
 
Func zeroline(ByRef $line)
    Local $i
    For $i = 0 To UBound($line) - 1
        $line[$i] = 0
    Next ;i
 
EndFunc   ;==>zeroline
 
Func MixerGetLineInfo($hmxobj, ByRef $line, $flag)
    Local $mixerline = DllStructCreate("dword;dword;dword;dword;dword;dword;dword;dword;dword;dword;" _
            & "char[16];char[64];dword;dword;short;short;dword;char[32]")
    If @error Then
        SetError(1)
        Return False
    EndIf
    Local $i
    For $i = 1 To UBound($line) - 1
        DllStructSetData($mixerline, $i, $line[$i])
    Next ;i
    DllStructSetData($mixerline, $cbStruct, DllStructGetSize($mixerline))
    $ret = DllCall("winmm.dll", "long", "mixerGetLineInfo", "hwnd", $hmxobj, "ptr", DllStructGetPtr($mixerline), "int", $flag)
    If @error Then
        SetError(1)
        Return False
    EndIf
    For $i = 1 To $szMPname
        $line[$i] = DllStructGetData($mixerline, $i)
    Next ;i
    If $ret[0] = $MMSYSERR_NOERROR Then Return True
    SetError(1)
    Return False
EndFunc   ;==>MixerGetLineInfo
 
 
;On Exit: MIX_HMXOBJ set to return value from mixeropn...check for @error
Func OpenAllMixers(ByRef $mixers)
    Local $i, $mxnumdevs, $hmxobj
    $mxnumdevs = mixerGetNumDevs()
    If $mxnumdevs Then
        ReDim $mixers[$mxnumdevs + 1][$AMIX_SIZEOF]
        For $i = 0 To $mxnumdevs - 1
            $hmxobj = MixerOpen($i, 0, 0, $MIXER_OBJECTF_MIXER)
            If @error Then
                SetError(1)
                Return False
            EndIf
            $mixers[$i][$MIX_HMXOBJ] = $hmxobj
        Next ;i
    EndIf
    $mixers[0][0] = $mxnumdevs
EndFunc   ;==>OpenAllMixers
 
;On ENtry: mixer id and flag(s) , if no id passed then the preffered id is used (0) ditto for flag
;on exit: mixer handle
Func MixerOpen($uMxid = 0, $hwnd = 0, $instance = 0, $fdwOpen = 0)
    Local $x, $h_struct
    $h_struct = DllStructCreate("udword") ;since a local will be deleted on exit of function
    If @error Then
        SetError(1)
        Return False
    EndIf
    $ret = DllCall("winmm.dll", "long", "mixerOpen", "ptr", DllStructGetPtr($h_struct), "int", $uMxid, "int", $hwnd, "int", $instance, "int", $fdwOpen)
    If Not @error Then
        If $ret[0] <> $MMSYSERR_NOERROR Then Return -1
        $x = DllStructGetData($h_struct, 1)
        Return $x
    EndIf
    SetError(1)
    Return False
EndFunc   ;==>MixerOpen
 
Func CloseAllMixers($mixers)
    Local $i, $cnt
    $cnt = $mixers[0][0]
    For $i = 0 To $cnt - 1
        MixerClose($mixers[$i][$MIX_HMXOBJ])
    Next ;i
EndFunc   ;==>CloseAllMixers
 
;On Entry: mixer handle
Func MixerClose($hmxobj)
    $ret = DllCall("winmm.dll", "long", "mixerClose", "long", $hmxobj)
    If Not @error Then Return True
    Return False
EndFunc   ;==>MixerClose
 
Func mixerGetNumDevs()
    $ret = DllCall("winmm.dll", "long", "mixerGetNumDevs")
    If Not @error Then Return $ret[0]
    SetError(1)
    Return False
EndFunc   ;==>mixerGetNumDevs
 
$sound_out = _GetMixerVolume($MIXERLINE_COMPONENTTYPE_DST_SPEAKERS)
$izracunaj = 30*$sound_out/100
$text1 = ""
for $i = 1 to $izracunaj
    $text1 &= "|"
Next
if $text1 = "" then $text1 = "|"
if stringlen($sound_out) < 2 Then
    $sound_out = "    " & $sound_out
elseif stringlen($sound_out) < 3 Then
    $sound_out = "  " & $sound_out
EndIf
$txt = "当前音量: " & $sound_out & "%" & " " & $text1
$trans_text1 = _TransparentTextWindow("MyTextGUI", $txt, 390, 30, @DesktopWidth-390, @DesktopHeight-70, "Arial", 1000, 0x00FF00, -1, -1, -1, 1, false)
 
Global $sound_out_old
Global $TIMER
 
While 1
    $sound_out = _GetMixerVolume($MIXERLINE_COMPONENTTYPE_DST_SPEAKERS)
    if $sound_out <> $sound_out_old Then
        $TIMER = TimerInit()
        GUISetState(@SW_SHOWNOACTIVATE)
        $izracunaj = 30*$sound_out/100
        $text1 = ""
        for $i = 1 to $izracunaj
            $text1 &= "|"
        Next
        if $text1 = "" then $text1 = "|"
        if stringlen($sound_out) < 2 Then
            $sound_out = "    " & $sound_out
        elseif stringlen($sound_out) < 3 Then
            $sound_out = "  " & $sound_out
        EndIf
        $txt = "当前音量: " & $sound_out & "%" & " " & $text1
        if $sound_out < 100 Then
            _TransparentTextWindow("MyTextGUI", $txt, 390, 30, @DesktopWidth-390, @DesktopHeight-70, "Arial", 1000, 0x00FF00, -1, -1, -1, 1, true, $trans_text1)
        Else
            _TransparentTextWindow("MyTextGUI", $txt, 390, 30, @DesktopWidth-390, @DesktopHeight-70, "Arial", 1000, 0xFF0000, -1, -1, -1, 1, true, $trans_text1)
        EndIf
        
        $sound_out_old = $sound_out
    EndIf
    if TimerDiff($TIMER) >= 1000 then GUISetState(@SW_HIDE)
    Sleep(50)
WEnd
 
Func _TransparentTextWindow($h_WinTitle, $s_WinText, $i_WinWidth, $i_WinHeight, $i_WinXPosn = -1, $i_WinYPosn = -1, _
        $s_TextFont = -1, $i_FontWeight = -1, $v_FontColor = -1, $i_FontItalics = 0, $i_FontUnderline = 0, $i_FontStrikeOut = 0, $i_Taskbar = 0, $i_WinExist = False, $i_hwnd = 0)
    Local Const $DEFAULT_CHARSET = 0 ; ANSI character set
    Local Const $OUT_CHARACTER_PRECIS = 2
    Local Const $CLIP_DEFAULT_PRECIS = 0
    Local Const $PROOF_QUALITY = 2
    Local Const $FIXED_PITCH = 1
    Local Const $RGN_XOR = 3
    If $h_WinTitle = "" Then $h_WinTitle = "AutoIt Overlayed Window"
    If $s_WinText = "" Then $s_WinText = "|"
    If $i_WinWidth < 1 Or $i_WinWidth > @DesktopWidth Then SetError(1) ; window width outside current screen geometry
    If $i_WinHeight < 1 Or $i_WinHeight > @DesktopHeight Then SetError(1) ; window height outside current screen geometry
    If $i_WinXPosn = -1 Then $i_WinXPosn = (@DesktopWidth / 2) - ($i_WinWidth / 2) ; center the window horizontally
    If $i_WinYPosn = -1 Then $i_WinYPosn = (@DesktopHeight / 2) - ($i_WinHeight / 2) ; center the window vertically
    If $i_WinXPosn < 1 Or $i_WinXPosn > (@DesktopWidth - $i_WinWidth) Then SetError(1) ; window won't fit on current screen geometry
    If $i_WinYPosn < 1 Or $i_WinYPosn > (@DesktopHeight - $i_WinHeight) Then SetError(1) ; window won't fit on current screen geometry
    If @error Then Return ; return with @error = 1
    If $s_TextFont = "" Or $s_TextFont = -1 Then $s_TextFont = "Microsoft Sans Serif" ; default font
    If $i_FontWeight = "" Or $i_FontWeight = -1 Then $i_FontWeight = 450 ; default Font weight
    If $v_FontColor = "" Or $v_FontColor = -1 Then $v_FontColor = "0xFF0000" ; default font colour (red)
    If $i_FontItalics <> 1 Then $i_FontItalics = 0 ; no italics as default
    If $i_FontUnderline <> 1 Then $i_FontUnderline = 0 ; no underlining as default
    If $i_FontStrikeOut <> 1 Then $i_FontStrikeOut = 0 ; no strike out font as default
    If $i_Taskbar <> 1 Then ; display tray icon
        if $i_WinExist = False Then
            Local $h_GUI = GUICreate($h_WinTitle, $i_WinWidth, $i_WinHeight, $i_WinXPosn, _
                $i_WinYPosn, $WS_POPUP, BitOR($WS_EX_TOPMOST, $WS_EX_TOOLWINDOW))
        Else
            Local $h_GUI = WinGetHandle($i_hwnd)
        EndIf
    Else ; hide tray icon
        if $i_WinExist = False Then
            Local $h_GUI = GUICreate($h_WinTitle, $i_WinWidth, $i_WinHeight, $i_WinXPosn, _
                $i_WinYPosn, $WS_POPUP, BitOR($WS_EX_TOPMOST, $WS_EX_TOOLWINDOW))
        Else
            Local $h_GUI = WinGetHandle($i_hwnd)
        EndIf
    EndIf
    GUISetBkColor($v_FontColor)
    Local $hDC = DllCall("user32.dll", "int", "GetDC", "hwnd", $h_GUI)
    Local $hMyFont = DllCall("gdi32.dll", "hwnd", "CreateFont", "int", $i_WinHeight, _
            "int", 0, "int", 0, "int", 0, "int", $i_FontWeight, "int", $i_FontItalics, _
            "int", $i_FontUnderline, "int", $i_FontStrikeOut, "int", $DEFAULT_CHARSET, _
            "int", $OUT_CHARACTER_PRECIS, "int", $CLIP_DEFAULT_PRECIS, _
            "int", $PROOF_QUALITY, "int", $FIXED_PITCH, "str", $s_TextFont)
    Local $hOldFont = DllCall("gdi32.dll", "hwnd", "SelectObject", "int", $hDC[0], _
            "hwnd", $hMyFont[0])
    DllCall("gdi32.dll", "int", "BeginPath", "int", $hDC[0])
    DllCall("gdi32.dll", "int", "TextOut", "int", $hDC[0], "int", 0, "int", 0, _
            "str", $s_WinText, "int", StringLen($s_WinText))
    DllCall("gdi32.dll", "int", "EndPath", "int", $hDC[0])
    Local $hRgn1 = DllCall("gdi32.dll", "hwnd", "PathToRegion", "int", $hDC[0])
    Local $rc = DllStructCreate("int;int;int;int")
    DllCall("gdi32.dll", "int", "GetRgnBox", "hwnd", $hRgn1[0], _
            "ptr", DllStructGetPtr($rc))
    Local $hRgn2 = DllCall("gdi32.dll", "hwnd", "CreateRectRgnIndirect", _
            "ptr", DllStructGetPtr($rc))
    DllCall("gdi32.dll", "int", "CombineRgn", "hwnd", $hRgn2[0], "hwnd", $hRgn2[0], _
            "hwnd", $hRgn1[0], "int", $RGN_XOR)
    DllCall("gdi32.dll", "int", "DeleteObject", "hwnd", $hRgn1[0])
    DllCall("user32.dll", "int", "ReleaseDC", "hwnd", $h_GUI, "int", $hDC[0])
    DllCall("user32.dll", "int", "SetWindowRgn", "hwnd", $h_GUI, "hwnd", $hRgn2[0], "int", 1)
    DllCall("", "int", "SelectObject", "int", $hDC[0], "hwnd", $hOldFont[0])
    Return $h_GUI
EndFunc ;==>_TransparentTextWindow