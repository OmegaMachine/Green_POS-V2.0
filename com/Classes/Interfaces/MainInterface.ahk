Class MainInterface{

	__New(InterfaceName){
global
		this._Name := InterfaceName
this.createInterface()
	}



	
	
	
	
	
	
	

	

destroyInterface(){
Gui,2:Destroy
return
}
createInterface(){
	global
		Menu, AccountMenu, Add, &Login,Logout
		Menu, AccountMenu, Add, &Settings , Settings
		Menu, MyMenuBar, Add, &Account, :AccountMenu
		
		Menu, ModulesMenu, Add, &Client Explorer,MODULE_CLIENT
		Menu, ModulesMenu, Add, &Product Explorer,MODULE_PRODUCTS
		Menu, ModulesMenu, Add, &Venture Explorer,MODULE_VENTURES
		Menu, ModulesMenu, Add, &Process Sales,MODULE_SALES
		Menu, ModulesMenu, Add
		Menu, ModulesMenu, Add, &Transaction Explorer,MODULE_TRANSACTIONS
		Menu, ModulesMenu, Add
		Menu, ModulesMenu, Add, &Memo Explorer,MODULE_MEMO
		Menu, ModulesMenu, Add
		Menu, ModulesMenu, Add, &Investor Tools ,MODULE_INVESTORS
		Menu, MyMenuBar, Add, &Programs, :ModulesMenu
		
		Menu, ELog, Add, &Open Logger,MODULE_LOGGER
		Menu, ELog, Add, &Clear Logger,Clear_Errors
		Menu, MyMenuBar, Add, &Logger, :ELog
		
		Menu, ExitMenu, Add, &Exit,ExitProgram
		Menu, MyMenuBar, Add, &Exit, :ExitMenu
		
		Menu, tray, Icon , %FOLDER_THEME%Main_Icon.ico, 1, 1
		Gui,2: Menu, MyMenuBar
		;Gui,2: Add, Tab2, x2 y0 w1090 h590 vTabControl, Tab1|Tab2
		Gui,2: Color , %MAIN_GUI_COLOR%
		;Gui,2: Add, StatusBar,,
		Gui,2:    -MinimizeBox +LastFound
		hWnd := WinExist()
		MainH := WinExist()
hSysMenu:=DllCall("GetSystemMenu","Int",hWnd,"Int",FALSE) 
nCnt:=DllCall("GetMenuItemCount","Int",hSysMenu) 
DllCall("RemoveMenu","Int",hSysMenu,"UInt",nCnt-6,"Uint","0x400") 
DllCall("DrawMenuBar","Int",hWnd) 
		Gui,2: Add,text,w%MAIN_SIZEw% h%MAIN_SIZEh% x0 y0 +BackgroundTrans gFocusMain cRed vEText  ;Used to focus this gui
		Gui,2: Show, w%MAIN_SIZEw% h%MAIN_SIZEh%  x0 y0,% this._Name . " - v" . PROGRAM_VERSION 
}

}