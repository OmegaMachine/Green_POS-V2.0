
ClearBackgroundErrors(){
global	
		Gui,6: Default
GuiControl,,LoggerText,
}


Destroy_All_Interfaces(this){
	global
	CURRENT_POS.Clients.destroyInterface()
	CURRENT_POS.Investors.destroyInterface()
	CURRENT_POS.Sales.destroyInterface()
	CURRENT_POS.Ventures.destroyInterface()
	CURRENT_POS.Products.destroyInterface()
	CURRENT_POS.Transactions.destroyInterface()
	CURRENT_POS.Settings.destroyInterface()
	CURRENT_POS.Memos.destroyInterface()
	return
}
GetPosName(this){
	global
	return CURRENT_POS.Database.ReadData("Name","Main","Default")
}

WM_Move(wP,lP,msg) {
Gui,5: +LastFound
WinSet, Redraw
}

Get_InternetTime(){
	global USE_INTERNET_TIME
	if(USE_INTERNET_TIME){
URLDownloadToFile,http://worldclockapi.com/api/json/est/now,Time.html	
	FileRead,Z,Time.Html
	FileDelete,Time.html
	Q := ReturnTag(Z,"""currentDateTime"":""","-05:00""`,""utcOffset""")
	StringSplit,Q,Q,T
	X := Q1 . " - " . Q2
}else{
	;2018-12-17 - 00:17
Q1:= A_YYYY . "-" . A_MM . "-" . A_DD
Q2:= A_Hour . ":" . A_Min
X := Q1 . " - " . Q2
}
	return X
}

clearField(Field){
	GuiControl,,%Field%,
}
ExitFunc(){
global
GoSub,ExitProgram
return
}
AllowableText(XText){
	;if XText is Not alnum
	;{
	;	return 0
;}
	if XText is space
	{
return 0	
}
return 1
}
AllowableNum(XNum){
	;if XText is Not alnum
	;{
	;	return 0
;}
	if XNum is space
	{
return 0	
}
	if XNum is Not Number
	{
return 0	
}
return 1
}
getEncryptionKey(){
return "wefgweg5t45334g3j98j894gt"	
}
GET_MIN_SHARE_VALUE(this){
	global
	V_Value := CURRENT_POS.Database.ReadData("Value","Main",0)
	V_SharesSold := CURRENT_POS.Database.ReadData("SharesSold","Main",0)
	V_Init := CURRENT_POS.Database.ReadData("InitialShareValue","Main",0)
	if(V_SharesSold = 0){
		return V_Init
	}
	V_ShareValue := V_Value / V_SharesSold
	if(V_ShareValue < V_Init){
		return V_Init
	}	
	return V_ShareValue
}
GET_SHARE_VALUE(this){
	global
	V_Value := CURRENT_POS.Database.ReadData("Value","Main",0)
	V_SharesSold := CURRENT_POS.Database.ReadData("SharesSold","Main",0)
	V_Init := CURRENT_POS.Database.ReadData("InitialShareValue","Main",0)
	if(V_SharesSold = 0){
		return V_Init
	}
		V_ShareValue := V_Value / V_SharesSold
	return V_ShareValue
}
GET_SHARES_SOLD(this){
	global
	return CURRENT_POS.Database.ReadData("SharesSold","Main",0)
}
ADD_MAIN_STAT(this,StatName,xData){
	global
		currentStat := CURRENT_POS.Database.ReadData(StatName,"Main",0)
	currentStat += xData
	CURRENT_POS.Database.WriteData(currentStat,StatName,"Main")
	;CURRENT_POS.AdminAccounts.WriteData(currentStat,StatName,"Main")
return
}
SUB_MAIN_STAT(this,StatName,xData){
	global
		currentStat := CURRENT_POS.Database.ReadData(StatName,"Main",0)
	currentStat -= xData
	CURRENT_POS.Database.WriteData(currentStat,StatName,"Main")
	;CURRENT_POS.AdminAccounts.WriteData(currentStat,StatName,"Main")
return
}
GET_MAIN_STAT(this,StatNamef){
	global
	return CURRENT_POS.Database.ReadData(StatNamef,"Main",0)
}