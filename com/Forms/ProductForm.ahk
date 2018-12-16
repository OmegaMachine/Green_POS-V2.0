CREATE_NEW_PRODUCT:
Gui,7:Submit,NoHide
clearField(NEW_PRODUCT_NAME)
if(AllowableText(NEW_PRODUCT_NAME) && AllowableText(PRODUCT_VENTUREBOX)){
	MsgBox, 36, Create Product,% "Are you sure you would like to create Product >" . NEW_PRODUCT_NAME . "< in Venture >" . PRODUCT_VENTUREBOX . "< ?"
	IfMsgBox,Yes
	{
CURRENT_POS.Ventures.createProduct(PRODUCT_VENTUREBOX,NEW_PRODUCT_NAME,"Quantity:0|Price:0|UnitsSold:0|Profits:0")
}
}else{
	MsgBox, 0, Create New Product, Failed. Invalid Name.
	CURRENT_POS.Logger.Log("Message","....Failed. Name invalid.",MESSAGE_SEP)
}
return
SELECT_PRODUCT:
Gui,7:Submit,NoHide
GuiControl,,Venture_VentureName,%Venture_VentureBox%
GuiControl,,Venture_VentureProfits,% CURRENT_POS.Ventures.getEntryStat("Profits",Venture_VentureBox)
GuiControl,,Venture_VentureCreation,% CURRENT_POS.Ventures.getEntryStat("CreateDate",Venture_VentureBox)
GuiControl,,Venture_ClientBox,% CURRENT_POS.Ventures.getAllClients(Venture_VentureBox)
GuiControl,,Venture_ProductBox,% CURRENT_POS.Ventures.getAllProducts(Venture_VentureBox)
;GuiControl,,_JoinDate,% CURRENT_POS.Investors.getInvestorStat("JoinDate",Investor_List)
return
PRODUCTSELECT_VENTURE:
Gui,7:Submit,NoHide
;GuiControl,,Venture_VentureName,%CLIENT_VENTUREBOX%
GuiControl,,PRODUCT_PRODUCTBOX,% "|" . CURRENT_POS.Ventures.getAllProducts(PRODUCT_VENTUREBOX)

;GuiControl,,_JoinDate,% CURRENT_POS.Investors.getInvestorStat("JoinDate",Investor_List)
return