Class Database{
	__New(databaseName,databaseFolder,enableEncryption := false,encryptNames := false,encryptionKey := "197165763784hfjkwbhjfhbsdgfsgdfuy734"){
	this._Name := databaseName
	this._Folder := databaseFolder
	this._EnableEncryption := enableEncryption
	this._EncryptionKey := encryptionKey
	this._EncryptNames := true
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


}