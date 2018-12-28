SALESSELECT_VENTURE:
Gui,8:Submit,NoHide
GuiControl,,SALES_PRODUCTBOX,% "|" . CURRENT_POS.Ventures.getAllProducts(SALES_VENTUREBOX)
GuiControl,,SALES_CLIENTBOX,% "|" . CURRENT_POS.Ventures.getAllClients(SALES_VENTUREBOX)
return
SALESSELECT_PRODUCT:
Gui,8:Submit,NoHide
gosub,LOAD_SALE
return
SALESSELECT_CLIENT:
Gui,8:Submit,NoHide
gosub,LOAD_SALE
return
LOAD_SALE:
if(SALES_CLIENTBOX && SALES_PRODUCTBOX){
	GuiControl,,Sales_VentureName,% SALES_VENTUREBOX
	GuiControl,,Sales_ProductName,% SALES_PRODUCTBOX
	GuiControl,,Sales_ClientName,% SALES_CLIENTBOX
	;GuiControl,,Sales_Quantity,0
	;GuiControl,,Sales_Price,0
	GuiControl,,Sales_ProductQuantity,% CURRENT_POS.Ventures.getProductStat("Quantity",SALES_VENTUREBOX,SALES_PRODUCTBOX)
	GuiControl,,Sales_ClientDebt,% CURRENT_POS.Ventures.getClientStat("Debt",SALES_VENTUREBOX,SALES_CLIENTBOX)

	;GuiControl,,Sales_ThisPPU,% Sales_Price / Sales_Quantity

}else{
	GuiControl,,Sales_VentureName,
	GuiControl,,Sales_ProductName,
	GuiControl,,Sales_ClientName,
	;GuiControl,,Sales_Quantity,
	;GuiControl,,Sales_Price,
	GuiControl,,Sales_ProductQuantity,
	GuiControl,,Sales_ClientDebt,	
}
return

Load_Sale_Details:
Gui,8:Submit,NoHide
if((Sales_Quantity > 0) && (Sales_Price > 0)){
F_Stock:=CURRENT_POS.Ventures.getProductStat("Quantity",SALES_VENTUREBOX,SALES_PRODUCTBOX)
F_Value:=CURRENT_POS.Ventures.getProductStat("Price",SALES_VENTUREBOX,SALES_PRODUCTBOX)
SetFormat,Float,0.2
F_PPU:= F_Value / F_Stock
;msgbox,% Sales_Price . "-   " . Sales_Quantity
F_ThisPPU:=Sales_Price / Sales_Quantity
TT:=(F_ThisPPU - F_PPU) * Sales_Quantity
YY:=F_ThisPPU - F_PPU


	GuiControl,,Sales_Profit,% TT
	GuiControl,,Sales_ThisPPU,% YY
	if(CashDebt2 = 1){
		GuiControl,,Sales_NewClientDebt,% (CURRENT_POS.Ventures.getClientStat("Debt",SALES_VENTUREBOX,SALES_CLIENTBOX) + Sales_Price)
	}else{
		GuiControl,,Sales_NewClientDebt,% (CURRENT_POS.Ventures.getClientStat("Debt",SALES_VENTUREBOX,SALES_CLIENTBOX))
}
	;CURRENT_POS.Ventures.getProductStat("Quantity",SALES_VENTUREBOX,SALES_PRODUCTBOX)
}else{

}
return

Process_Sale:
Gui,8:Submit,NoHide

F_Quantity:=Sales_Quantity
F_Price:=Sales_Price
F_isCash:=CashDebt1
		H:=F_Quantity * (CURRENT_POS.Ventures.getProductStat("Price",SALES_VENTUREBOX,SALES_PRODUCTBOX)) / (CURRENT_POS.Ventures.getProductStat("Quantity",SALES_VENTUREBOX,SALES_PRODUCTBOX))
MsgBox, 36, Add Debt,% "Are you sure you would like to sell >" . F_Quantity . "< >" . SALES_PRODUCTBOX . "< ( " . SALES_VENTUREBOX . " ) for >$" . F_Price . "< too >" . SALES_CLIENTBOX . "< ?"
CURRENT_POS.TransactionDatabas
	IfMsgBox,Yes
	{

;Set product stats
D:=CURRENT_POS.Ventures.getProductStat("Quantity",SALES_VENTUREBOX,SALES_PRODUCTBOX)
D-=F_Quantity
CURRENT_POS.Ventures.setProductStat("Quantity",SALES_VENTUREBOX,SALES_PRODUCTBOX,D)

D:=CURRENT_POS.Ventures.getProductStat("Price",SALES_VENTUREBOX,SALES_PRODUCTBOX)
D-=H
CURRENT_POS.Ventures.setProductStat("Price",SALES_VENTUREBOX,SALES_PRODUCTBOX,D)



;Venture Stats

CURRENT_POS.Ventures.getEntryStat("ProductValue",SALES_VENTUREBOX)

D-=H

CURRENT_POS.Ventures.setEntryStat("ProductValue",SALES_VENTUREBOX,D)



;Main Stats

CURRENT_POS.subMainStat("ProductValue",H)
D:=CURRENT_POS.Ventures.getProductStat("Profits",SALES_VENTUREBOX,SALES_PRODUCTBOX)
D+=F_Price
CURRENT_POS.Ventures.setProductStat("Profits",SALES_VENTUREBOX,SALES_PRODUCTBOX,D)
D:=CURRENT_POS.Ventures.getProductStat("UnitsSold",SALES_VENTUREBOX,SALES_PRODUCTBOX)
D+=F_Quantity
CURRENT_POS.Ventures.setProductStat("UnitsSold",SALES_VENTUREBOX,SALES_PRODUCTBOX,D)

D:=CURRENT_POS.Ventures.getProductStat("Sales",SALES_VENTUREBOX,SALES_PRODUCTBOX)
D+=F_Quantity
CURRENT_POS.Ventures.setProductStat("Sales",SALES_VENTUREBOX,SALES_PRODUCTBOX,D)

if(F_isCash){
	D:=CURRENT_POS.Ventures.getEntryStat("Profits",SALES_VENTUREBOX)
D+=F_Price
CURRENT_POS.Ventures.setEntryStat("Profits",SALES_VENTUREBOX,D)


CURRENT_POS.addMainStat("Value",F_Price)
}else{
	;setClientStat(StatName,Venture_Name,Client_Name,xData)
D:=CURRENT_POS.Ventures.getClientStat("Debt",SALES_VENTUREBOX,SALES_CLIENTBOX)
D+=F_Price
CURRENT_POS.Ventures.setClientStat("Debt",SALES_VENTUREBOX,SALES_CLIENTBOX,D)
}

gosub,SALESSELECT_CLIENT
GuiControl,,Sales_Quantity,
GuiControl,,Sales_Price,


if(F_isCash){
	MsgBox, 64, Transaction Complete,% "Transaction Completed. >" . F_Quantity . "< >" . SALES_PRODUCTBOX . "< ( " . SALES_VENTUREBOX . " ) sold for >$" . F_Price . "< too >" . SALES_CLIENTBOX . "<."
	CURRENT_POS.TransactionDatabase.createTransaction("Sale","Cash",SALES_VENTUREBOX,SALES_CLIENTBOX,SALES_PRODUCTBOX,F_Quantity,,F_Price)
}else{
	MsgBox, 64, Transaction Complete,% "Transaction Completed. >" . F_Quantity . "< >" . SALES_PRODUCTBOX . "< ( " . SALES_VENTUREBOX . " ) fronted for >$" . F_Price . "< too >" . SALES_CLIENTBOX . "<."
CURRENT_POS.TransactionDatabase.createTransaction("Sale","Debt",SALES_VENTUREBOX,SALES_CLIENTBOX,SALES_PRODUCTBOX,F_Quantity,,F_Price)

}
}else{
	
GuiControl,,Sales_Quantity,
GuiControl,,Sales_Price,
}
return