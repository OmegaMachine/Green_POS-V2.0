Class MainInterface{
	__New(InterfaceName){
global
		this._Name := InterfaceName
		Gui,2: Add, Tab2, x2 y0 w1090 h590 vTabControl, Tab1|Tab2
		Gui,2: Add, Text, x5 y100 w100 h30 vText1,heya
		Gui,2: Show, w1100 h600 ,% this._Name
	}
	_Authenticated := false
	_authAs := 0
	_Components := "TabControl"
	
	
	
	
	
	
	
	Lock_Components(){
		Gui,2:Default
		h:=this._Components
		Loop,Parse,h,CSV
{
	GuiControl,Hide,%A_LoopField%
}
	}
	
	Unlock_Components(){
		Gui,2:Default
		h:=this._Components
		Loop,Parse,h,CSV
{
	GuiControl,Show,%A_LoopField%
}
	}
	

HideInterface(){
Gui,2:Hide
return
}
ShowInterface(){
Gui,2:Show
return
}

}