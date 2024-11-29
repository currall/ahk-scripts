#Requires AutoHotkey v2.0

search() {
    Run("C:\Program Files\Everything\Everything.exe")
}

terminal(targetWindow:="A",admin:=false) {

    if admin{
        Run('powershell -Command "Start-Process cmd.exe -Verb RunAs"')
    } else {
        if (WinActive("ahk_class CabinetWClass")) { ; in explorer
            Send("^l")
            Sleep 100
            SendText("cmd")
            Sleep 100
            Send("{Enter}")
        } else if (WinActive("ahk_class ConsoleWindowClass")) { ; in cmd
            SendText("start cmd")
            Sleep 100
            Send("{Enter}")
        } else {
            Run("cmd.exe", EnvGet("USERPROFILE"))
        }

    }
}

explorer(targetWindow:="A") {
    if (WinActive("ahk_class ConsoleWindowClass")) { ; in cmd
        SendText("start explorer .")
        Sleep 100
        Send("{Enter}")
    } else {
        Run("explorer.exe")
    }
}