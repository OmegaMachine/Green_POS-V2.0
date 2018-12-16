CREATE_NEW_INVESTOR:
Gui,4:Submit,NoHide
clearField(INVESTOR_NEW_NAME)
clearField(INVESTOR_NEW_EMAIL)
clearField(INVESTOR_NEW_PW)
clearField(INVESTOR_NEW_PWREPEAT)
CURRENT_POS.Investors.attemptCreate(INVESTOR_NEW_NAME,INVESTOR_NEW_PW,INVESTOR_NEW_PWREPEAT)
return
SELECT_INVESTOR:
Gui,4:Submit,NoHide
GuiControl,,_InvestorName,%Investor_List%
GuiControl,,_IInvestment,% CURRENT_POS.Investors.getInvestorStat("Investments",Investor_List)
xxSharePercentage := Floor((CURRENT_POS.Investors.getInvestorStat("Shares",Investor_List) / CURRENT_POS.getSharesSold()) * 100)
GuiControl,,_IShares,% CURRENT_POS.Investors.getInvestorStat("Shares",Investor_List) . "  ( " . xxSharePercentage . "`% )"
SetFormat,Float,0.5
xxValue:=CURRENT_POS.Investors.getInvestorStat("Shares",Investor_List) * CURRENT_POS.getShareValue()
xxProfit:=(CURRENT_POS.Investors.getInvestorStat("Shares",Investor_List) * CURRENT_POS.getShareValue()) - CURRENT_POS.Investors.getInvestorStat("Investments",Investor_List)
SetFormat,Float,0.2
xxValue+=0
xxProfit+=0
GuiControl,,_IValue,% xxValue
GuiControl,,_IProfit,% xxProfit
GuiControl,,_IJoinDate,% CURRENT_POS.Investors.getInvestorStat("JoinDate",Investor_List)

return
PURCHASE_SHARES:
Gui,4:Submit,NoHide
GuiControl,,_PurchaseTotalPrice,
GuiControl,,_PurchaseQuantity,
PTP:=_PurchaseTotalPrice
PQ:=_PurchaseQuantity

if (AllowableNum(_PurchaseQuantity)){
MsgBox, 36, Purchase Shares,% "Are you sure you would like to Purchase >" . _PurchaseQuantity . "< shares for  >$" . _PurchaseTotalPrice . "< for >" . Investor_List . "< ?"
	IfMsgBox,Yes
	{
CURRENT_POS.Investors.purchaseShares(Investor_List,PQ,PTP)
gosub,SELECT_INVESTOR
MsgBox, 64, Transaction Complete,% "Transaction Completed. Place >$" . PTP . "< from >" . Investor_List . "< into the Main Vault."
}

}else{
MsgBox, 16, Invalid Share Quantity, Please enter a valid share quantity
return
}
return
TYPE_PURCHASE_QUANTITY:
Gui,4:Submit,NoHide

GuiControl,,_PurchaseTotalPrice,% _PurchaseQuantity * CURRENT_POS.getMinShareValue()
return
SELL_SHARES:
Gui,4:Submit,NoHide
GuiControl,,_SellTotalPrice,
GuiControl,,_SellQuantity,
STP:=_SellQuantity * CURRENT_POS.getMinShareValue()
SQ:=_SellQuantity

if (AllowableNum(STP)){
	if(_SellQuantity <= CURRENT_POS.Investors.getInvestorStat("Shares",Investor_List)){
MsgBox, 36, Sell Shares,% "Are you sure you would like to Sell >" . SQ . "< shares for  >$" . STP . "< for >" . Investor_List . "< ?"
	IfMsgBox,Yes
	{
CURRENT_POS.Investors.sellShares(Investor_List,SQ,STP)
gosub,SELECT_INVESTOR
MsgBox, 64, Transaction Complete,% "Transaction Completed. Remove >$" . STP . "< from the Main Vault and give it to >" . Investor_List . "< ."
}
}else{
MsgBox, 16, Invalid Share Quantity, Please enter a valid share quantity. You do not have this many shares.
}
}else{
MsgBox, 16, Invalid Share Quantity, Please enter a valid share quantity
return
}
return
TYPE_SELL_QUANTITY:
Gui,4:Submit,NoHide

GuiControl,,_SellTotalPrice,% _SellQuantity * CURRENT_POS.getMinShareValue()
return