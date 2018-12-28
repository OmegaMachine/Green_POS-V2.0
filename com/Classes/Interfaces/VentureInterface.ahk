Class VentureInterface{
	__New(InterfaceName){
global
		this._UnmodifiedName := InterfaceName
		StringReplace,InterfaceName,InterfaceName,%A_Space%,_,All
		this._Name := InterfaceName
		this._Folder :=  A_ScriptDir . "\data\" . "Ventures" . "\"
		this._Database := New Database("Ventures",this._Folder,ENCRYPT_DATAVALUES,ENCRYPT_DATAKEYS,ENCRYPTION_KEY)

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
Gui, 10: Add, ListBox, x22 y50 w570 h100 gSELECT_VENTURE vVenture_VentureBox,% this.getAllEntrys()

Gui, 10: Font, S12 Bold Underline, 
Gui, 10: Add, Text, x32 y150 w550 h20 +Center +BackgroundTrans vVenture_VentureName,

Gui, 10: Font, , 
Gui, 10: Font, Bold, 
Gui, 10: Add, GroupBox, x32 y170 w560 h190 , Details

Gui, 10: Font, , 
Gui, 10: Add, Text, x42 y190 w90 h20 , Creation Date
Gui, 10: Add, Edit, x132 y190 w150 h20 +Center +ReadOnly vVenture_VentureCreation,
Gui, 10: Add, Text, x42 y210 w90 h20 , Venture Profits
Gui, 10: Add, Edit, x132 y210 w150 h20 +Center +ReadOnly vVenture_VentureProfits,

Gui, 10: Font, Bold,
Gui, 10: Add, Text, x462 y180 w120 h20 +Center +BackgroundTrans, Clients
Gui, 10: Font, , 
Gui, 10: Add, ListBox, x462 y200 w120 h90 vVenture_ClientBox, 
Gui, 10: Add, Link, x462 y290 w120 h20 gMODULE_CLIENT +Center ,<a id="A">Modify Clients...</a>


Gui, 10: Font, Bold, 
Gui, 10: Add, Text, x342 y180 w120 h20 +Center, Products
Gui, 10: Font, , 
Gui, 10: Add, ListBox, x342 y200 w120 h82 vVenture_ProductBox, 
Gui, 10: Add, Link, x342 y290 w120 h20 gMODULE_PRODUCTS +Center ,<a id="A">Modify Products...</a>
;Gui, 10: Add, Text, x342 y290 w120 h20 +BackgroundTrans, Modify Products...

Gui, 10: Font, Bold, 
Gui, 10: Add, GroupBox, x42 y300 w540 h50 , Disolve Venture
Gui, 10: Add, Text, x52 y320 w390 h20 , (Profits Merged to Bank`, Clients / Products disolved)
Gui, 10: Add, Button, x482 y320 w90 h20 , Disolve

Gui, 10: Font, Bold, 
Gui, 10: Add, GroupBox, x32 y370 w550 h50 , New Venture
Gui, 10: Font, , 
Gui, 10: Add, Text, x272 y390 w70 h20 , Venture Name
Gui, 10: Add, Edit, x362 y390 w100 h20 vNEW_VENTURE_NAME,
Gui, 10: Add, Button, x482 y390 w90 h20 gCREATE_NEW_VENTURE, Create
Gui, 10: Show, w616 h474,% this._UnmodifiedName
	DllCall("SetParent", "uint", AuthH, "uint", MainH)
return
}

createDatabaseEntry(Entry_Name,Entry_Details := ""){
	global
	
	this._Database.WriteData(Get_InternetTime(),"CreateDate",Entry_Name)
	
	Loop,Parse,Entry_Details,|
	{
		StringSplit,Entry_Piece,A_LoopField,:
		this._Database.WriteData(Entry_Piece2,Entry_Piece1,Entry_Name)
	}
this.addEntryToCounter(Entry_Name)
CURRENT_POS.TransactionDatabase.createTransaction("Venture","Created",Entry_Name)
;this.openInterface()
GuiControl,,Venture_VentureBox,% "|" . this.getAllEntrys()
}
addEntryToCounter(Entry_Name){
	global
	D:=_ListAddStart(this._Database.ReadData("Counter","Counter",false),Entry_Name)
this._Database.WriteData(D,"Counter","Counter")
}
getAllEntrys(){
	global
	s:=this._Database.ReadData("Counter","Counter",false)
	if(s){
		return s
	}
return 	""
}

getEntryStat(StatName,Entry_Name,zDefault := 0){
	global
return this._Database.ReadData(StatName,Entry_Name,zDefault)
}
setEntryStat(StatName,Entry_Name,xData){
	global
	this._Database.WriteData(xData,StatName,Entry_Name)
return
}









;;;;;CLIENTS
createClient(Venture_Name,Client_Name,Entry_Details := ""){
	global
	this._Database.WriteData(Get_InternetTime(),"CreateDate",Venture_Name . "-" . Client_Name)
	
	Loop,Parse,Entry_Details,|
	{
		StringSplit,Entry_Piece,A_LoopField,:
		this._Database.WriteData(Entry_Piece2,Entry_Piece1,Venture_Name . "-" . Client_Name)
	}
this.addClientToCounter(Venture_Name,Client_Name)
CURRENT_POS.TransactionDatabase.createTransaction("Client","Created",Venture_Name,Client_Name)
;CURRENT_POS.Clients.openInterface()
gosub,CLIENTSELECT_VENTURE
}
addClientToCounter(Venture_Name,Client_Name){
	global
	D:=_ListAddStart(this._Database.ReadData("Client_Counter",Venture_Name,false),Client_Name)
this._Database.WriteData(D,"Client_Counter",Venture_Name)
}
getAllClients(Venture_Name){
	global
	s:=this._Database.ReadData("Client_Counter",Venture_Name,false)
	if(s){
		return s
	}
return 	""
}
getClientStat(StatName,Venture_Name,Client_Name,zDefault := 0){
	global
return this._Database.ReadData(StatName,Venture_Name . "-" . Client_Name)
}
setClientStat(StatName,Venture_Name,Client_Name,xData){
	global
	this._Database.WriteData(xData,StatName,Venture_Name . "-" . Client_Name)
return
}



deleteClient(clientName,ventureName){
	global
this.setClientStat("Debt",ventureName,clientName,0)
D:=_ListRemoveByData(this._Database.ReadData("Client_Counter",ventureName,false),clientName)
this._Database.WriteData(D,"Client_Counter",ventureName)
;CURRENT_POS.AdminAccounts.WriteData(D,"Counter","Counter")

CURRENT_POS.TransactionDatabase.createTransaction("Client","Removed",ventureName,clientName)
}







;;;;PRODUCTS
createProduct(Venture_Name,Product_Name,Entry_Details := ""){
	global
	this._Database.WriteData(Get_InternetTime(),"CreateDate",Venture_Name . "-" . Product_Name)
	
	Loop,Parse,Entry_Details,|
	{
		StringSplit,Entry_Piece,A_LoopField,:
		this._Database.WriteData(Entry_Piece2,Entry_Piece1,Venture_Name . "-" . Product_Name)
	}
this.addProductToCounter(Venture_Name,Product_Name)
CURRENT_POS.TransactionDatabase.createTransaction("Product","Created",Venture_Name,,Product_Name)
;CURRENT_POS.Products.openInterface()
gosub,PRODUCTSELECT_VENTURE
}
addProductToCounter(Venture_Name,Product_Name){
	global
	D:=_ListAddStart(this._Database.ReadData("Product_Counter",Venture_Name,false),Product_Name)
this._Database.WriteData(D,"Product_Counter",Venture_Name)
}
getAllProducts(Venture_Name){
	global
	s:=this._Database.ReadData("Product_Counter",Venture_Name,false)
	if(s){
		return s
	}
return 	""
}
getProductStat(StatName,Venture_Name,Product_Name,zDefault := 0){
	global
return this._Database.ReadData(StatName,Venture_Name . "-" . Product_Name)
}
setProductStat(StatName,Venture_Name,Product_Name,xData){
	global
	this._Database.WriteData(xData,StatName,Venture_Name . "-" . Product_Name)
return
}
deleteProduct(productName,ventureName){
	global
this.setClientStat("Quantity",ventureName,productName,0)
this.setClientStat("Price",ventureName,productName,0)
this.setClientStat("UnitsSold",ventureName,productName,0)
this.setClientStat("Profits",ventureName,productName,0)
this.setClientStat("Sales",ventureName,productName,0)
D:=_ListRemoveByData(this._Database.ReadData("Product_Counter",ventureName,false),productName)
this._Database.WriteData(D,"Product_Counter",ventureName)
CURRENT_POS.TransactionDatabase.createTransaction("Product","Removed",ventureName,,productName)
}
}