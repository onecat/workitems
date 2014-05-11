#include <IE.au3>
#include <MSHtml.au3>
Local $doc = _MHDocGetObj() ;创建document对象
_MHNavigate($doc, "https://code.google.com/p/cjxlist/source/browse/CustomStrings.dat",4) ;网上获取百度源码并加载到mshtml,4 utf8编码转换

;取对象只提供这两种方法，其它基本跟IE的一样
;推荐使用IEEX.au3提供的通用获取元素方法
;~ $kw = _IEQuery($doc,"input","id=kw") ;需要#include <IEEX.au3>
;~ $kw = _MHGetObjById($doc, "kw") ;id方法
;~ Local $kw = _MHGetObjByName($doc, "wd",1) ;name取输入框对象

;下面基本跟IE方法一样
Local $su = _MHGetObjById($doc,"sl_svn376_1") ;id方法对象
Local $sText = _IEPropertyGet($su,"outertext") ;取显示文本
MsgBox(0,"对象显示文本",StringTrimLeft($sText,14))