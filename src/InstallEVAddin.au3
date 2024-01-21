;
; AutoIt Version: 3.0
; Language:       English
; Platform:       Windows XP, Server 2008
; Author:         David Smiles
;
; Script Function:
;   My library of useful functions
;

#cs ----------------------------------------------------------------------------
EV Outlook Add-in Installer - using defaults
#ce ----------------------------------------------------------------------------

; Define $TheProgram

;$TheProgram = "Symantec Enterprise Vault Outlook Add-in.msi"
$TheProgram = "Setup.exe"
$Title = "Symantec Enterprise Vault Outlook Add-In"

; Disable mouse and keyboard
;BlockInput (1)

; Run installer
Run($TheProgram)

; Make the windows active
;WinActive("Symantec Enterprise Vault Outlook Add-In")

; Control window 1 - Close programs welcome window
WinWaitActive("Symantec Enterprise Vault Outlook Add-In", "Welcome to the Symantec Enterprise Vault Outlook Add-In Setup")
ControlClick ("Symantec Enterprise Vault Outlook Add-In", "Welcome to the Symantec Enterprise Vault Outlook Add-In Setup", "&Next")
Sleep(1000)

; Control window 2 - Licence agreement
WinWaitActive("Symantec Enterprise Vault Outlook Add-In", "End-User License Agreement ")
ControlClick ("Symantec Enterprise Vault Outlook Add-In", "End-User License Agreement ", "I &accept the terms in the License Agreement")
ControlClick ("Symantec Enterprise Vault Outlook Add-In", "End-User License Agreement", "&Next")
Sleep(1000)

; Control window 3 - Installation location
WinWaitActive("Symantec Enterprise Vault Outlook Add-In", "Installation location")
ControlClick ("Symantec Enterprise Vault Outlook Add-In", "Installation location", "&Next")
Sleep(1000)

 ; Control window 4 - Ready to Install
WinWaitActive("Symantec Enterprise Vault Outlook Add-In", "Ready to Install")
ControlClick ("Symantec Enterprise Vault Outlook Add-In", "Ready to Install", "&Install")
Sleep(1000)

; Control window 5 - Installing
WinWaitActive("Symantec Enterprise Vault Outlook Add-In", "Installing Symantec Enterprise Vault Outlook Add-In")
WinWaitClose("Symantec Enterprise Vault Outlook Add-In", "Installing Symantec Enterprise Vault Outlook Add-In")

; Control window 6 - Finish and exit
WinWaitActive("Symantec Enterprise Vault Outlook Add-In", "Click the Finish button to exit the Setup.")
ControlClick ("Symantec Enterprise Vault Outlook Add-In", "Click the Finish button to exit the Setup.", "&Finish")

; Enable mouse and keyboard
;BlockInput (0)

; Finished!
Exit
