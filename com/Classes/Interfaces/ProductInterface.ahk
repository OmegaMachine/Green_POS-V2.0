Class ProductInterface{
	__New(InterfaceName){
global
		this._Name := InterfaceName


	}

destroyInterface(){
Gui,7:Destroy
return
}

openInterface(){
	global
this.destroyInterface()
		Menu, tray, Icon , %FOLDER_THEME%Main_Icon.ico, 1, 1
		Gui,7: Color , %OTHER_GUI_COLOR%
		Gui,7: +MaximizeBox ;+ToolWindow
		
		
		Gui,7: +LastFound
		AuthH := WinExist()
		Gui,2: +Lastfound
		MainH := WinExist()
		Gui,7: +Lastfound
		Gui,7: +Owner2

		Gui,7: Show, w400 h150 ,% this._Name
	DllCall("SetParent", "uint", AuthH, "uint", MainH)
return
}




}