FORCE_AUTHENTICATION := true
ENCRYPTION_KEY := "wefgweg5t45334g3j98j894gt"
MAIN_SIZEw := A_ScreenWidth
MAIN_SIZEh := A_ScreenHeight-50
;Directorys
FOLDER_ACCOUNTS := A_ScriptDir . "\data\Accounts\"
FOLDER_MAIN := A_ScriptDir . "\data\Main\"
FOLDER_ADMIN := A_ScriptDir . "\data\Admin\"
FOLDER_THEME := A_ScriptDir . "\data\Theme\"
;GUI Names
MAIN_GUI_NAME := "BlackBook"
AUTH_GUI_NAME := "Authenticator"
LOGGER_GUI_NAME := "Logger"
SALES_GUI_NAME := "Process Sales"
CLIENTS_GUI_NAME := "Client Explorer"
ADMIN_GUI_NAME := "Admin Tools"
PRODUCTS_GUI_NAME := "Product Explorer"
TRANSACTIONS_GUI_NAME := "Transaction Explorer"
VENTURES_GUI_NAME := "Venture Explorer"
SETTINGS_GUI_NAME := "Settings"
Memo_GUI_NAME := "Memo Explorer"
;GUI Colors
GUI_COLOR0 := "020202"
GUI_COLOR1 := "6985A5"
GUI_COLOR2 := "F4F4F9"
GUI_COLOR3 := "212227"
GUI_COLOR4 := "648381"
GUI_COLOR5 := "134552"
GUI_COLOR6 := "27CFF4"
MAIN_GUI_COLOR := GUI_COLOR0
AUTH_GUI_COLOR := GUI_COLOR4
OTHER_GUI_COLOR := GUI_COLOR6
LOGGER_GUI_COLOR := GUI_COLOR0

;Layout Vars
MESSAGE_SEP := "::"

;OnMessage(0x3,"WM_Move")
;OnMessage(0x216,"WM_Move")  ;WM_Moving