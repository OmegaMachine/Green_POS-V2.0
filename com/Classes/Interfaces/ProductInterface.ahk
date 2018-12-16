﻿Class ProductInterface{
	__New(InterfaceName){
global
		this._Name := InterfaceName


	}

destroyInterface(){
Gui,7:Destroy
return
}

openInterface(){
	global
this.destroyInterface()
		Menu, tray, Icon , %FOLDER_THEME%Main_Icon.ico, 1, 1
		Gui,7: Color , %OTHER_GUI_COLOR%
		Gui,7:     +LastFound +MaximizeBox +Owner2 
		AuthH := WinExist()
Gui, 7:Font, S14 CDefault Bold Underline, Verdana
Gui, 7:Add, Text, x2 y0 w810 h30 +BackgroundTrans +Center, Product Explorer
Gui, 7:Font, , 
Gui, 7:Font, Bold, 
Gui, 7:Add, GroupBox, x12 y40 w790 h460 , GroupBox
Gui, 7:Font, , 
Gui, 7:Add, ListBox, x22 y80 w130 h210 , ListBox
Gui, 7:Font, Bold, 
Gui, 7:Add, Text, x22 y60 w120 h20 +Center, Venture
Gui, 7:Font, , 
Gui, 7:Add, ListBox, x162 y80 w130 h199 , ListBox
Gui, 7:Font, Bold, 
Gui, 7:Add, Text, x162 y60 w120 h20 +Center, Product
Gui, 7:Font, , 
Gui, 7:Add, Link, x22 y280 w120 h20 gMODULE_VENTURES +Center,<a id="A">create new venture...</a>
Gui, 7:Font, Bold, 
Gui, 7:Add, GroupBox, x162 y280 w130 h90 , New Product
Gui, 7:Font, , 
Gui, 7:Add, Text, x172 y300 w110 h20 +Center, Product Name
Gui, 7:Add, Edit, x172 y320 w110 h20 , 
Gui, 7:Add, Button, x172 y345 w110 h20 , Create
Gui, 7:Font, Bold, 
Gui, 7:Add, GroupBox, x302 y60 w490 h430 , Product Options
Gui, 7:Font, S12, 
Gui, 7:Add, Text, x312 y80 w470 h20 +Center, 
Gui, 7:Font, , 
Gui, 7:Font, Bold, 
Gui, 7:Add, GroupBox, x312 y218 w470 h70 , Purchase Product
Gui, 7:Font, ,
Gui, 7:Add, Text, x322 y238 w65 h20 , Total Price
Gui, 7:Add, Edit, x387 y238 w70 h20 , 
Gui, 7:Add, Text, x322 y258 w65 h20 , Quantity
Gui, 7:Add, Edit, x387 y258 w70 h20 , 
Gui, 7:Font, Bold, 
Gui, 7:Add, GroupBox, x312 y110 w470 h100 , Current Product Information
Gui, 7:Font, , 
Gui, 7:Add, Text, x322 y130 w60 h20 , Total Stock
Gui, 7:Add, Edit, x382 y130 w70 h20 , 
Gui, 7:Add, Text, x322 y150 w60 h20 , Total Value
Gui, 7:Add, Edit, x382 y150 w70 h20 , 
Gui, 7:Add, Text, x462 y130 w60 h20 , Price / Unit
Gui, 7:Add, Edit, x522 y130 w70 h20 , 
Gui, 7:Add, Text, x462 y150 w60 h20 , Units Sold
Gui, 7:Add, Edit, x522 y150 w70 h20 , 
Gui, 7:Add, Text, x602 y130 w60 h20 , Total Profit
Gui, 7:Add, Edit, x662 y130 w70 h20 , 
Gui, 7:Add, Text, x602 y150 w60 h20 , ~ Profit/Unit
Gui, 7:Add, Edit, x662 y150 w70 h20 , 
Gui, 7:Add, Text, x462 y170 w60 h20 , ~ Units/Sale
Gui, 7:Add, Edit, x522 y170 w70 h20 , 
Gui, 7:Add, Text, x602 y170 w60 h20 , ~ Profit/Sale
Gui, 7:Add, Edit, x662 y170 w70 h20 , 
Gui, 7:Add, Text, x462 y240 w80 h20 , New Price/Unit
Gui, 7:Add, Edit, x542 y240 w70 h20 , 
Gui, 7:Add, Button, x662 y260 w110 h20 , Purchase
Gui, 7:Font, Bold, 
Gui, 7:Add, GroupBox, x312 y290 w470 h70 , Void Product
Gui, 7:Font, , 
Gui, 7:Add, Text, x322 y310 w60 h20 , Quantity
Gui, 7:Add, Edit, x382 y310 w70 h20 , 
Gui, 7:Add, Text, x462 y310 w80 h20 , New Price/Unit
Gui, 7:Add, Edit, x542 y310 w70 h20 , 
Gui, 7:Add, Button, x662 y330 w110 h20 , Void
Gui, 7:Font, Bold, 
Gui, 7:Add, GroupBox, x312 y430 w470 h50 , Delete Product
Gui, 7:Font, , 
Gui, 7:Add, Text, x322 y450 w410 h20 , Voids all stock and deletes the product
Gui, 7:Add, Button, x662 y450 w110 h20 , Delete
Gui, 7:Show, w813 h513,% this._Name
	DllCall("SetParent", "uint", AuthH, "uint", MainH)
return
}




}