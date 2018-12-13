Class InvestorInterface{
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
		
Gui,4: Color , %OTHER_GUI_COLOR%
Gui,4:    +LastFound +MaximizeBox +Owner2 
AuthH := WinExist()
Gui,4: Font, S14 CDefault Bold Underline, Verdana
Gui,4: Add, Text, x0 y0 w630 h25 +BackgroundTrans +Center, Investors
Gui,4: Font, , 
Gui,4: Add, GroupBox, x12 y40 w600 h300 , Modify Investor
Gui,4: Add, ListBox, x22 y60 w580 h80 , ListBox
Gui,4: Font, S10 Bold Underline, Verdana
Gui,4: Add, Text, x22 y130 w570 h20 +Center +BackgroundTrans, Text
Gui,4: Font, , 
Gui,4: Add, GroupBox, x22 y150 w200 h180 , Investor Stats
Gui,4: Add, Text, x32 y170 w70 h20 , Investment
Gui,4: Add, Edit, x112 y170 w100 h20 , Edit
Gui,4: Add, Text, x32 y190 w70 h20 , Shares
Gui,4: Add, Edit, x112 y190 w100 h20 , Edit
Gui,4: Add, Text, x32 y210 w70 h20 , Share Worth
Gui,4: Add, Edit, x112 y210 w100 h20 , Edit
Gui,4: Add, Text, x32 y230 w70 h20 , Profit
Gui,4: Add, Edit, x112 y230 w100 h20 , Edit
Gui,4: Add, Text, x32 y260 w70 h20 , Join Date
Gui,4: Add, Edit, x112 y260 w100 h20 , Edit
Gui,4: Add, GroupBox, x222 y150 w380 h70 , Purchase Shares
Gui,4: Add, Text, x232 y170 w40 h20 , Quantity
Gui,4: Add, Edit, x282 y170 w50 h20 , Edit
Gui,4: Add, Text, x342 y170 w70 h20 , Price / Share
Gui,4: Add, Edit, x412 y170 w80 h20 , Edit
Gui,4: Add, Text, x342 y190 w40 h20 , Total
Gui,4: Add, Edit, x412 y190 w80 h20 , Edit
Gui,4: Add, Button, x502 y190 w90 h20 , Purchase
Gui,4: Add, GroupBox, x222 y220 w380 h70 , Sell Shares
Gui,4: Add, Text, x232 y240 w40 h20 , Quantity
Gui,4: Add, Edit, x282 y240 w50 h20 , Edit
Gui,4: Add, Text, x342 y240 w70 h20 , Price / Share
Gui,4: Add, Text, x342 y260 w40 h20 , Total
Gui,4: Add, Edit, x412 y240 w80 h20 , Edit
Gui,4: Add, Edit, x412 y260 w80 h20 , Edit
Gui,4: Add, Button, x502 y260 w90 h20 , Sell
Gui,4: Add, GroupBox, x222 y290 w380 h40 , Remove Investor
Gui,4: Add, Button, x502 y300 w90 h20 , Remove
Gui,4: Add, Text, x233 y307 w260 h20 +Center, (must have 0 shares)
Gui,4: Add, GroupBox, x12 y350 w600 h65 , New Investor
Gui,4: Add, Text, x22 y370 w40 h20 , Name
Gui,4: Add, Edit, x62 y370 w100 h20 , Edit
Gui,4: Add, Text, x172 y370 w40 h20 , Email
Gui,4: Add, Edit, x212 y370 w100 h20 , Edit
Gui,4: Add, Text, x322 y370 w50 h20 , Password
Gui,4: Add, Edit, x382 y370 w100 h20 , Edit
Gui,4: Add, Text, x322 y390 w60 h20 , Repeat PW
Gui,4: Add, Edit, x382 y390 w100 h20 , Edit
Gui,4: Add, Button, x502 y390 w90 h20 , Create
Gui,4: Show, w627 h433, % this._Name



	DllCall("SetParent", "uint", AuthH, "uint", MainH)
return
}




}