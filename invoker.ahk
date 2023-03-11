#NoEnv
#Persistent
#SingleInstance, Force
SendMode, Input
SetWorkingDir, %A_ScriptDir%
SetTitleMatchMode, 2
SetTitleMatchMode, Fast

; ========================================================================

global states:= ["qqq","www","eee"]
global i

; ========================================================================

Gui_Invoker()

; ========================================================================

^q::Invoker_Spell("Coldsnap")
^w::Invoker_Spell("GhostWalk")
^e::Invoker_Spell("IceWall")
^r::Invoker_Spell("EMP")
^a::Invoker_Spell("Tornado")
^s::Invoker_Spell("Alacrity")
^d::Invoker_Spell("DeafeningBlast")
^f::Invoker_Spell("SunStrike")
^3::Invoker_Spell("SpiritForge")
^4::Invoker_Spell("ChaosMeteor")

CapsLock::Invoker_ChangeState()

F12::ExitApp

; ========================================================================

Gui_Invoker(){
	
	Gui, +LastFound +AlwaysOnTop +ToolWindow -Caption
	Gui, Color, EEFFFF
	WinSet, TransColor, EEFFFF 225
	
	Width:= 64	
	GuiCommand:= ["w" Width " ys","w" Width],
	Path:= A_ScriptDir . "\img\"
	
	Gui, Add, Picture, % GuiCommand[2], % Path "Cold-Snap.png"
	Gui, Add, Picture, % GuiCommand[1], % Path "Tornado.png"
	Gui, Add, Picture, % GuiCommand[1], % Path "EMP.png"
	Gui, Add, Picture, % GuiCommand[1], % Path "Ice-Wall.png"
	Gui, Add, Picture, % GuiCommand[1], % Path "Ghost-Walk.png"
	Gui, Add, Picture, % GuiCommand[1], % Path "Alacrity.png"
	Gui, Add, Picture, % GuiCommand[1], % Path "Chaos-Meteor.png"
	Gui, Add, Picture, % GuiCommand[1], % Path "Deafening-Blast.png"
	Gui, Add, Picture, % GuiCommand[1], % Path "Sun-Strike.png"
	Gui, Add, Picture, % GuiCommand[1], % Path "Forge-Spirit.png"
	
	Gui, Show, y43
	hwnd_Gui:= WinExist()
	WinSet, ExStyle, ^0x20, ahk_id %hwnd_Gui%
	
	return
}

Invoker_Spell(spell){
	
	Spells:= [ ["ColdSnap", 	"qqq"]
		,     ["GhostWalk", 	"qqw"]
		,     ["IceWall", 	"qqe"]
		,     ["EMP", 		"www"]
		,     ["Tornado", 	"wwq"]	
		,     ["Alacrity", 	"wwe"]
		,     ["DeafeningBlast","qwe"]
		,     ["SunStrike", 	"eee"]
		,     ["SpiritForge", 	"eeq"]
		,     ["ChaosMeteor", 	"eew"] ]
	
	loop % Spells.Length(){
		if InStr(Spells[A_Index][1],spell){
			SendInput(Spells[A_Index][2] "r" states[i]) 
			return
		}
	}
}

Invoker_ChangeState(){
	i++
	(i=4) ? (i:= 1) : i
	SendInput(states[i])
	return
}

SendInput(hotkeys){
	SendInput, %hotkeys%
	return
}