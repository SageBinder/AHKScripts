toggle := 0

+F4::
    toggle := !toggle
    if (toggle) {
        SetTimer, mine_timer, 2000
    } else {
        SetTimer, mine_timer, Off
    }
return

mine_timer:
    Click, Down

    Send, {1}
    Sleep, 1500
    Send, {2}
    Sleep, 1500
    Send, {3}
    Sleep, 1500
    Send, {4}
    Sleep, 1500
    Send, {5}
    Sleep, 1500
    Send, {6}
    Sleep, 1500
    Send, {7}
    Sleep, 1500
    Send, {8}
    Sleep, 1500

    Click, Up

    Send, {9}
    Click, Down Right
    Sleep, 2000
    Click Up Right

return


