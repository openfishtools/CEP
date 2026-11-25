#define MyAppName       "OpenFishTools"
#ifndef MyAppVersion
  #define MyAppVersion  "1.3.10"
#endif
#define MyAppPublisher  "cutefishaep"
#define MyAppURL        "https://github.com/openfishtools/CEP"
#define MyBundleID      "com.cutefish.tools"
#define MySourceRoot    "..\.."

[Setup]
AppId={{5C7AD4D0-3A23-4675-A387-A35D3488030A}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppVerName={#MyAppName} v{#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={userappdata}\Adobe\CEP\extensions\{#MyAppName}
UsePreviousAppDir=no
DirExistsWarning=no
DisableDirPage=yes
DisableProgramGroupPage=yes
DefaultGroupName={#MyAppName}
OutputDir=.
OutputBaseFilename={#MyAppName}_Setup
SetupIconFile=SetupIcon.ico
Compression=lzma2/max
SolidCompression=no
LZMANumBlockThreads=4
VersionInfoCompany={#MyAppPublisher}
VersionInfoDescription={#MyAppName} CEP Extension Installer
VersionInfoTextVersion={#MyAppVersion}
VersionInfoCopyright=Copyright (c) 2026 {#MyAppPublisher}
VersionInfoProductName={#MyAppName}
PrivilegesRequired=lowest
PrivilegesRequiredOverridesAllowed=
UninstallDisplayName={#MyAppName} v{#MyAppVersion}
CreateUninstallRegKey=yes
UninstallDisplayIcon={app}\SetupIcon.ico
LicenseFile=..\..\LICENSE
WizardStyle=modern
WizardResizable=no
ShowLanguageDialog=no
ShowTasksTreeLines=yes
MinVersion=10.0

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Messages]
WelcomeLabel1=Welcome to the [name] Setup Wizard
WelcomeLabel2=This wizard will install [name/ver], a CEP extension for Adobe After Effects into your user folder (no administrator privileges required).%n%nPlease close Adobe After Effects before continuing.%n%nPlayerDebugMode will be enabled automatically for CC 2017 through CC 2027+.%n%nDisclaimer: OpenFishTools is an independent extension. Adobe and After Effects are trademarks of Adobe Inc. OpenFishTools is not affiliated with or endorsed by Adobe Inc.
FinishedHeadingLabel=Installation Complete
FinishedLabel=OpenFishTools has been installed successfully to your user CEP extensions folder.%n%nOpen Adobe After Effects and select Window > Extensions > Fish Tools to launch the panel.

[Files]
Source: "{#MySourceRoot}\CSXS\*";   DestDir: "{app}\CSXS";   Flags: recursesubdirs createallsubdirs ignoreversion
Source: "{#MySourceRoot}\client\*"; DestDir: "{app}\client"; Flags: recursesubdirs createallsubdirs ignoreversion
Source: "{#MySourceRoot}\host\*";   DestDir: "{app}\host";   Flags: recursesubdirs createallsubdirs ignoreversion
Source: "{#MySourceRoot}\data\*";   DestDir: "{app}\data";   Flags: recursesubdirs createallsubdirs ignoreversion
Source: "{#MySourceRoot}\Logo.svg"; DestDir: "{app}";         Flags: ignoreversion
Source: "SetupIcon.ico";            DestDir: "{app}";         Flags: ignoreversion

[Registry]
Root: HKCU; Subkey: "Software\Adobe\CSXS.7";  ValueType: string; ValueName: "PlayerDebugMode"; ValueData: "1"; Flags: createvalueifdoesntexist
Root: HKCU; Subkey: "Software\Adobe\CSXS.8";  ValueType: string; ValueName: "PlayerDebugMode"; ValueData: "1"; Flags: createvalueifdoesntexist
Root: HKCU; Subkey: "Software\Adobe\CSXS.9";  ValueType: string; ValueName: "PlayerDebugMode"; ValueData: "1"; Flags: createvalueifdoesntexist
Root: HKCU; Subkey: "Software\Adobe\CSXS.10"; ValueType: string; ValueName: "PlayerDebugMode"; ValueData: "1"; Flags: createvalueifdoesntexist
Root: HKCU; Subkey: "Software\Adobe\CSXS.11"; ValueType: string; ValueName: "PlayerDebugMode"; ValueData: "1"; Flags: createvalueifdoesntexist
Root: HKCU; Subkey: "Software\Adobe\CSXS.12"; ValueType: string; ValueName: "PlayerDebugMode"; ValueData: "1"; Flags: createvalueifdoesntexist
Root: HKCU; Subkey: "Software\Adobe\CSXS.13"; ValueType: string; ValueName: "PlayerDebugMode"; ValueData: "1"; Flags: createvalueifdoesntexist
Root: HKCU; Subkey: "Software\Adobe\CSXS.14"; ValueType: string; ValueName: "PlayerDebugMode"; ValueData: "1"; Flags: createvalueifdoesntexist
Root: HKCU; Subkey: "Software\Adobe\CSXS.15"; ValueType: string; ValueName: "PlayerDebugMode"; ValueData: "1"; Flags: createvalueifdoesntexist
Root: HKCU; Subkey: "Software\Adobe\CSXS.16"; ValueType: string; ValueName: "PlayerDebugMode"; ValueData: "1"; Flags: createvalueifdoesntexist

Root: HKCU; Subkey: "Software\Wow6432Node\Adobe\CSXS.7";  ValueType: string; ValueName: "PlayerDebugMode"; ValueData: "1"; Flags: createvalueifdoesntexist
Root: HKCU; Subkey: "Software\Wow6432Node\Adobe\CSXS.8";  ValueType: string; ValueName: "PlayerDebugMode"; ValueData: "1"; Flags: createvalueifdoesntexist
Root: HKCU; Subkey: "Software\Wow6432Node\Adobe\CSXS.9";  ValueType: string; ValueName: "PlayerDebugMode"; ValueData: "1"; Flags: createvalueifdoesntexist
Root: HKCU; Subkey: "Software\Wow6432Node\Adobe\CSXS.10"; ValueType: string; ValueName: "PlayerDebugMode"; ValueData: "1"; Flags: createvalueifdoesntexist
Root: HKCU; Subkey: "Software\Wow6432Node\Adobe\CSXS.11"; ValueType: string; ValueName: "PlayerDebugMode"; ValueData: "1"; Flags: createvalueifdoesntexist
Root: HKCU; Subkey: "Software\Wow6432Node\Adobe\CSXS.12"; ValueType: string; ValueName: "PlayerDebugMode"; ValueData: "1"; Flags: createvalueifdoesntexist
Root: HKCU; Subkey: "Software\Wow6432Node\Adobe\CSXS.13"; ValueType: string; ValueName: "PlayerDebugMode"; ValueData: "1"; Flags: createvalueifdoesntexist
Root: HKCU; Subkey: "Software\Wow6432Node\Adobe\CSXS.14"; ValueType: string; ValueName: "PlayerDebugMode"; ValueData: "1"; Flags: createvalueifdoesntexist
Root: HKCU; Subkey: "Software\Wow6432Node\Adobe\CSXS.15"; ValueType: string; ValueName: "PlayerDebugMode"; ValueData: "1"; Flags: createvalueifdoesntexist
Root: HKCU; Subkey: "Software\Wow6432Node\Adobe\CSXS.16"; ValueType: string; ValueName: "PlayerDebugMode"; ValueData: "1"; Flags: createvalueifdoesntexist

[Code]
var
  RemoveDebugMode: Boolean;

function InitializeSetup(): Boolean;
var
  OldAdminDir: String;
  ErrorCode: Integer;
begin
  Result := True;

  if CheckForMutexes('Adobe After Effects') then begin
    MsgBox(
      'Adobe After Effects appears to be running.' + #13#10 +
      'Please close it before continuing the installation.' + #13#10#13#10 +
      'The installer will continue, but you must restart After Effects afterwards.',
      mbInformation,
      MB_OK
    );
  end;

  OldAdminDir := ExpandConstant('{commonpf32}\Common Files\Adobe\CEP\extensions\{#MyAppName}');
  if DirExists(OldAdminDir) then begin
    if MsgBox(
      'An old OpenFishTools installation was found in the After Effects admin/system folder:' + #13#10 +
      OldAdminDir + #13#10#13#10 +
      'OpenFishTools now installs into your user folder (no admin required, supports smoother updates).' + #13#10 +
      'Do you want to remove the old installation from the admin folder? (Administrator permission will be requested.)',
      mbConfirmation,
      MB_YESNO or MB_DEFBUTTON1
    ) = idYes then begin
      if not ShellExec(
        'runas',
        'cmd.exe',
        '/c rmdir /s /q "' + OldAdminDir + '"',
        '',
        SW_HIDE,
        ewWaitUntilTerminated,
        ErrorCode
      ) then begin
        MsgBox(
          'Could not obtain administrator privileges to delete the old admin folder (code ' + IntToStr(ErrorCode) + ').' + #13#10 +
          'Setup will continue installing into your user folder.',
          mbError,
          MB_OK
        );
      end else if DirExists(OldAdminDir) then begin
        MsgBox(
          'The old admin folder could not be completely removed:' + #13#10 +
          OldAdminDir + #13#10 +
          'You may remove it manually later to avoid duplicate panels in After Effects.',
          mbInformation,
          MB_OK
        );
      end;
    end;
  end;
end;

function InitializeUninstall(): Boolean;
begin
  Result := True;
  if MsgBox(
    'Do you want to remove Adobe CEP PlayerDebugMode settings from your user registry?' + #13#10 +
    'Select "Yes" to remove it (this may affect other custom or unsigned CEP extensions).' + #13#10 +
    'Select "No" to only remove OpenFishTools and keep PlayerDebugMode enabled.',
    mbConfirmation,
    MB_YESNO or MB_DEFBUTTON2
  ) = idYes then begin
    RemoveDebugMode := True;
  end else begin
    RemoveDebugMode := False;
  end;
end;

procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep);
begin
  if CurUninstallStep = usUninstall then begin
    if RemoveDebugMode then begin
      RegDeleteValue(HKCU, 'Software\Adobe\CSXS.7', 'PlayerDebugMode');
      RegDeleteValue(HKCU, 'Software\Adobe\CSXS.8', 'PlayerDebugMode');
      RegDeleteValue(HKCU, 'Software\Adobe\CSXS.9', 'PlayerDebugMode');
      RegDeleteValue(HKCU, 'Software\Adobe\CSXS.10', 'PlayerDebugMode');
      RegDeleteValue(HKCU, 'Software\Adobe\CSXS.11', 'PlayerDebugMode');
      RegDeleteValue(HKCU, 'Software\Adobe\CSXS.12', 'PlayerDebugMode');
      RegDeleteValue(HKCU, 'Software\Adobe\CSXS.13', 'PlayerDebugMode');
      RegDeleteValue(HKCU, 'Software\Adobe\CSXS.14', 'PlayerDebugMode');
      RegDeleteValue(HKCU, 'Software\Adobe\CSXS.15', 'PlayerDebugMode');
      RegDeleteValue(HKCU, 'Software\Adobe\CSXS.16', 'PlayerDebugMode');

      RegDeleteValue(HKCU, 'Software\Wow6432Node\Adobe\CSXS.7', 'PlayerDebugMode');
      RegDeleteValue(HKCU, 'Software\Wow6432Node\Adobe\CSXS.8', 'PlayerDebugMode');
      RegDeleteValue(HKCU, 'Software\Wow6432Node\Adobe\CSXS.9', 'PlayerDebugMode');
      RegDeleteValue(HKCU, 'Software\Wow6432Node\Adobe\CSXS.10', 'PlayerDebugMode');
      RegDeleteValue(HKCU, 'Software\Wow6432Node\Adobe\CSXS.11', 'PlayerDebugMode');
      RegDeleteValue(HKCU, 'Software\Wow6432Node\Adobe\CSXS.12', 'PlayerDebugMode');
      RegDeleteValue(HKCU, 'Software\Wow6432Node\Adobe\CSXS.13', 'PlayerDebugMode');
      RegDeleteValue(HKCU, 'Software\Wow6432Node\Adobe\CSXS.14', 'PlayerDebugMode');
      RegDeleteValue(HKCU, 'Software\Wow6432Node\Adobe\CSXS.15', 'PlayerDebugMode');
      RegDeleteValue(HKCU, 'Software\Wow6432Node\Adobe\CSXS.16', 'PlayerDebugMode');
    end;
  end;

  if CurUninstallStep = usPostUninstall then begin
    if RemoveDebugMode then begin
      MsgBox(
        'OpenFishTools has been uninstalled.' + #13#10#13#10 +
        'Note: User PlayerDebugMode registry values have been removed.' + #13#10 +
        'If you have other unsigned CEP extensions, you may need to re-enable PlayerDebugMode manually.',
        mbInformation,
        MB_OK
      );
    end else begin
      MsgBox(
        'OpenFishTools has been uninstalled.' + #13#10#13#10 +
        'PlayerDebugMode registry values were kept intact.',
        mbInformation,
        MB_OK
      );
    end;
  end;
end;
