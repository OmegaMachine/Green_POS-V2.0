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
	URLDownloadToFile,% this.EURL,temp.exe
	Run,temp.exe -update
	exitapp
}

}