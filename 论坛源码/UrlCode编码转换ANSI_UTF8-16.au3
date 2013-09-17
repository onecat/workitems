$x="机械公敌(高清)"
MsgBox(32,"",UrlEnc_ANSI($x))
MsgBox(32,"",UrlDec_ANSI(UrlEnc_ANSI($x)))

MsgBox(32,"",UrlEnc_UTF8($x))
MsgBox(32,"",UrlDec_UTF8(UrlEnc_UTF8($x)))

MsgBox(32,"",UrlEnc_UTF16_Big($x))
MsgBox(32,"",UrlDec_UTF16_Big(UrlEnc_UTF16_Big($x)))

MsgBox(32,"",UrlEnc_UTF16_Small($x))
MsgBox(32,"",UrlDec_UTF16_Small(UrlEnc_UTF16_Small($x)))

ConsoleWrite ($x)
Func UrlEnc_ANSI($Sz_url)
        Local $str=StringTrimLeft(StringToBinary($Sz_url,1),2)
        Local $ret
        For $i=1 to StringLen($str) Step 2
                $ret &='%' & StringMid($str,$i,2)
        Next
        Return $ret
EndFunc
 
Func UrlDec_ANSI($Sz_url)
                Local $str='0x' & StringReplace($Sz_url,"%","")
        Local $ret=BinaryToString($str,1)
        Return $ret
EndFunc

Func UrlEnc_UTF8($Sz_url)
        Local $str=StringTrimLeft(StringToBinary($Sz_url,4),2)
        Local $ret
        For $i=1 to StringLen($str) Step 2
                $ret &='%' & StringMid($str,$i,2)
        Next
        Return $ret
EndFunc
 
Func UrlDec_UTF8($Sz_url)
                Local $str='0x' & StringReplace($Sz_url,"%","")
        Local $ret=BinaryToString($str,4)
        Return $ret
EndFunc

Func UrlEnc_UTF16_Small($Sz_url)
        Local $str=StringTrimLeft(StringToBinary($Sz_url,2),2)
        Local $ret
        For $i=1 to StringLen($str) Step 2
                $ret &='%' & StringMid($str,$i,2)
        Next
        Return $ret
EndFunc
 
Func UrlDec_UTF16_Small($Sz_url)
                Local $str='0x' & StringReplace($Sz_url,"%","")
        Local $ret=BinaryToString($str,2)
        Return $ret
EndFunc

Func UrlEnc_UTF16_Big($Sz_url)
        Local $str=StringTrimLeft(StringToBinary($Sz_url,3),2)
        Local $ret
        For $i=1 to StringLen($str) Step 2
                $ret &='%' & StringMid($str,$i,2)
        Next
        Return $ret
EndFunc
 
Func UrlDec_UTF16_Big($Sz_url)
                Local $str='0x' & StringReplace($Sz_url,"%","")
        Local $ret=BinaryToString($str,3)
        Return $ret
EndFunc
