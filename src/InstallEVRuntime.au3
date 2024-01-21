;
; AutoIt Version: 3.0
; Language:       English
; Platform:       Windows XP, Server 2008
; Author:         David Smiles
;
;EV Outlook Add-in Installer - using defaults
;

#include "include\library.au3"

; Define paths to folders, etc.
$TheProgram = "D:\Symantec Enterprise Vault\API Runtime\Symantec Enterprise Vault API Runtime.msi"
$ScreenShotFolder = "C:\OutputFolder"

; Text string for window title and window content searches
$WindowTitleText 		="Symantec Enterprise Vault API Runtime"
$WelcomeText			="Welcome to the Symantec Enterprise Vault API Runtime Setup"
$EULAText				="End-User License Agreement"
$EULAAccept				="I &accept the terms in the License Agreement"
$InstallLocation		="Installation location"
$ChangeInstallLocation	="Change destination folder"
$ReadyToInstall			="Ready to Install"
$InstallingText			="Installing Symantec Enterprise Vault API Runtime"
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
;Run("D:\Symantec Enterprise Vault\API Runtime\Symantec Enterprise Vault API Runtime.msi" )
ShellExecute($TheProgram)

;StartSUT($WindowTitleText, $TheProgram, $WelcomeText)

; Control window 1 - Close programs welcome window
_WindowWait($WindowTitleText, $WelcomeText)
_ScreenShot("Welcome")

ControlClick ($WindowTitleText, $WelcomeText, $NextButton)
Sleep(1000)

; Control window 2 - Licence agreement
_WindowWait($WindowTitleText, $EULAText)
ControlClick ($WindowTitleText, $EULAText, $EULAAccept)
ControlClick ($WindowTitleText, $EULAText, $NextButton)
Sleep(1000)

; Control window 3 - Installation location
_WindowWait($WindowTitleText, $InstallLocation)

ChangeInstallFolder("C:\EV-API-RUNTIME")

ControlClick ($WindowTitleText, $InstallLocation, $NextButton)
Sleep(1000)

 ; Control window 4 - Ready to Install
_WindowWait($WindowTitleText, $ReadyToInstall)
ControlClick ($WindowTitleText, $ReadyToInstall, $InstallButton)
Sleep(1000)

; Control window 5 - Installing
_WindowWait($WindowTitleText, $InstallingText)
WinWaitClose($WindowTitleText, $InstallingText)

; Control window 6 - Finish and exit
_WindowWait($WindowTitleText, $FinishText)
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
   _WindowWait($WindowTitleText, $ChangeInstallLocation)
   Send("!f")
   Sleep(1000)
   Send($folder)
   ControlClick ($WindowTitleText, $ChangeInstallLocation, $OKButton)
   Sleep(1000)
   ControlClick ($WindowTitleText, $ChangeInstallLocation, $OKButton)
EndFunc   ;==>ChangeInstallFolder
