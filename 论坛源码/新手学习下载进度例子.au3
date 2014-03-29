Dim $wizard,$landy,$size,$down;定义变量
$wizard="http://cjxlist.googlecode.com/svn/CustomStrings.dat";定义下载地址
$landy=@ScriptDir & "\CustomStrings.dat";定义下载存入的地址
$down=InetGet($wizard , $landy,1,1 );开始下载,后面的两个 1 请参考帮助
ProgressOn("智能ABC","正在下载,请稍后....");创建进度条
While 1 ;设置进度百分比的循环体
	If InetGetInfo($down,2) = True Then ExitLoop;如果下载完成，就会为真，就会退出这个循环
	$BFB = Round(InetGetInfo($down,0) / InetGetInfo($down,1),2) * 100;计算出百分比 
	TrayTip(InetGetInfo($down,0),InetGetInfo($down,1),10);这里是用来调试的，可以去除
	ProgressSet($BFB,'已经下载了： ' & $BFB & '%');显示出来
	Sleep(100)
WEnd;循环体结束;当然要在条件不成立的情况下。
ProgressSet(100,"下载完成了！");最后这里设置成下载完成，不设置也可， 因为用户只会看到一个一闪而过的画面
ProgressOff();关闭进度条
If MsgBox(32+4,'提示','已经下载完成了， 是否打开文件 ？') = 6 Then;如果用户点了 “是” 得到的值就会是6，条件成立，就会执行下面的
	Run($landy);运行下载过来的文件 
EndIf