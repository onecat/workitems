#include <WinINet.au3>
#cs===================================
	����
	
	$iCacheEntryType
	Ҫö�ٵĻ����������. ��Ϊ����ֵ:
	0 -  ɾ�����л�����
	1 - ɾ��cookies
	2 - ɾ��URL��ʷ��
	
#ce===================================
DelCache(0)
Func DelCache($iCacheEntryType)
	_WinINet_Startup()
	
	While 1
		$avCacheEntry = _WinINet_FindFirstUrlCacheEntry($iCacheEntryType)
		If @error Then Return SetError(@error,@extended,0)
		$avHarray = $avCacheEntry[1]
		_WinINet_DeleteUrlCacheEntry($avHarray[1])
	WEnd 
	
	_WinINet_FindCloseUrlCache($avCacheEntry[0])
	_WinINet_Shutdown()
EndFunc   ;==>DelCookies
