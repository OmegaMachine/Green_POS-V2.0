Class SalesInterface{
	__New(InterfaceName){
global
		this._Name := InterfaceName


	}

destroyInterface(){
Gui,8:Destroy
return
}

openInterface(){
	global
this.destroyInterface()
Menu, tray, Icon , %FOLDER_THEME%Main_Icon.ico, 1, 1
Gui,8: Color , %OTHER_GUI_COLOR%
		Gui,8: +MaximizeBox ;+ToolWindow
		
		
		Gui,8: +LastFound
		AuthH := WinExist()
		Gui,2: +Lastfound
		MainH := WinExist()
		Gui,8: +Lastfound
		Gui,8: +Owner2

		Gui,8: Show, w400 h150 ,% this._Name
	DllCall("SetParent", "uint", AuthH, "uint", MainH)
return
}




}