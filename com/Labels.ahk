2GuiClose:
ExitApp
return
3GuiClose:
Gui,3: Destroy
Gui,3: +Parent2
Gui,3: Show, w300 h200 ,%AUTH_GUI_NAME%
return