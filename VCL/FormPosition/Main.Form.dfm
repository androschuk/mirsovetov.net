object MainForm: TMainForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Demo - Position'
  ClientHeight = 175
  ClientWidth = 168
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ListBox1: TListBox
    Left = 8
    Top = 8
    Width = 153
    Height = 129
    ItemHeight = 13
    TabOrder = 0
  end
  object btnCreateForm: TButton
    Left = 8
    Top = 143
    Width = 75
    Height = 25
    Caption = 'Create Form'
    TabOrder = 1
    OnClick = btnCreateFormClick
  end
end
