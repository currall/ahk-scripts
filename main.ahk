#Requires AutoHotkey v2.0

#SingleInstance Force

TraySetIcon("imageres.dll",-27)

#include personal.ahk
#include programs.ahk
#include window.ahk

; #: windows
; ^: ctrl
; !: alt
; +: shift

; CTRL + ALT
^!e:: SendText(email) ; ctrl + alt + e: input email address
^!t:: terminal() ; ctrl + alt + t: Launch cmd
^!+t:: terminal(,true) ; ctrl + alt + shift + t: launch cmd as admin

; WIN
#e:: explorer()
#^e:: Run('cmd.exe /c "taskkill /f /im explorer.exe && explorer.exe"') ; win + ctrl + e: restart explorer
#i:: Run("control.exe") ; win + i: replace settings with control panel
#q:: hideTitle() ; win + q: hide window title bar
#s:: search() ; win + s: replace windows search with everything search
#t:: pinWindow() ; win + t: make current window always on top, even when not in focus
#w:: Send("!{f4}") ; win + w: close current window
#^w:: Send("#^{f4}") ; win + ctrl + w: close virtual desktop

; OTHER
CapsLock:: search() ; replace caps lock with search

>^Up:: Send("{PgUp}") ; right ctrl + up: pgup
>^Down:: Send("{PgDn}") ; right ctrl + down: pgdn

; Window Management
#Escape:: moveWindow("center",150)
#F1:: moveWindow("left",900)
#F2:: moveWindow("right",900)
#F11:: fullscreen()
#Left:: moveWindow("left",A_ScreenWidth/2)
#Right:: moveWindow("right",A_ScreenWidth/2)
#Up:: WinMaximize("A")
#Down:: WinMinimize("A")

#+Left::resizeWindow("left")
#+Right::resizeWindow("right")

