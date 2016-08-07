object MainForm: TMainForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Test.StringList'
  ClientHeight = 265
  ClientWidth = 289
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object lblResult: TLabel
    Left = 8
    Top = 81
    Width = 65
    Height = 13
    Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090#1099':'
  end
  object btnAdd: TButton
    Left = 8
    Top = 55
    Width = 75
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 0
    OnClick = btnAddClick
  end
  object mmoResult: TMemo
    Left = 8
    Top = 100
    Width = 273
    Height = 157
    TabOrder = 1
  end
  object gbCount: TGroupBox
    Left = 8
    Top = 8
    Width = 273
    Height = 41
    TabOrder = 2
    object lblRecCount: TLabel
      Left = 16
      Top = 13
      Width = 60
      Height = 13
      Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
    end
    object edtCount: TEdit
      Left = 84
      Top = 10
      Width = 68
      Height = 21
      TabOrder = 0
      Text = '100000'
    end
    object cbUnique: TCheckBox
      Left = 174
      Top = 12
      Width = 83
      Height = 17
      Caption = #1059#1085#1080#1082#1072#1083#1100#1085#1099#1077
      TabOrder = 1
    end
  end
  object btnStop: TButton
    Left = 89
    Top = 55
    Width = 75
    Height = 25
    Caption = #1054#1089#1090#1072#1085#1086#1074#1080#1090#1100
    Enabled = False
    TabOrder = 3
    OnClick = btnStopClick
  end
end
