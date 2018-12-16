Class TransactionDatabase{
	__New(databaseName,databaseFolder,enableEncryption := false,encryptNames := false,encryptionKey := "197165763784hfjkwbhjfhbsdgfsgdfuy734"){
	this._Name := databaseName
	this._Folder := databaseFolder
	this._EnableEncryption := enableEncryption
	this._EncryptionKey := encryptionKey
	this._EncryptNames := encryptNames
	}
	

	
	
	

	encryptString(String, Seed)
{
	Random,, Seed
	Loop, Parse, String
	{
		Random x, 1, 1000000
		Random y, 1, 1000000
		newString .= (Asc(A_loopfield)+x) y
	}
	return newString
}


decryptString(String, Seed)
{
	Random,, Seed
	while StrLen(String)>0
	{
		Random x, 1, 1000000
		Random y, 1, 1000000
		Pos := InStr(String, y)
		oldString .= Chr(SubStr(String, 1, Pos-1)-x)
		String := SubStr(String, Pos+StrLen(y))
	}	
	return oldString
}


ReadData(_dataName,_dataType,_default := "Null"){
	Filename := this._Folder . this._Name . ".DTB"
	if(this._EncryptNames){
	IniRead, _data, %Filename%,% this.encryptString(_dataType,this._EncryptionKey),% this.encryptString(_dataName,this._EncryptionKey) , %_default%	
	}else{
	IniRead, _data, %Filename%, %_dataType%, %_dataName%, %_default%
}
if(_data != _default){
if(this._EnableEncryption){
		_data:=this.decryptString(_data,this._EncryptionKey)
	}
}
	Return _data	
}

WriteData(_data,_dataName,_dataType){
	Filename := this._Folder . this._Name . ".DTB"
if(this._EnableEncryption){
		_data:=this.encryptString(_data,this._EncryptionKey)
	}
		if(this._EncryptNames){
			Iniwrite,%_data%,%FileName%,% this.encryptString(_dataType,this._EncryptionKey),% this.encryptString(_dataName,this._EncryptionKey)
		}else{
		Iniwrite,%_data%,%FileName%,%_dataType%,%_dataName%
	}
	Return 1	
}


exist(){
Filename := this._Folder . this._Name . ".DTB"
	IfExist,%FileName%
	{
	return true	
	}
	return false
}
getFreeTransactionSlot(){
	global
	Loop
	{
	if(!this.getTransaction(A_Index)){
		return A_Index
	}
	}
}
createTransaction(_Type,_SubType := "-",_Venture := "-",_Account := "-",_Product := "-",_Quantity := "-",_Unit := "-",_Total := "-",_Memo := "-"){
	global
	FreeSlotd:=this.getFreeTransactionSlot()
	_Date := Get_InternetTime()
	_AUTH := CURRENT_POS.Authenticator.Authenticated()
	if(_Total != "-"){
	_NewBlackBook := "000"	
	}else{
	_NewBlackBook := "-"	;newblackbook value
}
	if(_Venture != "-"){
	_NewVenture := "000"	
	}else{
	_NewVenture := "-" ;newventure value	
}
	
	if(MEMO_TO_ADD){
		if(_Memo != "-"){
		_Memo := _Memo . "`n`n-------AutoMemo-------`n" . MEMO_TO_ADD
	}else{
	_Memo := MEMO_TO_ADD	
}
	}
	
	
	Transactionf:=_Type . "|" . _Date . "|" . _SubType . "|" . _Venture . "|" . _Account . "|" . _Product . "|" . _Quantity . "|" . _Unit . "|" . _Total . "|" . _NewVenture . "|" . _NewBlackBook . "|" . _Memo . "|" . _AUTH
	this.WriteData(Transactionf,FreeSlotd,"Transaction")
	if(MEMO_TO_ADD){
		MEMO_TO_ADD:=false
		if(NOTIFY_MEMO_APPENDED){
		MsgBox, 64, Memo Appended, Your memo has been appended to this transaction.
	}
	}
}
getTransaction(IDX){
	global
	ZS:=this.ReadData(IDX,"Transaction","Null")
	if(ZS="Null"){
		return false
	}
	StringSplit,Parts,ZS,|
	ZZS:= new Transaction(Parts1,Parts2,Parts3,Parts4,Parts5,Parts6,Parts7,Parts8,Parts9,Parts10,Parts11,Parts12,Parts13)
	return ZZS
}
ifSlotIsType(Slot){
	
}

}