#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Suspend ; Script should not alternate case be default

Loop 26
    Hotkey, % "$"Chr(A_Index + 96), letterPress ;loop creating hotkeys for a-z
Return

capitalize := 0
letterPress:
    pressed := SubStr(A_ThisHotKey, 2)
    if(capitalize = 1) {
        capitalize := 0
        StringUpper, pressed, pressed
    } else {
        capitalize := 1
        StringLower, pressed, pressed
    }
    Send, %pressed%
Return

^+!r::Suspend