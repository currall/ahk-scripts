#Requires AutoHotkey v2.0

search(targetWindow:="A") {
    if (WinActive("ahk_class EVERYTHING")) {
        Send("!{f4}")
    } else {
        Run("C:\Program Files\Everything\Everything.exe")
    }
}

terminal(targetWindow:="A",admin:=false) {

    if admin{
        Run('powershell -Command "Start-Process cmd.exe -Verb RunAs"')
    } else {
        if (WinActive("ahk_class CabinetWClass")) { ; in explorer
            Send("^l")
            Sleep 50
            SendText("cmd")
            Sleep 50
            Send("{Enter}")
        } else if (WinActive("ahk_class ConsoleWindowClass")) { ; in cmd
            SendText("start cmd")
            Sleep 50
            Send("{Enter}")
        } else {
            Run("cmd.exe", EnvGet("USERPROFILE"))
        }

    }
}

explorer(targetWindow:="A") {
    if (WinActive("ahk_class ConsoleWindowClass")) { ; in cmd
        SendText("start explorer .")
        Sleep 50
        Send("{Enter}")
    } else if (WinActive("ahk_exe Code.exe")) { ; in vscode
        Send("^+e")
        Sleep 50
        Send("+!r")
    } else {
        Run("explorer.exe")
    }
}