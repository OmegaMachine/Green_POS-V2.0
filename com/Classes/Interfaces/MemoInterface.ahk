Class MemoInterface{
	__New(InterfaceName){
global
		this._Name := InterfaceName


	}

destroyInterface(){
Gui,12:Destroy
return
}

openInterface(){
	global
this.destroyInterface()
		Menu, tray, Icon , %FOLDER_THEME%Main_Icon.ico, 1, 1
		Gui,12: Color , %OTHER_GUI_COLOR%
		Gui,12:     +LastFound +MaximizeBox +Owner2 
		AuthH := WinExist()
Gui, 12:Font, S14 CDefault Bold Underline, Verdana
Gui, 12:Add, Text, x2 y0 w840 h30 +Center +BackgroundTrans, Memo Explorer
Gui, 12:Font, , 
Gui, 12:Add, ListView, x22 y40 w580 h170 , Date Created | Memo Name | Memo
Gui, 12:Font, Bold, 
Gui, 12:Add, GroupBox, x22 y220 w580 h100 , New Memo
Gui, 12:Font, , 
Gui, 12:Add, Text, x32 y240 w60 h20 , Memo Name
Gui, 12:Add, Edit, x92 y240 w220 h20 +Center, 
Gui, 12:Add, Text, x32 y260 w30 h20 , Memo
Gui, 12:Add, Edit, x92 y260 w220 h50 , 
Gui, 12:Add, Button, x342 y260 w100 h20 , Add
Gui, 12:Font, Bold, 
Gui, 12:Add, GroupBox, x612 y40 w220 h180 , Memo
Gui, 12:Font, , 
Gui, 12:Add, Text, x622 y60 w60 h20 , Memo Name
Gui, 12:Add, Edit, x692 y60 w130 h20 +ReadOnly, 
Gui, 12:Add, Text, x622 y80 w70 h20 , Date Created
Gui, 12:Add, Edit, x692 y80 w130 h20 +ReadOnly, 
Gui, 12:Add, Edit, x622 y100 w200 h110 +ReadOnly, 
Gui, 12:Show, w847 h421, % this._Name
	DllCall("SetParent", "uint", AuthH, "uint", MainH)
return
}




}