#include <FTPEx.au3>
#include <Inet.au3>
#include <File.au3>
;获取IP
$IP = _GetIP()
_FileWriteLog(@ScriptDir & '\IP.TXT',$IP & @CRLF)
;FTP 定义
Local $server = '192.168.0.250'
Local $username = 'root'
Local $pass = '123456'
Local $localfile = @ScriptDir & '\IP.TXT'
Local $s_RemoteFile = "IP.txt"

 _FtpUpdata()
 
;//ftp更新文件.
Func _FtpUpdata()
		Local $Open = _FTP_Open('MyFTP Control')
		Local $Conn = _FTP_Connect($Open, $server, $username, $pass)
		_FTP_ProgressUpload( $Conn, $localfile, $s_RemoteFile ) 
		MsgBox(64,'上传成功','文件上传成功')
		Local $Ftpc = _FTP_Close($Open)
EndFunc