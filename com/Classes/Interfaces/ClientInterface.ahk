Class ClientInterface{
	__New(InterfaceName){
global
		this._Name := InterfaceName


	}

destroyInterface(){
Gui,5:Destroy
return
}

openInterface(){
	global
this.destroyInterface()
		Menu, tray, Icon , %FOLDER_THEME%Main_Icon.ico, 1, 1
		Gui,5: Color , %AUTH_GUI_COLOR%
		Gui,5: +MaximizeBox ;+ToolWindow
		
		
		Gui,5: +LastFound
		AuthH := WinExist()
		Gui,2: +Lastfound
		MainH := WinExist()
		Gui,5: +Lastfound
		Gui,5: +Owner2

Gui,5: Add, ListBox, x2 y40 w140 h250 , ListBox
Gui,5: Add, ListBox, x152 y40 w140 h250 , ListBox
Gui,5: Add, Text, x152 y2 w140 h20 +Center +BackgroundTrans, Clients for Venture
Gui,5: Add, Text, x2 y2 w140 h20 +Center +BackgroundTrans, Venture
Gui,5: Add, Link, x2 y280 w140 h20 gMODULE_VENTURES +Center ,<a id="A">Venture Explorer</a>
Gui,5: Add, Text, x302 y2 w270 h20 +Center +BackgroundTrans, Client
Gui,5: Add, Text, x302 y70 w130 h20 +Center +BackgroundTrans, Client Venture Debt
Gui,5: Add, Edit, x442 y70 w130 h20 +ReadOnly +Center, Edit
Gui,5: Add, Text, x302 y90 w130 h20 +Center +BackgroundTrans, Add Venture Debt
Gui,5: Add, Edit, x442 y90 w60 h20 +Center, Edit
Gui,5: Add, Button, x502 y90 w70 h20 , Add
Gui,5: Add, Text, x302 y110 w130 h20 +Center +BackgroundTrans, Void Venture Debt
Gui,5: Add, Edit, x442 y110 w60 h20 +Center, Edit
Gui,5: Add, Button, x502 y110 w70 h20 , Void
Gui,5: Add, Text, x302 y130 w130 h20 +Center +BackgroundTrans, Pay Venture Debt
Gui,5: Add, Edit, x442 y130 w60 h20 +Center, Edit
Gui,5: Add, Button, x502 y130 w70 h20 , Pay
Gui,5: Add, Text, x302 y50 w130 h20 +Center +BackgroundTrans, Client Name
Gui,5: Add, Edit, x442 y50 w130 h20 +ReadOnly +Center, Edit
Gui,5: Add, Text, x432 y240 w60 h20 +BackgroundTrans, Delete Client
Gui,5: Add, Button, x502 y240 w70 h20 , Delete
Gui,5: Add, Text, x432 y260 w140 h20 +Center +BackgroundTrans, (Must Have $0 Debt)
Gui,5: Add, Text, x2 y20 w290 h20 +Center +BackgroundTrans, Double Click to Load Venture && Clients

Gui,5: Add, Text, x152 y280 w60 h20 , New Client
Gui,5: Add, Edit, x212 y280 w70 h20 ,
Gui,5: Add, Button, x212 y300 w70 h20 , Create

Gui,5: Show, w581 h320, % this._Name

	DllCall("SetParent", "uint", AuthH, "uint", MainH)
return
}




}