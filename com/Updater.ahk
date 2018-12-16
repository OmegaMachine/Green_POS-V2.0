    if(A_ScriptName = "Updater.exe"){

FileMove, BlackBook.exe, old.exe
 FileMove,Updater.exe, BlackBook.exe
 FileDelete,old.exe
 Msgbox,Succesfully Updated to Version %PROGRAM_VERSION%

}