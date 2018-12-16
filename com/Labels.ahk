ExitProgram:
2GuiClose:
CURRENT_POS.Authenticator.requestAuthentication()
ExitApp
return
3GuiClose:
CURRENT_POS.Authenticator.destroyInterface()
if(FORCE_AUTHENTICATION){
CURRENT_POS.Authenticator.requestAuthentication()
}
return
6GuiSize:
Gui,6:Default
Gui,6: +LastFound

GuiControl,Move,LoggerText,w%A_GUIWidth% h%A_GUIHeight%
return
9GuiSize:
Gui,9:Default
Gui,9: +LastFound
HO := 105
WO := 10
LVH:=A_GUIHeight-38-HO
LVW:=A_GUIWidth-34-WO
GBW:=A_GUIWidth-24-7
GBH := A_GUIHeight-28
GBEW:=A_GUIWidth-16
GBEH := A_GUIHeight-18

GuiControl,Move,TRANSACTION_LISTVIEW,w%LVW% h%LVH% 
GuiControl,Move,GBTrans,w%GBW% h%GBEH% 
GuiControl,Move,GBExplorer,w%GBEW% h%GBEH% 
GuiControl,Move,GBF,w%GBW% 
GuiControl,Move,TT,w%A_GUIWidth% 
WinSet, Redraw
return

2GuiSize:
Gui,2: +LastFound
MainX := WinExist()
WinActivate,%MainX%

return


Clear_Errors:
CURRENT_POS.Logger.Clear()
return
Logout:

CURRENT_POS.Authenticator.requestAuthentication()
return
Settings:
if(CURRENT_POS.Authenticator.Authenticated()){
CURRENT_POS.Settings.openInterface()
}else{
CURRENT_POS.Authenticator.requestAuthentication()
}
return
MODULE_CLIENT:
if(CURRENT_POS.Authenticator.Authenticated()){
CURRENT_POS.Clients.openInterface()
}else{
	CURRENT_POS.Logger.Log("Error","Please Authenticate First",MESSAGE_SEP)
	CURRENT_POS.Authenticator.requestAuthentication()
}
return
MODULE_INVESTORS:
if(CURRENT_POS.Authenticator.Authenticated()){
	CURRENT_POS.Investors.openInterface()
}else{
	CURRENT_POS.Logger.Log("Error","Please Authenticate First",MESSAGE_SEP)
CURRENT_POS.Authenticator.requestAuthentication()
}
return
MODULE_LOGGER:
	CURRENT_POS.Logger.openInterface()
return
MODULE_MEMO:
if(CURRENT_POS.Authenticator.Authenticated()){
	CURRENT_POS.Memos.openInterface()
}else{
	CURRENT_POS.Logger.Log("Error","Please Authenticate First",MESSAGE_SEP)
CURRENT_POS.Authenticator.requestAuthentication()
}
return
MODULE_SALES:
if(CURRENT_POS.Authenticator.Authenticated()){
	CURRENT_POS.Sales.openInterface()
}else{
	CURRENT_POS.Logger.Log("Error","Please Authenticate First",MESSAGE_SEP)
CURRENT_POS.Authenticator.requestAuthentication()
}
return
MODULE_PRODUCTS:
if(CURRENT_POS.Authenticator.Authenticated()){
	CURRENT_POS.Products.openInterface()
}else{
	CURRENT_POS.Logger.Log("Error","Please Authenticate First",MESSAGE_SEP)
CURRENT_POS.Authenticator.requestAuthentication()
}
return
MODULE_VENTURES:
if(CURRENT_POS.Authenticator.Authenticated()){
	CURRENT_POS.Ventures.openInterface()
}else{
	CURRENT_POS.Logger.Log("Error","Please Authenticate First",MESSAGE_SEP)
CURRENT_POS.Authenticator.requestAuthentication()
}
return
MODULE_TRANSACTIONS:
if(CURRENT_POS.Authenticator.Authenticated()){
	CURRENT_POS.Transactions.openInterface()
}else{
	CURRENT_POS.Logger.Log("Error","Please Authenticate First",MESSAGE_SEP)
CURRENT_POS.Authenticator.requestAuthentication()
}
return
_AttemptLogin:
CURRENT_POS.Authenticator.attemptAuthentication(CURRENT_POS.Database)
return
_AttemptCreate:
CURRENT_POS.Authenticator.attemptCreate(CURRENT_POS.Database)
return


BlackBook:
Gui,2: Show
return
FocusMain:
Gui,2: +LastFound
MainX := WinExist()
WinActivate,%MainX%
return

Radio1:
if(!ALLOW_DEBT_TRANSACTIONS){
	GuiControl,,CashDebt1,1
	MsgBox, 16, Debt Transaction Disallowed, Debt transactions have been disallowed by the admin.
	
}
return

MODULE_ADDMEMOTONEXT:
if(MEMO_TO_ADD){
	MsgBox, 4, Overwrite Previous Memo, The previous memo has not been appended yet. Would you like to overwrite the memo?
	IfMsgBox,Yes
	{
InputBox,MEMO_TO_ADD,Enter Memo,Enter the memo you would like appened to the next transaction. (Venture creation`, Client creation`, Processing Sales etc....)
if(ErrorLevel){
	MEMO_TO_ADD:=false
	MsgBox, 64, Memo Not Appended, No Memo will be appended to the next transaction.
}else{
MsgBox, 64, Memo Will Be Appended, Your memo has overwritten the previous memo and will be appended to the next transaction.	
}
}

}else{
InputBox,MEMO_TO_ADD,Enter Memo,Enter the memo you would like appened to the next transaction. (Venture creation`, Client creation`, Processing Sales etc....)
if(ErrorLevel){
	MEMO_TO_ADD:=false
	MsgBox, 64, Memo Not Appended, No Memo will be appended to the next transaction.
}else{
MsgBox, 64, Memo Will Be Appended, Your memo will be appended to the next transaction.	
}
}
return

