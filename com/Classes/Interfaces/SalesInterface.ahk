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
		Gui,8: +LastFound +MaximizeBox +Owner2 
		AuthH := WinExist()
Gui, 8:Font, S14 CDefault Bold Underline, Verdana
Gui, 8:Add, Text, x2 y0 w860 h30 +Center +BackgroundTrans, Process Sale
Gui, 8:Font, , 
Gui, 8:Font, Bold, 
Gui, 8:Add, GroupBox, x12 y30 w840 h330 , Venture
Gui, 8:Font, , 
Gui, 8:Add, ListBox, x22 y80 w120 h200 , % CURRENT_POS.Ventures.getAllVentures()
Gui, 8:Font, Bold, 
Gui, 8:Add, GroupBox, x152 y40 w690 h310 , Product && Client
Gui, 8:Font, , 
Gui, 8:Add, ListBox, x162 y80 w120 h200 , 
Gui, 8:Add, ListBox, x292 y80 w120 h200 , 
Gui, 8:Font, Bold, 
Gui, 8:Add, Text, x22 y60 w120 h20 , Choose Venture
Gui, 8:Add, Text, x162 y60 w120 h20 , Choose Product
Gui, 8:Add, Text, x292 y60 w120 h20 , Choose Client
Gui, 8:Font, , 
Gui, 8:Font, S14 Bold Underline, 
Gui, 8:Add, Text, x422 y170 w20 h30 , ->
Gui, 8:Font, , 
Gui, 8:Font, Bold, 
Gui, 8:Add, GroupBox, x452 y50 w380 h180 , Final Sale Details
Gui, 8:Font, , 
Gui, 8:Add, Text, x462 y70 w90 h20 , Venture Name
Gui, 8:Add, Edit, x552 y70 w90 h20 +ReadOnly, 
Gui, 8:Add, Text, x462 y90 w90 h20 , Product Name
Gui, 8:Add, Edit, x552 y90 w90 h20 +ReadOnly, 
Gui, 8:Add, Text, x462 y110 w90 h20 , Client Name
Gui, 8:Add, Edit, x552 y110 w90 h20 +ReadOnly, 
Gui, 8:Add, Text, x462 y130 w90 h20 , Quantity
Gui, 8:Add, Edit, x552 y130 w90 h20 , 
Gui, 8:Add, Text, x642 y90 w90 h20 , Product Quantity
Gui, 8:Add, Edit, x732 y90 w90 h20 +ReadOnly, 
Gui, 8:Add, Text, x642 y110 w90 h20 , Client Debt
Gui, 8:Add, Edit, x732 y110 w90 h20 +ReadOnly, 
Gui, 8:Add, Edit, x732 y130 w90 h20 +ReadOnly, 
Gui, 8:Add, Text, x642 y130 w90 h20 , Average $/Unit
Gui, 8:Add, Text, x642 y150 w90 h20 , This Sales $/Unit
Gui, 8:Add, Edit, x732 y150 w90 h20 +ReadOnly, 
Gui, 8:Add, Text, x462 y150 w90 h20 , Total Price
Gui, 8:Add, Edit, x552 y150 w90 h20 , 
Gui, 8:Add, Button, x572 y180 w70 h40 , Process Sale
Gui, 8:Add, Text, x642 y200 w90 h20 , New Client Debt
Gui, 8:Add, Edit, x732 y200 w90 h20 +ReadOnly, 
Gui, 8:Add, Radio, x462 y180 w100 h20 +Checked vCashDebt1, Cash Transaction
Gui, 8:Add, Radio, x462 y200 w100 h20  gRadio1 vCashDebt2, Debt Transaction
Gui, 8:Show, w864 h369,% this._Name
	DllCall("SetParent", "uint", AuthH, "uint", MainH)
return
}




}