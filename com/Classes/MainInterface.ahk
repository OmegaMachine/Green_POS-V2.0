Class MainInterface{
	__New(InterfaceName){
global
		this._Name := InterfaceName
this.createInterface()
	}


	_Components := ""
	
	
	
	
	
	
	

	

destroyInterface(){
Gui,2:Destroy
return
}
createInterface(){
	global
		Menu, AccountMenu, Add, &Login / Logout ,Logout
		Menu, AccountMenu, Add, &Settings , Settings
		Menu, MyMenuBar, Add, &Account, :AccountMenu
		Gui,2: Menu, MyMenuBar
		;Gui,2: Add, Tab2, x2 y0 w1090 h590 vTabControl, Tab1|Tab2
		Gui,2: Color , %MAIN_GUI_COLOR%
		Gui,2: Show, w1100 h600 ,% this._Name
}

}