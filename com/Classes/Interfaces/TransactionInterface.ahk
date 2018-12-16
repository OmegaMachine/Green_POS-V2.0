﻿Class TransactionInterface{
	__New(InterfaceName){
global
		this._Name := InterfaceName


	}

destroyInterface(){
Gui,9:Destroy
return
}

openInterface(){
	global
this.destroyInterface()
		Menu, tray, Icon , %FOLDER_THEME%Main_Icon.ico, 1, 1
		Gui,9: Color , %OTHER_GUI_COLOR%
Gui,9:    +LastFound +MaximizeBox +Owner2 
AuthH := WinExist()
Gui, 9:Font, S14 CDefault Bold Underline, Verdana
Gui, 9:Add, Text, x2 y0 w640 h30 +Center +BackgroundTrans, Transaction Explorer
Gui, 9:Font, , 
Gui, 9:Font, Bold, 
Gui, 9:Add, GroupBox, x12 y30 w620 h440 , Explorer
Gui, 9:Add, GroupBox, x22 y50 w600 h70 , Filter
Gui, 9:Font, , 
Gui, 9:Add, CheckBox, x42 y70 w70 h20 , Date
Gui, 9:Add, DateTime, x112 y70 w130 h20 , 
Gui, 9:Add, Text, x242 y70 w20 h20 , To
Gui, 9:Add, CheckBox, x42 y90 w70 h20 , Type
Gui, 9:Add, CheckBox, x412 y90 w60 h20 , Search
Gui, 9:Add, Edit, x482 y90 w130 h20 , Edit
Gui, 9:Add, CheckBox, x412 y70 w60 h20 , Investor
Gui, 9:Add, DropDownList, x482 y70 w130 h10 , DropDownList
Gui, 9:Add, DropDownList, x112 y90 w130 h21 , DropDownList
Gui, 9:Add, DateTime, x262 y70 w130 h20 , 
Gui, 9:Font, Bold, 
Gui, 9:Add, GroupBox, x22 y120 w600 h340 , Transactions
Gui, 9:Font, , 
Gui, 9:Add, ListView, x32 y140 w580 h310 vTRANSACTION_LISTVIEW,Date|Type|SubType|Venture|Account|Product|Quantity|Unit Cost|Total $$|New Venture Value|New BlackBook Value|Memo
Gui, 9:Show, w646 h488, % this._Name
	DllCall("SetParent", "uint", AuthH, "uint", MainH)
	this.loadTransactionsToListview()
return
}

loadTransactionsToListview(){
	global
	gui,9:Default
	Loop
	{
		
		xTransaction :=CURRENT_POS.TransactionDatabase.getTransaction(A_Index)
		if(!xTransaction){
			break
		}else{
		LV_Add("",xTransaction._Date,xTransaction._Type,xTransaction._SubType,xTransaction._Venture,xTransaction._Account,xTransaction._Product,xTransaction._Quantity,xTransaction._Unit,xTransaction._Total,xTransaction._NewVenture,xTransaction._NewBlackBook,xTransaction._Memo)	
	}
	}
	return
}


}