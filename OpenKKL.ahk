#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

^+!F12::
    KeyWait, Control
    KeyWait, Shift
    KeyWait, Alt
    KeyWait, F12
    Run, "C:\Program Files (x86)\100dof_kidkeylock\bin\kidkeylock.exe"
Return