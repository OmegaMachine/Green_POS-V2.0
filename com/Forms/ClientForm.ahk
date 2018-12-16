﻿CREATE_NEW_CLIENT:
Gui,5:Submit,NoHide
clearField(NEW_CLIENT_NAME)
if(AllowableText(NEW_CLIENT_NAME) && AllowableText(CLIENT_VENTUREBOX)){
	MsgBox, 36, Create Client,% "Are you sure you would like to create client >" . NEW_CLIENT_NAME . "< in Venture >" . CLIENT_VENTUREBOX . "< ?"
	IfMsgBox,Yes
	{
CURRENT_POS.Ventures.createClient(CLIENT_VENTUREBOX,NEW_CLIENT_NAME,"Debt:0")
}
}else{
	MsgBox, 0, Create New Client, Failed. Invalid Name.
	CURRENT_POS.Logger.Log("Message","....Failed. Name invalid.",MESSAGE_SEP)
}
return
SELECT_CLIENT:
Gui,5:Submit,NoHide
GuiControl,,Venture_VentureName,%Venture_VentureBox%
GuiControl,,Venture_VentureProfits,% CURRENT_POS.Ventures.getEntryStat("Profits",Venture_VentureBox)
GuiControl,,Venture_VentureCreation,% CURRENT_POS.Ventures.getEntryStat("CreateDate",Venture_VentureBox)
GuiControl,,Venture_ClientBox,% CURRENT_POS.Ventures.getAllClients(Venture_VentureBox)
GuiControl,,Venture_ProductBox,% CURRENT_POS.Ventures.getAllProducts(Venture_VentureBox)
;GuiControl,,_JoinDate,% CURRENT_POS.Investors.getInvestorStat("JoinDate",Investor_List)
return
CLIENTSELECT_VENTURE:
Gui,5:Submit,NoHide
;GuiControl,,Venture_VentureName,%CLIENT_VENTUREBOX%
GuiControl,,CLIENT_CLIENTBOX,% "|" . CURRENT_POS.Ventures.getAllClients(CLIENT_VENTUREBOX)

;GuiControl,,_JoinDate,% CURRENT_POS.Investors.getInvestorStat("JoinDate",Investor_List)
return