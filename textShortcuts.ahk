; by Andrew Troy
; 2023-02-03 

; shift + alt + d to insert the current date formatted how I want
!+d::
FormatTime, CurrentDateTime,, yyyy-MM-dd
SendInput %CurrentDateTime%
return

; shift + alt + o to create the ° symbol
!+o::
{
SendInput {°}
}
return


; windows key to perform a left mouse button click
RCtrl::LButton


; alt + c to perform a left mouse button click
!c::LButton

; shift + alt + up/down to adjust volume + m to mute
!+Down::Volume_Down

!+Up::Volume_Up

!+m::
{
Send {Volume_Mute}
}
return
