CREATE_NEW_CLIENT:
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
GuiControl,,Client_ClientName,%CLIENT_CLIENTBOX%
GuiControl,,Client_ClientDebt,% CURRENT_POS.Ventures.getClientStat("Debt",CLIENT_VENTUREBOX,CLIENT_CLIENTBOX)
GuiControl,,Client_CreateDate,% CURRENT_POS.Ventures.getClientStat("CreateDate",CLIENT_VENTUREBOX,CLIENT_CLIENTBOX)
;GuiControl,,Venture_VentureCreation,% CURRENT_POS.Ventures.getEntryStat("CreateDate",Venture_VentureBox)
;GuiControl,,Venture_ClientBox,% CURRENT_POS.Ventures.getAllClients(Venture_VentureBox)
;GuiControl,,Venture_ProductBox,% CURRENT_POS.Ventures.getAllProducts(Venture_VentureBox)
;GuiControl,,_JoinDate,% CURRENT_POS.Investors.getInvestorStat("JoinDate",Investor_List)
return
CLIENTSELECT_VENTURE:
Gui,5:Submit,NoHide
;GuiControl,,Venture_VentureName,%CLIENT_VENTUREBOX%
GuiControl,,CLIENT_CLIENTBOX,% "|" . CURRENT_POS.Ventures.getAllClients(CLIENT_VENTUREBOX)

;GuiControl,,_JoinDate,% CURRENT_POS.Investors.getInvestorStat("JoinDate",Investor_List)
return

ADD_DEBT:
Gui,5:Submit,NoHide
GuiControl,,Debt_To_Add,
if (AllowableNum(Debt_To_Add)){
	if(Debt_To_Add > 0){
MsgBox, 36, Add Debt,% "Are you sure you would like to Add  >$" . Debt_To_Add . "< Debt for >" . CLIENT_CLIENTBOX . "< ?"
	IfMsgBox,Yes
	{
D:=CURRENT_POS.Ventures.getClientStat("Debt",CLIENT_VENTUREBOX,CLIENT_CLIENTBOX)
D+=Debt_To_Add
CURRENT_POS.Ventures.setClientStat("Debt",CLIENT_VENTUREBOX,CLIENT_CLIENTBOX,D)
;CURRENT_POS.TransactionDatabase.createTransaction("Client","Debt Add",CLIENT_VENTUREBOX,CLIENT_CLIENTBOX)
D:=CURRENT_POS.Ventures.getEntryStat("Profits",CLIENT_VENTUREBOX)
D-=Debt_To_Add
CURRENT_POS.Ventures.setEntryStat("Profits",CLIENT_VENTUREBOX,D)
CURRENT_POS.TransactionDatabase.createTransaction("Client","Debt Add",CLIENT_VENTUREBOX,CLIENT_CLIENTBOX,,,,Debt_To_Add)
gosub,SELECT_CLIENT
MsgBox, 64, Transaction Complete,% "Transaction Completed. >$" . Debt_To_Add . "< Debt added to >" . CLIENT_CLIENTBOX . "< ."
}
}else{
MsgBox, 16, Invalid Amount, Please enter a valid Amount.
}
}else{
MsgBox, 16, Invalid Amount, Please enter a valid Amount.
return
}
return

PAY_DEBT:
Gui,5:Submit,NoHide
GuiControl,,Debt_To_Pay,
if (AllowableNum(Debt_To_Pay)){
	if(Debt_To_Pay > 0){
MsgBox, 36, Add Debt,% "Are you sure you would like to Pay  >$" . Debt_To_Pay . "< Debt for >" . CLIENT_CLIENTBOX . "< ?"
	IfMsgBox,Yes
	{
D:=CURRENT_POS.Ventures.getClientStat("Debt",CLIENT_VENTUREBOX,CLIENT_CLIENTBOX)
D-=Debt_To_Pay
CURRENT_POS.Ventures.setClientStat("Debt",CLIENT_VENTUREBOX,CLIENT_CLIENTBOX,D)
CURRENT_POS.addMainStat("Value",Debt_To_Pay)
D:=CURRENT_POS.Ventures.getEntryStat("Profits",CLIENT_VENTUREBOX)
D+=Debt_To_Pay
CURRENT_POS.Ventures.setEntryStat("Profits",CLIENT_VENTUREBOX,D)
CURRENT_POS.TransactionDatabase.createTransaction("Client","Debt Paid",CLIENT_VENTUREBOX,CLIENT_CLIENTBOX,,,,Debt_To_Pay)
gosub,SELECT_CLIENT
MsgBox, 64, Transaction Complete,% "Transaction Completed. >$" . Debt_To_Pay . "< Debt removed from >" . CLIENT_CLIENTBOX . "< ."
}
}else{
MsgBox, 16, Invalid Amount, Please enter a valid Amount.
}
}else{
MsgBox, 16, Invalid Amount, Please enter a valid Amount.
return
}
return
VOID_DEBT:
Gui,5:Submit,NoHide
GuiControl,,Debt_To_Void,
if (AllowableNum(Debt_To_Void)){
	if(Debt_To_Void > 0){
MsgBox, 36, Add Debt,% "Are you sure you would like to Void  >$" . Debt_To_Void . "< Debt for >" . CLIENT_CLIENTBOX . "< ?"
	IfMsgBox,Yes
	{
D:=CURRENT_POS.Ventures.getClientStat("Debt",CLIENT_VENTUREBOX,CLIENT_CLIENTBOX)
D-=Debt_To_Void
CURRENT_POS.Ventures.setClientStat("Debt",CLIENT_VENTUREBOX,CLIENT_CLIENTBOX,D)



CURRENT_POS.TransactionDatabase.createTransaction("Client","Debt Void",CLIENT_VENTUREBOX,CLIENT_CLIENTBOX,,,,Debt_To_Void)
gosub,SELECT_CLIENT
MsgBox, 64, Transaction Complete,% "Transaction Completed. >$" . Debt_To_Void . "< Voided from >" . CLIENT_CLIENTBOX . "< ."
}
}else{
MsgBox, 16, Invalid Amount, Please enter a valid Amount.
}
}else{
MsgBox, 16, Invalid Amount, Please enter a valid Amount.
return
}
return
DELETE_CLIENT:
Gui,5:Submit,NoHide
if(CURRENT_POS.Ventures.getClientStat("Debt",CLIENT_VENTUREBOX,CLIENT_CLIENTBOX) <=0 ){
	MsgBox, 4, Remove Client,% "Are you sure you would like to remove client >" . CLIENT_CLIENTBOX . "< ?"
	IfMsgBox,Yes
	{
	CURRENT_POS.Ventures.deleteClient(CLIENT_CLIENTBOX,CLIENT_VENTUREBOX)
	MsgBox, 64, Transaction Complete,% "Transaction Completed. Client >" . CLIENT_CLIENTBOX . "< Removed from >" . CLIENT_VENTUREBOX . "< ."
}
}else{
MsgBox, 16, Remove Debt, Remove debt before deleting client.
}
gosub,CLIENTSELECT_VENTURE
return