CURRENT_POS := {}
;Databases
CURRENT_POS.Database := New Database("Main",FOLDER_MAIN,true,true,ENCRYPTION_KEY)
CURRENT_POS.AdminAccounts := New Database("Admin",FOLDER_ADMIN,true,true,ENCRYPTION_KEY)
;Interfaces
CURRENT_POS.Main := New MainInterface(MAIN_GUI_NAME)
CURRENT_POS.Authenticator := New AuthenticationInterface(AUTH_GUI_NAME)
CURRENT_POS.Admin := New AdminInterface(ADMIN_GUI_NAME)
CURRENT_POS.Clients := New ClientInterface(CLIENTS_GUI_NAME)
CURRENT_POS.Logger := New LoggerInterface(LOGGER_GUI_NAME)
CURRENT_POS.Sales := New SalesInterface(SALES_GUI_NAME)
CURRENT_POS.Products := New ProductInterface(PRODUCTS_GUI_NAME)
CURRENT_POS.Ventures := New VentureInterface(VENTURES_GUI_NAME)
CURRENT_POS.Transactions := New TransactionInterface(TRANSACTIONS_GUI_NAME)
CURRENT_POS.Settings := New SettingsInterface(SETTINGS_GUI_NAME)
;Functions
CURRENT_POS.DestroyAllInterfaces := Func("Destroy_All_Interfaces")

;Startup

CURRENT_POS.Authenticator.requestAuthentication()


