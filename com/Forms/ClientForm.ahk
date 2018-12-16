CREATE_NEW_CLIENT:
Gui,10:Submit,NoHide
clearField(NEW_VENTURE_NAME)
	if NEW_VENTURE_NAME is Not alnum
	{
		MsgBox, 0, Create New Venture, Failed. Invalid Name.
	CURRENT_POS.Logger.Log("Message","....Failed. Name invalid.",MESSAGE_SEP)
return	
}
	if NEW_VENTURE_NAME is space
	{
		MsgBox, 0, Create New Venture, Failed. Invalid Name.
	CURRENT_POS.Logger.Log("Message","....Failed. Name invalid.",MESSAGE_SEP)
return	
}
;CURRENT_POS.Ventures.createVenture(NEW_VENTURE_NAME)
CURRENT_POS.Ventures.createDatabaseEntry(NEW_VENTURE_NAME,"Profits:0")
return
SELECT_CLIENT:
Gui,10:Submit,NoHide
GuiControl,,Venture_VentureName,%Venture_VentureBox%
GuiControl,,Venture_VentureProfits,% CURRENT_POS.Ventures.getEntryStat("Profits",Venture_VentureBox)
GuiControl,,Venture_VentureCreation,% CURRENT_POS.Ventures.getEntryStat("CreateDate",Venture_VentureBox)
GuiControl,,Venture_ClientBox,% CURRENT_POS.Ventures.getAllClients(Venture_VentureBox)
GuiControl,,Venture_ProductBox,% CURRENT_POS.Ventures.getAllProducts(Venture_VentureBox)
;GuiControl,,_JoinDate,% CURRENT_POS.Investors.getInvestorStat("JoinDate",Investor_List)
return