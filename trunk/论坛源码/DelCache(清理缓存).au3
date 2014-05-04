#include <WinINet.au3>
#cs===================================
	参数
	
	$iCacheEntryType
	要枚举的缓存项的类型. 可为下列值:
	0 -  删除所有缓存项
	1 - 删除cookies
	2 - 删除URL历史项
	
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
