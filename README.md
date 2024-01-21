# AutoIT Scripts for automating Enterprise Vault installers

This repository contains some simple AutoIT scripts that I wrote for automating some of the Enterprise Vault product installers back in 2012.

For example:

EV Outlook Add-in was a third-party component that was installed into Microsoft Outlook 2000, 2003, 2010 to provide additional functionality.

## Scripts:

- Install the Outlook Add-in (install using defaults)
- Install the Outlook Add-in (install to custom folder)
- Install the Outlook Add-in (work in progress)
- Install the Enterprise Vault API Runtime (install using defaults)

## Virtualization

I used these scripts to quickly test new builds within a virtual machine (VM). My default virtualization tools at the time were:

1. **VMware Workstation**

For when I was running installers on my local machine.

2. **VMware ESX Server / Lab Manager**

For when I was running the installers as part of a larger suite of Build Verification Tests (BVT).

## Usage

1. Ensure the required prerequisites are installed on the machine or VM (rollback to a known state as required).
2. Create a working folder
3. Copy the AutoIT au3 files to the working folder
4. Copy the product installers to the working folder
5. Run the AutoIT script 

## AutoIT v3

AutoIt v3 is a freeware BASIC-like scripting language designed for automating the Windows GUI and general scripting. It uses a combination of simulated keystrokes, mouse movement and window/control manipulation in order to automate tasks in a way not possible or reliable with other languages (e.g. VBScript and SendKeys). AutoIt is also very small, self-contained and will run on all versions of Windows out-of-the-box with no annoying “runtimes” required!

AutoIt was initially designed for PC “roll out” situations to reliably automate and configure thousands of PCs. Over time it has become a powerful language that supports complex expressions, user functions, loops and everything else that veteran scripters would expect.

[Official Website: AutoIt v3](https://www.autoitscript.com/site/autoit/downloads/)


# LEGAL NOTES
## Disclaimer
All named product and company names are trademarks (™) or registered (®) trademarks of their respective holders. Use of them does not imply any affiliation with or endorsement by them.
