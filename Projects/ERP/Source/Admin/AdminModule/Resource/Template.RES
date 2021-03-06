        ��  ��                  �  8   ��
 T E M P L A T E _ D P K         0         package TemplatePackage;

{$R *.res}
{$IFDEF IMPLICITBUILDING This IFDEF should not be used by users}
{$ALIGN 8}
{$ASSERTIONS ON}
{$BOOLEVAL OFF}
{$DEBUGINFO OFF}
{$EXTENDEDSYNTAX ON}
{$IMPORTEDDATA ON}
{$IOCHECKS ON}
{$LOCALSYMBOLS ON}
{$LONGSTRINGS ON}
{$OPENSTRINGS ON}
{$OPTIMIZATION OFF}
{$OVERFLOWCHECKS OFF}
{$RANGECHECKS OFF}
{$REFERENCEINFO ON}
{$SAFEDIVIDE OFF}
{$STACKFRAMES ON}
{$TYPEDADDRESS OFF}
{$VARSTRINGCHECKS ON}
{$WRITEABLECONST OFF}
{$MINENUMSIZE 1}
{$IMAGEBASE $400000}
{$DEFINE DEBUG}
{$ENDIF IMPLICITBUILDING}
{$RUNONLY}
{$IMPLICITBUILD ON}

requires
  rtl,
  vcl,
  ERP.Package.CustomForm;

contains
  TemplateForm in 'Sources\TemplateForm.pas' {frmTemplate};

end.
  �0  <   ��
 T E M P L A T E _ D P R O J         0         ﻿<Project xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <PropertyGroup>
        <ProjectGuid>{11111111-1111-1111-1111-111111111111}</ProjectGuid>
        <MainSource>TemplatePackage.dpk</MainSource>
        <ProjectVersion>15.4</ProjectVersion>
        <FrameworkType>VCL</FrameworkType>
        <Base>True</Base>
        <Config Condition="'$(Config)'==''">Debug</Config>
        <Platform Condition="'$(Platform)'==''">Win32</Platform>
        <TargetedPlatforms>1</TargetedPlatforms>
        <AppType>Package</AppType>
    </PropertyGroup>
    <PropertyGroup Condition="'$(Config)'=='Base' or '$(Base)'!=''">
        <Base>true</Base>
    </PropertyGroup>
    <PropertyGroup Condition="('$(Platform)'=='Android' and '$(Base)'=='true') or '$(Base_Android)'!=''">
        <Base_Android>true</Base_Android>
        <CfgParent>Base</CfgParent>
        <Base>true</Base>
    </PropertyGroup>
    <PropertyGroup Condition="('$(Platform)'=='iOSDevice' and '$(Base)'=='true') or '$(Base_iOSDevice)'!=''">
        <Base_iOSDevice>true</Base_iOSDevice>
        <CfgParent>Base</CfgParent>
        <Base>true</Base>
    </PropertyGroup>
    <PropertyGroup Condition="('$(Platform)'=='iOSSimulator' and '$(Base)'=='true') or '$(Base_iOSSimulator)'!=''">
        <Base_iOSSimulator>true</Base_iOSSimulator>
        <CfgParent>Base</CfgParent>
        <Base>true</Base>
    </PropertyGroup>
    <PropertyGroup Condition="('$(Platform)'=='Win32' and '$(Base)'=='true') or '$(Base_Win32)'!=''">
        <Base_Win32>true</Base_Win32>
        <CfgParent>Base</CfgParent>
        <Base>true</Base>
    </PropertyGroup>
    <PropertyGroup Condition="'$(Config)'=='Debug' or '$(Cfg_1)'!=''">
        <Cfg_1>true</Cfg_1>
        <CfgParent>Base</CfgParent>
        <Base>true</Base>
    </PropertyGroup>
    <PropertyGroup Condition="('$(Platform)'=='Win32' and '$(Cfg_1)'=='true') or '$(Cfg_1_Win32)'!=''">
        <Cfg_1_Win32>true</Cfg_1_Win32>
        <CfgParent>Cfg_1</CfgParent>
        <Cfg_1>true</Cfg_1>
        <Base>true</Base>
    </PropertyGroup>
    <PropertyGroup Condition="'$(Config)'=='Release' or '$(Cfg_2)'!=''">
        <Cfg_2>true</Cfg_2>
        <CfgParent>Base</CfgParent>
        <Base>true</Base>
    </PropertyGroup>
    <PropertyGroup Condition="'$(Base)'!=''">
        <PreBuildEvent><![CDATA[brcc32.exe -v "$(PROJECTDIR)\Resource\Icon.rc"
$(PreBuildEvent)]]></PreBuildEvent>
        <DCC_DcpOutput>$(ERPPATH)\Bin\$(Platform)\DCP\</DCC_DcpOutput>
        <SanitizedProjectName>TemplatePackage</SanitizedProjectName>
        <DCC_BplOutput>$(ERPPATH)\Bin\$(Platform)\Modules\</DCC_BplOutput>
        <DCC_UnitSearchPath>$(ERPPATH)\Bin\$(Platform)\DCP\;$(DCC_UnitSearchPath)</DCC_UnitSearchPath>
        <GenDll>true</GenDll>
        <GenPackage>true</GenPackage>
        <DCC_Namespace>System;Xml;Data;Datasnap;Web;Soap;Vcl;Vcl.Imaging;Vcl.Touch;Vcl.Samples;Vcl.Shell;$(DCC_Namespace)</DCC_Namespace>
        <DCC_CBuilderOutput>All</DCC_CBuilderOutput>
        <RuntimeOnlyPackage>true</RuntimeOnlyPackage>
        <DCC_DcuOutput>$(ERPPATH)\Bin\$(Platform)\DCU\</DCC_DcuOutput>
        <DCC_ExeOutput>.\$(Platform)\$(Config)</DCC_ExeOutput>
        <DCC_E>false</DCC_E>
        <DCC_N>false</DCC_N>
        <DCC_S>false</DCC_S>
        <DCC_F>false</DCC_F>
        <DCC_K>false</DCC_K>
    </PropertyGroup>
    <PropertyGroup Condition="'$(Base_Android)'!=''">
        <DCC_CBuilderOutput>None</DCC_CBuilderOutput>
    </PropertyGroup>
    <PropertyGroup Condition="'$(Base_iOSDevice)'!=''">
        <DCC_CBuilderOutput>None</DCC_CBuilderOutput>
    </PropertyGroup>
    <PropertyGroup Condition="'$(Base_iOSSimulator)'!=''">
        <DCC_CBuilderOutput>None</DCC_CBuilderOutput>
    </PropertyGroup>
    <PropertyGroup Condition="'$(Base_Win32)'!=''">
        <VerInfo_Locale>1033</VerInfo_Locale>
        <VerInfo_IncludeVerInfo>true</VerInfo_IncludeVerInfo>
        <DCC_Namespace>Winapi;System.Win;Data.Win;Datasnap.Win;Web.Win;Soap.Win;Xml.Win;Bde;$(DCC_Namespace)</DCC_Namespace>
        <VerInfo_Keys>CompanyName=;FileDescription=;FileVersion=1.0.0.0;InternalName=;LegalCopyright=;LegalTrademarks=;OriginalFilename=;ProductName=;ProductVersion=1.0.0.0;Comments=</VerInfo_Keys>
    </PropertyGroup>
    <PropertyGroup Condition="'$(Cfg_1)'!=''">
        <DCC_Define>DEBUG;$(DCC_Define)</DCC_Define>
        <DCC_DebugDCUs>true</DCC_DebugDCUs>
        <DCC_Optimize>false</DCC_Optimize>
        <DCC_GenerateStackFrames>true</DCC_GenerateStackFrames>
        <DCC_DebugInfoInExe>true</DCC_DebugInfoInExe>
        <DCC_RemoteDebug>true</DCC_RemoteDebug>
    </PropertyGroup>
    <PropertyGroup Condition="'$(Cfg_1_Win32)'!=''">
        <VerInfo_IncludeVerInfo>true</VerInfo_IncludeVerInfo>
        <VerInfo_Locale>1033</VerInfo_Locale>
        <DCC_RemoteDebug>false</DCC_RemoteDebug>
    </PropertyGroup>
    <PropertyGroup Condition="'$(Cfg_2)'!=''">
        <DCC_LocalDebugSymbols>false</DCC_LocalDebugSymbols>
        <DCC_Define>RELEASE;$(DCC_Define)</DCC_Define>
        <DCC_SymbolReferenceInfo>0</DCC_SymbolReferenceInfo>
        <DCC_DebugInformation>0</DCC_DebugInformation>
    </PropertyGroup>
    <ItemGroup>
        <DelphiCompile Include="$(MainSource)">
            <MainSource>MainSource</MainSource>
        </DelphiCompile>
        <DCCReference Include="rtl.dcp"/>
        <DCCReference Include="vcl.dcp"/>
        <DCCReference Include="ERP.Package.CustomForm.dcp"/>
        <DCCReference Include="Sources\TemplateForm.pas">
            <Form>frmTemplate</Form>
        </DCCReference>
        <BuildConfiguration Include="Release">
            <Key>Cfg_2</Key>
            <CfgParent>Base</CfgParent>
        </BuildConfiguration>
        <BuildConfiguration Include="Base">
            <Key>Base</Key>
        </BuildConfiguration>
        <BuildConfiguration Include="Debug">
            <Key>Cfg_1</Key>
            <CfgParent>Base</CfgParent>
        </BuildConfiguration>
    </ItemGroup>
    <ProjectExtensions>
        <Borland.Personality>Delphi.Personality.12</Borland.Personality>
        <Borland.ProjectType>Package</Borland.ProjectType>
        <BorlandProject>
            <Delphi.Personality>
                <Excluded_Packages>
                    <Excluded_Packages Name="$(BDSBIN)\dcloffice2k200.bpl">Microsoft Office 2000 Sample Automation Server Wrapper Components</Excluded_Packages>
                    <Excluded_Packages Name="$(BDSBIN)\dclofficexp200.bpl">Microsoft Office XP Sample Automation Server Wrapper Components</Excluded_Packages>
                </Excluded_Packages>
                <Source>
                    <Source Name="MainSource">TemplatePackage.dpk</Source>
                </Source>
            </Delphi.Personality>
            <Deployment/>
            <Platforms>
                <Platform value="Android">False</Platform>
                <Platform value="iOSDevice">False</Platform>
                <Platform value="iOSSimulator">False</Platform>
                <Platform value="Win32">True</Platform>
                <Platform value="Win64">False</Platform>
            </Platforms>
        </BorlandProject>
        <ProjectFileVersion>12</ProjectFileVersion>
    </ProjectExtensions>
    <Import Project="$(BDS)\Bin\CodeGear.Delphi.Targets" Condition="Exists('$(BDS)\Bin\CodeGear.Delphi.Targets')"/>
    <Import Project="$(APPDATA)\Embarcadero\$(BDSAPPDATABASEDIR)\$(PRODUCTVERSION)\UserTools.proj" Condition="Exists('$(APPDATA)\Embarcadero\$(BDSAPPDATABASEDIR)\$(PRODUCTVERSION)\UserTools.proj')"/>
    <PropertyGroup Condition="'$(Config)'=='Debug' And '$(Platform)'=='Android'">
        <PreBuildEvent>brcc32.exe -v &quot;$(PROJECTDIR)\Resource\Icon.rc&quot;</PreBuildEvent>
        <PreBuildEventIgnoreExitCode>False</PreBuildEventIgnoreExitCode>
        <PreLinkEvent/>
        <PreLinkEventIgnoreExitCode>False</PreLinkEventIgnoreExitCode>
        <PostBuildEvent/>
        <PostBuildEventIgnoreExitCode>False</PostBuildEventIgnoreExitCode>
    </PropertyGroup>
    <PropertyGroup Condition="'$(Config)'=='Debug' And '$(Platform)'=='iOSDevice'">
        <PreBuildEvent>brcc32.exe -v &quot;$(PROJECTDIR)\Resource\Icon.rc&quot;</PreBuildEvent>
        <PreBuildEventIgnoreExitCode>False</PreBuildEventIgnoreExitCode>
        <PreLinkEvent/>
        <PreLinkEventIgnoreExitCode>False</PreLinkEventIgnoreExitCode>
        <PostBuildEvent/>
        <PostBuildEventIgnoreExitCode>False</PostBuildEventIgnoreExitCode>
    </PropertyGroup>
    <PropertyGroup Condition="'$(Config)'=='Debug' And '$(Platform)'=='iOSSimulator'">
        <PreBuildEvent>brcc32.exe -v &quot;$(PROJECTDIR)\Resource\Icon.rc&quot;</PreBuildEvent>
        <PreBuildEventIgnoreExitCode>False</PreBuildEventIgnoreExitCode>
        <PreLinkEvent/>
        <PreLinkEventIgnoreExitCode>False</PreLinkEventIgnoreExitCode>
        <PostBuildEvent/>
        <PostBuildEventIgnoreExitCode>False</PostBuildEventIgnoreExitCode>
    </PropertyGroup>
    <PropertyGroup Condition="'$(Config)'=='Debug' And '$(Platform)'=='Win32'">
        <PreBuildEvent>brcc32.exe -v &quot;$(PROJECTDIR)\Resource\Icon.rc&quot;</PreBuildEvent>
        <PreBuildEventIgnoreExitCode>False</PreBuildEventIgnoreExitCode>
        <PreLinkEvent/>
        <PreLinkEventIgnoreExitCode>False</PreLinkEventIgnoreExitCode>
        <PostBuildEvent/>
        <PostBuildEventIgnoreExitCode>False</PostBuildEventIgnoreExitCode>
    </PropertyGroup>
    <PropertyGroup Condition="'$(Config)'=='Debug' And '$(Platform)'=='Win64'">
        <PreBuildEvent>brcc32.exe -v &quot;$(PROJECTDIR)\Resource\Icon.rc&quot;</PreBuildEvent>
        <PreBuildEventIgnoreExitCode>False</PreBuildEventIgnoreExitCode>
        <PreLinkEvent/>
        <PreLinkEventIgnoreExitCode>False</PreLinkEventIgnoreExitCode>
        <PostBuildEvent/>
        <PostBuildEventIgnoreExitCode>False</PostBuildEventIgnoreExitCode>
    </PropertyGroup>
    <PropertyGroup Condition="'$(Config)'=='Release' And '$(Platform)'=='Android'">
        <PreBuildEvent>brcc32.exe -v &quot;$(PROJECTDIR)\Resource\Icon.rc&quot;</PreBuildEvent>
        <PreBuildEventIgnoreExitCode>False</PreBuildEventIgnoreExitCode>
        <PreLinkEvent/>
        <PreLinkEventIgnoreExitCode>False</PreLinkEventIgnoreExitCode>
        <PostBuildEvent/>
        <PostBuildEventIgnoreExitCode>False</PostBuildEventIgnoreExitCode>
    </PropertyGroup>
    <PropertyGroup Condition="'$(Config)'=='Release' And '$(Platform)'=='iOSDevice'">
        <PreBuildEvent>brcc32.exe -v &quot;$(PROJECTDIR)\Resource\Icon.rc&quot;</PreBuildEvent>
        <PreBuildEventIgnoreExitCode>False</PreBuildEventIgnoreExitCode>
        <PreLinkEvent/>
        <PreLinkEventIgnoreExitCode>False</PreLinkEventIgnoreExitCode>
        <PostBuildEvent/>
        <PostBuildEventIgnoreExitCode>False</PostBuildEventIgnoreExitCode>
    </PropertyGroup>
    <PropertyGroup Condition="'$(Config)'=='Release' And '$(Platform)'=='iOSSimulator'">
        <PreBuildEvent>brcc32.exe -v &quot;$(PROJECTDIR)\Resource\Icon.rc&quot;</PreBuildEvent>
        <PreBuildEventIgnoreExitCode>False</PreBuildEventIgnoreExitCode>
        <PreLinkEvent/>
        <PreLinkEventIgnoreExitCode>False</PreLinkEventIgnoreExitCode>
        <PostBuildEvent/>
        <PostBuildEventIgnoreExitCode>False</PostBuildEventIgnoreExitCode>
    </PropertyGroup>
    <PropertyGroup Condition="'$(Config)'=='Release' And '$(Platform)'=='Win32'">
        <PreBuildEvent>brcc32.exe -v &quot;$(PROJECTDIR)\Resource\Icon.rc&quot;</PreBuildEvent>
        <PreBuildEventIgnoreExitCode>False</PreBuildEventIgnoreExitCode>
        <PreLinkEvent/>
        <PreLinkEventIgnoreExitCode>False</PreLinkEventIgnoreExitCode>
        <PostBuildEvent/>
        <PostBuildEventIgnoreExitCode>False</PostBuildEventIgnoreExitCode>
    </PropertyGroup>
    <PropertyGroup Condition="'$(Config)'=='Release' And '$(Platform)'=='Win64'">
        <PreBuildEvent>brcc32.exe -v &quot;$(PROJECTDIR)\Resource\Icon.rc&quot;</PreBuildEvent>
        <PreBuildEventIgnoreExitCode>False</PreBuildEventIgnoreExitCode>
        <PreLinkEvent/>
        <PreLinkEventIgnoreExitCode>False</PreLinkEventIgnoreExitCode>
        <PostBuildEvent/>
        <PostBuildEventIgnoreExitCode>False</PostBuildEventIgnoreExitCode>
    </PropertyGroup>
</Project>
   �  8   ��
 T E M P L A T E _ R E S         0                 ��  ��                  @      �� ��     0 	        @4   V S _ V E R S I O N _ I N F O     ���                 ?                         �    S t r i n g F i l e I n f o   |    0 4 0 9 0 4 E 4   0   F i l e V e r s i o n     1 . 0 . 0 . 0   4   P r o d u c t V e r s i o n   1 . 0 . 0 . 0   D    V a r F i l e I n f o     $    T r a n s l a t i o n     	�   <   ��
 P L A T F O R M T A R G E T S       0 	           ~  <   ��
 T E M P L A T E _ I M G 1 6         0                  h     (                                                                                                 4����������������������������������̋                       8��������������������������������������ڥ8AF                   8������������������������������������������ǧ               8����������������������������������������������Ƌ              8������������������������������������������������              8������������������������������������������������              8������������������������������������������������              8������������������������������������������������              8������������������������������������������������              8������������������������������������������������              8������������������������������������������������              8������������������������������������������������              8������������������������������������������������              8������������������������������������������������                 *   *   *   *   *   *   *   *   *   *   *   &       ��  �  �  �  �  �  �  �  �  �  �  �  �  �  �  ��    �  <   ��
 T E M P L A T E _ I M G 3 2         0                    �     (       @                                                                                                                                                                                                                                                                                                       R�������������������������������������������������������������������~   
                                                      ^����������������������������������������������������������������������͟                                                  ^��������������������������������������������������������������������������ع7BE                                             ^��������������������������������������������������������������������������������<FK                                         ^������������������������������������������������������������������������������������#,1                                      ^��������������������������������������������������������������������������������������ù                                  ^��������������������������������������������������������������������������������������������                                 ^������������������������������������������������������������������������������������������������                             ^������������������������������������������������������������������������������������������������                             ^������������������������������������������������������������������������������������������������                              ^������������������������������������������������������������������������������������������������                              ^������������������������������������������������������������������������������������������������                              ^������������������������������������������������������������������������������������������������                              ^������������������������������������������������������������������������������������������������                              ^������������������������������������������������������������������������������������������������                              ^������������������������������������������������������������������������������������������������                              ^������������������������������������������������������������������������������������������������                              ^������������������������������������������������������������������������������������������������                              ^������������������������������������������������������������������������������������������������                              ^������������������������������������������������������������������������������������������������                              ^������������������������������������������������������������������������������������������������                              ^������������������������������������������������������������������������������������������������                              ^������������������������������������������������������������������������������������������������                              ^������������������������������������������������������������������������������������������������                              ^������������������������������������������������������������������������������������������������                              ^������������������������������������������������������������������������������������������������                              ^������������������������������������������������������������������������������������������������                              \������������������������������������������������������������������������������������������������                           
   6   J   J   J   J   J   J   J   J   J   J   J   J   J   J   J   J   J   J   J   J   J   J   J   @                                                                                                                     ��������� �� �� ��  ��  �  ?�  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  �  ��������  f   4   ��
 T E M P L A T E _ R C       0         TfrmTemplate16 ICON "..\Img\TemplatePackage16.ico"
TfrmTemplate32 ICON "..\Img\TemplatePackage32.ico"  m  8   ��
 T E M P L A T E _ D F M         0         object frmTemplate: TfrmTemplate
  Left = 0
  Top = 0
  Caption = 'frmTemplate'
  ClientHeight = 300
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
end
   �  8   ��
 T E M P L A T E _ P A S         0         unit TemplateForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  ERP.Package.CustomForm.TERPCustomForm,
  ERP.Package.ClientInterface.IERPClientData,
  ERP.Package.ClientInterface.IModuleInfo,
  ERP.Package.ClientInterface.IModuleAccess;

type
  TfrmTemplate = class(TERPCustomForm)
  private
    { Private declarations }
  public
    constructor Create(aERPClientData: IERPClientData); reintroduce;
  end;

function CreateForm(aERPClientData: IERPClientData): THandle; stdcall;
function GetIcon(aSize: Integer): THandle; stdcall;
procedure RegisterAccess(aModuleAccess: IModuleAccess); stdcall;
procedure SetModuleInfo(aModuleInfo: IModuleInfo); stdcall;

exports CreateForm;
exports GetIcon;
exports RegisterAccess;
exports SetModuleInfo;

implementation

{$R *.dfm}
{$R Resource\Icon.res}

uses
  ERP.Package.CustomClasses.Consts;

const
  MODULE_NAME            = '����� ������';
  MODULE_BAR             = '������ �� ������� ��� ����� ������';
  MODULE_PAGE            = '�������';
  MODULE_GUID: TGUID     = '{00000000-0000-0000-0000-000000000000}';
  MODULE_TYPEDB          = MODULE_TYPEDB_PATTERN;

function CreateForm(aERPClientData: IERPClientData): THandle;
var
  frmForm: TfrmTemplate;
begin
  frmForm := TfrmTemplate.Create(aERPClientData);
  Result := frmForm.Handle;
end;

function GetIcon(aSize: Integer): THandle;
begin
  case aSize of
  16:
    Result := LoadIcon(HInstance, PChar(Format('%s%d', [TfrmTemplate.ClassName, 16])));
  32:
    Result := LoadIcon(HInstance, PChar(Format('%s%d', [TfrmTemplate.ClassName, 32])));
  else
    Result := 0;
  end;
end;

procedure SetModuleInfo(aModuleInfo: IModuleInfo);
begin
  aModuleInfo.GUID := MODULE_GUID;
  aModuleInfo.Name := MODULE_NAME;
  aModuleInfo.PageName := MODULE_PAGE;
  aModuleInfo.BarName := MODULE_BAR;
  aModuleInfo.TypeDB := MODULE_TYPEDB;
  aModuleInfo.TypeGuid := MODULE_TYPEMODULE_PATTERN;
end;

procedure RegisterAccess(aModuleAccess: IModuleAccess);
begin
end;

{ TfrmTemplate }

constructor TfrmTemplate.Create(aERPClientData: IERPClientData);
begin
  inherited Create(MODULE_NAME, aERPClientData);
end;

end.
 