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
Gui,11: Color , %OTHER_GUI_COLOR%
Gui,11:    +LastFound +MaximizeBox +Owner2 
AuthH := WinExist()
Gui,11: Font, S14 CDefault Bold Underline, Verdana
Gui,11: Add, Text, x2 y0 w370 h25 +BackgroundTrans +Center, Settings
Gui,11: Font, , 
Gui,11: Add, Tab2, x2 y20 w370 h520 , Account Settings|BlackBook Settings
Gui,11: Tab, Account Settings
Gui,11: Add, GroupBox, x12 y60 w350 h90 , Change Password
Gui,11: Add, Text, x22 y80 w80 h20 , Account Name
Gui,11: Add, Edit, x102 y80 w90 h20 , Edit
Gui,11: Add, Text, x22 y100 w80 h20 , Old Password
Gui,11: Add, Edit, x102 y100 w90 h20 , Edit
Gui,11: Add, Text, x192 y80 w80 h20 , New Password
Gui,11: Add, Edit, x272 y80 w80 h20 , Edit
Gui,11: Add, Text, x192 y100 w80 h20 , Repeat
Gui,11: Add, Edit, x272 y100 w80 h20 , Edit
Gui,11: Add, Button, x272 y120 w80 h20 , Change
Gui,11: Show, w374 h542, % this._Name
		
	DllCall("SetParent", "uint", AuthH, "uint", MainH)
return
}




}