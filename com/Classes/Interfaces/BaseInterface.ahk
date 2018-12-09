Class XInterface{
	__New(InterfaceName){
global
		this._Name := InterfaceName


	}

destroyInterface(){
Gui,4:Destroy
return
}

openInterface(){
	global
this.destroyInterface()
		;Gui,3: Add,Picture,w400 h150 x0 y0,%FOLDER_THEME%Red.PNG
		Gui,4: Color , %AUTH_GUI_COLOR%
		Gui,4: +MaximizeBox ;+ToolWindow
		
		
		Gui,4: +LastFound
		AuthH := WinExist()
		Gui,2: +Lastfound
		MainH := WinExist()
		Gui,4: +Lastfound
		Gui,4: +Owner2

		Gui,4: Show, w400 h150 ,% this._Name
	DllCall("SetParent", "uint", AuthH, "uint", MainH)
return
}




}