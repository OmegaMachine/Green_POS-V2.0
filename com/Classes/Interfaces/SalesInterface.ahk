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
Gui, 8:Add, ListBox, x22 y80 w120 h200 vSALES_VENTUREBOX gSALESSELECT_VENTURE, % CURRENT_POS.Ventures.getAllEntrys()
Gui, 8:Font, Bold, 
Gui, 8:Add, GroupBox, x152 y40 w690 h310 , Product && Client
Gui, 8:Font, , 
Gui, 8:Add, ListBox, x162 y80 w120 h200 vSALES_PRODUCTBOX gSALESSELECT_PRODUCT, 
Gui, 8:Add, ListBox, x292 y80 w120 h200 vSALES_CLIENTBOX gSALESSELECT_CLIENT, 
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
Gui, 8:Add, Edit, x552 y70 w90 h20 +ReadOnly vSales_VentureName, 
Gui, 8:Add, Text, x462 y90 w90 h20 , Product Name
Gui, 8:Add, Edit, x552 y90 w90 h20 +ReadOnly vSales_ProductName, 
Gui, 8:Add, Text, x462 y110 w90 h20 , Client Name
Gui, 8:Add, Edit, x552 y110 w90 h20 +ReadOnly vSales_ClientName, 
Gui, 8:Add, Text, x462 y130 w90 h20 , Quantity
Gui, 8:Add, Edit, x552 y130 w90 h20 vSales_Quantity gLoad_Sale_Details, 
Gui, 8:Add, Text, x642 y90 w90 h20 , Product Quantity
Gui, 8:Add, Edit, x732 y90 w90 h20 +ReadOnly vSales_ProductQuantity, 
Gui, 8:Add, Text, x642 y110 w90 h20 , Client Debt
Gui, 8:Add, Edit, x732 y110 w90 h20 +ReadOnly vSales_ClientDebt, 

Gui, 8:Add, Edit, x732 y130 w90 h20 +ReadOnly vSales_Profit, 
Gui, 8:Add, Text, x642 y130 w90 h20 , Profit 

Gui, 8:Add, Text, x642 y150 w90 h20 , Profit / Unit
Gui, 8:Add, Edit, x732 y150 w90 h20 +ReadOnly vSales_ThisPPU, 

Gui, 8:Add, Text, x462 y150 w90 h20 , Total Price
Gui, 8:Add, Edit, x552 y150 w90 h20 vSales_Price gLoad_Sale_Details, 
Gui, 8:Add, Button, x572 y180 w70 h40 gProcess_Sale, Process Sale
Gui, 8:Add, Text, x642 y200 w90 h20 , New Client Debt
Gui, 8:Add, Edit, x732 y200 w90 h20 +ReadOnly vSales_NewClientDebt, 
Gui, 8:Add, Radio, x462 y180 w100 h20 +Checked vCashDebt1 gRadio1, Cash Transaction
Gui, 8:Add, Radio, x462 y200 w100 h20  gRadio1 vCashDebt2, Debt Transaction
Gui, 8:Show, w864 h369,% this._Name
	DllCall("SetParent", "uint", AuthH, "uint", MainH)
return
}




}