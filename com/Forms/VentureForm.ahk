CREATE_NEW_VENTURE:
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
CURRENT_POS.Ventures.createVenture(NEW_VENTURE_NAME)
return
SELECT_VENTURE:
Gui,10:Submit,NoHide

GuiControl,,_InvestorName,%Investor_List%
GuiControl,,_JoinDate,% CURRENT_POS.Investors.getInvestorStat("JoinDate",Investor_List)
return