#Persistent
MsgBox, PZAutoPauser, PZAutoPauser watches the "Project Zomboid" window. If the window exists and it detects it isn't the active window, it will send the key strokes F2 then ESC (pausing it).`n`nWARNING: If you are in the ESC menu during a loaded game and focus a different window, the script will unpause it thinking it's pausing it. Recommended to use F2 to pause instead of ESC.

if WinExist("Project Zomboid") and !WinActive("Project Zomboid")
{
	MsgBox, 4, PZAutoPauser, Looks like you already have Project Zomboid running. Would you like to focus/activate the window?`n`nClicking YES will focus/activate the "Project Zomboid" window. The script will then start watching the window.`n`nClicking NO will exit PZAutoPauser.
	IfMsgBox Yes
		WinActivate, Project Zomboid
	else
		ExitApp
}

SetTimer, WatchActiveWindow, 200

return

WatchActiveWindow:

if WinExist("Project Zomboid") and !WinActive("Project Zomboid")
{
	SetKeyDelay, 100, 100
	ControlSend,, {F2}, Project Zomboid
	ControlSend,, {Esc}, Project Zomboid
    MsgBox, 4, PZAutoPauser, PZAutoPauser Triggered!`n`nWould you like to resume the game?`n`nClicking YES will focus/activate the "Project Zomboid" window. The script will continue watching the window.`n`nClicking NO will exit PZAutoPauser.
	IfMsgBox Yes
		WinActivate, Project Zomboid
	else
		ExitApp
}

return
