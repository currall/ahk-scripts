#Requires AutoHotkey v2.0

moveWindow(position, size) {
    WinRestore("A")
    If (position = "center"){
        WinMove(size, 60, A_ScreenWidth-(size*2), A_ScreenHeight-168,"A")
    } Else If (position = "left") {
        WinMove(0, 0, A_ScreenWidth-size, A_ScreenHeight-48,"A")
    } Else If (position = "right") {
        WinMove(A_ScreenWidth-size, 0, size, A_ScreenHeight-48,"A")
    }
}

resizeWindow(direction) {

    distance := 100

    WinGetPos(&x, ,&width, ,WinGetID("A"))
    If (direction = "right") {
        If (x <= 50){
            WinMove(0, , width+distance, ,"A")
        } Else {
            WinMove(x+distance, , width-distance, ,"A")
        }
    } Else If (direction = "left") {
        If (x <= 50){
            WinMove(0, , width-distance, ,"A")
        } Else {
            WinMove(x -distance, , width+distance, ,"A")
        }
    }
}

pinWindow(targetWindow := "A") {
	tWnd := WinActive(targetWindow)
	title := WinGetTitle("ahk_id " tWnd)
	newTitle := InStr(title, " - Priotised") ? RegExReplace(title, " - Priotised$") : title " - Priotised"
	WinSetTitle(newTitle, "ahk_id " tWnd)
	WinSetAlwaysOnTop(-1, "ahk_id " tWnd) 
}

hideTitle(targetWindow := "A") {
    activeWindow := WinExist(targetWindow)

    if activeWindow
    {
        if WinGetStyle(activeWindow) & 0xC00000 {
            WinSetStyle("-0xC00000", activeWindow) ; remove title bar
        }
        else {
            WinSetStyle("+0xC00000", activeWindow) ; show title bar
        }
    }
}

fullscreen(targetWindow := "A") {
    activeWindow := WinExist(targetWindow)

    if activeWindow
    {
        if WinGetStyle(activeWindow) & 0xC00000 {
            WinMaximize("A")
            WinSetStyle("-0xC00000", activeWindow) ; remove title bar
        }
        else {
            WinRestore("A")
            WinMove(250, 100, A_ScreenWidth-500, A_ScreenHeight-248,"A")
            WinSetStyle("+0xC00000", activeWindow) ; show title bar
        }
    }
}