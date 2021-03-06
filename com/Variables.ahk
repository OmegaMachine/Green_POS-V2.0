PROGRAM_VERSION := "1.5.1"
CHECK_FOR_UPDATES := true
USE_INTERNET_TIME := false
FORCE_AUTHENTICATION := true
TRANSACT_SESSIONS := true
ALLOW_DEBT_TRANSACTIONS := true
MEMO_TO_ADD := false
NOTIFY_MEMO_APPENDED := true

ENCRYPT_DATA := true
ENCRYPT_DATAVALUES := ENCRYPT_DATA
ENCRYPT_DATAKEYS := ENCRYPT_DATA

ENCRYPT_TRANSACTIONS := true
ENCRYPT_TRANSACTIONDATA := ENCRYPT_TRANSACTIONS
ENCRYPT_TRANSACTIONKEYS := ENCRYPT_TRANSACTIONS

INITIAL_SHAREVALUE := 0.01



TRANSACTIONS_HIDE_SESSION := true
ENCRYPTION_KEY := getEncryptionKey()
MAIN_SIZEw := A_ScreenWidth
MAIN_SIZEh := A_ScreenHeight-50
;Directorys
FOLDER_ACCOUNTS := A_ScriptDir . "\data\Accounts\"
FileCreateDir, %FOLDER_ACCOUNTS%
FOLDER_MAIN := A_ScriptDir . "\data\Main\"
FileCreateDir, %FOLDER_MAIN%
FOLDER_INVESTOR := A_ScriptDir . "\data\INVESTOR\"
FileCreateDir, %FOLDER_INVESTOR%
FOLDER_THEME := A_ScriptDir . "\Theme\"
FileCreateDir, %FOLDER_THEME%
FOLDER_TRANSACTIONS := A_ScriptDir . "\data\Transactions\"
FileCreateDir, %FOLDER_TRANSACTIONS%
FOLDER_VENTURES := A_ScriptDir . "\data\Ventures\"
FileCreateDir, %FOLDER_VENTURES%
;GUI Names
MAIN_GUI_NAME := "BlackBook"
AUTH_GUI_NAME := "Authenticator"
LOGGER_GUI_NAME := "Logger"
SALES_GUI_NAME := "Process Sales"
CLIENTS_GUI_NAME := "Client Explorer"
INVESTOR_GUI_NAME := "Investor Explorer"
PRODUCTS_GUI_NAME := "Product Explorer"
TRANSACTIONS_GUI_NAME := "Transaction Explorer"
VENTURES_GUI_NAME := "Venture Explorer"
SETTINGS_GUI_NAME := "Settings"
Memo_GUI_NAME := "Memo Explorer"
OVERVIEW_GUI_NAME := "BlackBook Overview"
;GUI Colors
GUI_COLOR0 := "020202"
GUI_COLOR1 := "6985A5"
GUI_COLOR2 := "F4F4F9"
GUI_COLOR3 := "212227"
GUI_COLOR4 := "648381"
GUI_COLOR5 := "134552"
GUI_COLOR6 := "27CFF4"
GUI_COLOR7 := "e5e5e5"

GUI_Colors := "ff0000|020202|6985A5|F4F4F9|212227|212227|648381|134552|27CFF4|e5e5e5"
;GUI_Colors := "ff0000"
MAIN_GUI_COLOR := GUI_COLOR0
;MAIN_GUI_COLOR := _ListRandom(GUI_Colors)
AUTH_GUI_COLOR := GUI_COLOR4
OTHER_GUI_COLOR := GUI_COLOR7
LOGGER_GUI_COLOR := GUI_COLOR0
OVERVIEW_GUI_COLOR := OTHER_GUI_COLOR
;Layout Vars
MESSAGE_SEP := "::"

;OnMessage(0x3,"WM_Move")
;OnMessage(0x216,"WM_Move")  ;WM_Moving