Class AdminInterface{
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
		Menu, tray, Icon , %FOLDER_THEME%Main_Icon.ico, 1, 1
		Gui,4: Color , %AUTH_GUI_COLOR%
		Gui,4:    +LastFound +MaximizeBox ;+ToolWindow
		AuthH := WinExist()
		Gui,2: +Lastfound
		MainH := WinExist()
		Gui,4: +Lastfound
		Gui,4: +Owner2
		;Gui,4: +Parent2
		x:=10
		
		Gui,4: Add, Text, x10 y10 w50 h20 +BackgroundTrans, Username:
		Gui,4: Add, Edit, x+m y10 w130 h20 , Edit

		Gui,4: Add, Text,x10 y30 w50 h20 +BackgroundTrans, Password:
		Gui,4: Add, Edit, x+m yp w130 h20 , Edit

		;Gui,3: Add, Text, x%x% y50 w90 h20 +BackgroundTrans, Repeat Password
		;Gui,3: Add, Edit, x%x%+90 y50 w130 h20 , Edit

		;Gui,3: Add, Button, x%x%+130 y70 w90 h20 , Login
		
		
		
		Gui,4: Show, w400 h150 ,% this._Name
	DllCall("SetParent", "uint", AuthH, "uint", MainH)
return
}




}