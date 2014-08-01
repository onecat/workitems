#include <File.au3>
#include <Array.au3>

$_Path = "C:\Users\chtyfox\Desktop\°å¶Ë"
$var = _FileListToArray($_Path,"*",2)
MsgBox(0,"",$var[0])