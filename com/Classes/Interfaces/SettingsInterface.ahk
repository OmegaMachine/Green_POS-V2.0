Class SettingsInterface{
	__New(InterfaceName){
global
		this._Name := InterfaceName


	}

destroyInterface(){
Gui,11:Destroy
return
}

openInterface(){
	global
this.destroyInterface()
		Menu, tray, Icon , %FOLDER_THEME%Settings_Icon.ico, 1, 1
		Gui,11: Color , %AUTH_GUI_COLOR%
		Gui,11: +MaximizeBox ;+ToolWindow
		
		
		Gui,11: +LastFound
		AuthH := WinExist()
		Gui,2: +Lastfound
		MainH := WinExist()
		Gui,11: +Lastfound
		Gui,11: +Owner2

		Gui,11: Show, w400 h150 ,% this._Name
	DllCall("SetParent", "uint", AuthH, "uint", MainH)
return
}




}