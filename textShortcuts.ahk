; by Andrew Troy
; 2023-02-03 

; shift + alt + d to insert the current date formatted how I want
!+d::
FormatTime, CurrentDateTime,, yyyy-MM-dd
SendInput %CurrentDateTime%
return

; shift + alt + o to create the ° symbol
!+o::SendInput {U+00B0}


; shift + alt + up/down to adjust volume + m to mute
!+Down::Volume_Down
!+Up::Volume_Up

; shift + alt + s to center across selection in excel
+!s::
Send, ^1
Send, a
Send, !h
Send, cc
Send, {enter}{enter}
return



!+m::
{
Send {Volume_Mute}
}
return




; added this on 2025-04-03
^!Down::  ; Ctrl + Alt + D to move the selected row all the way to the bottom
Send ^x  ; Cut the selected text
Sleep 50  ; Short delay for clipboard update
Send ^{End}  ; Move cursor to the bottom of the text box
Sleep 150  ; Short delay for clipboard update
Send {Enter}
Sleep 50  ; Short delay for clipboard update
Send +{Tab 3}
Sleep 50  ; Short delay for clipboard update
Send ^v  ; Paste the text
Sleep 50
Send ^{Home}
return


; added this on 2025-04-07
!F1::Send {PrintScreen}



; 2025-05-21 script from chatgpt that automatically reverses the lines that were enteired into a single excel cell. good for reversing the view of dated lines
^!r:: ; Ctrl + Alt + R
{
    ; Save the current clipboard
    ClipSaved := ClipboardAll
    Clipboard := ""

    ; Open the selected Excel cell in edit mode
    Send, {F2}
    Sleep, 100

    ; Select all and copy
    Send, ^a
    Sleep, 100
    Send, ^c

    ; Wait up to 2 seconds for clipboard to update
    ClipWait, 2
    if (ErrorLevel) {
        MsgBox, Clipboard did not update. Try again.
        Clipboard := ClipSaved
        return
    }

    ; Get the clipboard content
    text := Clipboard

    ; Normalize line endings
    lines := StrSplit(text, "`n")
    for i, line in lines
        lines[i] := RegExReplace(line, "`r")

    ; Reverse the lines
    reversed := ""
    Loop % lines.MaxIndex()
    {
        reversed .= lines[lines.MaxIndex() - A_Index + 1]
        if (A_Index != lines.MaxIndex())
            reversed .= "`r`n"
    }

    ; Replace clipboard with reversed content
    Clipboard := reversed
    Sleep, 100

    ; Paste into the cell (still in edit mode)
    Send, ^a
    Sleep, 50
    Send, ^v
    Sleep, 50
    Send, {Enter}

    ; Restore original clipboard
    Sleep, 100
    Clipboard := ClipSaved
    return
}
    
