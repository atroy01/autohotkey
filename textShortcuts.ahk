; by Andrew Troy
; 2023-02-03 

; shift + alt + d to insert the current date formatted how I want
!+d::
FormatTime, CurrentDateTime,, yyyy-MM-dd
SendInput %CurrentDateTime%
return

; shift + alt + o to create the ° symbol
!+o::SendInput {U+00B0}

; alt + c to perform a left mouse button click
!c::LButton


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
