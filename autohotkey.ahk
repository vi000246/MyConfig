;=====================================================================o
;         Summary:                                                    |
;o----------------------o---------------------------------------------o
;|CapsLock;             | {ESC}  Especially Convient for vim user     |
;|CaspLock + `          | {CapsLock}CapsLock Switcher as a Substituent|
;|CapsLock + hjklwb     | Vim-Style Cursor Mover                      |
;|CaspLock + iobf       | Convient Home/End PageUp/PageDn             |
;|CaspLock + nm,.       | Convient Delete Controller                  |
;|CapsLock + Direction  | Mouse Move                                  |
;|CapsLock + Enter      | Mouse Click                                 |
;|CaspLock + {F1}~{F6}  | Media Volume Controller                     |
;|CapsLock + qsa        | Windows & Tags Control                      |
;|CapsLock + ;'[]       | Convient Key Mapping                        |
;|CaspLock + egrc        | Frequently Used Programs (Self Defined)    |
;|CaspLock + 123456     | Dev-Hotkey for Visual Studio (Self Defined) |
;|CapsLock + 67890-=    | Shifter as Shift                            |
;|Win      + \          | 關閉螢幕                                    |
;|Win      + A          | 切換音訊                                    |
;|Alt      + P          | 開啟PTT                                     |
;|Ctrl + Alt + 1        | 設為半透明                                  |
;|Ctrl + Alt + 2        | 還原透明度                                  |
;=====================================================================o


;定義路徑
	VisualStudio := "C:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\IDE\devenv.exe"
	SourceTree := "C:\Users\user\AppData\Local\SourceTree\app-2.1.2.5\SourceTree.exe"
	LinqPad := "C:\Program Files (x86)\LINQPad5\LINQPad.exe"
	SQLServer := "C:\Program Files (x86)\Microsoft SQL Server\130\Tools\Binn\ManagementStudio\Ssms.exe"
	OneNote := "C:\Program Files\Microsoft Office\root\Office16\ONENOTE.EXE"

;==============自動開啟PTTChrome && 自動關閉PTTChrome  p.s. 這裡的.指的是視窗標題==================
!p::   ;Alt+p 按一次開啟ptt，再按一次關閉ptt
SetTitleMatchMode, 3 ;設定ahk匹配窗口標題的模式
DetectHiddenWindows, On
PttTitle :=.
IfWinNotExist, %PttTitle%
{
	Run, C:\Program Files (x86)\Google\Chrome\Application\chrome.exe --app="https://term.ptt.cc/"
}
else
{

	IfWinExist, %PttTitle%
	; Window Exists
	{
 	  DetectHiddenWindows, Off    
 	  ; Check if its hidden
  	  IfWinNotExist, %PttTitle%   
  	  {
	      ; Script cant see it without detecting hidden windows, so...
 	      WinShow, %PttTitle%
	      WinActivate, %PttTitle%
	  }
 	  else
	  {
		IfWinExist, %PttTitle%
  		 ; Script sees it without detecting hidden windows, so..
 	     	 WinHide, %PttTitle%
	  }
	}
}
return

;=========================設定視窗透明度=========================================

^!1:: ;Ctrl+Alt+1

SetTitleMatchMode, 2 ;設定ahk匹配窗口標題的模式
winactivate,A ; 激活此窗口
sleep, 500 ; 延時，確保
WinSet,Transparent,50,A ;使得窗口變透明。取值範圍0-255.0為完全透明，255完全不透明。
return

^!2:: ;Ctrl+Alt+2

SetTitleMatchMode, 2 ;設定ahk匹配窗口標題的模式
WinActivate,A
WinSet,Transparent,255,A
return

;=====================================================================o
;           快速開啟程式設定                                           |
;---------------------------------------------------------------------o
                                                                     ;|
;win+d 開啟cmd.exe                                                   ;|   
	#d::RunOrActivate("cmd.exe")                                 ;|                      
                                                                     ;|
;win+v 開啟Visual Studio                                             ;|         
	#v::RunOrActivate(VisualStudio)                              ;|                                              
                                                                     ;|
;win+s 開啟SourceTree                                                ;|      
	#s::RunOrActivate(SourceTree)                                ;|                       
                                                                     ;|
;win+Q 開啟LinqPad                                                   ;|   
	#Q::RunOrActivate(LinqPad)                                   ;|                    
                                                                     ;|
;win+M 開啟SqlServer                                                 ;|     
	#M::RunOrActivate(SQLServer)                                 ;|                      
                                                                     ;|
;win+O 開啟one note                                                  ;|    
	#o::RunOrActivate(OneNote)                                   ;|                    
;---------------------------------------------------------------------o

;=====================================================================o
;                       CapsLock Initializer                         ;|
;---------------------------------------------------------------------o
SetCapsLockState, AlwaysOff                                          ;|
;---------------------------------------------------------------------o


;=====================================================================o
;                       CapsLock Switcher:                           ;|
;---------------------------------o-----------------------------------o
;                    CapsLock + ` | {CapsLock}                       ;|
;---------------------------------o-----------------------------------o
CapsLock & `::                                                       ;|
GetKeyState, CapsLockState, CapsLock, T                              ;|
if CapsLockState = D                                                 ;|
    SetCapsLockState, AlwaysOff                                      ;|
else                                                                 ;|
    SetCapsLockState, AlwaysOn                                       ;|
KeyWait, ``                                                          ;|
return                                                               ;|
;---------------------------------------------------------------------o


;=====================================================================o
;                         CapsLock Escaper:                          ;|
;----------------------------------o----------------------------------o
;                        CapsLock  |  {ESC}                          ;|
;----------------------------------o----------------------------------o
CapsLock::Send, {ESC}                                                ;|
;---------------------------------------------------------------------o


;=====================================================================o
;                    CapsLock Direction Navigator                    ;|
;-----------------------------------o---------------------------------o
;                      CapsLock + h |  Left                          ;|
;                      CapsLock + j |  Down                          ;|
;                      CapsLock + k |  Up                            ;|
;                      CapsLock + l |  Right                         ;|
;                      Ctrl, Alt Compatible                          ;|
;-----------------------------------o---------------------------------o
CapsLock & h::                                                       ;|
if GetKeyState("control") = 0                                        ;|
{                                                                    ;|
    if GetKeyState("alt") = 0                                        ;|
        Send, {Left}                                                 ;|
    else                                                             ;|
        Send, +{Left}                                                ;|
    return                                                           ;|
}                                                                    ;|
else {                                                               ;|
    if GetKeyState("alt") = 0                                        ;|
        Send, ^{Left}                                                ;|
    else                                                             ;|
        Send, +^{Left}                                               ;|
    return                                                           ;|
}                                                                    ;|
return                                                               ;|
;-----------------------------------o                                ;|
CapsLock & j::                                                       ;|
if GetKeyState("control") = 0                                        ;|
{                                                                    ;|
    if GetKeyState("alt") = 0                                        ;|
        Send, {Down}                                                 ;|
    else                                                             ;|
        Send, +{Down}                                                ;|
    return                                                           ;|
}                                                                    ;|
else {                                                               ;|
    if GetKeyState("alt") = 0                                        ;|
        Send, ^{Down}                                                ;|
    else                                                             ;|
        Send, +^{Down}                                               ;|
    return                                                           ;|
}                                                                    ;|
return                                                               ;|
;-----------------------------------o                                ;|
CapsLock & k::                                                       ;|
if GetKeyState("control") = 0                                        ;|
{                                                                    ;|
    if GetKeyState("alt") = 0                                        ;|
        Send, {Up}                                                   ;|
    else                                                             ;|
        Send, +{Up}                                                  ;|
    return                                                           ;|
}                                                                    ;|
else {                                                               ;|
    if GetKeyState("alt") = 0                                        ;|
        Send, ^{Up}                                                  ;|
    else                                                             ;|
        Send, +^{Up}                                                 ;|
    return                                                           ;|
}                                                                    ;|
return                                                               ;|
;-----------------------------------o                                ;|
CapsLock & l::                                                       ;|
if GetKeyState("control") = 0                                        ;|
{                                                                    ;|
    if GetKeyState("alt") = 0                                        ;|
        Send, {Right}                                                ;|
    else                                                             ;|
        Send, +{Right}                                               ;|
    return                                                           ;|
}                                                                    ;|
else {                                                               ;|
    if GetKeyState("alt") = 0                                        ;|
        Send, ^{Right}                                               ;|
    else                                                             ;|
        Send, +^{Right}                                              ;|
    return                                                           ;|
}                                                                    ;|
return                                                               ;|
;---------------------------------------------------------------------o


;=====================================================================o
;                     CapsLock Home/End Navigator                    ;|
;-----------------------------------o---------------------------------o
;                      CapsLock + i |  Home                          ;|
;                      CapsLock + o |  End                           ;|
;                      Ctrl, Alt Compatible                          ;|
;-----------------------------------o---------------------------------o
CapsLock & i::                                                       ;|
if GetKeyState("control") = 0                                        ;|
{                                                                    ;|
    if GetKeyState("alt") = 0                                        ;|
        Send, {Home}                                                 ;|
    else                                                             ;|
        Send, +{Home}                                                ;|
    return                                                           ;|
}                                                                    ;|
else {                                                               ;|
    if GetKeyState("alt") = 0                                        ;|
        Send, ^{Home}                                                ;|
    else                                                             ;|
        Send, +^{Home}                                               ;|
    return                                                           ;|
}                                                                    ;|
return                                                               ;|
;-----------------------------------o                                ;|
CapsLock & o::                                                       ;|
if GetKeyState("control") = 0                                        ;|
{                                                                    ;|
    if GetKeyState("alt") = 0                                        ;|
        Send, {End}                                                  ;|
    else                                                             ;|
        Send, +{End}                                                 ;|
    return                                                           ;|
}                                                                    ;|
else {                                                               ;|
    if GetKeyState("alt") = 0                                        ;|
        Send, ^{End}                                                 ;|
    else                                                             ;|
        Send, +^{End}                                                ;|
    return                                                           ;|
}                                                                    ;|
return                                                               ;|
;---------------------------------------------------------------------o


;=====================================================================o
;                      CapsLock Page Navigator                       ;|
;-----------------------------------o---------------------------------o
;                      CapsLock + b |  PageUp                        ;|
;                      CapsLock + f |  PageDown                      ;|
;                      Ctrl, Alt Compatible                          ;|
;-----------------------------------o---------------------------------o
CapsLock & b::                                                       ;|
if GetKeyState("control") = 0                                        ;|
{                                                                    ;|
    if GetKeyState("alt") = 0                                        ;|
        Send, {PgUp}                                                 ;|
    else                                                             ;|
        Send, +{PgUp}                                                ;|
    return                                                           ;|
}                                                                    ;|
else {                                                               ;|
    if GetKeyState("alt") = 0                                        ;|
        Send, ^{PgUp}                                                ;|
    else                                                             ;|
        Send, +^{PgUp}                                               ;|
    return                                                           ;|
}                                                                    ;|
return                                                               ;|
;-----------------------------------o                                ;|
CapsLock & f::                                                       ;|
if GetKeyState("control") = 0                                        ;|
{                                                                    ;|
    if GetKeyState("alt") = 0                                        ;|
        Send, {PgDn}                                                 ;|
    else                                                             ;|
        Send, +{PgDn}                                                ;|
    return                                                           ;|
}                                                                    ;|
else {                                                               ;|
    if GetKeyState("alt") = 0                                        ;|
        Send, ^{PgDn}                                                ;|
    else                                                             ;|
        Send, +^{PgDn}                                               ;|
    return                                                           ;|
}                                                                    ;|
return                                                               ;|
;---------------------------------------------------------------------o


;=====================================================================o
;                     CapsLock Mouse Controller                      ;|
;-----------------------------------o---------------------------------o
;                   CapsLock + Up   |  Mouse Up                      ;|
;                   CapsLock + Down |  Mouse Down                    ;|
;                   CapsLock + Left |  Mouse Left                    ;|
;                  CapsLock + Right |  Mouse Right                   ;|
;    CapsLock + Enter(Push Release) |  Mouse Left Push(Release)      ;|
;-----------------------------------o---------------------------------o
CapsLock & Up::    MouseMove, 0, -10, 0, R                           ;|
CapsLock & Down::  MouseMove, 0, 10, 0, R                            ;|
CapsLock & Left::  MouseMove, -10, 0, 0, R                           ;|
CapsLock & Right:: MouseMove, 10, 0, 0, R                            ;|
;-----------------------------------o                                ;|
CapsLock & Enter::                                                   ;|
SendEvent {Blind}{LButton down}                                      ;|
KeyWait Enter                                                        ;|
SendEvent {Blind}{LButton up}                                        ;|
return                                                               ;|
;---------------------------------------------------------------------o


;=====================================================================o
;                           CapsLock Deletor                         ;|
;-----------------------------------o---------------------------------o
;                     CapsLock + n  |  Ctrl + Delete (刪除右邊word)  ;|
;                     CapsLock + m  |  Delete    (刪除左邊char)      ;|
;                     CapsLock + ,  |  BackSpace (刪除右邊char)      ;|
;                     CapsLock + .  |  Ctrl + BackSpace(刪除左邊word);|
;-----------------------------------o---------------------------------o
CapsLock & ,:: Send, {Del}                                           ;|
CapsLock & .:: Send, ^{Del}                                          ;|
CapsLock & m:: Send, {BS}                                            ;|
CapsLock & n:: Send, ^{BS}                                           ;|
;---------------------------------------------------------------------o


;=====================================================================o
;                       CapsLock Media Controller                    ;|
;-----------------------------------o---------------------------------o
;                    CapsLock + F1  |  Volume_Mute                   ;|
;                    CapsLock + F2  |  Volume_Down                   ;|
;                    CapsLock + F3  |  Volume_Up                     ;|
;                    CapsLock + F4  |  Media_Play_Pause              ;|
;                    CapsLock + F5  |  Media_Next                    ;|
;                    CapsLock + F6  |  Media_Stop                    ;|
;-----------------------------------o---------------------------------o
CapsLock & F1:: Send, {Volume_Mute}                                  ;|
CapsLock & F2:: Send, {Volume_Down}                                  ;|
CapsLock & F3:: Send, {Volume_Up}                                    ;|
CapsLock & F4:: Send, {Media_Play_Pause}                             ;|
CapsLock & F5:: Send, {Media_Next}                                   ;|
CapsLock & F6:: Send, {Media_Stop}                                   ;|
;---------------------------------------------------------------------o


;=====================================================================o
;                      CapsLock Window Controller                    ;|
;-----------------------------------o---------------------------------o
;                     CapsLock + s  |  Ctrl + Tab (Swith Tag)        ;|
;                     CapsLock + q  |  Ctrl + W   (Close Tag)        ;|
;   (Disabled)  Alt + CapsLock + s  |  AltTab     (Switch Windows)   ;|
;               Alt + CapsLock + q  |  Ctrl + Tab (Close Windows)    ;|
;                     CapsLock + a  |  AppsKey    (Menu Key)         ;|
;-----------------------------------o---------------------------------o
CapsLock & s::Send, ^{Tab}                                           ;|
;-----------------------------------o                                ;|
CapsLock & q::                                                       ;|
if GetKeyState("alt") = 0                                            ;|
{                                                                    ;|
    Send, ^w                                                         ;|
}                                                                    ;|
else {                                                               ;|
    Send, !{F4}                                                      ;|
    return                                                           ;|
}                                                                    ;|
return                                                               ;|
;-----------------------------------o                                ;|
CapsLock & a:: Send, {AppsKey}                                       ;|
;---------------------------------------------------------------------o


;=====================================================================o
;                        CapsLock Self Defined Area                  ;|
;-----------------------------------o---------------------------------o
;     CapsLock + e  |  (search everything 需自訂快捷ctrl+shift+alt+f);|
;              CapsLock + g  |  Open Search Engine                   ;|
;              CapsLock + r  |  Open Shell                           ;|
;              CapsLock + c  |  Open Chrome                           ;|
;-----------------------------------o---------------------------------o
CapsLock & e:: Send, ^+!f                                            ;|
CapsLock & g::                                                       ;|
InputBox, Search, Google, What would you like to search?             ;|
	if not ErrorLevel                                            ;|
	{                                                            ;|
		run http://www.google.com/search?q=%Search%          ;|
	}                                                            ;|
	return                                                       ;|
CapsLock & r:: Run Powershell                                        ;|
CapsLock & c::RunOrActivate("chrome.exe")                            ;|
;---------------------------------------------------------------------o


;=====================================================================o
;                        CapsLock Char Mapping                       ;|
;-----------------------------------o---------------------------------o
;                     CapsLock + ;  |  Enter (Cancel)                ;|
;                     CapsLock + '  |  =                             ;|
;                     CapsLock + [  |  Back         (Visual Studio)  ;|
;                     CapsLock + ]  |  Goto Define  (Visual Studio)  ;|
;                     CapsLock + /  |  Comment      (Visual Studio)  ;|
;                     CapsLock + \  |  Uncomment    (Visual Studio)  ;|
;                     CapsLock + 1  |  Build and Run(Visual Studio)  ;|
;                     CapsLock + 2  |  Debuging     (Visual Studio)  ;|
;                     CapsLock + 3  |  Step Over    (Visual Studio)  ;|
;                     CapsLock + 4  |  Step In      (Visual Studio)  ;|
;                     CapsLock + 5  |  Stop Debuging(Visual Studio)  ;|
;                     CapsLock + 6  |  Shift + 6     ^               ;|
;                     CapsLock + 7  |  Shift + 7     &               ;|
;                     CapsLock + 8  |  Shift + 8     *               ;|
;                     CapsLock + 9  |  Shift + 9     (               ;|
;                     CapsLock + 0  |  Shift + 0     )               ;|
;-----------------------------------o---------------------------------o
CapsLock & `;:: Send, {Enter}                                        ;|
CapsLock & ':: Send, =                                               ;|
CapsLock & [:: Send, ^-                                              ;|
CapsLock & ]:: Send, {F12}                                           ;|
;-----------------------------------o                                ;|
CapsLock & /::                                                       ;|
Send, ^e                                                             ;|
Send, c                                                              ;|
return                                                               ;|
;-----------------------------------o                                ;|
CapsLock & \::                                                       ;|
Send, ^e                                                             ;|
Send, u                                                              ;|
return                                                               ;|
;-----------------------------------o                                ;|
CapsLock & 1:: Send,^{F5}                                            ;|
CapsLock & 2:: Send,{F5}                                             ;|
CapsLock & 3:: Send,{F10}                                            ;|
CapsLock & 4:: Send,{F11}                                            ;|
CapsLock & 5:: Send,+{F5}                                            ;|
;-----------------------------------o                                ;|
CapsLock & 6:: Send,+6                                               ;|
CapsLock & 7:: Send,+7                                               ;|
CapsLock & 8:: Send,+8                                               ;|
CapsLock & 9:: Send,+9                                               ;|
CapsLock & 0:: Send,+0                                               ;|
;---------------------------------------------------------------------o

; ================================================================================================================o
;開啟程式或切換至已開啟的視窗                                                                                    ;|
;    Target - 要開啟的程式 例: Calc.exe 或 C:\Progs\Bobo.exe                                            	 ;|
;    WinTitle - Optional title of the window to activate.  Programs like                                         ;|
;       MS Outlook might have multiple windows open (main window and email                                       ;|
;       windows).  This parm allows activating a specific window.                                    	         ;|
;範例                                           							  	 ;|
; Example uses...												 ;|
;#b::RunOrActivate("C:\Program Files\Seapine\TestTrack Pro\TestTrack Pro Client.exe")                            ;|
;#c::RunOrActivate("control panel")                                      				         ;|
;#d::RunOrActivate("cmd.exe")                                        						 ;|
;#g::RunOrActivate("regedit.exe")                                    					         ;|
;#i::Run, iexplore.exe                                         							 ;|
;#n::RunOrActivate("uedit32.exe")                                          					 ;|
                                           									 ;|
; Outlook can have multiple child windows, so specify which window to activate                                   ;|
;#o::RunOrActivate("C:\Program Files\Microsoft Office\OFFICE11\OUTLOOK.EXE", "Microsoft Outlook")                ;|
                                           									 ;|
;#p::RunOrActivate("C:\Program Files\Perforce\P4Win.exe")                                                        ;|
;#q::RunOrActivate("C:\Program Files\Microsoft Visual Studio\COMMON\MSDev98\Bin\MSDEV.EXE", "Microsoft Visual")  ;|
;#t::RunOrActivate("C:\Program Files\totalcmd\totalcmd.exe")                                                     ;|
;#y::RunOrActivate("wmplayer.exe")                                                                               ;|
;#-::RunOrActivate("mspaint.exe")                                      					         ;|
;#=::RunOrActivate("calc.exe")                                    					         ;|
; ----------------------------------------------------------------------------------------------------------------o
RunOrActivate(Target, WinTitle = "")										 ;|
{                                                                                                                ;|
	; Get the filename without a path                                                                        ;|
	SplitPath, Target, TargetNameOnly                                                                        ;|
                                                                       						 ;|
	Process, Exist, %TargetNameOnly%                                                                         ;|
	If ErrorLevel > 0                                                                       		 ;|
		PID = %ErrorLevel%                                                                  		 ;|
	Else                                                                       				 ;|
		Run, %Target%, , , PID                                                                           ;|
                                                                       						 ;|
	; At least one app (Seapine TestTrack wouldn't always become the active                                  ;|
	; window after using Run), so we always force a window activate.                                         ;|
	; Activate by title if given, otherwise use PID.                                                         ;|
	If WinTitle <>                                                                        			 ;|
	{                                                                       				 ;|
		SetTitleMatchMode, 2                                                                             ;|
		WinWait, %WinTitle%, , 3                                                                       	 ;|
		TrayTip, , Activating Window Title "%WinTitle%" (%TargetNameOnly%)                               ;|
		WinActivate, %WinTitle%                                                                       	 ;|
	}                                                                       				 ;|
	Else                                                                       				 ;|
	{                                                                       				 ;|
		WinWait, ahk_pid %PID%, , 3                                                                      ;|
		TrayTip, , Activating PID %PID% (%TargetNameOnly%)                                               ;|
		WinActivate, ahk_pid %PID%                                                                       ;|
	}                                                                       				 ;|
                                                                       						 ;|
                                                                       						 ;|
	SetTimer, RunOrActivateTrayTipOff, 1500                                                                  ;|
}                                                                       					 ;|					   	   	   	     ;|
RunOrActivateTrayTipOff:                                                                                         ;|
	SetTimer, RunOrActivateTrayTipOff, off                                                                   ;|
	TrayTip                                                                       				 ;|
Return                                                                       					 ;|
                                                                      						 ;|
;-----------------------------------------------------------------------------------------------------------------o



; ================================================================================================================o
;                   使用win+a切換喇叭跟耳機                                                                      ;|
;                   需要下載 nircmd 並複製到 c:\windows\system32                                                 ;| 
;                   要將setdefaultsounddevice後的字串改為右下角喇叭圖示的播放裝置名稱                            ;|
;                   需要到音效卡驅動的選單勾選 "將前面板與後面板的輸出裝置分為兩個獨立的音訊流"                  ;|
;-----------------------------------------------------------------------------------------------------------------o
#a::                                                                                                             ;|
                                                                                                                 ;|
                                                                                                                 ;|
  	toggle:=!toggle ; This toggles the variable between true/false                                           ;|
        if toggle                                                                                                ;|
                                                                                                                 ;|
	{                                                                                                        ;|
		Run nircmd setdefaultsounddevice "喇叭"                                                          ;|
		soundToggleBox("Speakers")                                                                       ;|
	}                                                                                                        ;|
	else                                                                                                     ;|
	{                                                                                                        ;|
		Run nircmd setdefaultsounddevice "Realtek HD Audio 2nd output"                                   ;|
		soundToggleBox("Headphones")                                                                     ;|
	}                                                                                                        ;|
Return                                                                                                           ;|
; Display sound toggle GUI                                                                                       ;|
soundToggleBox(Device)                                                                                           ;|
{                                                                                                                ;|
	IfWinExist, soundToggleWin                                                                               ;|
	{                                                                                                        ;|
		Gui, destroy                                                                                     ;|
	}                                                                                                        ;|
                                                                                                                 ;|
	Gui, +ToolWindow -Caption +0x400000 +alwaysontop                                                         ;|
	Gui, Add, text, x35 y8, Default sound: %Device%                                                          ;|
	SysGet, screenx, 0                                                                                       ;|
	SysGet, screeny, 1                                                                                       ;|
	xpos:=screenx-275                                                                                        ;|
	ypos:=screeny-100                                                                                        ;|
	Gui, Show, NoActivate x%xpos% y%ypos% h30 w200, soundToggleWin                                           ;|
                                                                                                                 ;|
	SetTimer,soundToggleClose, 2000                                                                          ;|
}                                                                                                                ;|
                                                                                                                 ;|
soundToggleClose:                                                                                                ;|
    SetTimer,soundToggleClose, off                                                                               ;|
    Gui, destroy                                                                                                 ;|
Return                                                                                                           ;|
;-----------------------------------------------------------------------------------------------------------------o


; ======================================================================o              
;                     Win+\    關閉螢幕                                ;|
;-----------------------------------------------------------------------o
#\::                                                                   ;|
	BlockInput On                                                  ;|
	SendMessage 0x112, 0xF170, 2, , Program Manager  ; Monitor off ;|
	SendMessage 0x112, 0xF140, 0, , Program Manager  ; Screensaver ;|
	Sleep 2000                                                     ;|
	BlockInput Off                                                 ;|
	return                                                         ;|
;-----------------------------------------------------------------------o



; ================================================================o
; boss key 待完成 
;-----------------------------------------------------------------o


; ----------------------------------------------------------------------------------------------------------------oreturn

^!2:: ;Ctrl+Alt+2

SetTitleMatchMode, 2 ;設定ahk匹配窗口標題的模式
WinActivate,A
WinSet,Transparent,255,A
return

;================================ 快速開啟程式設定  ==========================

;win+d 開啟cmd.exe
	#d::RunOrActivate("cmd.exe") 

;win+v 開啟Visual Studio
	#v::RunOrActivate(VisualStudio) 

;win+c 開啟Chrome
	#c::RunOrActivate("chrome.exe") 

;win+s 開啟SourceTree
	#s::RunOrActivate(SourceTree) 

;win+Q 開啟LinqPad
	#Q::RunOrActivate(LinqPad) 

;win+M 開啟SqlServer
	#M::RunOrActivate(SQLServer) 

;win+O 開啟one note
	#o::RunOrActivate(OneNote) 

;=====================================================================o
;                   Feng Ruohang's AHK Script                         | 
;                      CapsLock Enhancement                           |
;---------------------------------------------------------------------o
;Description:                                                         |
;    This Script is wrote by Feng Ruohang via AutoHotKey Script. It   |
; Provieds an enhancement towards the "Useless Key" CapsLock, and     |
; turns CapsLock into an useful function Key just like Ctrl and Alt   |
; by combining CapsLock with almost all other keys in the keyboard.   |
;                                                                     |
;Summary:                                                             |
;o----------------------o---------------------------------------------o
;|CapsLock;             | {ESC}  Especially Convient for vim user     |
;|CaspLock + `          | {CapsLock}CapsLock Switcher as a Substituent|
;|CapsLock + hjklwb     | Vim-Style Cursor Mover                      |
;|CaspLock + iobf       | Convient Home/End PageUp/PageDn             |
;|CaspLock + nm,.       | Convient Delete Controller                  |
;|CapsLock + zxcvau     | Windows-Style Editor                        |
;|CapsLock + Direction  | Mouse Move                                  |
;|CapsLock + Enter      | Mouse Click                                 |
;|CaspLock + {F1}~{F6}  | Media Volume Controller                     |
;|CapsLock + qs         | Windows & Tags Control                      |
;|CapsLock + ;'[]       | Convient Key Mapping                        |
;|CaspLock + der        | Frequently Used Programs (Self Defined)     |
;|CaspLock + 123456     | Dev-Hotkey for Visual Studio (Self Defined) |
;|CapsLock + 67890-=    | Shifter as Shift                            |
;-----------------------o---------------------------------------------o
;|Use it whatever and wherever you like. Hope it help                 |
;=====================================================================o


;=====================================================================o
;                       CapsLock Initializer                         ;|
;---------------------------------------------------------------------o
SetCapsLockState, AlwaysOff                                          ;|
;---------------------------------------------------------------------o


;=====================================================================o
;                       CapsLock Switcher:                           ;|
;---------------------------------o-----------------------------------o
;                    CapsLock + ` | {CapsLock}                       ;|
;---------------------------------o-----------------------------------o
CapsLock & `::                                                       ;|
GetKeyState, CapsLockState, CapsLock, T                              ;|
if CapsLockState = D                                                 ;|
    SetCapsLockState, AlwaysOff                                      ;|
else                                                                 ;|
    SetCapsLockState, AlwaysOn                                       ;|
KeyWait, ``                                                          ;|
return                                                               ;|
;---------------------------------------------------------------------o


;=====================================================================o
;                         CapsLock Escaper:                          ;|
;----------------------------------o----------------------------------o
;                        CapsLock  |  {ESC}                          ;|
;----------------------------------o----------------------------------o
CapsLock::Send, {ESC}                                                ;|
;---------------------------------------------------------------------o


;=====================================================================o
;                    CapsLock Direction Navigator                    ;|
;-----------------------------------o---------------------------------o
;                      CapsLock + h |  Left                          ;|
;                      CapsLock + j |  Down                          ;|
;                      CapsLock + k |  Up                            ;|
;                      CapsLock + l |  Right                         ;|
;                      Ctrl, Alt Compatible                          ;|
;-----------------------------------o---------------------------------o
CapsLock & h::                                                       ;|
if GetKeyState("control") = 0                                        ;|
{                                                                    ;|
    if GetKeyState("alt") = 0                                        ;|
        Send, {Left}                                                 ;|
    else                                                             ;|
        Send, +{Left}                                                ;|
    return                                                           ;|
}                                                                    ;|
else {                                                               ;|
    if GetKeyState("alt") = 0                                        ;|
        Send, ^{Left}                                                ;|
    else                                                             ;|
        Send, +^{Left}                                               ;|
    return                                                           ;|
}                                                                    ;|
return                                                               ;|
;-----------------------------------o                                ;|
CapsLock & j::                                                       ;|
if GetKeyState("control") = 0                                        ;|
{                                                                    ;|
    if GetKeyState("alt") = 0                                        ;|
        Send, {Down}                                                 ;|
    else                                                             ;|
        Send, +{Down}                                                ;|
    return                                                           ;|
}                                                                    ;|
else {                                                               ;|
    if GetKeyState("alt") = 0                                        ;|
        Send, ^{Down}                                                ;|
    else                                                             ;|
        Send, +^{Down}                                               ;|
    return                                                           ;|
}                                                                    ;|
return                                                               ;|
;-----------------------------------o                                ;|
CapsLock & k::                                                       ;|
if GetKeyState("control") = 0                                        ;|
{                                                                    ;|
    if GetKeyState("alt") = 0                                        ;|
        Send, {Up}                                                   ;|
    else                                                             ;|
        Send, +{Up}                                                  ;|
    return                                                           ;|
}                                                                    ;|
else {                                                               ;|
    if GetKeyState("alt") = 0                                        ;|
        Send, ^{Up}                                                  ;|
    else                                                             ;|
        Send, +^{Up}                                                 ;|
    return                                                           ;|
}                                                                    ;|
return                                                               ;|
;-----------------------------------o                                ;|
CapsLock & l::                                                       ;|
if GetKeyState("control") = 0                                        ;|
{                                                                    ;|
    if GetKeyState("alt") = 0                                        ;|
        Send, {Right}                                                ;|
    else                                                             ;|
        Send, +{Right}                                               ;|
    return                                                           ;|
}                                                                    ;|
else {                                                               ;|
    if GetKeyState("alt") = 0                                        ;|
        Send, ^{Right}                                               ;|
    else                                                             ;|
        Send, +^{Right}                                              ;|
    return                                                           ;|
}                                                                    ;|
return                                                               ;|
;---------------------------------------------------------------------o


;=====================================================================o
;                     CapsLock Home/End Navigator                    ;|
;-----------------------------------o---------------------------------o
;                      CapsLock + i |  Home                          ;|
;                      CapsLock + o |  End                           ;|
;                      Ctrl, Alt Compatible                          ;|
;-----------------------------------o---------------------------------o
CapsLock & i::                                                       ;|
if GetKeyState("control") = 0                                        ;|
{                                                                    ;|
    if GetKeyState("alt") = 0                                        ;|
        Send, {Home}                                                 ;|
    else                                                             ;|
        Send, +{Home}                                                ;|
    return                                                           ;|
}                                                                    ;|
else {                                                               ;|
    if GetKeyState("alt") = 0                                        ;|
        Send, ^{Home}                                                ;|
    else                                                             ;|
        Send, +^{Home}                                               ;|
    return                                                           ;|
}                                                                    ;|
return                                                               ;|
;-----------------------------------o                                ;|
CapsLock & o::                                                       ;|
if GetKeyState("control") = 0                                        ;|
{                                                                    ;|
    if GetKeyState("alt") = 0                                        ;|
        Send, {End}                                                  ;|
    else                                                             ;|
        Send, +{End}                                                 ;|
    return                                                           ;|
}                                                                    ;|
else {                                                               ;|
    if GetKeyState("alt") = 0                                        ;|
        Send, ^{End}                                                 ;|
    else                                                             ;|
        Send, +^{End}                                                ;|
    return                                                           ;|
}                                                                    ;|
return                                                               ;|
;---------------------------------------------------------------------o


;=====================================================================o
;                      CapsLock Page Navigator                       ;|
;-----------------------------------o---------------------------------o
;                      CapsLock + b |  PageUp                        ;|
;                      CapsLock + f |  PageDown                      ;|
;                      Ctrl, Alt Compatible                          ;|
;-----------------------------------o---------------------------------o
CapsLock & b::                                                       ;|
if GetKeyState("control") = 0                                        ;|
{                                                                    ;|
    if GetKeyState("alt") = 0                                        ;|
        Send, {PgUp}                                                 ;|
    else                                                             ;|
        Send, +{PgUp}                                                ;|
    return                                                           ;|
}                                                                    ;|
else {                                                               ;|
    if GetKeyState("alt") = 0                                        ;|
        Send, ^{PgUp}                                                ;|
    else                                                             ;|
        Send, +^{PgUp}                                               ;|
    return                                                           ;|
}                                                                    ;|
return                                                               ;|
;-----------------------------------o                                ;|
CapsLock & f::                                                       ;|
if GetKeyState("control") = 0                                        ;|
{                                                                    ;|
    if GetKeyState("alt") = 0                                        ;|
        Send, {PgDn}                                                 ;|
    else                                                             ;|
        Send, +{PgDn}                                                ;|
    return                                                           ;|
}                                                                    ;|
else {                                                               ;|
    if GetKeyState("alt") = 0                                        ;|
        Send, ^{PgDn}                                                ;|
    else                                                             ;|
        Send, +^{PgDn}                                               ;|
    return                                                           ;|
}                                                                    ;|
return                                                               ;|
;---------------------------------------------------------------------o


;=====================================================================o
;                     CapsLock Mouse Controller                      ;|
;-----------------------------------o---------------------------------o
;                   CapsLock + Up   |  Mouse Up                      ;|
;                   CapsLock + Down |  Mouse Down                    ;|
;                   CapsLock + Left |  Mouse Left                    ;|
;                  CapsLock + Right |  Mouse Right                   ;|
;    CapsLock + Enter(Push Release) |  Mouse Left Push(Release)      ;|
;-----------------------------------o---------------------------------o
CapsLock & Up::    MouseMove, 0, -10, 0, R                           ;|
CapsLock & Down::  MouseMove, 0, 10, 0, R                            ;|
CapsLock & Left::  MouseMove, -10, 0, 0, R                           ;|
CapsLock & Right:: MouseMove, 10, 0, 0, R                            ;|
;-----------------------------------o                                ;|
CapsLock & Enter::                                                   ;|
SendEvent {Blind}{LButton down}                                      ;|
KeyWait Enter                                                        ;|
SendEvent {Blind}{LButton up}                                        ;|
return                                                               ;|
;---------------------------------------------------------------------o


;=====================================================================o
;                           CapsLock Deletor                         ;|
;-----------------------------------o---------------------------------o
;                     CapsLock + n  |  Ctrl + Delete (刪除右邊word)  ;|
;                     CapsLock + m  |  Delete    (刪除左邊char)      ;|
;                     CapsLock + ,  |  BackSpace (刪除右邊char)      ;|
;                     CapsLock + .  |  Ctrl + BackSpace(刪除左邊word);|
;-----------------------------------o---------------------------------o
CapsLock & ,:: Send, {Del}                                           ;|
CapsLock & .:: Send, ^{Del}                                          ;|
CapsLock & m:: Send, {BS}                                            ;|
CapsLock & n:: Send, ^{BS}                                           ;|
;---------------------------------------------------------------------o


;=====================================================================o
;                            CapsLock Editor                         ;|
;-----------------------------------o---------------------------------o
;                     CapsLock + z  |  Ctrl + z (Cancel 還原)        ;|
;                     CapsLock + x  |  Ctrl + x (Cut)                ;|
;                     CapsLock + c  |  Ctrl + c (Copy)               ;|
;                     CapsLock + v  |  Ctrl + z (Paste)              ;|
;                     CapsLock + a  |  Ctrl + a (Select All)         ;|
;                     CapsLock + u  |  Ctrl + y (Yeild 徹銷還原)     ;|
;                     CapsLock + w  |  Ctrl + Right(Move as [vim: w]);|
;                     CapsLock + b  |  Ctrl + Left (Move as [vim: b]) conflict disabled;|
;-----------------------------------o---------------------------------o
CapsLock & z:: Send, ^z                                              ;|
CapsLock & x:: Send, ^x                                              ;|
CapsLock & c:: Send, ^c                                              ;|
CapsLock & v:: Send, ^v                                              ;|
CapsLock & a:: Send, ^a                                              ;|
CapsLock & u:: Send, ^y                                              ;|
CapsLock & w:: Send, ^{Right}                                        ;|
;CapsLock & b:: Send, ^{Left}                                         ;|
;---------------------------------------------------------------------o


;=====================================================================o
;                       CapsLock Media Controller                    ;|
;-----------------------------------o---------------------------------o
;                    CapsLock + F1  |  Volume_Mute                   ;|
;                    CapsLock + F2  |  Volume_Down                   ;|
;                    CapsLock + F3  |  Volume_Up                     ;|
;                    CapsLock + F4  |  Media_Play_Pause              ;|
;                    CapsLock + F5  |  Media_Next                    ;|
;                    CapsLock + F6  |  Media_Stop                    ;|
;-----------------------------------o---------------------------------o
CapsLock & F1:: Send, {Volume_Mute}                                  ;|
CapsLock & F2:: Send, {Volume_Down}                                  ;|
CapsLock & F3:: Send, {Volume_Up}                                    ;|
CapsLock & F4:: Send, {Media_Play_Pause}                             ;|
CapsLock & F5:: Send, {Media_Next}                                   ;|
CapsLock & F6:: Send, {Media_Stop}                                   ;|
;---------------------------------------------------------------------o


;=====================================================================o
;                      CapsLock Window Controller                    ;|
;-----------------------------------o---------------------------------o
;                     CapsLock + s  |  Ctrl + Tab (Swith Tag)        ;|
;                     CapsLock + q  |  Ctrl + W   (Close Tag)        ;|
;   (Disabled)  Alt + CapsLock + s  |  AltTab     (Switch Windows)   ;|
;               Alt + CapsLock + q  |  Ctrl + Tab (Close Windows)    ;|
;                     CapsLock + g  |  AppsKey    (Menu Key)         ;|
;-----------------------------------o---------------------------------o
CapsLock & s::Send, ^{Tab}                                           ;|
;-----------------------------------o                                ;|
CapsLock & q::                                                       ;|
if GetKeyState("alt") = 0                                            ;|
{                                                                    ;|
    Send, ^w                                                         ;|
}                                                                    ;|
else {                                                               ;|
    Send, !{F4}                                                      ;|
    return                                                           ;|
}                                                                    ;|
return                                                               ;|
;-----------------------------------o                                ;|
CapsLock & g:: Send, {AppsKey}                                       ;|
;---------------------------------------------------------------------o


;=====================================================================o
;                        CapsLock Self Defined Area                  ;|
;-----------------------------------o---------------------------------o
;                     CapsLock + d  |  Alt + d(Dictionary)           ;|
;                     CapsLock + e  |  Open Search Engine            ;|
;                     CapsLock + r  |  Open Shell                    ;|
;-----------------------------------o---------------------------------o
CapsLock & d:: Send, !d                                              ;|
CapsLock & e::                                                       ;|
InputBox, Search, Google, What would you like to search?             ;|
	if not ErrorLevel                                            ;|
	{                                                            ;|
		run http://www.google.com/search?q=%Search%          ;|
	}                                                            ;|
	return                                                       ;|
CapsLock & r:: Run Powershell                                        ;|
;---------------------------------------------------------------------o


;=====================================================================o
;                        CapsLock Char Mapping                       ;|
;-----------------------------------o---------------------------------o
;                     CapsLock + ;  |  Enter (Cancel)                ;|
;                     CapsLock + '  |  =                             ;|
;                     CapsLock + [  |  Back         (Visual Studio)  ;|
;                     CapsLock + ]  |  Goto Define  (Visual Studio)  ;|
;                     CapsLock + /  |  Comment      (Visual Studio)  ;|
;                     CapsLock + \  |  Uncomment    (Visual Studio)  ;|
;                     CapsLock + 1  |  Build and Run(Visual Studio)  ;|
;                     CapsLock + 2  |  Debuging     (Visual Studio)  ;|
;                     CapsLock + 3  |  Step Over    (Visual Studio)  ;|
;                     CapsLock + 4  |  Step In      (Visual Studio)  ;|
;                     CapsLock + 5  |  Stop Debuging(Visual Studio)  ;|
;                     CapsLock + 6  |  Shift + 6     ^               ;|
;                     CapsLock + 7  |  Shift + 7     &               ;|
;                     CapsLock + 8  |  Shift + 8     *               ;|
;                     CapsLock + 9  |  Shift + 9     (               ;|
;                     CapsLock + 0  |  Shift + 0     )               ;|
;-----------------------------------o---------------------------------o
CapsLock & `;:: Send, {Enter}                                        ;|
CapsLock & ':: Send, =                                               ;|
CapsLock & [:: Send, ^-                                              ;|
CapsLock & ]:: Send, {F12}                                           ;|
;-----------------------------------o                                ;|
CapsLock & /::                                                       ;|
Send, ^e                                                             ;|
Send, c                                                              ;|
return                                                               ;|
;-----------------------------------o                                ;|
CapsLock & \::                                                       ;|
Send, ^e                                                             ;|
Send, u                                                              ;|
return                                                               ;|
;-----------------------------------o                                ;|
CapsLock & 1:: Send,^{F5}                                            ;|
CapsLock & 2:: Send,{F5}                                             ;|
CapsLock & 3:: Send,{F10}                                            ;|
CapsLock & 4:: Send,{F11}                                            ;|
CapsLock & 5:: Send,+{F5}                                            ;|
;-----------------------------------o                                ;|
CapsLock & 6:: Send,+6                                               ;|
CapsLock & 7:: Send,+7                                               ;|
CapsLock & 8:: Send,+8                                               ;|
CapsLock & 9:: Send,+9                                               ;|
CapsLock & 0:: Send,+0                                               ;|
;---------------------------------------------------------------------o

; ================================================================================================================o
;開啟程式或切換至已開啟的視窗                                                                                    ;|
;    Target - 要開啟的程式 例: Calc.exe 或 C:\Progs\Bobo.exe                                           		 ;|
;    WinTitle - Optional title of the window to activate.  Programs like                                         ;|
;       MS Outlook might have multiple windows open (main window and email                                       ;|
;       windows).  This parm allows activating a specific window.                                    	         ;|
;範例                                           								 ;|
; Example uses...												 ;|
;#b::RunOrActivate("C:\Program Files\Seapine\TestTrack Pro\TestTrack Pro Client.exe")                            ;|
;#c::RunOrActivate("control panel")                                      				         ;|
;#d::RunOrActivate("cmd.exe")                                        						 ;|
;#g::RunOrActivate("regedit.exe")                                    					         ;|
;#i::Run, iexplore.exe                                         							 ;|
;#n::RunOrActivate("uedit32.exe")                                          					 ;|
                                           									 ;|
; Outlook can have multiple child windows, so specify which window to activate                                   ;|
;#o::RunOrActivate("C:\Program Files\Microsoft Office\OFFICE11\OUTLOOK.EXE", "Microsoft Outlook")                ;|
                                           									 ;|
;#p::RunOrActivate("C:\Program Files\Perforce\P4Win.exe")                                                        ;|
;#q::RunOrActivate("C:\Program Files\Microsoft Visual Studio\COMMON\MSDev98\Bin\MSDEV.EXE", "Microsoft Visual")  ;|
;#t::RunOrActivate("C:\Program Files\totalcmd\totalcmd.exe")                                                     ;|
;#y::RunOrActivate("wmplayer.exe")                                                                               ;|
;#-::RunOrActivate("mspaint.exe")                                      					         ;|
;#=::RunOrActivate("calc.exe")                                    					         ;|
; ----------------------------------------------------------------------------------------------------------------o
RunOrActivate(Target, WinTitle = "")										 ;|
{                                                                                                                ;|
	; Get the filename without a path                                                                        ;|
	SplitPath, Target, TargetNameOnly                                                                        ;|
                                                                       						 ;|
	Process, Exist, %TargetNameOnly%                                                                         ;|
	If ErrorLevel > 0                                                                       		 ;|
		PID = %ErrorLevel%                                                                  		 ;|
	Else                                                                       				 ;|
		Run, %Target%, , , PID                                                                           ;|
                                                                       						 ;|
	; At least one app (Seapine TestTrack wouldn't always become the active                                  ;|
	; window after using Run), so we always force a window activate.                                         ;|
	; Activate by title if given, otherwise use PID.                                                         ;|
	If WinTitle <>                                                                        			 ;|
	{                                                                       				 ;|
		SetTitleMatchMode, 2                                                                       	 ;|
		WinWait, %WinTitle%, , 3                                                                       	 ;|
		TrayTip, , Activating Window Title "%WinTitle%" (%TargetNameOnly%)                               ;|
		WinActivate, %WinTitle%                                                                       	 ;|
	}                                                                       				 ;|
	Else                                                                       				 ;|
	{                                                                       				 ;|
		WinWait, ahk_pid %PID%, , 3                                                                      ;|
		TrayTip, , Activating PID %PID% (%TargetNameOnly%)                                               ;|
		WinActivate, ahk_pid %PID%                                                                       ;|
	}                                                                       				 ;|
                                                                       						 ;|
                                                                       						 ;|
	SetTimer, RunOrActivateTrayTipOff, 1500                                                                  ;|
}                                                                       					 ;|
RunOrActivateTrayTipOff:                                                                                         ;|
	SetTimer, RunOrActivateTrayTipOff, off                                                                   ;|
	TrayTip                                                                       				 ;|
Return                                                                       					 ;|
                                                                      						 ;|
;-----------------------------------------------------------------------------------------------------------------o


; ================================================================================================================o
; boss key 待完成 
;-----------------------------------------------------------------o


; ----------------------------------------------------------------------------------------------------------------oreturn

^!2:: ;Ctrl+Alt+2

SetTitleMatchMode, 2 ;設定ahk匹配窗口標題的模式
WinActivate,A
WinSet,Transparent,255,A
return

;================================ 快速開啟程式設定  ==========================

;win+d 開啟cmd.exe
	#d::RunOrActivate("cmd.exe") 

;win+v 開啟Visual Studio
	#v::RunOrActivate(VisualStudio) 

;win+c 開啟Chrome
	#c::RunOrActivate("chrome.exe") 

;win+s 開啟SourceTree
	#s::RunOrActivate(SourceTree) 

;win+Q 開啟LinqPad
	#Q::RunOrActivate(LinqPad) 

;win+M 開啟SqlServer
	#M::RunOrActivate(SQLServer) 

;win+O 開啟one note
	#o::RunOrActivate(OneNote) 

;=====================================================================o
;                   Feng Ruohang's AHK Script                         | 
;                      CapsLock Enhancement                           |
;---------------------------------------------------------------------o
;Description:                                                         |
;    This Script is wrote by Feng Ruohang via AutoHotKey Script. It   |
; Provieds an enhancement towards the "Useless Key" CapsLock, and     |
; turns CapsLock into an useful function Key just like Ctrl and Alt   |
; by combining CapsLock with almost all other keys in the keyboard.   |
;                                                                     |
;Summary:                                                             |
;o----------------------o---------------------------------------------o
;|CapsLock;             | {ESC}  Especially Convient for vim user     |
;|CaspLock + `          | {CapsLock}CapsLock Switcher as a Substituent|
;|CapsLock + hjklwb     | Vim-Style Cursor Mover                      |
;|CaspLock + iobf       | Convient Home/End PageUp/PageDn             |
;|CaspLock + nm,.       | Convient Delete Controller                  |
;|CapsLock + zxcvau     | Windows-Style Editor                        |
;|CapsLock + Direction  | Mouse Move                                  |
;|CapsLock + Enter      | Mouse Click                                 |
;|CaspLock + {F1}~{F6}  | Media Volume Controller                     |
;|CapsLock + qs         | Windows & Tags Control                      |
;|CapsLock + ;'[]       | Convient Key Mapping                        |
;|CaspLock + der        | Frequently Used Programs (Self Defined)     |
;|CaspLock + 123456     | Dev-Hotkey for Visual Studio (Self Defined) |
;|CapsLock + 67890-=    | Shifter as Shift                            |
;-----------------------o---------------------------------------------o
;|Use it whatever and wherever you like. Hope it help                 |
;=====================================================================o


;=====================================================================o
;                       CapsLock Initializer                         ;|
;---------------------------------------------------------------------o
SetCapsLockState, AlwaysOff                                          ;|
;---------------------------------------------------------------------o


;=====================================================================o
;                       CapsLock Switcher:                           ;|
;---------------------------------o-----------------------------------o
;                    CapsLock + ` | {CapsLock}                       ;|
;---------------------------------o-----------------------------------o
CapsLock & `::                                                       ;|
GetKeyState, CapsLockState, CapsLock, T                              ;|
if CapsLockState = D                                                 ;|
    SetCapsLockState, AlwaysOff                                      ;|
else                                                                 ;|
    SetCapsLockState, AlwaysOn                                       ;|
KeyWait, ``                                                          ;|
return                                                               ;|
;---------------------------------------------------------------------o


;=====================================================================o
;                         CapsLock Escaper:                          ;|
;----------------------------------o----------------------------------o
;                        CapsLock  |  {ESC}                          ;|
;----------------------------------o----------------------------------o
CapsLock::Send, {ESC}                                                ;|
;---------------------------------------------------------------------o


;=====================================================================o
;                    CapsLock Direction Navigator                    ;|
;-----------------------------------o---------------------------------o
;                      CapsLock + h |  Left                          ;|
;                      CapsLock + j |  Down                          ;|
;                      CapsLock + k |  Up                            ;|
;                      CapsLock + l |  Right                         ;|
;                      Ctrl, Alt Compatible                          ;|
;-----------------------------------o---------------------------------o
CapsLock & h::                                                       ;|
if GetKeyState("control") = 0                                        ;|
{                                                                    ;|
    if GetKeyState("alt") = 0                                        ;|
        Send, {Left}                                                 ;|
    else                                                             ;|
        Send, +{Left}                                                ;|
    return                                                           ;|
}                                                                    ;|
else {                                                               ;|
    if GetKeyState("alt") = 0                                        ;|
        Send, ^{Left}                                                ;|
    else                                                             ;|
        Send, +^{Left}                                               ;|
    return                                                           ;|
}                                                                    ;|
return                                                               ;|
;-----------------------------------o                                ;|
CapsLock & j::                                                       ;|
if GetKeyState("control") = 0                                        ;|
{                                                                    ;|
    if GetKeyState("alt") = 0                                        ;|
        Send, {Down}                                                 ;|
    else                                                             ;|
        Send, +{Down}                                                ;|
    return                                                           ;|
}                                                                    ;|
else {                                                               ;|
    if GetKeyState("alt") = 0                                        ;|
        Send, ^{Down}                                                ;|
    else                                                             ;|
        Send, +^{Down}                                               ;|
    return                                                           ;|
}                                                                    ;|
return                                                               ;|
;-----------------------------------o                                ;|
CapsLock & k::                                                       ;|
if GetKeyState("control") = 0                                        ;|
{                                                                    ;|
    if GetKeyState("alt") = 0                                        ;|
        Send, {Up}                                                   ;|
    else                                                             ;|
        Send, +{Up}                                                  ;|
    return                                                           ;|
}                                                                    ;|
else {                                                               ;|
    if GetKeyState("alt") = 0                                        ;|
        Send, ^{Up}                                                  ;|
    else                                                             ;|
        Send, +^{Up}                                                 ;|
    return                                                           ;|
}                                                                    ;|
return                                                               ;|
;-----------------------------------o                                ;|
CapsLock & l::                                                       ;|
if GetKeyState("control") = 0                                        ;|
{                                                                    ;|
    if GetKeyState("alt") = 0                                        ;|
        Send, {Right}                                                ;|
    else                                                             ;|
        Send, +{Right}                                               ;|
    return                                                           ;|
}                                                                    ;|
else {                                                               ;|
    if GetKeyState("alt") = 0                                        ;|
        Send, ^{Right}                                               ;|
    else                                                             ;|
        Send, +^{Right}                                              ;|
    return                                                           ;|
}                                                                    ;|
return                                                               ;|
;---------------------------------------------------------------------o


;=====================================================================o
;                     CapsLock Home/End Navigator                    ;|
;-----------------------------------o---------------------------------o
;                      CapsLock + i |  Home                          ;|
;                      CapsLock + o |  End                           ;|
;                      Ctrl, Alt Compatible                          ;|
;-----------------------------------o---------------------------------o
CapsLock & i::                                                       ;|
if GetKeyState("control") = 0                                        ;|
{                                                                    ;|
    if GetKeyState("alt") = 0                                        ;|
        Send, {Home}                                                 ;|
    else                                                             ;|
        Send, +{Home}                                                ;|
    return                                                           ;|
}                                                                    ;|
else {                                                               ;|
    if GetKeyState("alt") = 0                                        ;|
        Send, ^{Home}                                                ;|
    else                                                             ;|
        Send, +^{Home}                                               ;|
    return                                                           ;|
}                                                                    ;|
return                                                               ;|
;-----------------------------------o                                ;|
CapsLock & o::                                                       ;|
if GetKeyState("control") = 0                                        ;|
{                                                                    ;|
    if GetKeyState("alt") = 0                                        ;|
        Send, {End}                                                  ;|
    else                                                             ;|
        Send, +{End}                                                 ;|
    return                                                           ;|
}                                                                    ;|
else {                                                               ;|
    if GetKeyState("alt") = 0                                        ;|
        Send, ^{End}                                                 ;|
    else                                                             ;|
        Send, +^{End}                                                ;|
    return                                                           ;|
}                                                                    ;|
return                                                               ;|
;---------------------------------------------------------------------o


;=====================================================================o
;                      CapsLock Page Navigator                       ;|
;-----------------------------------o---------------------------------o
;                      CapsLock + b |  PageUp                        ;|
;                      CapsLock + f |  PageDown                      ;|
;                      Ctrl, Alt Compatible                          ;|
;-----------------------------------o---------------------------------o
CapsLock & b::                                                       ;|
if GetKeyState("control") = 0                                        ;|
{                                                                    ;|
    if GetKeyState("alt") = 0                                        ;|
        Send, {PgUp}                                                 ;|
    else                                                             ;|
        Send, +{PgUp}                                                ;|
    return                                                           ;|
}                                                                    ;|
else {                                                               ;|
    if GetKeyState("alt") = 0                                        ;|
        Send, ^{PgUp}                                                ;|
    else                                                             ;|
        Send, +^{PgUp}                                               ;|
    return                                                           ;|
}                                                                    ;|
return                                                               ;|
;-----------------------------------o                                ;|
CapsLock & f::                                                       ;|
if GetKeyState("control") = 0                                        ;|
{                                                                    ;|
    if GetKeyState("alt") = 0                                        ;|
        Send, {PgDn}                                                 ;|
    else                                                             ;|
        Send, +{PgDn}                                                ;|
    return                                                           ;|
}                                                                    ;|
else {                                                               ;|
    if GetKeyState("alt") = 0                                        ;|
        Send, ^{PgDn}                                                ;|
    else                                                             ;|
        Send, +^{PgDn}                                               ;|
    return                                                           ;|
}                                                                    ;|
return                                                               ;|
;---------------------------------------------------------------------o


;=====================================================================o
;                     CapsLock Mouse Controller                      ;|
;-----------------------------------o---------------------------------o
;                   CapsLock + Up   |  Mouse Up                      ;|
;                   CapsLock + Down |  Mouse Down                    ;|
;                   CapsLock + Left |  Mouse Left                    ;|
;                  CapsLock + Right |  Mouse Right                   ;|
;    CapsLock + Enter(Push Release) |  Mouse Left Push(Release)      ;|
;-----------------------------------o---------------------------------o
CapsLock & Up::    MouseMove, 0, -10, 0, R                           ;|
CapsLock & Down::  MouseMove, 0, 10, 0, R                            ;|
CapsLock & Left::  MouseMove, -10, 0, 0, R                           ;|
CapsLock & Right:: MouseMove, 10, 0, 0, R                            ;|
;-----------------------------------o                                ;|
CapsLock & Enter::                                                   ;|
SendEvent {Blind}{LButton down}                                      ;|
KeyWait Enter                                                        ;|
SendEvent {Blind}{LButton up}                                        ;|
return                                                               ;|
;---------------------------------------------------------------------o


;=====================================================================o
;                           CapsLock Deletor                         ;|
;-----------------------------------o---------------------------------o
;                     CapsLock + n  |  Ctrl + Delete (刪除右邊word)  ;|
;                     CapsLock + m  |  Delete    (刪除左邊char)      ;|
;                     CapsLock + ,  |  BackSpace (刪除右邊char)      ;|
;                     CapsLock + .  |  Ctrl + BackSpace(刪除左邊word);|
;-----------------------------------o---------------------------------o
CapsLock & ,:: Send, {Del}                                           ;|
CapsLock & .:: Send, ^{Del}                                          ;|
CapsLock & m:: Send, {BS}                                            ;|
CapsLock & n:: Send, ^{BS}                                           ;|
;---------------------------------------------------------------------o


;=====================================================================o
;                            CapsLock Editor                         ;|
;-----------------------------------o---------------------------------o
;                     CapsLock + z  |  Ctrl + z (Cancel 還原)        ;|
;                     CapsLock + x  |  Ctrl + x (Cut)                ;|
;                     CapsLock + c  |  Ctrl + c (Copy)               ;|
;                     CapsLock + v  |  Ctrl + z (Paste)              ;|
;                     CapsLock + a  |  Ctrl + a (Select All)         ;|
;                     CapsLock + u  |  Ctrl + y (Yeild 徹銷還原)     ;|
;                     CapsLock + w  |  Ctrl + Right(Move as [vim: w]);|
;                     CapsLock + b  |  Ctrl + Left (Move as [vim: b]) conflict disabled;|
;-----------------------------------o---------------------------------o
CapsLock & z:: Send, ^z                                              ;|
CapsLock & x:: Send, ^x                                              ;|
CapsLock & c:: Send, ^c                                              ;|
CapsLock & v:: Send, ^v                                              ;|
CapsLock & a:: Send, ^a                                              ;|
CapsLock & u:: Send, ^y                                              ;|
CapsLock & w:: Send, ^{Right}                                        ;|
;CapsLock & b:: Send, ^{Left}                                         ;|
;---------------------------------------------------------------------o


;=====================================================================o
;                       CapsLock Media Controller                    ;|
;-----------------------------------o---------------------------------o
;                    CapsLock + F1  |  Volume_Mute                   ;|
;                    CapsLock + F2  |  Volume_Down                   ;|
;                    CapsLock + F3  |  Volume_Up                     ;|
;                    CapsLock + F4  |  Media_Play_Pause              ;|
;                    CapsLock + F5  |  Media_Next                    ;|
;                    CapsLock + F6  |  Media_Stop                    ;|
;-----------------------------------o---------------------------------o
CapsLock & F1:: Send, {Volume_Mute}                                  ;|
CapsLock & F2:: Send, {Volume_Down}                                  ;|
CapsLock & F3:: Send, {Volume_Up}                                    ;|
CapsLock & F4:: Send, {Media_Play_Pause}                             ;|
CapsLock & F5:: Send, {Media_Next}                                   ;|
CapsLock & F6:: Send, {Media_Stop}                                   ;|
;---------------------------------------------------------------------o


;=====================================================================o
;                      CapsLock Window Controller                    ;|
;-----------------------------------o---------------------------------o
;                     CapsLock + s  |  Ctrl + Tab (Swith Tag)        ;|
;                     CapsLock + q  |  Ctrl + W   (Close Tag)        ;|
;   (Disabled)  Alt + CapsLock + s  |  AltTab     (Switch Windows)   ;|
;               Alt + CapsLock + q  |  Ctrl + Tab (Close Windows)    ;|
;                     CapsLock + g  |  AppsKey    (Menu Key)         ;|
;-----------------------------------o---------------------------------o
CapsLock & s::Send, ^{Tab}                                           ;|
;-----------------------------------o                                ;|
CapsLock & q::                                                       ;|
if GetKeyState("alt") = 0                                            ;|
{                                                                    ;|
    Send, ^w                                                         ;|
}                                                                    ;|
else {                                                               ;|
    Send, !{F4}                                                      ;|
    return                                                           ;|
}                                                                    ;|
return                                                               ;|
;-----------------------------------o                                ;|
CapsLock & g:: Send, {AppsKey}                                       ;|
;---------------------------------------------------------------------o


;=====================================================================o
;                        CapsLock Self Defined Area                  ;|
;-----------------------------------o---------------------------------o
;                     CapsLock + d  |  Alt + d(Dictionary)           ;|
;                     CapsLock + e  |  Open Search Engine            ;|
;                     CapsLock + r  |  Open Shell                    ;|
;-----------------------------------o---------------------------------o
CapsLock & d:: Send, !d                                              ;|
CapsLock & e::                                                       ;|
InputBox, Search, Google, What would you like to search?             ;|
	if not ErrorLevel                                            ;|
	{                                                            ;|
		run http://www.google.com/search?q=%Search%          ;|
	}                                                            ;|
	return                                                       ;|
CapsLock & r:: Run Powershell                                        ;|
;---------------------------------------------------------------------o


;=====================================================================o
;                        CapsLock Char Mapping                       ;|
;-----------------------------------o---------------------------------o
;                     CapsLock + ;  |  Enter (Cancel)                ;|
;                     CapsLock + '  |  =                             ;|
;                     CapsLock + [  |  Back         (Visual Studio)  ;|
;                     CapsLock + ]  |  Goto Define  (Visual Studio)  ;|
;                     CapsLock + /  |  Comment      (Visual Studio)  ;|
;                     CapsLock + \  |  Uncomment    (Visual Studio)  ;|
;                     CapsLock + 1  |  Build and Run(Visual Studio)  ;|
;                     CapsLock + 2  |  Debuging     (Visual Studio)  ;|
;                     CapsLock + 3  |  Step Over    (Visual Studio)  ;|
;                     CapsLock + 4  |  Step In      (Visual Studio)  ;|
;                     CapsLock + 5  |  Stop Debuging(Visual Studio)  ;|
;                     CapsLock + 6  |  Shift + 6     ^               ;|
;                     CapsLock + 7  |  Shift + 7     &               ;|
;                     CapsLock + 8  |  Shift + 8     *               ;|
;                     CapsLock + 9  |  Shift + 9     (               ;|
;                     CapsLock + 0  |  Shift + 0     )               ;|
;-----------------------------------o---------------------------------o
CapsLock & `;:: Send, {Enter}                                        ;|
CapsLock & ':: Send, =                                               ;|
CapsLock & [:: Send, ^-                                              ;|
CapsLock & ]:: Send, {F12}                                           ;|
;-----------------------------------o                                ;|
CapsLock & /::                                                       ;|
Send, ^e                                                             ;|
Send, c                                                              ;|
return                                                               ;|
;-----------------------------------o                                ;|
CapsLock & \::                                                       ;|
Send, ^e                                                             ;|
Send, u                                                              ;|
return                                                               ;|
;-----------------------------------o                                ;|
CapsLock & 1:: Send,^{F5}                                            ;|
CapsLock & 2:: Send,{F5}                                             ;|
CapsLock & 3:: Send,{F10}                                            ;|
CapsLock & 4:: Send,{F11}                                            ;|
CapsLock & 5:: Send,+{F5}                                            ;|
;-----------------------------------o                                ;|
CapsLock & 6:: Send,+6                                               ;|
CapsLock & 7:: Send,+7                                               ;|
CapsLock & 8:: Send,+8                                               ;|
CapsLock & 9:: Send,+9                                               ;|
CapsLock & 0:: Send,+0                                               ;|
;---------------------------------------------------------------------o

; ================================================================================================================o
;開啟程式或切換至已開啟的視窗                                                                                      ;|
;    Target - 要開啟的程式 例: Calc.exe 或 C:\Progs\Bobo.exe                                           		  ;|
;    WinTitle - Optional title of the window to activate.  Programs like                                         ;|
;       MS Outlook might have multiple windows open (main window and email                                       ;|
;       windows).  This parm allows activating a specific window.                                    	         ;|
;範例                                                                                                            ;|
; Example uses...												 ;|
;#b::RunOrActivate("C:\Program Files\Seapine\TestTrack Pro\TestTrack Pro Client.exe")                            ;|
;#c::RunOrActivate("control panel")                                      				         ;|
;#d::RunOrActivate("cmd.exe")                                        						 ;|
;#g::RunOrActivate("regedit.exe")                                    					         ;|
;#i::Run, iexplore.exe                                         							 ;|
;#n::RunOrActivate("uedit32.exe")                                          					 ;|
                                           									 ;|
; Outlook can have multiple child windows, so specify which window to activate                                   ;|
;#o::RunOrActivate("C:\Program Files\Microsoft Office\OFFICE11\OUTLOOK.EXE", "Microsoft Outlook")                ;|
                                           									 ;|
;#p::RunOrActivate("C:\Program Files\Perforce\P4Win.exe")                                                        ;|
;#q::RunOrActivate("C:\Program Files\Microsoft Visual Studio\COMMON\MSDev98\Bin\MSDEV.EXE", "Microsoft Visual")  ;|
;#t::RunOrActivate("C:\Program Files\totalcmd\totalcmd.exe")                                                     ;|
;#y::RunOrActivate("wmplayer.exe")                                                                               ;|
;#-::RunOrActivate("mspaint.exe")                                      					         ;|
;#=::RunOrActivate("calc.exe")                                    					         ;|
; ----------------------------------------------------------------------------------------------------------------o
RunOrActivate(Target, WinTitle = "")										  ;|                                    ;|
{                                                                                                                 ;|
	; Get the filename without a path                                                                         ;|
	SplitPath, Target, TargetNameOnly                                                                         ;|
                                                                       						  ;|
	Process, Exist, %TargetNameOnly%                                                                          ;|
	If ErrorLevel > 0                                                                       		  ;|
		PID = %ErrorLevel%                                                                  		  ;|
	Else                                                                       				  ;|
		Run, %Target%, , , PID                                                                            ;|
                                                                       						  ;|
	; At least one app (Seapine TestTrack wouldn't always become the active                                   ;|
	; window after using Run), so we always force a window activate.                                          ;|
	; Activate by title if given, otherwise use PID.                                                          ;|
	If WinTitle <>                                                                        		          ;|
	{                                                                       				  ;|
		SetTitleMatchMode, 2                                                                 	          ;|
		WinWait, %WinTitle%, , 3                                                                       	  ;|
		TrayTip, , Activating Window Title "%WinTitle%" (%TargetNameOnly%)                                ;|
		WinActivate, %WinTitle%                                                                       	  ;|
	}                                                                       				  ;|
	Else                                                                       				  ;|
	{                                                                       				  ;|
		WinWait, ahk_pid %PID%, , 3                                                                       ;|
		TrayTip, , Activating PID %PID% (%TargetNameOnly%)                                                ;|
		WinActivate, ahk_pid %PID%                                                                        ;|
	}                                                                       				  ;|
                                                                       						  ;|
                                                                       						  ;|
	SetTimer, RunOrActivateTrayTipOff, 1500                                                                   ;|
}                                                                       					  ;|
RunOrActivateTrayTipOff:                                                                                          ;|
	SetTimer, RunOrActivateTrayTipOff, off                                                                    ;|
	TrayTip                                                                       			          ;|
Return                                                                       					  ;|
                                                                      						  ;|
;-----------------------------------------------------------------------------------------------------------------o


; ================================================================================================================o
; boss key 待完成 
;-----------------------------------------------------------------o


; ----------------------------------------------------------------------------------------------------------------o
