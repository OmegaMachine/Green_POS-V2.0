Class SettingsInterface{
	__New(InterfaceName){
global
		this._Name := InterfaceName


	}

destroyInterface(){
Gui,11:Destroy
return
}

openInterface(){
	global
this.destroyInterface()
		Menu, tray, Icon , %FOLDER_THEME%Settings_Icon.ico, 1, 1
Gui,11: Color , %OTHER_GUI_COLOR%
Gui,11:    +LastFound +MaximizeBox +Owner2 
AuthH := WinExist()
Gui,11: Font, S14 CDefault Bold Underline, Verdana
Gui,11: Add, Text, x2 y0 w370 h25 +BackgroundTrans +Center, Settings
Gui,11: Font, , 
Gui,11: Add, Tab2, x2 y20 w370 h520 , Account Settings|BlackBook Settings|Theme
Gui,11: Tab, Account Settings
;-----------------------------------------------------------Change Password
Gui,11: Add, GroupBox, x12 y60 w350 h90 , Change Password

Gui,11: Add, Text, x22 y80 w80 h20 , Account Name
Gui,11: Add, Edit, x102 y80 w90 h20 vSettings_ChangePassword_Name,

Gui,11: Add, Text, x22 y100 w80 h20 , My Password
Gui,11: Add, Edit, x102 y100 w90 h20 +Password vSettings_ChangePassword_MyPW,

Gui,11: Add, Text, x192 y80 w80 h20 , New Password
Gui,11: Add, Edit, x272 y80 w80 h20 +Password vSettings_ChangePassword_NewPW,

Gui,11: Add, Text, x192 y100 w80 h20 , Repeat
Gui,11: Add, Edit, x272 y100 w80 h20 +Password vSettings_ChangePassword_NewPWRepeat,

Gui,11: Add, Button, x272 y120 w80 h20 , Change
;-----------------------------------------------------------Change Password

;-----------------------------------------------------------Toggles
;Gui,11: Add, GroupBox, x12 y160 w350 h120 , Toggles


;-----------------------------------------------------------Toggles

Gui,11: Tab, BlackBook Settings
Gui,11: Add, GroupBox, x12 y60 w350 h180 , Toggle Settings

;---------------------Left Column
Gui,11: Add, CheckBox, x22 y80 w160 h20 vSettings_CheckUpdates_Toggle +Checked%CHECK_FOR_UPDATES%, Check For Updates
Gui,11: Add, CheckBox, x22 y100 w160 h20 vSettings_ForceAuthentication_Toggle +Checked%FORCE_AUTHENTICATION%, Force Authentication
Gui,11: Add, CheckBox, x22 y120 w160 h20 vSettings_NotifyMemo_Toggle +Checked%NOTIFY_MEMO_APPENDED%,Notify When Memo Used
Gui,11: Add, CheckBox, x22 y140 w160 h20 vSettings_AllowDebt_Toggle +Checked%ALLOW_DEBT_TRANSACTIONS%,Allow Debt



;---------------------Right Column
Gui,11: Add, CheckBox, x184 y80 w160 h20 vSettings_UseInternet_Toggle +Checked%USE_INTERNET_TIME%, Use Internet Time
Gui,11: Add, CheckBox, x184 y100 w160 h20 vSettings_TransactSessions_Toggle +Checked%TRANSACT_SESSIONS%, Transact Sessions
Gui,11: Add, CheckBox, x184 y120 w160 h20 vSettings_HideSessions_Toggle +Checked%TRANSACTIONS_HIDE_SESSION%, Default Hide Sessions

Gui,11: Add, Button, x272 yp+40 w80 h20 , Save









Gui,11: Tab, Theme
Gui,11: Add, GroupBox, x12 y60 w350 h180 , Theme Settings

;---------------------Left Column
Gui,11: Add, Text, x22 y80 w160 h20 ,Main GUI Color
Gui,11: Add, Text, x22 y100 w160 h20  ,Sales GUI Color
Gui,11: Add, Text, x22 y120 w160 h20  ,Transactions GUI Color
Gui,11: Add, Text, x22 y140 w160 h20  ,Settings GUI Color



;---------------------Right Column
Gui,11: Add, ComboBox, x184 y80 w160 h80 vSettings_Theme_Main Choose%MAIN_GUI_COLOR%,% MAIN_GUI_COLOR . "||" . GUI_Colors
Gui,11: Add, ComboBox, x184 y100 w160 h80 vSettings_Theme_Sales Choose%OTHER_GUI_COLOR%,% OTHER_GUI_COLOR . "||" . GUI_Colors
Gui,11: Add, ComboBox, x184 y120 w160 h80 vSettings_Theme_Transactions Choose%OTHER_GUI_COLOR%,% OTHER_GUI_COLOR . "||" . GUI_Colors
Gui,11: Add, ComboBox, x184 y140 w160 h80 vSettings_Theme_Settings Choose%OTHER_GUI_COLOR%,% OTHER_GUI_COLOR . "||" . GUI_Colors


Gui,11: Add, Button, x272 yp+40 w80 h20 , Save










Gui,11: Show, w374 h542, % this._Name
		
	DllCall("SetParent", "uint", AuthH, "uint", MainH)
return
}




}