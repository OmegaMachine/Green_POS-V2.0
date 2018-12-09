Class AuthenticationInterface{
	__New(InterfaceName){
global
		this._Name := InterfaceName


	}
	_Authenticated := false
	_authAs := 0

	


destroyInterface(){
Gui,3:Destroy
return
}
requestAuthentication(){
	global
	_Authenticated := false
	_authAs := 0
this.destroyInterface()
		;Gui,3: Add,Picture,w400 h150 x0 y0,%FOLDER_THEME%Red.PNG
		Gui,3: Color , %AUTH_GUI_COLOR%
		Gui,3: +Parent2  +ToolWindow
		Gui,3: Show, w400 h150 ,% this._Name
return
}
createInterface(){
	global
this.destroyInterface()
		;Gui,3: Add,Picture,w400 h150 x0 y0,%FOLDER_THEME%Red.PNG
		Gui,3: Color , %AUTH_GUI_COLOR%
		Gui,3: +Parent2  +ToolWindow
		Gui,3: Show, w400 h150 ,% this._Name
return
}

}