object FormMain: TFormMain
  Left = 0
  Top = 0
  Caption = 'FormMain'
  ClientHeight = 177
  ClientWidth = 442
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    442
    177)
  PixelsPerInch = 96
  TextHeight = 13
  object lblFileLocation: TLabel
    Left = 8
    Top = 40
    Width = 63
    Height = 13
    Caption = 'File'#39's location'
  end
  object btnWrite: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Write'
    TabOrder = 0
    OnClick = btnWriteClick
  end
  object mmoResult: TMemo
    Left = 8
    Top = 84
    Width = 423
    Height = 86
    Anchors = [akLeft, akTop, akRight, akBottom]
    ScrollBars = ssVertical
    TabOrder = 2
    ExplicitWidth = 236
  end
  object edtFileLocation: TEdit
    Left = 8
    Top = 57
    Width = 423
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Text = 'edtFileLocation'
    ExplicitWidth = 236
  end
end
