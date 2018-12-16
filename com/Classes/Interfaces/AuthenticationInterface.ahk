Class AuthenticationInterface{
	__New(InterfaceName){
global
	this._Name := InterfaceName
	this._Creator := !CURRENT_POS.AdminAccounts.exist()
	this._authAs := 0
	this._Authenticated := false

	}
	


	


destroyInterface(){
Gui,3:Destroy
return
}
Authenticated(){
	if(this._Authenticated){
		return this._authAs
	}
	return false
}
Logout(Name){
global
	if(TRANSACT_SESSIONS){
CURRENT_POS.TransactionDatabase.createTransaction("Session","Ended",,Name)
}
	Menu, AccountMenu, Rename,&Logout - %Name%,&Login
	this._Authenticated := false
	this._authAs := 0
	this._Creator := !CURRENT_POS.AdminAccounts.exist()
	CURRENT_POS.DestroyAllInterfaces()
	CURRENT_POS.Logger.Clear()
	CURRENT_POS.Logger.Log("Message","Logged Out Admin >" . Name . "<",MESSAGE_SEP)

}
requestAuthentication(){
	global
	if(this._authAs){
		this.Logout(this._authAs)
	}

	
	CURRENT_POS.Logger.Log("Message","Please Authenticate.",MESSAGE_SEP)
this.destroyInterface()
Menu, tray, Icon , %FOLDER_THEME%Auth_icon.ico, 1, 1
		;Gui,3: Add,Picture,w400 h150 x0 y0,%FOLDER_THEME%Red.PNG
		Gui,3: Color , %AUTH_GUI_COLOR%
		Gui,3:    +LastFound ; +ToolWindow
		AuthH := WinExist()
		Gui,2: +Lastfound
		MainH := WinExist()
		Gui,3: +Lastfound
		Gui,3: +Owner2
		;Gui,3: +Parent2
		x:=10
		
		
		

if(this._Creator){
;	Gui,3: Add, Button, x+m yp w90 h20 g_AttemptCreate, Create
;		Gui,3: Add, Text, x10 y+m w50 h20 +BackgroundTrans,PW(Again)
;		Gui,3: Add, Edit, x+M yp w130 h20 vLogin_Repeat +Password,
		CURRENT_POS.Logger.Log("Message","Initializing a new BlackBook. Please create an Investor account.",MESSAGE_SEP)
	Gui, 3:Add, Text, x52 y60 w100 h20 , BlackBook Name
Gui, 3:Add, Edit, x152 y60 w100 h20 vNEW_BLACKBOOK_NAME,
Gui, 3:Add, Text, x52 y90 w100 h20 , Username
Gui, 3:Add, Edit, x152 y90 w100 h20 vNEW_BLACKBOOK_USERNAME, 
Gui, 3:Add, Text, x52 y110 w100 h20 , Password
Gui, 3:Add, Edit, x152 y110 w100 h20 vNEW_BLACKBOOK_PW  +Password,
Gui, 3:Add, Text, x52 y130 w100 h20 , Password (repeat)
Gui, 3:Add, Edit, x152 y130 w100 h20 vNEW_BLACKBOOK_PWREPEAT +Password, 
Gui, 3:Add, Button, x262 y130 w90 h20 g_AttemptCreate, Create
Gui, 3:Font, S8 CDefault Bold, Verdana
Gui, 3:Add, GroupBox, x42 y40 w320 h120 , Initialize New BlackBook
Gui, 3:Font, S14 CDefault Bold Underline, Verdana
Gui, 3:Add, Text, x2 y0 w400 h30 +BackgroundTrans +Center, New BlackBook
Gui, 12:Font, , 
Gui, 3:Show, w407 h184,% this._Name
		
}else{
			Gui,3: Add, Text, x10  w50 h20 +BackgroundTrans, Username:
		Gui,3: Add, Edit, x+m yp w130 h20 vLogin_Username,

		Gui,3: Add, Text,x10 y+m w50 h20 +BackgroundTrans, Password:
		Gui,3: Add, Edit, x+m yp w130 h20 vLogin_Password +Password,
		Gui,3: Add, Button, x+m yp w90 h20 g_AttemptLogin, Login
		Gui,3: Show,  ,% this._Name
}
		
		
	DllCall("SetParent", "uint", AuthH, "uint", MainH)
return
}

attemptAuthentication(){
	global
	CURRENT_POS.Logger.Log("Message","Attempting To Authenticate...",MESSAGE_SEP)
	
	Gui,3: Submit,NoHide
	Guicontrol,,Login_Username,
	Guicontrol,,Login_Password,
	if (Login_Password != CURRENT_POS.AdminAccounts.ReadData("Password",Login_Username,"Null"))
	{
	CURRENT_POS.Logger.Log("Message","....Failed. Username / Password combination do not match.",MESSAGE_SEP)
return	
}
this.authenticateAdmin(Login_Username)
CURRENT_POS.Logger.Clear()

CURRENT_POS.Logger.Log("Session","Authentication Succesful. New Session As: >" . Login_Username . "<",MESSAGE_SEP)

}
authenticateAdmin(VUsername){
	global
	this._Authenticated := true
	this._authAs := VUsername
	this.destroyInterface()
	Menu, AccountMenu, Rename,&Login,&Logout - %VUsername%
if(TRANSACT_SESSIONS){
CURRENT_POS.TransactionDatabase.createTransaction("Session","Started",,VUsername)
}
}
attemptCreate(){
	global
	CURRENT_POS.Logger.Log("Message","Attempting to create a new admin account....",MESSAGE_SEP)
	Gui,3: Submit,NoHide
	if NEW_BLACKBOOK_USERNAME is Not alnum
	{
		MsgBox, 0, Create New Investor, Failed. Invalid Name.
	CURRENT_POS.Logger.Log("Message","....Failed. Username invalid.",MESSAGE_SEP)
return	
}
	if NEW_BLACKBOOK_USERNAME is space
	{
		MsgBox, 0, Create New Investor, Failed. Invalid Name.
	CURRENT_POS.Logger.Log("Message","....Failed. Username invalid.",MESSAGE_SEP)
return	
}
	if NEW_BLACKBOOK_NAME is Not alnum
	{
		MsgBox, 0, Create New BlackBook, Failed. Invalid Name.
	CURRENT_POS.Logger.Log("Message","....Failed. Username invalid.",MESSAGE_SEP)
return	
}
	if NEW_BLACKBOOK_NAME is space
	{
		MsgBox, 0, Create New BlackBook, Failed. Invalid Name.
	CURRENT_POS.Logger.Log("Message","....Failed. Username invalid.",MESSAGE_SEP)
return	
}
	if NEW_BLACKBOOK_PW is Not alnum
	{
		MsgBox, 0, Create New Investor, Failed. Invalid Password.
	CURRENT_POS.Logger.Log("Message","....Failed. Password invalid.",MESSAGE_SEP)
return	
}
	if NEW_BLACKBOOK_PW is space
	{
		MsgBox, 0, Create New Investor, Failed. Invalid Password.
	CURRENT_POS.Logger.Log("Message","....Failed. Password invalid.",MESSAGE_SEP)
return	
}
	if (NEW_BLACKBOOK_PWREPEAT != NEW_BLACKBOOK_PW)
	{
			MsgBox, 0, Create New Investor, Failed. Passwords do not match. 
	CURRENT_POS.Logger.Log("Message","....Failed. Repeat Password does not match Password.",MESSAGE_SEP)
return	
}

	GuiControl,,NEW_BLACKBOOK_NAME,
	Guicontrol,,NEW_BLACKBOOK_USERNAME,
	Guicontrol,,NEW_BLACKBOOK_PW,
	Guicontrol,,NEW_BLACKBOOK_PWREPEAT,
	this.createAdmin(NEW_BLACKBOOK_USERNAME,NEW_BLACKBOOK_PW)
	CURRENT_POS.Database.WriteData(NEW_BLACKBOOK_NAME,"Name","Main")
	CURRENT_POS.Database.WriteData(0,"Investments","Main")
	CURRENT_POS.Database.WriteData(0,"Value","Main")
	CURRENT_POS.Database.WriteData(0,"SharesSold","Main")
	CURRENT_POS.Database.WriteData(INITIAL_SHAREVALUE,"InitialShareValue","Main")
	this._Creator:=false
	Gui,2: Show, w%MAIN_SIZEw% h%MAIN_SIZEh%  x0 y0,% CURRENT_POS.getName() . " " . CURRENT_POS.Main._Name . " - v" . PROGRAM_VERSION 
	this.requestAuthentication()
	CURRENT_POS.Logger.Log("Message","....Success.",MESSAGE_SEP)
	
	;msgbox,% CURRENT_POS.Database.exist()
	;this._Authenticated := true
}
attemptCreateCustom(_Name,PW,PWREPEAT){
	global
	CURRENT_POS.Logger.Log("Message","Attempting to create a new admin account....",MESSAGE_SEP)
	Gui,3: Submit,NoHide
	if _Name is Not alnum
	{
	CURRENT_POS.Logger.Log("Message","....Failed. Username invalid.",MESSAGE_SEP)
return	
}
	if _Name is space
	{
	CURRENT_POS.Logger.Log("Message","....Failed. Username invalid.",MESSAGE_SEP)
return	
}
	if PW is Not alnum
	{
	CURRENT_POS.Logger.Log("Message","....Failed. Password invalid.",MESSAGE_SEP)
return	
}
	if PW is space
	{
	CURRENT_POS.Logger.Log("Message","....Failed. Password invalid.",MESSAGE_SEP)
return	
}
	if (PWREPEAT != PW)
	{
	CURRENT_POS.Logger.Log("Message","....Failed. Repeat Password does not match Password.",MESSAGE_SEP)
return	
}

	Guicontrol,,_Name,
	Guicontrol,,PW,
	Guicontrol,,PWREPEAT,
	this.createAdmin(_Name,PW)
	;this.requestAuthentication()
	CURRENT_POS.Logger.Log("Message","....Success.",MESSAGE_SEP)
MsgBox, 0, Create New Investor, Succesful!
}

createAdmin(VUsername,vPassword){
	global
CURRENT_POS.AdminAccounts.WriteData(vPassword,"Password",vUsername)
CURRENT_POS.AdminAccounts.WriteData(Get_InternetTime(),"JoinDate",vUsername)
CURRENT_POS.AdminAccounts.WriteData(0,"Investments",vUsername)
	CURRENT_POS.AdminAccounts.WriteData(0,"Shares",vUsername)
D:=_ListAddStart(CURRENT_POS.AdminAccounts.ReadData("Counter","Counter",false),vUsername)
CURRENT_POS.AdminAccounts.WriteData(D,"Counter","Counter")
CURRENT_POS.TransactionDatabase.createTransaction("BlackBook","Initialized",,VUsername)
CURRENT_POS.TransactionDatabase.createTransaction("Investor","Created",,VUsername)
}


}