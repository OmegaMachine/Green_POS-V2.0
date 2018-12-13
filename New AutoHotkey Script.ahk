
Gui, Font, S14 CDefault Bold Underline, Verdana
Gui, Add, Text, x2 y0 w370 h25 +BackgroundTrans +Center, Settings
Gui, Font, , 
Gui, Add, Tab2, x2 y20 w370 h520 , Account Settings|BlackBook Settings
Gui, Tab, Account Settings
Gui, Add, GroupBox, x12 y60 w350 h90 , Change Password
Gui, Add, Text, x22 y80 w80 h20 , Account Name
Gui, Add, Edit, x102 y80 w90 h20 , Edit
Gui, Add, Text, x22 y100 w80 h20 , Old Password
Gui, Add, Edit, x102 y100 w90 h20 , Edit
Gui, Add, Text, x192 y80 w80 h20 , New Password
Gui, Add, Edit, x272 y80 w80 h20 , Edit
Gui, Add, Text, x192 y100 w80 h20 , Repeat
Gui, Add, Edit, x272 y100 w80 h20 , Edit
Gui, Add, Button, x272 y120 w80 h20 , Change
Gui, Show, w374 h542, % this._Name
return

