object frmMain: TfrmMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Mail checker'
  ClientHeight = 676
  ClientWidth = 281
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object grpSettings: TGroupBox
    Left = 8
    Top = 8
    Width = 265
    Height = 145
    Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1103#1097#1080#1082#1072
    TabOrder = 0
    object lblAdress: TLabel
      Left = 22
      Top = 27
      Width = 31
      Height = 13
      Caption = #1040#1076#1088#1077#1089
    end
    object lblPass: TLabel
      Left = 22
      Top = 51
      Width = 37
      Height = 13
      Caption = #1055#1072#1088#1086#1083#1100
    end
    object lblPop3: TLabel
      Left = 22
      Top = 75
      Width = 64
      Height = 13
      Caption = 'POP3 '#1089#1077#1088#1074#1077#1088
    end
    object lblPort: TLabel
      Left = 22
      Top = 102
      Width = 25
      Height = 13
      Caption = #1055#1086#1088#1090
    end
    object edtAdress: TEdit
      Left = 94
      Top = 24
      Width = 153
      Height = 21
      TabOrder = 0
    end
    object edtPass: TEdit
      Left = 94
      Top = 48
      Width = 105
      Height = 21
      PasswordChar = '*'
      TabOrder = 1
    end
    object edtPop3: TEdit
      Left = 94
      Top = 72
      Width = 131
      Height = 21
      TabOrder = 2
    end
    object edtPort: TEdit
      Left = 94
      Top = 99
      Width = 49
      Height = 21
      TabOrder = 3
    end
  end
  object grpCheck: TGroupBox
    Left = 8
    Top = 159
    Width = 265
    Height = 50
    Caption = #1042#1088#1077#1084#1103' '#1087#1088#1086#1074#1077#1088#1082#1080
    TabOrder = 1
    object lblCheckAfter: TLabel
      Left = 15
      Top = 22
      Width = 151
      Height = 13
      Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1095#1077#1088#1077#1079'                '#1084#1080#1085'.'
    end
    object edtCheckAfter: TEdit
      Left = 103
      Top = 18
      Width = 34
      Height = 21
      TabOrder = 0
      Text = '1'
    end
    object btnSetup: TButton
      Left = 172
      Top = 16
      Width = 75
      Height = 25
      Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100
      TabOrder = 1
      OnClick = btnSetupClick
    end
  end
  object mmoResult: TMemo
    Left = 8
    Top = 280
    Width = 265
    Height = 88
    Lines.Strings = (
      'mmoResult')
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object btnTest: TButton
    Left = 8
    Top = 217
    Width = 75
    Height = 25
    Caption = #1058#1077#1089#1090
    TabOrder = 3
    OnClick = btnTestClick
  end
  object chkUseSSL: TCheckBox
    Left = 8
    Top = 248
    Width = 113
    Height = 17
    Caption = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' SSL'
    TabOrder = 4
  end
  object cbSSLType: TComboBox
    Left = 127
    Top = 246
    Width = 145
    Height = 21
    ItemIndex = 0
    TabOrder = 5
    Text = 'sslvSSLv2'
    Items.Strings = (
      'sslvSSLv2'
      'sslvSSLv23'
      'sslvSSLv3'
      'sslvTLSv1')
  end
  object lbMessageInfo: TListBox
    Left = 8
    Top = 376
    Width = 265
    Height = 129
    ItemHeight = 13
    TabOrder = 6
  end
  object lst1: TListBox
    Left = 32
    Top = 528
    Width = 121
    Height = 97
    ItemHeight = 13
    TabOrder = 7
  end
  object tmrChecker: TTimer
    Enabled = False
    OnTimer = tmrCheckerTimer
    Left = 160
    Top = 304
  end
  object IdPOP3: TIdPOP3
    AutoLogin = True
    SASLMechanisms = <>
    Left = 48
    Top = 304
  end
  object SSLHandler: TIdSSLIOHandlerSocketOpenSSL
    MaxLineAction = maException
    Port = 0
    DefaultPort = 0
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 104
    Top = 304
  end
  object IdMessage1: TIdMessage
    AttachmentEncoding = 'UUE'
    BccList = <>
    CCList = <>
    Encoding = meDefault
    FromList = <
      item
      end>
    Recipients = <>
    ReplyTo = <>
    ConvertPreamble = True
    Left = 48
    Top = 400
  end
end
