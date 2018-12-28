Class GITBinaryUpdater{
	__New(VersionURL,ExeURL){
		Global
	this.VURL := VersionURL
	this.EURL := ExeURL
	this.LocalVersionPath := A_ScriptDir . "\version.txt"
	this.LocalVersion := PROGRAM_VERSION
	FileDelete, % this.LocalVersionPath
	FileAppend,% this.LocalVersion,% this.LocalVersionPath
	}
checkForUpdate(){
this.checkDependencys()
URLDownloadToFile,% this.VURL,temp.txt
FileRead,A,temp.txt
FileDelete,temp.txt
FileRead,B,% this.LocalVersionPath
if(A!=B){
	MsgBox, 36, Update Available, A new version has been found (%A%) `, would you like to download and install it now?
ifMsgbox,Yes
{
this.doUpdate()	
}
}
}

doUpdate(){
	URLDownloadToFile,% this.EURL,Updater.exe
	Run,Updater.exe 
	exitapp
}

checkDependencys(){
	global
this.checkDependency("Main_Icon","ico","https://raw.githubusercontent.com/OmegaMachine/Green_POS-V2.0/master/Theme/",FOLDER_THEME)
this.checkDependency("Settings_Icon","ico","https://raw.githubusercontent.com/OmegaMachine/Green_POS-V2.0/master/Theme/",FOLDER_THEME)
this.checkDependency("Auth_icon","ico","https://raw.githubusercontent.com/OmegaMachine/Green_POS-V2.0/master/Theme/",FOLDER_THEME)
}
checkDependency(Name,Ext,PullURL,DestinationFolder){
	global
	FileName:= DestinationFolder . Name . "." . Ext
	FIlePartName:=Name . "." . Ext
	IfNotExist,%FileName%
{
	URLDownloadToFile,%PullURL%%FIlePartName%,%FileName%

}	
}

}