; Match app version with VERSION.txt file in mozak folder

#define MyAppName           "Vaa3D-Mozak"
#define MyAppVersion        "0.5.6"
#define MyAppPublisher      "Allen Institute"
#define MyAppURL            "http://www.example.com/"
#define MyAppExeName        "vaa3d_msvc.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId                                 = {{5577C27F-94CD-46FE-8B6F-CDF8006721F1}}
AppName                               = {#MyAppName}
AppVersion                            = {#MyAppVersion}
AppVerName                            = {#MyAppName}_{#MyAppVersion}
AppPublisher                          = {#MyAppPublisher}
AppPublisherURL                       = {#MyAppURL}
AppSupportURL                         = {#MyAppURL}
AppUpdatesURL                         = {#MyAppURL}
DefaultDirName                        = {pf}\{#MyAppName}
DisableProgramGroupPage               = yes
OutputBaseFilename                    = {#MyAppName}-{#MyAppVersion}
OutputDir                             = \\aibsfileprint\public\MozakReleases
Compression                           = lzma
SolidCompression                      = yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "C:\v3d\v3d_external\v3d_main\v3d\release\vaa3d_msvc.exe";    DestDir: "{app}"; Flags: ignoreversion
Source: "C:\v3d\v3d_external\v3d_main\v3d\release\*.dll";             DestDir: "{app}"; Flags: ignoreversion 


;Most used plugins
Source: "C:\v3d\v3d_external\bin\plugins\IVSCC\*.dll";                                      DestDir: "{app}/plugins";                                       Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\v3d\v3d_external\bin\plugins\IVSCC_smoothing_swc\*.dll";                        DestDir: "{app}/plugins/IVSCC_smoothing_swc";                   Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\v3d\v3d_external\bin\plugins\linker_file\*.dll";                                DestDir: "{app}/plugins/linker_file";                           Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\v3d\v3d_external\bin\plugins\AllenNeuron_postprocessing\*.dll";                 DestDir: "{app}/plugins/AllenNeuron_postprocessing";            Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\v3d\v3d_external\bin\plugins\neuron_utilities\assemble_neuron_live\*.dll";      DestDir: "{app}/plugins/neuron_utilities/assemble_neuron_live"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\v3d\v3d_external\bin\plugins\neuron_utilities\inter_node_pruning\*.dll";        DestDir: "{app}/plugins/neuron_utilities/inter_node_pruning";   Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\v3d\v3d_external\bin\plugins\neuron_utilities\pruning_swc_simple\*.dll";        DestDir: "{app}/plugins/neuron_utilities/pruning_swc_simple";   Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\v3d\v3d_external\bin\plugins\neuron_utilities\resample_swc\*.dll";              DestDir: "{app}/plugins/neuron_utilities/resample_swc";         Flags: ignoreversion recursesubdirs createallsubdirs                                                                             
Source: "C:\v3d\v3d_external\bin\plugins\neuron_utilities\typeset_childbranch\*.dll";       DestDir: "{app}/plugins/neuron_utilities/typeset_childbranch";  Flags: ignoreversion recursesubdirs createallsubdirs                                                                             

; ALL plugins
Source: "C:\v3d\v3d_external\bin\plugins\*.dll";                                             DestDir: "{app}/plugins/ALL"; Flags: ignoreversion recursesubdirs createallsubdirs

Source: "VERSION.txt";                                                DestDir: "{app}"; DestName: "MOZAK_VERSION.txt"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "CHANGELOG.txt";                                              DestDir: "{app}"; DestName: "MOZAK_CHANGELOG.txt"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "GracesMozakConfiguration.xml";                               DestDir: "{app}"; DestName: "GracesMozakConfiguration.xml"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "DS4_profile.xml";                                            DestDir: "{app}"; DestName: "DS4_profile.xml"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "MOZAK-CONTROLLERS-HELP.txt";                                 DestDir: "{app}"; DestName: "MOZAK-CONTROLLERS-HELP.txt"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\pDisk\libs\QT\4.8.6\bin\QtCore4.dll";                     DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\pDisk\libs\QT\4.8.6\bin\QtGui4.dll";                      DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\pDisk\libs\QT\4.8.6\bin\QtNetwork4.dll";                  DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\pDisk\libs\QT\4.8.6\bin\QtOpenGL4.dll";                   DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\pDisk\libs\QT\4.8.6\bin\QtSvg4.dll";                      DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\pDisk\libs\QT\4.8.6\bin\QtXml4.dll";                      DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\pDisk\libs\QT\4.8.6\plugins\imageformats\qgif4.dll";      DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\pDisk\libs\QT\4.8.6\plugins\imageformats\qico4.dll";      DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\pDisk\libs\QT\4.8.6\plugins\imageformats\qjpeg4.dll";     DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\pDisk\libs\QT\4.8.6\plugins\imageformats\qmng4.dll";      DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\pDisk\libs\QT\4.8.6\plugins\imageformats\qsvg4.dll";      DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\pDisk\libs\QT\4.8.6\plugins\imageformats\qtga4.dll";      DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\pDisk\libs\QT\4.8.6\plugins\imageformats\qtiff4.dll";     DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

;Game controlle and Space Mouse 
Source: "C:\pDisk\vsbuild\bin\aiGameControllerAPI-vs2013.dll";        DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\pDisk\vsbuild\bin\ai3DXLib-vs2013.dll";                   DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\pDisk\vsbuild\bin\dslFoundation-vs2013.dll";              DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\pDisk\vsbuild\bin\poco_foundation-vs2013.dll";            DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\pDisk\vsbuild\bin\tinyxml2-vs2013.dll";                   DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs


; The configFile UI and related DLL's, BPL's
Source: "C:\pDisk\build\bin\configFileUI.exe";                        DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\pDisk\build\bin\dslFoundation.dll";                       DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\pDisk\build\bin\dslVCLCommon.dll";                        DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\pDisk\build\BPL\dslVCLComponents.bpl";                    DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\pDisk\build\BPL\dslVCLVisualComponents.bpl";              DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\pDisk\build\bin\poco_foundation.dll";                     DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\pDisk\build\bin\tinyxml2.dll";                            DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\pDisk\build\bin\sqlite.dll";                              DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\CodeGear\Tokyo\bin\borlndmm.dll";                         DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\CodeGear\Tokyo\bin\cc32250mt.dll";                        DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\CodeGear\Tokyo\bin\rtl250.bpl";                           DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\CodeGear\Tokyo\bin\vcl250.bpl";                           DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\CodeGear\Tokyo\bin\vclactnband250.bpl";                   DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\CodeGear\Tokyo\bin\vclimg250.bpl";                        DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "C:\CodeGear\Tokyo\bin\vclx250.bpl";                          DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

; NOTE: Don't use "Flags: ignoreversion" on any shared system files
[Icons]
Name: "{commonprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent
