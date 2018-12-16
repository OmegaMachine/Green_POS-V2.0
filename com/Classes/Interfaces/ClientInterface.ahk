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
		Gui,5: Color , %OTHER_GUI_COLOR%
Gui,5:    +LastFound +MaximizeBox +Owner2 
AuthH := WinExist()

Gui, 5: Font, S14 CDefault Bold Underline, Verdana
Gui, 5: Add, Text, x2 y0 w660 h30 +BackgroundTrans +Center, % this._Name

Gui, 5: Font, , 
Gui, 5: Font, Bold, 
Gui, 5: Add, GroupBox, x12 y30 w640 h380 , Select Client from Venture
Gui, 5: Font, , 
Gui, 5: Add, ListBox, x22 y70 w130 h230 , % CURRENT_POS.Ventures.getAllVentures()
Gui, 5: Add, ListBox, x162 y70 w130 h230 , 

Gui, 5: Add, Link, x22 y300 w130 h20 gMODULE_VENTURES +Center ,<a id="A">create new venture...</a>

Gui, 5: Font, Bold, 
Gui, 5: Add, GroupBox, x162 y300 w130 h100 , New Client
Gui, 5: Font, , 
Gui, 5: Add, Text, x172 y320 w110 h20 +Center +BackgroundTrans, Client Name
Gui, 5: Add, Edit, x172 y340 w110 h20 +Center, 
Gui, 5: Add, Button, x188 y365 w80 h20 , Create

Gui, 5: Font, Bold, 
Gui, 5: Add, Text, x22 y50 w130 h20 +Center +BackgroundTrans, Ventures
Gui, 5: Add, Text, x162 y50 w130 h20 +Center +BackgroundTrans, Clients

Gui, 5: Add, GroupBox, x302 y50 w340 h350 , Client Options

Gui, 5: Font, S12 Bold underline, 
Gui, 5: Add, Text, x312 y70 w320 h20 +Center,

Gui, 5: Font, , 
Gui, 5: Add, Text, x322 y110 w100 h20 +BackgroundTrans, Current Venture Debt
Gui, 5: Add, Edit, x432 y110 w120 h20 +Center, 


Gui, 5: Font, Bold, 
Gui, 5: Add, GroupBox, x312 y140 w320 h50 , Manually Add Debt
Gui, 5: Font, , 
Gui, 5: Add, Text, x322 y160 w100 h20 , Debt to Add
Gui, 5: Add, Edit, x402 y160 w110 h20 , 
Gui, 5: Add, Button, x522 y160 w100 h20 , Add


Gui, 5: Font, Bold, 
Gui, 5: Add, GroupBox, x312 y200 w320 h50 , Void Debt (no impact on books)
Gui, 5: Font, , 
Gui, 5: Add, Text, x322 y220 w100 h20 , Debt to Void
Gui, 5: Add, Edit, x402 y220 w110 h20 , 
Gui, 5: Add, Button, x522 y220 w100 h20 , Void

Gui, 5: Font, Bold, 
Gui, 5: Add, GroupBox, x312 y260 w320 h50 , Pay Debt (impacts books)
Gui, 5: Font, , 
Gui, 5: Add, Text, x322 y280 w100 h20 , Debt to Pay
Gui, 5: Add, Edit, x402 y280 w110 h20 , 
Gui, 5: Add, Button, x522 y280 w100 h20 , Pay


Gui, 5: Font, Bold, 
Gui, 5: Add, GroupBox, x312 y320 w320 h50 , Delete Client (Must have $0 Debt)
Gui, 5: Font, , 
Gui, 5: Add, Text, x442 y340 w60 h20 , Delete Client
Gui, 5: Add, Button, x522 y340 w100 h20 , Delete


Gui, 5: Show, w662 h418,  % this._Name

	DllCall("SetParent", "uint", AuthH, "uint", MainH)
return
}




}