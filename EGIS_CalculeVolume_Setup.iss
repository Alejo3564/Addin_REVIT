; EGIS Smart Tools - Calcule Volume
; Installer script for Inno Setup.
;
; Expected folder layout (place this .iss file here, alongside these two items):
;   D:\2_ALEJO\APP_BIM\REVIT\CALCULE VOLUME\Installer\
;     |-- EGIS_CalculeVolume_Setup.iss   (this file)
;     |-- EGIS_CalculeVolume\            (compiled output: .dll, .pdb, etc.)
;     |-- EGIS_CalculeVolume.addin
;
; Compile with: open this file in Inno Setup Compiler and click "Compile"
; (or run ISCC.exe "EGIS_CalculeVolume_Setup.iss" from a command line).
; The finished installer .exe is written next to this script.

#define MyAppName "EGIS Calcule Volume"
#define MyAppVersion "1.1.0"
#define MyAppPublisher "Egis"
#define MyRevitYear "2026"

[Setup]
AppId={{9E2B7C1A-4F3D-4E1B-8C6A-1D2E3F4A5B6C}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL=https://www.egis-group.com
DefaultDirName={userappdata}\Autodesk\Revit\Addins\{#MyRevitYear}\EGIS_CalculeVolume
DisableProgramGroupPage=yes
DisableDirPage=yes
DisableReadyPage=yes
DisableFinishedPage=no
PrivilegesRequired=lowest
Uninstallable=no
CreateUninstallRegKey=no
Compression=lzma
SolidCompression=yes
OutputDir=.
OutputBaseFilename=EGIS_CalculeVolume_Setup
WizardStyle=modern
ShowLanguageDialog=no
DisableWelcomePage=no

; No custom icons anywhere in this installer:
;  - no SetupIconFile (uses Inno Setup's own default icon for the .exe)
;  - no [Icons] section (no Start Menu / Desktop shortcuts are created)

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
; The compiled add-in folder goes straight into {app}, which already points to
; ...\Addins\2026\EGIS_CalculeVolume
Source: "EGIS_CalculeVolume\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs

; The .addin manifest goes one level up, directly in ...\Addins\2026
Source: "EGIS_CalculeVolume.addin"; DestDir: "{userappdata}\Autodesk\Revit\Addins\{#MyRevitYear}"; Flags: ignoreversion

[Code]
function InitializeSetup(): Boolean;
begin
  Result := True;
end;

procedure InitializeWizard;
begin
  WizardForm.WelcomeLabel1.Caption := 'EGIS Smart Tools' + Chr(13) + Chr(10) + 'Calcule Volume';
  WizardForm.WelcomeLabel2.Caption :=
    'This will install the EGIS Calcule Volume add-in for Autodesk Revit {#MyRevitYear}.' + Chr(13) + Chr(10) + Chr(13) + Chr(10) +
    'No administrator privileges are required.' + Chr(13) + Chr(10) + Chr(13) + Chr(10) +
    'Click Next to continue.';
end;
