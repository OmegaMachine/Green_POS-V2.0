_Text :=
Period := 1
Gui,2: +Resize
Gui,2: Color , 020202
Gui,2: Add,edit,w1100 h600 x0 y0 +ReadOnly  cRed vEText +Wrap,
Gui,2: Show, w1100 h600
SetTimer,GoNow,%Period%
return
2GuiSize:
Gui,2:Default
Gui,2: +LastFound
GuiControl,Move,EText,w%A_GUIWidth% h%A_GUIHeight%
return
GoNow:
Random,C,0,1
AddLog(C)
return

AddLog(xxx){
global

MessageX:=xxx
		Gui,2: Default
GuiControlGet,Z,,EText
_Text := MessageX . "" . Z
GuiControl,,EText,% _Text

}