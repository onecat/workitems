#Include <File.au3>
#Include <Array.au3>
 
For $i = 0 to 10 step 1 
        DirCreate ("C:\Users\chtyfox\Desktop\������\$"&$i&"$")
Next
 
$folderlist=_FileListToArray ("C:\Users\chtyfox\Desktop\������","*",2);ע���������͵��
 
If $folderlist=0 Then
        MsgBox (0,"","��������")
ElseIf @error = 1 Then
        MsgBox (0,"","Path not found or invalid")
ElseIf @error = 2 Then
        MsgBox (0,"","Invalid $sFilter")
ElseIf @error = 3 Then
        MsgBox (0,"","Invalid $iFlag")
ElseIf @error = 4 Then
        MsgBox (0,"","No File(s) Found")
Else
        _ArrayDisplay($FolderList,"$FileList")
EndIf
