Class LoggerInterface{
	__New(InterfaceName){
global
		this._Name := InterfaceName
		this._Text:=

	}



destroyInterface(){
Gui,6:Destroy
return
}

openInterface(){
	global

this.destroyInterface()
	Menu, tray, Icon , %FOLDER_THEME%Main_Icon.ico, 1, 1


		Gui,6: Color , %LOGGER_GUI_COLOR%
		Gui,6: +MaximizeBox +Resize ;+ToolWindow
		
		
		Gui,6: +LastFound
		AuthH := WinExist()
		Gui,2: +Lastfound
		MainH := WinExist()
		Gui,6: +Lastfound
		Gui,6: +Owner2
	
		Gui,6: Add,Edit,w400 h150 x0 y0  +ReadOnly cRed vLoggerText ,% this._Text ;Used to focus this gui

		Gui,6: Show, w400 h150 ,% this._Name
	DllCall("SetParent", "uint", AuthH, "uint", MainH)
return
}

Log(xType,XText,XSep:="::"){
global
XTime := Get_InternetTime()
MessageX:=XTime . " | " . xType . " " . XSep . " " . XText
		Gui,6: Default
GuiControlGet,Z,,LoggerText
this._Text := MessageX . "`n" . Z
GuiControl,,LoggerText,% this._Text
Gui,2:Default
;SB_SetText(MessageX)
}
Clear(){
global	
Gui,6: Default
this._Text :=""
GuiControl,,LoggerText,

}

}