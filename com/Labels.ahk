ExitProgram:
2GuiClose:
ExitApp
return
3GuiClose:
CURRENT_POS.Authenticator.destroyInterface()
return
6GuiSize:
Gui,6:Default
Gui,6: +LastFound
GuiControl,Move,LoggerText,w%A_GUIWidth% h%A_GUIHeight%
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
MODULE_ADMIN:
if(CURRENT_POS.Authenticator.Authenticated()){
	CURRENT_POS.Admin.openInterface()
}else{
	CURRENT_POS.Logger.Log("Error","Please Authenticate First",MESSAGE_SEP)
CURRENT_POS.Authenticator.requestAuthentication()
}
return
MODULE_LOGGER:
	CURRENT_POS.Logger.openInterface()
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



FocusMain:
Gui,2: +LastFound
MainX := WinExist()
WinActivate,%MainX%
return