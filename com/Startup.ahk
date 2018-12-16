OnExit("ExitFunc")
CURRENT_POS := {}
;Updater
CURRENT_POS.Updater := New GITBinaryUpdater("https://raw.githubusercontent.com/OmegaMachine/Green_POS-V2.0/master/version.txt","https://github.com/OmegaMachine/Green_POS-V2.0/raw/master/BlackBook.exe")
if(CHECK_FOR_UPDATES){
CURRENT_POS.Updater.checkForUpdate()
}
;Databases
CURRENT_POS.Database := New Database("Main",FOLDER_MAIN,true,true,ENCRYPTION_KEY)
CURRENT_POS.TransactionDatabase := New TransactionDatabase("Main",FOLDER_TRANSACTIONS,true,true,ENCRYPTION_KEY)
CURRENT_POS.AdminAccounts := New Database("Admin",FOLDER_INVESTOR,true,true,ENCRYPTION_KEY)
CURRENT_POS.VentureAccounts := New Database("Ventures",FOLDER_VENTURES,true,true,ENCRYPTION_KEY)
;Functions
CURRENT_POS.DestroyAllInterfaces := Func("Destroy_All_Interfaces")
CURRENT_POS.getName := Func("GetPosName")
;Interfaces
CURRENT_POS.Main := New MainInterface(MAIN_GUI_NAME)
CURRENT_POS.Authenticator := New AuthenticationInterface(AUTH_GUI_NAME)
CURRENT_POS.Investors := New InvestorInterface(INVESTOR_GUI_NAME)
CURRENT_POS.Clients := New ClientInterface(CLIENTS_GUI_NAME)
CURRENT_POS.Logger := New LoggerInterface(LOGGER_GUI_NAME)
CURRENT_POS.Sales := New SalesInterface(SALES_GUI_NAME)
CURRENT_POS.Products := New ProductInterface(PRODUCTS_GUI_NAME)
CURRENT_POS.Ventures := New VentureInterface(VENTURES_GUI_NAME)
CURRENT_POS.Transactions := New TransactionInterface(TRANSACTIONS_GUI_NAME)
CURRENT_POS.Settings := New SettingsInterface(SETTINGS_GUI_NAME)
CURRENT_POS.Memos := New MemoInterface(MEMO_GUI_NAME)
CURRENT_POS.FORK := New MDIInterface("FORK")
CURRENT_POS.FORK.openInterface()

;Startup
;createTransaction(_Type,_SubType := "-",_Venture := "-",_Account := "-",_Product := "-",_Quantity := "-",_Unit := "-",_Total := "-",_NewVenture := "-",_NewBlackBook := "-",_Memo := "-")
;CURRENT_POS.TransactionDatabase.createTransaction(_Type,_SubType := "-",_Venture := "-",_Account := "-",_Product := "-",_Quantity := "-",_Unit := "-",_Total := "-",_NewVenture := "-",_NewBlackBook := "-",_Memo := "-")
;Q:=CURRENT_POS.TransactionDatabase.getTransaction(1)
;msgbox,% Q._Type
;Q:=CURRENT_POS.TransactionDatabase.getTransaction(2)
;msgbox,% Q._Type
;Msgbox,% 
;_ListAddStart(CURRENT_POS.AdminAccounts.ReadData("Counter","Counter",false),"WOW")
;msgbox, % CURRENT_POS.Investors.getInvestorStat("JoinDate","joe")


CURRENT_POS.Authenticator.requestAuthentication()


