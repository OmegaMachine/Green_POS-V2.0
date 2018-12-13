
ClearBackgroundErrors(){
global	
		Gui,6: Default
GuiControl,,LoggerText,
}


Destroy_All_Interfaces(this){
	global
	CURRENT_POS.Clients.destroyInterface()
	CURRENT_POS.Admin.destroyInterface()
	CURRENT_POS.Sales.destroyInterface()
	CURRENT_POS.Ventures.destroyInterface()
	CURRENT_POS.Products.destroyInterface()
	CURRENT_POS.Transactions.destroyInterface()
	CURRENT_POS.Settings.destroyInterface()
	CURRENT_POS.Memos.destroyInterface()
	return
}


WM_Move(wP,lP,msg) {
Gui,5: +LastFound
WinSet, Redraw
}

Get_InternetTime(){
URLDownloadToFile,http://worldclockapi.com/api/json/est/now,Time.html	
	FileRead,Z,Time.Html
	FileDelete,Time.html
	Q := ReturnTag(Z,"""currentDateTime"":""","-05:00""`,""utcOffset""")
	StringSplit,Q,Q,T
	X := Q1 . " - " . Q2
	return X
}

