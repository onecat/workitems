#Region ACN预处理程序参数(常用参数)
#PRE_Icon= 										;图标,支持EXE,DLL,ICO
#PRE_OutFile=									;输出文件名
#PRE_OutFile_Type=exe							;文件类型
#PRE_Compression=4								;压缩等级
#PRE_UseUpx=y 									;使用压缩
#PRE_Res_Comment= 								;程序注释
#PRE_Res_Description=							;详细信息
#PRE_Res_Fileversion=							;文件版本
#PRE_Res_FileVersion_AutoIncrement=p			;自动更新版本
#PRE_Res_LegalCopyright= 						;版权
#PRE_Change2CUI=N                   			;修改输出的程序为CUI(控制台程序)
;#PRE_Res_Field=AutoIt Version|%AutoItVer%		;自定义资源段
;#PRE_Run_Tidy=                   				;脚本整理
;#PRE_Run_Obfuscator=      						;代码迷惑
;#PRE_Run_AU3Check= 							;语法检查
;#PRE_Run_Before= 								;运行前
;#PRE_Run_After=								;运行后
;#PRE_UseX64=n									;使用64位解释器
;#PRE_Compile_Both								;进行双平台编译
#EndRegion ACN预处理程序参数设置完成
#cs ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿

 Au3 版本: 
 脚本作者: 
 电子邮件: 
	QQ/TM: 
 脚本版本: 
 脚本功能: 

#ce ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿脚本开始＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿

#include <GuiListView.au3>
#include <WindowsConstants.au3>

$var = IniReadSection(@ScriptDir & '\Config.ini', 'Config')
If @error Then Exit MsgBox(48, "出错！", "发生错误，INI文件读取失败！") ;INI文件读取错误将退出
Dim $iChange = 25, $dqyc = 1 ;$iChange 每页显示多少个项目；$dqyc 为当前页次
Dim $zys = Ceiling($var[0][0] / $iChange)

GUICreate("Listview分页显示", 400, 450)
$ListView1 = GUICtrlCreateListView("编号|内容", 5, 5, 390, 380, -1, BitOR($WS_EX_CLIENTEDGE, $LVS_EX_FULLROWSELECT, $LVS_REPORT))
_GUICtrlListView_SetColumnWidth($ListView1, 0, 100)
_GUICtrlListView_SetColumnWidth($ListView1, 1, 280)
$Button1 = GUICtrlCreateButton("＜", 110, 400, 30, 22)
$Button2 = GUICtrlCreateButton("＞", 190, 400, 30, 22)
$Label = GUICtrlCreateLabel('1', 143, 405, 18, 17, 0x0002)
GUICtrlCreateLabel('/' & $zys, 162, 405, 23, 17)
$Button3 = GUICtrlCreateButton("返回首页", 30, 400, 80, 22)
$Button4 = GUICtrlCreateButton("跳至尾页", 220, 400, 80, 22)
$Combo = GUICtrlCreateCombo('', 305, 402, 60, 22)
$Combodata = ''
For $i = 1 To $zys
        $Combodata &= '第' & $i & '页|'
Next
GUICtrlSetData(-1, $Combodata, '第1页')
GUISetState()

Go(1) ;首次读取

While 1
        $nMsg = GUIGetMsg()
        Switch $nMsg
                Case -3
                        Exit
                Case $Button1 ;上一页
                        Go($dqyc - 1)
                Case $Button2 ;下一页
                        Go($dqyc + 1)
                Case $Button3 ;首页
                        Go(1)
                Case $Button4 ;尾页
                        Go($zys)
                Case $Combo ;下拉选择页次
                        Go(StringRegExpReplace(GUICtrlRead($Combo), '[^\d]', ''))
        EndSwitch
WEnd

Func Go($yc)
        Local $iNo1 = ($yc - 1) * $iChange + 1
        Local $iNo2
        If $yc = $zys Then
                $iNo2 = $var[0][0]
                SetState(64, 128, 64, 128)
        ElseIf $yc = 1 Then
                $iNo2 = $iNo1 + $iChange - 1
                SetState(128, 64, 128, 64)
        Else
                $iNo2 = $iNo1 + $iChange - 1
                SetState(64, 64, 64, 64)
        EndIf
        Read($iNo1, $iNo2)
        GUICtrlSetData($Label, $yc)
        GUICtrlSetData($Combo, '第' & $yc & '页')
        $dqyc = $yc
EndFunc   ;==>Go

Func SetState($1, $2, $3, $4)
        GUICtrlSetState($Button1, $1)
        GUICtrlSetState($Button2, $2)
        GUICtrlSetState($Button3, $3)
        GUICtrlSetState($Button4, $4)
EndFunc   ;==>SetState

Func Read($iNo1, $iNo2)
        _GUICtrlListView_DeleteAllItems($ListView1)
        For $i = $iNo1 To $iNo2
                GUICtrlCreateListViewItem($var[$i][0] & '|' & $var[$i][1], $ListView1)
        Next
	EndFunc   ;==>Read
	
#cs
Config.ini
[Config]
1=项目1
2=项目2
3=项目3
4=项目4
5=项目5
6=项目6
7=项目7
8=项目8
9=项目9
10=项目10
11=项目11
12=项目12
13=项目13
14=项目14
15=项目15
16=项目16
17=项目17
18=项目18
19=项目19
20=项目20
21=项目21
22=项目22
23=项目23
24=项目24
25=项目25
26=项目26
27=项目27
28=项目28
29=项目29
30=项目30
31=项目31
32=项目32
33=项目33
34=项目34
35=项目35
36=项目36
37=项目37
38=项目38
39=项目39
40=项目40
41=项目41
42=项目42
43=项目43
44=项目44
45=项目45
46=项目46
47=项目47
48=项目48
49=项目49
50=项目50
51=项目51
52=项目52
53=项目53
54=项目54
55=项目55
56=项目56
57=项目57
58=项目58
59=项目59
60=项目60
61=项目61
62=项目62
63=项目63
64=项目64
65=项目65
66=项目66
67=项目67
68=项目68
69=项目69
70=项目70
71=项目71
72=项目72
73=项目73
74=项目74
75=项目75
76=项目76
77=项目77
78=项目78
79=项目79
80=项目80
81=项目81
82=项目82
83=项目83
84=项目84
85=项目85
86=项目86
87=项目87
88=项目88
89=项目89
90=项目90
91=项目91
92=项目92
93=项目93
94=项目94
95=项目95
96=项目96
97=项目97
98=项目98
99=项目99
100=项目100
101=项目101
102=项目102
103=项目103
104=项目104
105=项目105
106=项目106
107=项目107
108=项目108
109=项目109
110=项目110
111=项目111
112=项目112
113=项目113
114=项目114
115=项目115
116=项目116
117=项目117
118=项目118
119=项目119
120=项目120
121=项目121
122=项目122
123=项目123
124=项目124
125=项目125
126=项目126
127=项目127
128=项目128
129=项目129
130=项目130
131=项目131
132=项目132
133=项目133
134=项目134
135=项目135
136=项目136
137=项目137
138=项目138
139=项目139
140=项目140
141=项目141
142=项目142
143=项目143
144=项目144
145=项目145
146=项目146
147=项目147
148=项目148
149=项目149
150=项目150
151=项目151
152=项目152
153=项目153
154=项目154
155=项目155
156=项目156
157=项目157
158=项目158
159=项目159
160=项目160
161=项目161
162=项目162
163=项目163
164=项目164
165=项目165
166=项目166
167=项目167
168=项目168
169=项目169
170=项目170
171=项目171
172=项目172
173=项目173
174=项目174
175=项目175
176=项目176
177=项目177
178=项目178
179=项目179
180=项目180
181=项目181
182=项目182
183=项目183
184=项目184
185=项目185
186=项目186
187=项目187
188=项目188
189=项目189
190=项目190
191=项目191
192=项目192
193=项目193
194=项目194
195=项目195
196=项目196
197=项目197
198=项目198
199=项目199
200=项目200
201=项目201
202=项目202
203=项目203
204=项目204
205=项目205
206=项目206
207=项目207
208=项目208
209=项目209
210=项目210
211=项目211
212=项目212
213=项目213
214=项目214
215=项目215
216=项目216
217=项目217
218=项目218
219=项目219
220=项目220
221=项目221
222=项目222
223=项目223
224=项目224
225=项目225
226=项目226
227=项目227
228=项目228
229=项目229
230=项目230
231=项目231
232=项目232
233=项目233
234=项目234
235=项目235
236=项目236
237=项目237
238=项目238
239=项目239
240=项目240
241=项目241
242=项目242
243=项目243
244=项目244
245=项目245
#ce