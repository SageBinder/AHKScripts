toggle := 0

F4::
    toggle := !toggle
    if (toggle) {
        SetTimer, click_timer, 2000
        SetTimer, eat_timer, 120000
    } else {
        SetTimer, click_timer, Off
        SetTimer, eat_timer, Off
    }
return

click_timer:
    Click
return

eat_timer:
    Click, Down Right
    Sleep, 2000
    Click Up Right
return
