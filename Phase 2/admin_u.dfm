object Frmadmin: TFrmadmin
  Left = 0
  Top = 0
  Caption = 'Frmadmin'
  ClientHeight = 276
  ClientWidth = 418
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 402
    Height = 233
    DataSource = DataM.DsScore
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 8
    Top = 247
    Width = 402
    Height = 25
    Caption = 'Delete Record'
    TabOrder = 1
    OnClick = Button1Click
  end
end
