#include <guiconstantsex.au3>
#include <windowsconstants.au3>
#include <WINAPI.au3>

local $countdown = 3, $freq = 500

local $gui010 = GUICreate("",700,700 ,-1, -1, $WS_POPUP, $WS_EX_LAYERED)
                GUISetBkColor(0xABCDEF)
local $lbl010 = guictrlcreatelabel('',140,10,680,680)
                guictrlsetfont($lbl010,500,800)
                _WinAPI_SetLayeredWindowAttributes($gui010, 0xABCDEF, 250)
                guisetstate(@sw_show)

for $i = $countdown to 1 step -1

    guictrlsetdata($lbl010,$i)

    beep($freq,500)

    Sleep(1000)

next