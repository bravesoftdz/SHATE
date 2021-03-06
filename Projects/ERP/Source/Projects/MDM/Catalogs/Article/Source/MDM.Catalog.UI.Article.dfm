object frmMDMArticle: TfrmMDMArticle
  Left = 0
  Top = 0
  Caption = 'frmMDMArticle'
  ClientHeight = 556
  ClientWidth = 969
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Visible = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pcArticle: TcxPageControl
    Left = 0
    Top = 0
    Width = 969
    Height = 556
    Align = alClient
    TabOrder = 0
    Properties.ActivePage = tsClean
    Properties.CustomButtons.Buttons = <>
    OnChange = pcArticleChange
    ClientRectBottom = 552
    ClientRectLeft = 4
    ClientRectRight = 965
    ClientRectTop = 24
    object tsDraft: TcxTabSheet
      Caption = #1063#1077#1088#1085#1086#1074#1080#1082
      ImageIndex = 0
      object cxGridAD: TcxGrid
        Left = 0
        Top = 46
        Width = 762
        Height = 482
        Align = alClient
        TabOrder = 0
        object tblArticleDraft: TCatalogTableViewDraft
          Navigator.Buttons.CustomButtons = <>
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsSelection.MultiSelect = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          OptionsMDM.WebBrowser = wbDraftDetails
          OptionsMDM.ActionOptions.ActionRefresh = acDraftRefresh
          OptionsMDM.ActionOptions.ActionAdd = acDraftAdd
          OptionsMDM.ActionOptions.ActionEdit = acDraftEdit
          OptionsMDM.ActionOptions.ActionDelete = acDraftDelete
          OptionsMDM.ActionOptions.ActionStatusReset = acDraftReset
          OptionsMDM.ActionOptions.ActionStatusReady = acDraftReady
          OptionsMDM.ActionOptions.ActionStatusDelete = acDraftToDelete
          OptionsMDM.ActionOptions.ActionMerge = acDraftMerge
          OptionsMDM.ActionOptions.ActionAnalysis = acDraftAnalysis
          OptionsMDM.ActionOptions.ActionApprove = acDraftApprove
          OptionsMDM.ActionOptions.ActionImport = acDraftImport
          object colDraftId_ArticleDraft: TCatalogDraftColumn
            Visible = False
            HeaderAlignmentHorz = taCenter
            MetaOptions.FieldName = 'Id_ArticleDraft'
            MetaOptions.PK = True
            MetaOptions.ServiceType = stPK
          end
          object colDraftId_Article: TCatalogDraftColumn
            Visible = False
            HeaderAlignmentHorz = taCenter
            MetaOptions.FieldName = 'Id_Article'
            MetaOptions.ServiceType = stPKClean
          end
          object colDraftTradeMarkName: TCatalogDraftColumn
            Caption = #1058#1086#1088#1075#1086#1074#1072#1103' '#1084#1072#1088#1082#1072
            HeaderAlignmentHorz = taCenter
            MetaOptions.FieldName = 'TradeMarkName'
            MetaOptions.ServiceType = stMetaData
          end
          object colDraftNumber: TCatalogDraftColumn
            Caption = #1053#1086#1084#1077#1088
            HeaderAlignmentHorz = taCenter
            MetaOptions.FieldName = 'Number'
            MetaOptions.ServiceType = stMetaData
          end
          object colDraftNumberShort: TCatalogDraftColumn
            Caption = #1050#1086#1088#1086#1090#1082#1080#1081' '#1085#1086#1084#1077#1088
            HeaderAlignmentHorz = taCenter
            MetaOptions.FieldName = 'NumberShort'
            MetaOptions.ServiceType = stMetaData
          end
          object colDraftUserName: TCatalogDraftColumn
            Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
            HeaderAlignmentHorz = taCenter
            MetaOptions.FieldName = 'UserName'
          end
          object colDraftId_StatusDraft: TCatalogDraftColumn
            Caption = #1057#1090#1072#1090#1091#1089
            Visible = False
            HeaderAlignmentHorz = taCenter
            MetaOptions.FieldName = 'Id_StatusDraft'
            MetaOptions.ServiceType = stStatus
          end
          object colDraftStatusName: TCatalogDraftColumn
            Caption = #1057#1090#1072#1090#1091#1089
            HeaderAlignmentHorz = taCenter
            MetaOptions.FieldName = 'StatusName'
          end
          object colDraftVersion: TCatalogDraftColumn
            Caption = #1042#1077#1088#1089#1080#1103
            HeaderAlignmentHorz = taCenter
            MetaOptions.FieldName = 'Version'
          end
          object colDraftAnalysisIcon: TCatalogDraftColumn
            Caption = #1040#1085#1072#1083#1080#1079
            PropertiesClassName = 'TcxImageProperties'
            Properties.GraphicClassName = 'TIcon'
            HeaderAlignmentHorz = taCenter
            MetaOptions.FieldName = 'AnalysisIcon'
          end
          object colDraftCondition: TCatalogDraftColumn
            Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077
            Visible = False
            HeaderAlignmentHorz = taCenter
            MetaOptions.FieldName = 'Condition'
            MetaOptions.ServiceType = stCondition
          end
          object colDraftConditionName: TCatalogDraftColumn
            Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077
            HeaderAlignmentHorz = taCenter
            MetaOptions.FieldName = 'ConditionName'
          end
          object colDraftLabel: TCatalogDraftColumn
            Caption = #1052#1077#1090#1082#1072
            HeaderAlignmentHorz = taCenter
            MetaOptions.FieldName = 'Label'
          end
        end
        object cxLevelAD: TcxGridLevel
          GridView = tblArticleDraft
        end
      end
      object barDockDraft: TdxBarDockControl
        Left = 0
        Top = 0
        Width = 961
        Height = 46
        Align = dalTop
        BarManager = dxBarManager
      end
      object wbDraftDetails: TERPWebBrowser
        Left = 770
        Top = 46
        Width = 191
        Height = 482
        Align = alRight
        TabOrder = 2
        ERPOptions.APProtocolList = <>
        ERPOptions.TemplateList = <>
        ExplicitLeft = 672
        ExplicitHeight = 416
        ControlData = {
          4C000000BE130000D13100000000000000000000000000000000000000000000
          000000004C000000000000000000000001000000E0D057007335CF11AE690800
          2B2E126208000000000000004C0000000114020000000000C000000000000046
          8000000000000000000000000000000000000000000000000000000000000000
          00000000000000000100000000000000000000000000000000000000}
      end
      object cxSplitter1: TcxSplitter
        Left = 762
        Top = 46
        Width = 8
        Height = 482
        AlignSplitter = salRight
        Control = wbDraftDetails
      end
    end
    object tsClean: TcxTabSheet
      Caption = #1063#1080#1089#1090#1086#1074#1080#1082
      ImageIndex = 1
      object cxGridAC: TcxGrid
        Left = 0
        Top = 72
        Width = 653
        Height = 456
        Align = alClient
        TabOrder = 0
        object tblArticleClean: TCatalogTableViewClean
          Navigator.Buttons.CustomButtons = <>
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = #1050#1086#1083'-'#1074#1086': #'
              Kind = skCount
              Column = colCleanId_Article
            end>
          DataController.Summary.SummaryGroups = <>
          Filtering.ColumnFilteredItemsList = True
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsSelection.MultiSelect = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          OptionsMDM.WebBrowser = wbCleanDetails
          OptionsMDM.ActionOptions.ActionRefresh = acCleanRefresh
          OptionsMDM.ActionOptions.ActionMoveToDraft = acCleanMoveToDraft
          OptionsMDM.ActionOptions.ActionCopyFrom = acCleanCopyFrom
          OptionsMDM.ActionOptions.ActionRestore = acCleanRestore
          OptionsMDM.ActionOptions.ActionExport = acCleanExport
          object colCleanId_Article: TCatalogCleanColumn
            Caption = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088
            HeaderAlignmentHorz = taCenter
            MetaOptions.FieldName = 'Id_Article'
            MetaOptions.PK = True
            MetaOptions.ServiceType = stPK
          end
          object colCleanTradeMarkName: TCatalogCleanColumn
            Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            HeaderAlignmentHorz = taCenter
            MetaOptions.FieldName = 'TradeMarkName'
            MetaOptions.ServiceType = stMetaData
          end
          object colCleanNumber: TCatalogCleanColumn
            Caption = #1055#1086#1083#1085#1086#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            HeaderAlignmentHorz = taCenter
            MetaOptions.FieldName = 'Number'
            MetaOptions.ServiceType = stMetaData
          end
          object colCleanNumberShort: TCatalogCleanColumn
            Caption = #1054#1088#1080#1075#1080#1085#1072#1083
            HeaderAlignmentHorz = taCenter
            MetaOptions.FieldName = 'NumberShort'
            MetaOptions.ServiceType = stMetaData
          end
          object colCleanVersion: TCatalogCleanColumn
            Caption = #1042#1077#1088#1089#1080#1103
            HeaderAlignmentHorz = taCenter
            MetaOptions.FieldName = 'Version'
          end
          object colCleanEnabled: TCatalogCleanColumn
            Caption = #1056#1072#1079#1088#1077#1096#1077#1085#1072
            PropertiesClassName = 'TcxCheckBoxProperties'
            Properties.NullStyle = nssUnchecked
            HeaderAlignmentHorz = taCenter
            MetaOptions.FieldName = 'Enabled'
            MetaOptions.ServiceType = stEnabled
          end
          object colCleanCountDraft: TCatalogCleanColumn
            Caption = #1050#1086#1083'-'#1074#1086' '#1095#1077#1088#1085#1086#1074#1080#1082#1086#1074
            HeaderAlignmentHorz = taCenter
            MetaOptions.FieldName = 'CountDraft'
          end
        end
        object cxLevelAC: TcxGridLevel
          GridView = tblArticleClean
        end
      end
      object barDockTM: TdxBarDockControl
        Left = 0
        Top = 26
        Width = 961
        Height = 46
        Align = dalTop
        BarManager = dxBarManager
      end
      object wbCleanDetails: TERPWebBrowser
        Left = 661
        Top = 72
        Width = 300
        Height = 456
        Align = alRight
        TabOrder = 2
        ERPOptions.APProtocolList = <
          item
            NameProtocol = 'myhttp'
          end>
        ERPOptions.TemplateList = <
          item
            TemplateFile = 'D:\ERP\Win32\Debug ERP\Templates\2.html'
            TemplateName = 'Test1'
          end
          item
            TemplateFile = 'D:\ERP\Win32\Debug ERP\Templates\1.html'
            TemplateName = 'Test2'
          end>
        ExplicitLeft = 659
        ControlData = {
          4C000000021F0000212F00000000000000000000000000000000000000000000
          000000004C000000000000000000000001000000E0D057007335CF11AE690800
          2B2E126208000000000000004C0000000114020000000000C000000000000046
          8000000000000000000000000000000000000000000000000000000000000000
          00000000000000000100000000000000000000000000000000000000}
      end
      object cxSplitter2: TcxSplitter
        Left = 653
        Top = 72
        Width = 8
        Height = 456
        AlignSplitter = salRight
        Control = wbCleanDetails
      end
      object dxBarDockControl1: TdxBarDockControl
        Left = 0
        Top = 0
        Width = 961
        Height = 26
        Align = dalTop
        BarManager = dxBarManager
      end
    end
  end
  object ilImage32: TcxImageList
    Height = 32
    Width = 32
    FormatVersion = 1
    DesignInfo = 22937644
  end
  object dxBarManager: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    CanCustomize = False
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.LargeImages = ilImage32
    NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 48
    Top = 288
    DockControlHeights = (
      0
      0
      0
      0)
    object barDraft: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      Caption = 'Custom 2'
      CaptionButtons = <>
      DockControl = barDockDraft
      DockedDockControl = barDockDraft
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 905
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'btnDraftAdd'
        end
        item
          Visible = True
          ItemName = 'btnDraftEdit'
        end
        item
          Visible = True
          ItemName = 'btnDraftDelete'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'btnDraftRefresh'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'btnDraftReset'
        end
        item
          Visible = True
          ItemName = 'btnDraftReady'
        end
        item
          Visible = True
          ItemName = 'btnDraftToDelete'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'btnDraftMerge'
        end
        item
          Visible = True
          ItemName = 'btnDraftAnalysis'
        end
        item
          Visible = True
          ItemName = 'btnDraftApprove'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'btnDraftImport'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object barTM: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      Caption = 'Custom 3'
      CaptionButtons = <>
      DockControl = barDockTM
      DockedDockControl = barDockTM
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 905
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'btnCleanRefresh'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'btnCleanToDraft'
        end
        item
          Visible = True
          ItemName = 'btnCleanCopyFrom'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'btnCleanRestore'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'btnCleanExport'
        end
        item
          Visible = True
          ItemName = 'dxBarLargeButton1'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxBarManagerBar1: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      Caption = 'Custom 1'
      CaptionButtons = <>
      DockControl = dxBarDockControl1
      DockedDockControl = dxBarDockControl1
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 1003
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'cxBarEditItem3'
        end
        item
          UserDefine = [udWidth]
          UserWidth = 362
          Visible = True
          ItemName = 'cmbTradeMark'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object btnDraftRefresh: TdxBarLargeButton
      Action = acDraftRefresh
      Category = 0
    end
    object btnDraftAdd: TdxBarLargeButton
      Action = acDraftAdd
      Category = 0
    end
    object btnDraftEdit: TdxBarLargeButton
      Action = acDraftEdit
      Category = 0
    end
    object btnDraftDelete: TdxBarLargeButton
      Action = acDraftDelete
      Category = 0
    end
    object btnDraftApprove: TdxBarLargeButton
      Action = acDraftApprove
      Category = 0
    end
    object btnCleanToDraft: TdxBarLargeButton
      Action = acCleanMoveToDraft
      Category = 0
    end
    object btnCleanExport: TdxBarLargeButton
      Action = acCleanExport
      Category = 0
    end
    object btnDraftImport: TdxBarLargeButton
      Action = acDraftImport
      Category = 0
    end
    object btnDraftReady: TdxBarLargeButton
      Action = acDraftReady
      Category = 0
    end
    object btnCleanRestore: TdxBarLargeButton
      Action = acCleanRestore
      Category = 0
    end
    object btnCleanRefresh: TdxBarLargeButton
      Action = acCleanRefresh
      Category = 0
      AutoGrayScale = False
    end
    object btnDraftReset: TdxBarLargeButton
      Action = acDraftReset
      Category = 0
    end
    object btnDraftAnalysis: TdxBarLargeButton
      Action = acDraftAnalysis
      Category = 0
    end
    object btnDraftToDelete: TdxBarLargeButton
      Action = acDraftToDelete
      Category = 0
    end
    object btnDraftMerge: TdxBarLargeButton
      Action = acDraftMerge
      Category = 0
    end
    object btnCleanCopyFrom: TdxBarLargeButton
      Action = acCleanCopyFrom
      Category = 0
    end
    object cmbTradeMark: TcxBarEditItem
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      OnChange = cmbTradeMarkChange
      PropertiesClassName = 'TcxLookupComboBoxProperties'
      Properties.GridMode = True
      Properties.ImmediatePost = True
      Properties.KeyFieldNames = 'Id_TradeMark'
      Properties.ListColumns = <
        item
          Caption = #1048#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088
          FieldName = 'Id_TradeMark'
        end
        item
          Caption = #1058#1086#1088#1075#1086#1074#1072#1103' '#1084#1072#1088#1082#1072
          FieldName = 'Name'
        end
        item
          Caption = #1055#1086#1083#1085#1086#1077' '#1086#1087#1080#1089#1072#1085#1080#1077
          FieldName = 'FullName'
        end
        item
          Caption = 'Check'
          FieldName = 'Check'
        end>
      Properties.ListFieldIndex = 1
      Properties.ListSource = dsTradeMark
    end
    object cxBarEditItem3: TcxBarEditItem
      Caption = #1058#1086#1088#1075#1086#1074#1072#1103' '#1084#1072#1088#1082#1072
      Category = 0
      Hint = #1058#1086#1088#1075#1086#1074#1072#1103' '#1084#1072#1088#1082#1072
      Visible = ivAlways
      PropertiesClassName = 'TcxLabelProperties'
    end
    object dxBarLargeButton1: TdxBarLargeButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
      OnClick = dxBarLargeButton1Click
    end
  end
  object ActionList: TActionList
    Left = 136
    Top = 288
    object acCleanRefresh: TCatalogAction
      Category = 'MDM Catalog'
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
    end
    object acCleanMoveToDraft: TCatalogAction
      Category = 'MDM Catalog'
      Caption = #1042' '#1095#1077#1088#1085#1086#1074#1080#1082'...'
    end
    object acCleanCopyFrom: TCatalogAction
      Category = 'MDM Catalog'
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1080#1079
    end
    object acCleanRestore: TCatalogAction
      Category = 'MDM Catalog'
      Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100'...'
    end
    object acCleanExport: TCatalogAction
      Category = 'MDM Catalog'
      Caption = #1069#1082#1089#1087#1086#1088#1090'...'
    end
    object acDraftRefresh: TCatalogAction
      Category = 'MDM Catalog'
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
    end
    object acDraftAdd: TCatalogAction
      Category = 'MDM Catalog'
      Caption = #1057#1086#1079#1076#1072#1090#1100'...'
    end
    object acDraftEdit: TCatalogAction
      Category = 'MDM Catalog'
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100'...'
    end
    object acDraftDelete: TCatalogAction
      Category = 'MDM Catalog'
      Caption = #1059#1076#1072#1083#1080#1090#1100
    end
    object acDraftReset: TCatalogAction
      Category = 'MDM Catalog'
      Caption = #1057#1073#1088#1086#1089#1080#1090#1100
    end
    object acDraftReady: TCatalogAction
      Category = 'MDM Catalog'
      Caption = #1043#1086#1090#1086#1074
    end
    object acDraftToDelete: TCatalogAction
      Category = 'MDM Catalog'
      Caption = #1050' '#1091#1076#1072#1083#1077#1085#1080#1102
    end
    object acDraftMerge: TCatalogAction
      Category = 'MDM Catalog'
      Caption = #1057#1083#1080#1103#1085#1080#1077'...'
    end
    object acDraftAnalysis: TCatalogAction
      Category = 'MDM Catalog'
      Caption = #1040#1085#1072#1083#1080#1079
    end
    object acDraftApprove: TCatalogAction
      Category = 'MDM Catalog'
      Caption = #1059#1090#1074#1077#1088#1076#1080#1090#1100
    end
    object acDraftImport: TCatalogAction
      Category = 'MDM Catalog'
      Caption = #1048#1084#1087#1086#1088#1090'...'
    end
  end
  object dsTradeMark: TDataSource
    DataSet = memTradeMark
    Left = 164
    Top = 360
  end
  object memTradeMark: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    Left = 244
    Top = 360
  end
end
