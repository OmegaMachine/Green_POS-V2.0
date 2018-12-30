Class OverviewInterface{
	__New(InterfaceName){
global
		this._Name := InterfaceName


	}

destroyInterface(){
Gui,8:Destroy
return
}

openInterface(){
	global
this.destroyInterface()
Menu, tray, Icon , %FOLDER_THEME%Main_Icon.ico, 1, 1
Gui,8: Color , %OVERVIEW_GUI_COLOR%
		Gui,20: +LastFound +MaximizeBox +Owner2 
		AuthH := WinExist()

Gui, 20:Font, S14 CDefault Bold Underline, Verdana
Gui, 20:Add, Text, x0 y0 w1218 h30 +Center +BackgroundTrans,BlackBook Overview
Gui, 20:Font, , 




Gui, 20:Font, S10 Bold, 
Gui, 20:Add, GroupBox, x12 y50 w230 h420 , Investors
Gui, 20:Font, , 
Gui, 20:Add, Text, x22 y70 w80 h20 , Total Investors
Gui, 20:Add, Edit, x102 y70 w100 h20 +ReadOnly, 
Gui, 20:Add, Text, x22 y90 w80 h20 , Total Shares
Gui, 20:Add, Edit, x102 y90 w100 h20 +ReadOnly,  % CURRENT_POS.getMainStat("SharesSold")
Gui, 20:Add, Text, x22 y110 w80 h20 , Total Invested
Gui, 20:Add, Edit, x102 y110 w100 h20 +ReadOnly, % CURRENT_POS.getMainStat("Investments")
Gui, 20:Add, Text, x22 y130 w80 h20 , Share Value
Gui, 20:Add, Edit, x102 y130 w100 h20 +ReadOnly,  % CURRENT_POS.getShareValue()
Gui, 20:Add, Text, x22 y150 w80 h20 , Investor Profit
Gui, 20:Add, Edit, x102 y150 w100 h20 +ReadOnly,
Gui, 20:Add, Link, x32 y440 w190 h20 +Center gMODULE_INVESTORS,<a id="A">View Investors...</a>

Gui, 20:Font, S10 Bold, 
Gui, 20:Add, GroupBox, x252 y50 w230 h420 , Ventures
Gui, 20:Font, , 
Gui, 20:Add, Text, x262 y70 w80 h20 , Total Ventures
Gui, 20:Add, Edit, x342 y70 w100 h20 +ReadOnly, 
Gui, 20:Add, Text, x262 y90 w80 h20 , Venture Profit
Gui, 20:Add, Edit, x342 y90 w100 h20 +ReadOnly, 
Gui, 20:Add, Link, x272 y440 w190 h20 +Center gMODULE_VENTURES,<a id="A">View Ventures...</a>

Gui, 20:Font, S10 Bold, 
Gui, 20:Add, GroupBox, x492 y50 w230 h420 , Products
Gui, 20:Font, , 
Gui, 20:Add, Text, x502 y70 w80 h20 , Total Products
Gui, 20:Add, Edit, x582 y70 w100 h20 +ReadOnly, 
Gui, 20:Add, Text, x502 y90 w80 h20 , Total Products
Gui, 20:Add, Edit, x582 y90 w100 h20 +ReadOnly, 
Gui, 20:Add, Link, x512 y440 w190 h20 +Center gMODULE_PRODUCTS,<a id="A">View Products...</a>

Gui, 20:Font, S10 Bold, 
Gui, 20:Add, GroupBox, x732 y50 w230 h420 , Clients
Gui, 20:Font, , 
Gui, 20:Add, Text, x742 y70 w80 h20 , Total Clients
Gui, 20:Add, Edit, x822 y70 w100 h20 +ReadOnly, 
Gui, 20:Add, Text, x742 y90 w80 h20 , Client Debt
Gui, 20:Add, Edit, x822 y90 w100 h20 +ReadOnly, 
Gui, 20:Add, Link, x752 y440 w190 h20 +Center gMODULE_CLIENT,<a id="A">View Clients...</a>

Gui, 20:Font, S10 Bold, 
Gui, 20:Add, GroupBox, x972 y50 w230 h420 , Sales
Gui, 20:Font, ,
Gui, 20:Add, Link, x982 y440 w190 h20 +Center gMODULE_SALES,<a id="A">View Sales...</a>

Gui, 20:Show, w1218 h522,% this._Name

	DllCall("SetParent", "uint", AuthH, "uint", MainH)
return
}




}