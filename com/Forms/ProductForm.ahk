CREATE_NEW_PRODUCT:
Gui,7:Submit,NoHide
clearField(NEW_PRODUCT_NAME)
if(AllowableText(NEW_PRODUCT_NAME) && AllowableText(PRODUCT_VENTUREBOX)){
	MsgBox, 36, Create Product,% "Are you sure you would like to create Product >" . NEW_PRODUCT_NAME . "< in Venture >" . PRODUCT_VENTUREBOX . "< ?"
	IfMsgBox,Yes
	{
CURRENT_POS.Ventures.createProduct(PRODUCT_VENTUREBOX,NEW_PRODUCT_NAME,"Quantity:0|Price:0|UnitsSold:0|Profits:0|Sales:0")
}
}else{
	MsgBox, 0, Create New Product, Failed. Invalid Name.
	CURRENT_POS.Logger.Log("Message","....Failed. Name invalid.",MESSAGE_SEP)
}
return
SELECT_PRODUCT:
Gui,7:Submit,NoHide
F_Stock:=CURRENT_POS.Ventures.getProductStat("Quantity",PRODUCT_VENTUREBOX,PRODUCT_PRODUCTBOX)
F_Value:=CURRENT_POS.Ventures.getProductStat("Price",PRODUCT_VENTUREBOX,PRODUCT_PRODUCTBOX)
F_Sold := CURRENT_POS.Ventures.getProductStat("UnitsSold",PRODUCT_VENTUREBOX,PRODUCT_PRODUCTBOX)
F_Profit:=CURRENT_POS.Ventures.getProductStat("Profits",PRODUCT_VENTUREBOX,PRODUCT_PRODUCTBOX)
F_Sales:=CURRENT_POS.Ventures.getProductStat("Sales",PRODUCT_VENTUREBOX,PRODUCT_PRODUCTBOX)
F_Units:=CURRENT_POS.Ventures.getProductStat("UnitsSold",PRODUCT_VENTUREBOX,PRODUCT_PRODUCTBOX)
SetFormat,Float,0.2
F_PPU:= F_Value / F_Stock
F_ProfitPerUnit:=F_Profit / F_Sold
F_UnitsPerSale:=F_Sold / F_Sales
F_ProfitPerSale:=F_Profit / F_Sales

GuiControl,,Product_Stock,% F_Stock
GuiControl,,Product_Value,% F_Value
GuiControl,,Product_PPU,% F_PPU
GuiControl,,Product_UnitsSold,% F_Sold
GuiControl,,Product_Profit,% F_Profit
GuiControl,,Product_ProfitPerUnit,% F_ProfitPerUnit
GuiControl,,Product_UnitsPerSale,% F_UnitsPerSale
GuiControl,,Product_ProfitPerSale,% F_ProfitPerSale
GuiControl,,Product_Name,% PRODUCT_PRODUCTBOX

return
PRODUCTSELECT_VENTURE:
Gui,7:Submit,NoHide
;GuiControl,,Venture_VentureName,%CLIENT_VENTUREBOX%
GuiControl,,PRODUCT_PRODUCTBOX,% "|" . CURRENT_POS.Ventures.getAllProducts(PRODUCT_VENTUREBOX)

;GuiControl,,_JoinDate,% CURRENT_POS.Investors.getInvestorStat("JoinDate",Investor_List)
return



TYPE_PURCHASE_PRODUCT:
Gui,7:Submit,NoHide
F_Stock:=CURRENT_POS.Ventures.getProductStat("Quantity",PRODUCT_VENTUREBOX,PRODUCT_PRODUCTBOX)
F_Value:=CURRENT_POS.Ventures.getProductStat("Price",PRODUCT_VENTUREBOX,PRODUCT_PRODUCTBOX)
SetFormat,Float,0.2
F_PPU:= F_Value / F_Stock

F_NewQ:=F_Stock + ProductPurchase_Quantity
F_NewPPU := (F_Value + ProductPurchase_Price) / (F_Stock + ProductPurchase_Quantity)

GuiControl,,ProductPurchase_PPU,% F_PPU
GuiControl,,ProductPurchase_NewPPU,% F_NewPPU
GuiControl,,ProductPurchase_NewQuantity,% F_NewQ
return
PURCHASE_PRODUCT:
Gui,7:Submit,NoHide
GuiControl,,ProductPurchase_Quantity,
GuiControl,,ProductPurchase_Price,
GuiControl,,ProductPurchase_PPU,
GuiControl,,ProductPurchase_NewPPU,
GuiControl,,ProductPurchase_NewQuantity,
F_Quantity:=ProductPurchase_Quantity
F_Price:=ProductPurchase_Price
SetFormat,Float,0.2
F_PPU:=F_Price / F_Quantity
if (AllowableNum(ProductPurchase_Quantity) && AllowableNum(ProductPurchase_Price)){
	if(ProductPurchase_Quantity > 0 && ProductPurchase_Price <= CURRENT_POS.getMainStat("Value")){
MsgBox, 36, Add Debt,% "Are you sure you would like to Purchase  >" . ProductPurchase_Quantity . "< >" . PRODUCT_PRODUCTBOX . "< ( " . PRODUCT_VENTUREBOX . " ) for >$" . ProductPurchase_Price . "< ?"
	IfMsgBox,Yes
	{
		;Set Product Stats
D:=CURRENT_POS.Ventures.getProductStat("Quantity",PRODUCT_VENTUREBOX,PRODUCT_PRODUCTBOX)
D+=F_Quantity
CURRENT_POS.Ventures.setProductStat("Quantity",PRODUCT_VENTUREBOX,PRODUCT_PRODUCTBOX,D)

D:=CURRENT_POS.Ventures.getProductStat("Price",PRODUCT_VENTUREBOX,PRODUCT_PRODUCTBOX)
D+=F_Price
CURRENT_POS.Ventures.setProductStat("Price",PRODUCT_VENTUREBOX,PRODUCT_PRODUCTBOX,D)

D:=CURRENT_POS.Ventures.getProductStat("Profits",PRODUCT_VENTUREBOX,PRODUCT_PRODUCTBOX)
D-=F_Price
CURRENT_POS.Ventures.setProductStat("Profits",PRODUCT_VENTUREBOX,PRODUCT_PRODUCTBOX,D)

;Set Venture Stats

D:=CURRENT_POS.Ventures.getEntryStat("Profits",PRODUCT_VENTUREBOX)
D-=F_Price
CURRENT_POS.Ventures.setEntryStat("Profits",PRODUCT_VENTUREBOX,D)

D:=CURRENT_POS.Ventures.getEntryStat("ProductValue",PRODUCT_VENTUREBOX)
D+=F_Price
CURRENT_POS.Ventures.setEntryStat("ProductValue",PRODUCT_VENTUREBOX,D)

;Set Main Stats

CURRENT_POS.subMainStat("Value",F_Price)
CURRENT_POS.addMainStat("ProductValue",F_Price)
CURRENT_POS.TransactionDatabase.createTransaction("Product","Purchased",PRODUCT_VENTUREBOX,,PRODUCT_PRODUCTBOX,F_Quantity,F_PPU,F_Price)
gosub,SELECT_PRODUCT
MsgBox, 64, Transaction Complete,% "Transaction Completed. >" . F_Quantity . "< >" . PRODUCT_PRODUCTBOX . "< ( " . PRODUCT_VENTUREBOX . " ) purchased for >$" . F_Price . "<."
}
}else{
MsgBox, 16, Invalid Amount, Please enter a valid Amount. Not enough free cash.
}
}else{
MsgBox, 16, Invalid Amount, Please enter a valid Amount.
return
}
return
TYPE_VOID_PRODUCT:
Gui,7:Submit,NoHide

SetFormat,Float,0.2

F_NewPPU :=(CURRENT_POS.Ventures.getProductStat("Price",PRODUCT_VENTUREBOX,PRODUCT_PRODUCTBOX)) / (CURRENT_POS.Ventures.getProductStat("Quantity",PRODUCT_VENTUREBOX,PRODUCT_PRODUCTBOX) - ProductVoid_Quantity)

GuiControl,,ProductVoid_NewPPU,% F_NewPPU

return
VOID_PRODUCT:
Gui,7:Submit,NoHide
GuiControl,,ProductVoid_NewPPU,
GuiControl,,ProductVoid_Quantity,

F_Quantity:=ProductVoid_Quantity
F_NewPPU:= (CURRENT_POS.Ventures.getProductStat("Price",PRODUCT_VENTUREBOX,PRODUCT_PRODUCTBOX)) / (CURRENT_POS.Ventures.getProductStat("Quantity",PRODUCT_VENTUREBOX,PRODUCT_PRODUCTBOX) - ProductVoid_Quantity)
if (AllowableNum(F_Quantity)){
	if(F_Quantity <= CURRENT_POS.Ventures.getProductStat("Quantity",PRODUCT_VENTUREBOX,PRODUCT_PRODUCTBOX)){
MsgBox, 36, Add Debt,% "Are you sure you would like to void  >" . F_Quantity . "< units of >" . PRODUCT_PRODUCTBOX . "< ( " . PRODUCT_VENTUREBOX . " ) ?"
	IfMsgBox,Yes
	{
		
		;Product Stats
		H:=F_Quantity * (CURRENT_POS.Ventures.getProductStat("Price",PRODUCT_VENTUREBOX,PRODUCT_PRODUCTBOX)) / (CURRENT_POS.Ventures.getProductStat("Quantity",PRODUCT_VENTUREBOX,PRODUCT_PRODUCTBOX))
		
D:=CURRENT_POS.Ventures.getProductStat("Quantity",PRODUCT_VENTUREBOX,PRODUCT_PRODUCTBOX)
D-=F_Quantity
CURRENT_POS.Ventures.setProductStat("Quantity",PRODUCT_VENTUREBOX,PRODUCT_PRODUCTBOX,D)

D:=CURRENT_POS.Ventures.getProductStat("Price",PRODUCT_VENTUREBOX,PRODUCT_PRODUCTBOX)
D-=H
CURRENT_POS.Ventures.setProductStat("Price",PRODUCT_VENTUREBOX,PRODUCT_PRODUCTBOX,D)

;Venture Stats

CURRENT_POS.Ventures.getEntryStat("ProductValue",PRODUCT_VENTUREBOX)

D-=H

CURRENT_POS.Ventures.setEntryStat("ProductValue",PRODUCT_VENTUREBOX,D)


;Main Stats

CURRENT_POS.subMainStat("ProductValue",H)
CURRENT_POS.TransactionDatabase.createTransaction("Product","Voided",PRODUCT_VENTUREBOX,,PRODUCT_PRODUCTBOX,F_Quantity)
gosub,SELECT_PRODUCT
MsgBox, 64, Transaction Complete,% "Transaction Completed.  >" . F_Quantity . "< units voided from >" . PRODUCT_PRODUCTBOX . "< ( " . PRODUCT_VENTUREBOX . " ) ?"
}
}else{
MsgBox, 16, Invalid Amount, Please enter a valid Amount. not enough units.
}
}else{
MsgBox, 16, Invalid Amount, Please enter a valid Amount.
return
}
return
DELETE_PRODUCT:
Gui,7:Submit,NoHide

if(CURRENT_POS.Ventures.getProductStat("Quantity",PRODUCT_VENTUREBOX,PRODUCT_PRODUCTBOX) = 0 ){
	MsgBox, 4, Remove Client,% "Are you sure you would like to remove product >" . PRODUCT_PRODUCTBOX . "< ( " . PRODUCT_VENTUREBOX . " ) ?"
	IfMsgBox,Yes
	{
		
	CURRENT_POS.Ventures.deleteProduct(PRODUCT_PRODUCTBOX,PRODUCT_VENTUREBOX)
	MsgBox, 64, Transaction Complete,% "Transaction Completed. Product Removed >" . PRODUCT_PRODUCTBOX . "< ( " . PRODUCT_VENTUREBOX . " )."
}
}else{
MsgBox, 16, Remove Stock, Remove Inventory Units before deleting Product.
}
gosub,PRODUCTSELECT_VENTURE
return