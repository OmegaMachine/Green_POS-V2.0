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
Gui,4: Add, Text, x0 y0 w630 h25 +BackgroundTrans +Center, % this._Name
Gui,4: Font, , 
Gui,4: Font, Bold, Verdana
Gui,4: Add, GroupBox, x12 y40 w600 h300 , Modify Investor
Gui,4: Font, ,
Gui,4: Add, ListBox, x22 y60 w580 h80 gSELECT_INVESTOR vInvestor_List , % CURRENT_POS.Investors.getAllInvestors()
Gui,4: Font, S10 Bold Underline, Verdana
Gui,4: Add, Text, x22 y130 w570 h20 +Center +BackgroundTrans v_InvestorName, 
Gui,4: Font, , 
Gui,4: Font, Bold, Verdana
Gui,4: Add, GroupBox, x22 y150 w200 h180 , Investor Stats
Gui,4: Font, ,
Gui,4: Add, Text, x32 y170 w70 h20 , Investment
Gui,4: Add, Edit, x112 y170 w100 h20 v_IInvestment +ReadOnly, 
Gui,4: Add, Text, x32 y190 w70 h20 , Shares
Gui,4: Add, Edit, x112 y190 w100 h20 v_IShares +ReadOnly, 
Gui,4: Add, Text, x32 y210 w70 h20 , Value
Gui,4: Add, Edit, x112 y210 w100 h20 v_IValue +ReadOnly, 
Gui,4: Add, Text, x32 y230 w70 h20 , Profit
Gui,4: Add, Edit, x112 y230 w100 h20 v_IProfit +ReadOnly, 
Gui,4: Add, Text, x32 y260 w70 h20 , Join Date
Gui,4: Add, Edit, x112 y260 w100 h20 v_IJoinDate +ReadOnly, 
Gui,4: Font, , 
Gui,4: Font, Bold, Verdana
Gui,4: Add, GroupBox, x222 y150 w380 h70 , Purchase Shares
Gui,4: Font, ,
Gui,4: Add, Text, x232 y170 w40 h20 , Quantity
Gui,4: Add, Edit, x282 y170 w50 h20 v_PurchaseQuantity gTYPE_PURCHASE_QUANTITY +Number, 
Gui,4: Add, Text, x342 y170 w70 h20 , Price / Share
Gui,4: Add, Edit, x412 y170 w80 h20  +ReadOnly v_PurchasePPS, % CURRENT_POS.getMinShareValue()
Gui,4: Add, Text, x342 y190 w40 h20 , Total
Gui,4: Add, Edit, x412 y190 w80 h20  +ReadOnly v_PurchaseTotalPrice,0 
Gui,4: Add, Button, x502 y190 w90 h20  gPURCHASE_SHARES, Purchase
Gui,4: Font, , 
Gui,4: Font, Bold, Verdana
Gui,4: Add, GroupBox, x222 y220 w380 h70 , Sell Shares
Gui,4: Font, ,
Gui,4: Add, Text, x232 y240 w40 h20 , Quantity
Gui,4: Add, Edit, x282 y240 w50 h20 v_SellQuantity gTYPE_SELL_QUANTITY +Number, 
Gui,4: Add, Text, x342 y240 w70 h20  , Price / Share
Gui,4: Add, Edit, x412 y240 w80 h20 +ReadOnly v_SellPPS, % CURRENT_POS.getMinShareValue()
Gui,4: Add, Text, x342 y260 w40 h20  , Total
Gui,4: Add, Edit, x412 y260 w80 h20 +ReadOnly v_SellTotalPrice,0 
Gui,4: Add, Button, x502 y260 w90 h20 gSELL_SHARES, Sell
Gui,4: Font, , 
Gui,4: Font, Bold, Verdana
Gui,4: Add, GroupBox, x222 y290 w380 h40 , Remove Investor
Gui,4: Font, ,
Gui,4: Add, Button, x502 y300 w90 h20 gDELETE_INVESTOR, Remove
Gui,4: Add, Text, x233 y307 w260 h20 +Center, (must have 0 shares)
Gui,4: Font, , 
Gui,4: Font, Bold, Verdana
Gui,4: Add, GroupBox, x12 y350 w600 h65 , New Investor
Gui,4: Font, ,
Gui,4: Add, Text, x22 y370 w40 h20 , Name
Gui,4: Add, Edit, x62 y370 w100 h20 vINVESTOR_NEW_NAME, 
Gui,4: Add, Text, x172 y370 w40 h20 , Email
Gui,4: Add, Edit, x212 y370 w100 h20 vINVESTOR_NEW_EMAIL, 
Gui,4: Add, Text, x322 y370 w50 h20 , Password
Gui,4: Add, Edit, x382 y370 w100 h20 vINVESTOR_NEW_PW +Password, 
Gui,4: Add, Text, x322 y390 w60 h20 , Repeat PW
Gui,4: Add, Edit, x382 y390 w100 h20 vINVESTOR_NEW_PWREPEAT +Password, 
Gui,4: Add, Button, x502 y390 w90 h20 gCREATE_NEW_INVESTOR, Create
Gui,4: Show, w627 h433, % this._Name



	DllCall("SetParent", "uint", AuthH, "uint", MainH)
return
}


attemptCreate(_Name,PW,PWREPEAT){
	global
	CURRENT_POS.Logger.Log("Message","Attempting to create a new admin account....",MESSAGE_SEP)
	Gui,3: Submit,NoHide
	if _Name is Not alnum
	{
		MsgBox, 0, Create New Investor, Failed. Invalid Name.
	CURRENT_POS.Logger.Log("Message","....Failed. Username invalid.",MESSAGE_SEP)
return	
}
	if _Name is space
	{
		MsgBox, 0, Create New Investor, Failed. Invalid Name.
	CURRENT_POS.Logger.Log("Message","....Failed. Username invalid.",MESSAGE_SEP)
return	
}
	if PW is Not alnum
	{
		MsgBox, 0, Create New Investor, Failed. Invalid Password.
	CURRENT_POS.Logger.Log("Message","....Failed. Password invalid.",MESSAGE_SEP)
return	
}
	if PW is space
	{
		MsgBox, 0, Create New Investor, Failed. Invalid Password.
	CURRENT_POS.Logger.Log("Message","....Failed. Password invalid.",MESSAGE_SEP)
return	
}
	if (PWREPEAT != PW)
	{
		MsgBox, 0, Create New Investor, Failed. Passwords do not match. 
	CURRENT_POS.Logger.Log("Message","....Failed. Repeat Password does not match Password.",MESSAGE_SEP)
return	
}

	Guicontrol,,_Name,
	Guicontrol,,PW,
	Guicontrol,,PWREPEAT,
	this.createAdmin(_Name,PW)
	;this.requestAuthentication()
	CURRENT_POS.Logger.Log("Message","....Success.",MESSAGE_SEP)

}

createAdmin(VUsername,vPassword){
	global
	CURRENT_POS.AdminAccounts.WriteData(vPassword,"Password",vUsername)
	CURRENT_POS.AdminAccounts.WriteData(Get_InternetTime(),"JoinDate",vUsername)
	CURRENT_POS.AdminAccounts.WriteData(0,"Investments",vUsername)
	CURRENT_POS.AdminAccounts.WriteData(0,"Shares",vUsername)
D:=_ListAddStart(CURRENT_POS.AdminAccounts.ReadData("Counter","Counter",false),vUsername)
CURRENT_POS.AdminAccounts.WriteData(D,"Counter","Counter")
CURRENT_POS.TransactionDatabase.createTransaction("Investor","Created",,VUsername)
this.openInterface()
}
deleteAdmin(VUsername){
	global

	CURRENT_POS.AdminAccounts.WriteData(0,"Investments",vUsername)
D:=_ListRemoveByData(CURRENT_POS.AdminAccounts.ReadData("Counter","Counter",false),vUsername)

CURRENT_POS.AdminAccounts.WriteData(D,"Counter","Counter")
CURRENT_POS.TransactionDatabase.createTransaction("Investor","Removed",,VUsername)
this.openInterface()
}
getAllInvestors(){
	global
return 	CURRENT_POS.AdminAccounts.ReadData("Counter","Counter",false)
}

getInvestorStat(StatName,InvestorName,zDefault := 0){
	global
return CURRENT_POS.AdminAccounts.ReadData(StatName,InvestorName,zDefault)
}
setInvestorStat(StatName,InvestorName,xData){
	global
	CURRENT_POS.AdminAccounts.WriteData(xData,StatName,InvestorName)
return
}
addInvestorStat(StatName,InvestorName,xData){
	global
		currentStat := this.getInvestorStat(StatName,InvestorName)
	currentStat += xData
	CURRENT_POS.AdminAccounts.WriteData(currentStat,StatName,InvestorName)
return
}
subInvestorStat(StatName,InvestorName,xData){
	global
		currentStat := this.getInvestorStat(StatName,InvestorName)
	currentStat -= xData
	CURRENT_POS.AdminAccounts.WriteData(currentStat,StatName,InvestorName)
return
}
purchaseShares(IInvestor_Name,I_PurchaseQuantity,I_PurchaseTotalPrice){
	global
	;msgbox,% I_PurchaseQuantity
	this.addInvestorStat("Shares",IInvestor_Name,I_PurchaseQuantity)
	this.addInvestorStat("Investments",IInvestor_Name,I_PurchaseTotalPrice)
	CURRENT_POS.addMainStat("SharesSold",I_PurchaseQuantity)
	CURRENT_POS.addMainStat("Value",I_PurchaseTotalPrice)
	CURRENT_POS.addMainStat("Investments",I_PurchaseTotalPrice)
	CURRENT_POS.TransactionDatabase.createTransaction("Investor","Purchase",,IInvestor_Name,"Shares",I_PurchaseQuantity,CURRENT_POS.getMinShareValue(),I_PurchaseTotalPrice)
}
sellShares(IInvestor_Name,I_SellQuantity,I_SellTotalPrice){
	global
	;msgbox,% I_PurchaseQuantity
	this.subInvestorStat("Shares",IInvestor_Name,I_SellQuantity)
	this.subInvestorStat("Investments",IInvestor_Name,I_SellTotalPrice)
	CURRENT_POS.subMainStat("SharesSold",I_SellQuantity)
	CURRENT_POS.subMainStat("Value",I_SellTotalPrice)
	CURRENT_POS.subMainStat("Investments",I_SellTotalPrice)
	CURRENT_POS.TransactionDatabase.createTransaction("Investor","Sell",,IInvestor_Name,"Shares",I_SellQuantity,CURRENT_POS.getMinShareValue(),I_SellTotalPrice)
}
}