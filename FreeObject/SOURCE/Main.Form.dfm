object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'MainForm'
  ClientHeight = 127
  ClientWidth = 162
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object btnWithoutMemoryLeek: TButton
    Left = 8
    Top = 33
    Width = 145
    Height = 25
    Caption = #1041#1077#1079' '#1091#1090#1077#1095#1077#1082
    TabOrder = 0
    OnClick = btnWithoutMemoryLeekClick
  end
  object cboxTest1: TComboBox
    Left = 8
    Top = 6
    Width = 145
    Height = 21
    TabOrder = 1
  end
  object btnGenMemoryLeek: TButton
    Left = 8
    Top = 91
    Width = 145
    Height = 25
    Caption = #1057' '#1091#1090#1077#1095#1082#1072#1084#1080
    TabOrder = 2
    OnClick = btnGenMemoryLeekClick
  end
  object cBoxTest2: TComboBox
    Left = 8
    Top = 64
    Width = 145
    Height = 21
    TabOrder = 3
  end
end
