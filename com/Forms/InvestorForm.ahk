CREATE_NEW_INVESTOR:
Gui,4:Submit,NoHide
clearField(INVESTOR_NEW_NAME)
clearField(INVESTOR_NEW_EMAIL)
clearField(INVESTOR_NEW_PW)
clearField(INVESTOR_NEW_PWREPEAT)
CURRENT_POS.Investors.attemptCreate(INVESTOR_NEW_NAME,INVESTOR_NEW_PW,INVESTOR_NEW_PWREPEAT)
return
SELECT_INVESTOR:
Gui,4:Submit,NoHide
GuiControl,,_InvestorName,%Investor_List%
GuiControl,,_JoinDate,% CURRENT_POS.Investors.getInvestorStat("JoinDate",Investor_List)
return