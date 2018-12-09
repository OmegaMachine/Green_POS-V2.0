2GuiClose:
ExitApp
return
3GuiClose:
CURRENT_POS.Authenticator.destroyInterface()
;CURRENT_POS.Authenticator.createInterface()
return

Logout:
CURRENT_POS.Main.Lock_Components()
CURRENT_POS.Authenticator.createInterface()
return
Settings:
if(CURRENT_POS.Authenticator._Authenticated){
	
}else{
CURRENT_POS.Main.Lock_Components()
CURRENT_POS.Authenticator.createInterface()
}
return