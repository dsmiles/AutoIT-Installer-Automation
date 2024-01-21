; ============================================================================
; Title .........: InstallAddinDefaultPath.au3
; Description ...: EV Outlook Add-in Installer - using defaults
; Date: .........: 29 July 2012
; AutoIt Version : 3.0
; Language ......: English
; Platform ......: Windows XP, Server 2008
; Author(s) .....: David Smiles
; ============================================================================

#include "include\library.au3"

; Define $TheProgram to start

;$TheProgram = "Symantec Enterprise Vault Outlook Add-in.msi"
$TheProgram = "Setup.exe"

; Text string for window title and window content searches
$WindowTitleText 		="Symantec Enterprise Vault Outlook Add-In"
$WelcomeText			="Welcome to the Symantec Enterprise Vault Outlook Add-In Setup"
$EULAText				="End-User License Agreement"
$EULAAccept				="I &accept the terms in the License Agreement"
$InstallLocation		="Installation location"
$ChangeInstallLocation	="Change destination folder"
$ReadyToInstall			="Ready to Install"
$InstallingText			="Installing Symantec Enterprise Vault Outlook Add-In"
$FinishText				="Click the Finish button to exit the Setup."

; Button text
$OKButton				="OK"
$BackButton				="&Back"
$NextButton				="&Next"
$CancelButton			="Cancel"
$BrowseButton			="B&rowse..."
$InstallButton			="&Install"
$FinishButton			="&Finish"

; Disable mouse and keyboard
;BlockInput (1)

; Run installer
;Run($TheProgram)

StartSUT($WindowTitleText, $TheProgram, $WelcomeText)

; Control window 1 - Close programs welcome window
WaitForWindow($WindowTitleText, $WelcomeText)
_ScreenShot("welcome")
ControlClick ($WindowTitleText, $WelcomeText, $NextButton)
Sleep(1000)

; Control window 2 - Licence agreement
WaitForWindow($WindowTitleText, $EULAText)
ControlClick ($WindowTitleText, $EULAText, $EULAAccept)
ControlClick ($WindowTitleText, $EULAText, $NextButton)
Sleep(1000)

; Control window 3 - Installation location
WaitForWindow($WindowTitleText, $InstallLocation)
ControlClick ($WindowTitleText, $InstallLocation, $NextButton)
Sleep(1000)

 ; Control window 4 - Ready to Install
WaitForWindow($WindowTitleText, $ReadyToInstall)
ControlClick ($WindowTitleText, $ReadyToInstall, $InstallButton)
Sleep(1000)

; Control window 5 - Installing
WaitForWindow($WindowTitleText, $InstallingText)
WinWaitClose($WindowTitleText, $InstallingText)

; Control window 6 - Finish and exit
WaitForWindow($WindowTitleText, $FinishText)
ControlClick ($WindowTitleText, $FinishText, $FinishButton)

; Enable mouse and keyboard
;BlockInput (0)

; Finished!
Exit


; Control window 3.1 - Change destination folder
Func ChangeInstallFolder($folder)

   ; Control window 3.1 - Change destination folder
   ControlClick ($WindowTitleText, $InstallLocation, $BrowseButton)
   Sleep(1000)

   ; Control window 3.1 - Change destination folder
   WaitForWindow($WindowTitleText, $ChangeInstallLocation)
   Send("!f")
   Sleep(1000)
   Send($folder)
   ControlClick ($WindowTitleText, $ChangeInstallLocation, $OKButton)
   Sleep(1000)
EndFunc   ;==>ChangeInstallFolder
