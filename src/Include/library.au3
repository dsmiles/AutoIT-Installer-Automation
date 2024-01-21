; ============================================================================
; Title .........: library.au3
; Description ...: My library of useful functions
; Date ......... : 01 August 2012
; AutoIt Version : 3.3.8.1++
; Language ......: English
; Author(s) .....: David Smiles
; ============================================================================

#include-once

#include <ScreenCapture.au3>
#include <Date.au3>
#include <File.au3>

; Set global options
;AutoItSetOption("MustDeclareVars", 1)		;1=Variables must be pre-declared, 0=Variables don't need to be pre-declared (default)
AutoItSetOption("WinWaitDelay",200)			;200 milliseconds
AutoItSetOption("WinTitleMatchMode",2)		;1=start (default), 2=substring, 3=exact, 4=advanced, -1 to -4=Nocase
AutoItSetOption("WinDetectHiddenText",0)	;0=don't detect (default), 1=do detect
AutoItSetOption("MouseCoordMode",2)			;1=absolute, 0=relative, 2=client
AutoItSetOption("TrayIconDebug",1)			;0=no info, 1=debug line info
AutoItSetOption("SendKeyDelay",200)			;200 milliseconds

; Set global variables
Global $WinWaitTimeOut = 60					; seconds
Global $DEBUG = TRUE
Global $CurrentLine = 0;
Global $ErrorMessage = ""


; #FUNCTION# =================================================================
; Name...........: StartSUT
; Description ...: Start the system under test (SUT) if not already running.
; Parameters ....: $sWindowTitle: The window title of the SUT.
; 				   $sExeName: The name of the executable file.
;				   $sWindowText: Additional text that must appear in the SUT
;				                window (optional).
; Return values .:
; ============================================================================

Func _StartSUT($sWindowTitle, $sExeName, $sWindowText = "")
	If Not WinExists($sWindowTitle, $sWindowText) Then
		Run($sExeName)
	EndIf
	WinWait($sWindowTitle, $sWindowText)
	If Not WinActive($sWindowTitle, $sWindowText) Then
		WinActivate($sWindowTitle, $sWindowText)
	EndIf
	WinWaitActive($sWindowTitle, $sWindowText)
EndFunc ;==>StartSUT


; #FUNCTION# =================================================================
; Name...........: _WindowActivate
; Description ...: Screen Shot function
; Parameters ....:
; Return values .:
; ============================================================================
Func _ScreenShot($sCaption)
	; Capture full screen
	$hBmp = _ScreenCapture_Capture("")

	; _NowCalc() Returns the current Date and Time in format YYYY/MM/DD HH:MM:SS
	; for use in date calculations.
	$sDateTime =  StringReplace(_NowCalc(), "/", "")
	$sDateTime =  StringReplace($sDateTime, ":", "")
	$sDateTime =  StringReplace($sDateTime, " ", "_")

	$FileName = @WorkingDir & "\\" & $sCaption & $sDateTime & ".jpg"

	; Save bitmap to file
	_ScreenCapture_SaveImage($FileName, $hBMP)
EndFunc   ;==>_ScreenShot


; #FUNCTION# =================================================================
; Name...........: _WindowActivate
; Description ...: Tries to activate a window with provided title
; Parameters ....:
; Return values .:
; ============================================================================
Func _WindowActivate($sTitle, $sText = "")
	IF WinActive($sTitle, $sText) = 0 Then
		$ErrorMessage = StringFormat("Window not found %s", $sTitle)
		Exit(1)
	EndIf
EndFunc   ;==>_WindowActivate


; #FUNCTION# =================================================================
; Name...........: _WindowWait
; Description ...: Waits for a window with provided title then activate it.
; Parameters ....:
; Return values .:
; ============================================================================
Func _WindowWait ( $sTitle, $sText = "" )
	IF WinWait ( $sTitle, $sText, $WinWaitTimeOut ) = 0 THEN
		$ErrorMessage = StringFormat("Window not found %s", $sTitle)
		Exit(1)
	EndIf

	IF WinWaitActive($sTitle, $sText, 5) = 0 Then
		$ErrorMessage = StringFormat("Window not found %s", $sTitle)
		Exit(1)
	EndIf
EndFunc   ;==>_WindowWait


; #FUNCTION# =================================================================
; Name...........: WaitForWindow
; Description ...: Window Active and Wait
; Parameters ....:
; Return values .:
; ============================================================================
Func _WaitForWindow($sTitle, $sText = "")
	If WinWait($sTitle, $sText, $WinWaitTimeOut) = 0 Then
		$ErrorMessage = StringFormat("Window not found %s", $sTitle)
		Exit(1)
	EndIf

	If WinActive($sTitle, $sText) = 0 Then
		If WinActivate($sTitle, $sText) = 0 Then
			$ErrorMessage = StringFormat("Cannot active window %s", $sTitle)
			Exit(1)
		EndIf
	EndIf

	If WinWaitActive($sTitle, $sText) = 0 Then
		$ErrorMessage = StringFormat("Window not found %s", $sTitle)
		Exit(1)
	EndIf
EndFunc   ;==>WaitForWindow


; #FUNCTION# =================================================================
; Name...........: WaitForWindow2
; Description ...: Window Active and Wait
; Parameters ....:
; Return values .:
; ============================================================================
Func _WaitForWindow2($sTitle, $sText = "")
	WinWait($sTitle, $sText)
	If Not WinActive($sTitle, $sText) Then WinActivate($sTitle, $sText)
	WinWaitActive($sTitle, $sText)

	;Success: Returns handle to the requested window.
	;Failure: Returns 0 if timeout occurred.

	; WinWait

EndFunc   ;==>WaitForWindow2

;
;Give feedback / report functions
;

; #FUNCTION# =================================================================
; Name...........: OnAutoItStart
; Description ...: fill it with start actions
; Parameters ....:
; Return values .:
; ============================================================================
Func OnAutoItStart ( )

EndFunc   ;==>OnAutoItStart

;
; #FUNCTION# =================================================================
; Name...........: OnAutoItExit
; Description ...: if global error message variable is not empty – take screen shot
; Parameters ....:
; Return values .:
; ============================================================================
Func OnAutoItExit ( )
	If $ErrorMessage <> "" Then
		_ScreenShot("img")
	EndIf
	ConsoleWrite($ErrorMessage)
	
	_FileWriteLog(@WorkingDir & "\\debug.log", $ErrorMessage)
EndFunc   ;==>OnAutoItExit

