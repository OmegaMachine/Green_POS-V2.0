#SingleInstance,Force

#Include com\Variables.ahk
for n, param in A_Args  ; For each parameter:
{

    if(param = "update"){

FileMove, BlackBook.exe, old.exe
 FileMove, %A_ScriptName%, BlackBook.exe
 FileDelete,old.exe
 Msgbox,Succesfully Updated to Version %PROGRAM_VERSION%
}
}
#Include com\Startup.ahk
return
#Include com\Hotkeys.ahk
#Include com\Classes.ahk
#Include com\Functions.ahk
#Include com\Labels.ahk
#Include com\Forms.ahk

#Include com\_Html.ahk
;#Include com\\Database.ahk


;CURRENT_POS.Database := New Database(Database Name,Folder for Database,Encrypt Data?,Encrypt Names?,ENCRYPTION_KEY)
;CURRENT_POS.Database.WriteData(0.005,"IValue","Numbers") ;Returns 1 if succesful. Writes 0.005 to >IValue< in section >Numbers< 
;CURRENT_POS.Database.ReadData("IValue","Numbers",5) ;Returns  Data from >IValue< in section >Numbers< with a default of >5<




