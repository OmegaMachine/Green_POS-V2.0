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
FileRead,B,% this.LocalVersionPath
if(A!=B){
	Msgbox,% "New: " . A . " - Old: " . B
}
}



}