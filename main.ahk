#Requires AutoHotkey v2.0

#SingleInstance Force

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
^!+t:: terminal(true) ; ctrl + alt + shift + t: launch cmd as admin

; WIN
#e:: explorer()
#i:: Run("control.exe") ; win + i: replace settings with control panel
#q:: hideTitle() ; win + q: hide window title bar
#s:: search() ; win + s: replace windows search with everything search
#t:: pinWindow() ; win + t: make current window always on top, even when not in focus
#w:: Send("!{f4}") ; win + w: close current window

; OTHER
CapsLock:: search() ; replace caps lock with search

>^Up:: Send("{PgUp}") ; right ctrl + up: pgup
>^Down:: Send("{PgDn}") ; right ctrl + down: pgdn

; Window Management
#Escape:: moveWindow("center",150)
#F1:: moveWindow("left",900)
#F2:: moveWindow("right",900)
#F11:: fullscreen()

#+Left::resizeWindow("left")
#+Right::resizeWindow("right")