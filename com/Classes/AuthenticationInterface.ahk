Class AuthenticationInterface{
	__New(InterfaceName){
global
		this._Name := InterfaceName

		Gui,3: +Parent2
		Gui,3: Show, w300 h200 ,% this._Name
	}
	_Authenticated := false
	_authAs := 0

	


HideInterface(){
Gui,3:Hide
return
}
ShowInterface(){
Gui,3:Show
return
}

}