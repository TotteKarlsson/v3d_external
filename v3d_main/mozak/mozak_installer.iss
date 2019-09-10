; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Vaa3D-Mozak"
#define MyAppVersion "0.5.2"
#define MyAppPublisher "Allen Institute"
#define MyAppURL "http://www.example.com/"
#define MyAppExeName "vaa3d_msvc.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{5577C27F-94CD-46FE-8B6F-CDF8006721F1}}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppVerName={#MyAppName}_{#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppName}
DisableProgramGroupPage=yes
OutputBaseFilename={#MyAppName}-{#MyAppVersion}
OutputDir=\\aibsfileprint\public\MozakReleases
Compression=lzma
SolidCompression=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "C:\v3d\v3d_external\v3d_main\v3d\release\vaa3d_msvc.exe";         DestDir: "{app}"; Flags: ignoreversion
Source: "C:\v3d\v3d_external\v3d_main\v3d\release\*.dll";   DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\v3d\v3d_external\v3d_main\v3d\release\*.dll";   DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "VERSION.txt";                                      DestDir: "{app}"; DestName: "MOZAK_VERSION.txt"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "CHANGELOG.txt";                                    DestDir: "{app}"; DestName: "MOZAK_CHANGELOG.txt"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\pDisk\libs\QT\4.8.6\bin\QtCore4.dll";   DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\pDisk\libs\QT\4.8.6\bin\QtGui4.dll";   DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\pDisk\libs\QT\4.8.6\bin\QtNetwork4.dll";   DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\pDisk\libs\QT\4.8.6\bin\QtOpenGL4.dll";   DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\pDisk\libs\QT\4.8.6\bin\QtSvg4.dll";   DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\pDisk\libs\QT\4.8.6\bin\QtXml4.dll";   DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\pDisk\libs\QT\4.8.6\plugins\imageformats\qgif4.dll";   DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\pDisk\libs\QT\4.8.6\plugins\imageformats\qico4.dll";   DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\pDisk\libs\QT\4.8.6\plugins\imageformats\qjpeg4.dll";   DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\pDisk\libs\QT\4.8.6\plugins\imageformats\qmng4.dll";   DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\pDisk\libs\QT\4.8.6\plugins\imageformats\qsvg4.dll";   DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\pDisk\libs\QT\4.8.6\plugins\imageformats\qtga4.dll";   DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\pDisk\libs\QT\4.8.6\plugins\imageformats\qtiff4.dll";   DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\pDisk\vsbuild\bin\aiGameControllerAPI.dll";   DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\pDisk\vsbuild\bin\dslFoundation.dll";   DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\pDisk\vsbuild\bin\poco_foundation.dll";   DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\pDisk\vsbuild\bin\tinyxml2.dll";   DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\pDisk\vsbuild\bin\ai3DXLib.dll";   DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs


; NOTE: Don't use "Flags: ignoreversion" on any shared system files
[Icons]
Name: "{commonprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent
