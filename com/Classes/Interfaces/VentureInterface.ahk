Class VentureInterface{
	__New(InterfaceName){
global
		this._Name := InterfaceName


	}

destroyInterface(){
Gui,10:Destroy
return
}

openInterface(){
	global
this.destroyInterface()
		Menu, tray, Icon , %FOLDER_THEME%Main_Icon.ico, 1, 1
		Gui,10: Color , %OTHER_GUI_COLOR%
Gui,10:    +LastFound +MaximizeBox +Owner2 
AuthH := WinExist()

Gui, 10: Font, S14 CDefault Bold Underline, Verdana
Gui, 10: Add, Text, x2 y0 w610 h30 +BackgroundTrans +Center, % this._Name
Gui, 10: Font, , 
Gui, 10: Font, Bold, 
Gui, 10: Add, GroupBox, x12 y30 w590 h400 , Select Venture
Gui, 10: Font, , 
Gui, 10: Add, ListBox, x22 y50 w570 h100 , ListBox
Gui, 10: Font, S12 Bold Underline, 
Gui, 10: Add, Text, x32 y150 w550 h20 +Center +BackgroundTrans, general
Gui, 10: Font, , 
Gui, 10: Font, Bold, 
Gui, 10: Add, GroupBox, x32 y170 w560 h190 , Details
Gui, 10: Add, Text, x462 y180 w120 h20 +Center +BackgroundTrans, Clients
Gui, 10: Font, , 
Gui, 10: Add, ListBox, x462 y200 w120 h90 , ListBox
Gui, 10: Add, Link, x462 y290 w120 h20 gMODULE_CLIENT +Center ,<a id="A">Modify Clients...</a>
;Gui, 10: Add, Text, x462 y290 w120 h20 +BackgroundTrans, Modify Clients...
Gui, 10: Add, Text, x42 y190 w90 h20 , Venture Profits
Gui, 10: Add, Edit, x132 y190 w100 h20 , Edit
Gui, 10: Font, Bold, 
Gui, 10: Add, Text, x342 y180 w120 h20 +Center, Products
Gui, 10: Font, , 
Gui, 10: Add, ListBox, x342 y200 w120 h82 , ListBox
Gui, 10: Add, Link, x342 y290 w120 h20 gMODULE_PRODUCTS +Center ,<a id="A">Modify Products...</a>
;Gui, 10: Add, Text, x342 y290 w120 h20 +BackgroundTrans, Modify Products...
Gui, 10: Add, Text, x42 y210 w90 h20 , Creation Date
Gui, 10: Add, Edit, x132 y210 w100 h20 , Edit
Gui, 10: Font, Bold, 
Gui, 10: Add, GroupBox, x42 y300 w540 h50 , Disolve Venture
Gui, 10: Add, Text, x52 y320 w390 h20 , (Profits Merged to Bank`, Clients / Products disolved)
Gui, 10: Add, Button, x482 y320 w90 h20 , Disolve
Gui, 10: Add, GroupBox, x32 y370 w550 h50 , New Venture
Gui, 10: Font, , 
Gui, 10: Add, Text, x272 y390 w70 h20 , Venture Name
Gui, 10: Add, Edit, x362 y390 w100 h20 , Edit
Gui, 10: Add, Button, x482 y390 w90 h20 , Create
Gui, 10: Show, w616 h474,% this._Name
	DllCall("SetParent", "uint", AuthH, "uint", MainH)
return
}




}