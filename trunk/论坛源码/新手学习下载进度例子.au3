Dim $wizard,$landy,$size,$down;�������
$wizard="http://cjxlist.googlecode.com/svn/CustomStrings.dat";�������ص�ַ
$landy=@ScriptDir & "\CustomStrings.dat";�������ش���ĵ�ַ
$down=InetGet($wizard , $landy,1,1 );��ʼ����,��������� 1 ��ο�����
ProgressOn("����ABC","��������,���Ժ�....");����������
While 1 ;���ý��Ȱٷֱȵ�ѭ����
	If InetGetInfo($down,2) = True Then ExitLoop;���������ɣ��ͻ�Ϊ�棬�ͻ��˳����ѭ��
	$BFB = Round(InetGetInfo($down,0) / InetGetInfo($down,1),2) * 100;������ٷֱ� 
	TrayTip(InetGetInfo($down,0),InetGetInfo($down,1),10);�������������Եģ�����ȥ��
	ProgressSet($BFB,'�Ѿ������ˣ� ' & $BFB & '%');��ʾ����
	Sleep(100)
WEnd;ѭ�������;��ȻҪ������������������¡�
ProgressSet(100,"��������ˣ�");����������ó�������ɣ�������Ҳ�ɣ� ��Ϊ�û�ֻ�ῴ��һ��һ�������Ļ���
ProgressOff();�رս�����
If MsgBox(32+4,'��ʾ','�Ѿ���������ˣ� �Ƿ���ļ� ��') = 6 Then;����û����� ���ǡ� �õ���ֵ�ͻ���6�������������ͻ�ִ�������
	Run($landy);�������ع������ļ� 
EndIf