

;==============自動開啟PTTChrome && 自動關閉PTTChrome  p.s. 這裡的.指的是視窗標題==================
!p::   ;Alt+p 按一次開啟ptt，再按一次關閉ptt
SetTitleMatchMode, 3 ;設定ahk匹配窗口標題的模式
DetectHiddenWindows, On
PttTitle :="批踢踢實業坊"
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
;                   要將setdefaultsounddevice後的字串改為右下角喇叭圖示的播放裝置名稱(不支援中文)                ;|
;                   需要到音效卡驅動的選單勾選 "將前面板與後面板的輸出裝置分為兩個獨立的音訊流"                  ;|
;-----------------------------------------------------------------------------------------------------------------o
#a::                                                                                                             ;|
                                                                                                                 ;|
                                                                                                                 ;|
  	toggle:=!toggle ; This toggles the variable between true/false                                           ;|
        if toggle                                                                                                ;|
                                                                                                                 ;|
	{                                                                                                        ;|
		Run nircmd setdefaultsounddevice "Speakers"                                                          ;|
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


; ======================================================================o              
;                     切換輸入法中英文 1:中文  0:英文                  ;|
;-----------------------------------------------------------------------o
IME_SET(setSts, WinTitle="")                                           ;|
{                                                                      ;|
    ifEqual WinTitle,,  SetEnv,WinTitle,A                              ;|
    WinGet,hWnd,ID,%WinTitle%                                          ;|
    DefaultIMEWnd := DllCall("imm32\ImmGetDefaultIMEWnd", Uint,hWnd, Uint)
                                                                       ;|
    ;Message : WM_IME_CONTROL  wParam:IMC_SETOPENSTATUS                ;|
    DetectSave := A_DetectHiddenWindows                                ;|                                   
    DetectHiddenWindows,ON                                             ;|
    SendMessage 0x283, 0x006,setSts,,ahk_id %DefaultIMEWnd%            ;|
    DetectHiddenWindows,%DetectSave%                                   ;|
    Return ErrorLevel                                                  ;|
}                                                                      ;|
;-----------------------------------------------------------------------o

; ================================================================o
; boss key 待完成 
;-----------------------------------------------------------------o


; ----------------------------------------------------------------------------------------------------------------o
