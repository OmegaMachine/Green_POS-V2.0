Class MDIInterface{
	__New(InterfaceName){
global
		this._UnmodifiedName := InterfaceName
		StringReplace,InterfaceName,InterfaceName,%A_Space%,_,All
		this._Name := InterfaceName
		this._Folder :=  A_ScriptDir . "\data\" . InterfaceName . "\"
		this._Database := New Database(InterfaceName,this._Folder,true,true,ENCRYPTION_KEY)
	}

destroyInterface(){
	global
	Z:=this._Name
Gui,%Z%:Destroy
return
}

openInterface(){
	global
this.destroyInterface()
Z:=this._Name
		;Gui,3: Add,Picture,w400 h150 x0 y0,%FOLDER_THEME%Red.PNG
		Gui,%Z%: Color , %AUTH_GUI_COLOR%
Gui,%Z%:    +LastFound +MaximizeBox +Owner2  +Resize
AuthH := WinExist()




		Gui,%Z%: Show, w400 h150 ,% this._UnmodifiedName
	DllCall("SetParent", "uint", AuthH, "uint", MainH)
return
}
createDatabaseEntry(Entry_Name,Entry_Details := ""){
	global
	
	this._Database.WriteData(Get_InternetTime(),"CreateDate",Entry_Name)
	
	Loop,Parse,Entry_Details,|
	{
		StringSplit,Entry_Piece,A_LoopField,:
		this._Database.WriteData(Entry_Piece2,Entry_Piece1,Entry_Name)
	}
this.addEntryToCounter(Entry_Name)
CURRENT_POS.TransactionDatabase.createTransaction("Venture","Created",,Entry_Name)
this.openInterface()
}
addEntryToCounter(Entry_Name){
	global
	D:=_ListAddStart(this._Database.ReadData("Counter","Counter",false),Entry_Name)
this._Database.WriteData(D,"Counter","Counter")
}
getAllEntrys(){
	global
	s:=this._Database.ReadData("Counter","Counter",false)
	if(s){
		return s
	}
return 	""
}

getEntryStat(StatName,Entry_Name,zDefault := 0){
	global
return this._Database.ReadData(StatName,Entry_Name,zDefault)
}
setEntryStat(StatName,Entry_Name,xData){
	global
	this._Database.WriteData(xData,StatName,Entry_Name)
return
}
}