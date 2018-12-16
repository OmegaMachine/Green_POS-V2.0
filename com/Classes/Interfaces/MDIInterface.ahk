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
create(Name){
	global
	;this._Database.WriteData(0,"Profit",Name)
	this._Database.WriteData(Get_InternetTime(),"CreateDate",Name)
	
D:=_ListAddStart(this._Database.ReadData("Counter","Counter",false),Name)
this._Database.WriteData(D,"Counter","Counter")
CURRENT_POS.TransactionDatabase.createTransaction("Venture","Created",,Name)
this.openInterface()
}

getAll(){
	global
	s:=this._Database.ReadData("Counter","Counter",false)
	if(s){
		return s
	}
return 	""
}

getStat(StatName,Name,zDefault := 0){
	global
return this._Database.ReadData(StatName,Name,zDefault)
}
setStat(StatName,Name,xData){
	global
	this._Database.WriteData(xData,StatName,Name)
return
}
}