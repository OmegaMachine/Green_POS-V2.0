ReturnHtml(XID){
Z:="http://services.runescape.com/m=itemdb_oldschool/viewitem?obj=" . XID
	URLDownloadToFile,%Z%,%A_ScriptDir%\Temp\Temp.html
FileRead,HtmlFile,%A_ScriptDir%\Temp\Temp.html
FileDelete,%A_ScriptDir%\Temp\Temp.html
	return HtmlFile
}

ReturnTag(Html,StartTag,EndTag){
	Q:=StartTag . "(.*)" . EndTag
	FoundPos := RegExMatch(Html,Q,FoundPos2)
	StringLen,Tag1L,StartTag
	StringLen,Tag2L,EndTag
	StringTrimLeft,FoundPos2,FoundPos2,%Tag1L%
	StringTrimRight,FoundPos2,FoundPos2,%Tag2L%
	return FoundPos2
}