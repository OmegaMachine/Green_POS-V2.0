CURRENT_POS := {}

CURRENT_POS.Database := New Database("Main",FOLDER_MAIN,true,true,ENCRYPTION_KEY)
CURRENT_POS.Main := New MainInterface(MAIN_GUI_NAME)
CURRENT_POS.Main.Lock_Components()
CURRENT_POS.Authenticator := New AuthenticationInterface(AUTH_GUI_NAME)
;CURRENT_POS.Authenticator

;CU