#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Loop 26
    Hotkey, % "$"Chr(A_Index + 96), letterPress ;loop creating hotkeys for a-z
Return

alternating_case_flag := 0
capitalize := 0

letterPress:
    pressed := SubStr(A_ThisHotKey, 2)
    if(alternating_case_flag = 1) {
        if(capitalize = 1) {
            capitalize := 0
            StringUpper, pressed, pressed
        } else {
            capitalize := 1
            StringLower, pressed, pressed
        }
        Send, %pressed%
    } else {
    	sendevent {Blind}{%pressed% DownTemp}
    	sendevent {Blind}{%pressed% up}
    }
Return

^+!r::
    if(alternating_case_flag = 1) {
        alternating_case_flag := 0
    } else {
        alternating_case_flag := 1
    }
Return