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
createInterface(){
	global

		Gui,3: Add,Picture,w400 h150 x0 y0,%FOLDER_THEME%Red.PNG
		Gui,3: +Parent2 +MaximizeBox
		Gui,3: Show, w400 h150 ,% this._Name
return
}

}