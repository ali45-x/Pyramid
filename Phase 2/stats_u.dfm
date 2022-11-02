object frmstats: Tfrmstats
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'frmstats'
  ClientHeight = 249
  ClientWidth = 465
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object LblUser: TLabel
    Left = 32
    Top = 52
    Width = 47
    Height = 16
    Caption = 'LblUser'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 56
    Top = 95
    Width = 83
    Height = 16
    Caption = 'Times Played'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 56
    Top = 117
    Width = 90
    Height = 16
    Caption = 'Highest Score'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 56
    Top = 139
    Width = 97
    Height = 16
    Caption = 'Average Score'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 56
    Top = 161
    Width = 73
    Height = 16
    Caption = 'Total Score'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbltimes: TLabel
    Left = 328
    Top = 95
    Width = 83
    Height = 16
    Caption = 'Times Played'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblHs: TLabel
    Left = 328
    Top = 117
    Width = 90
    Height = 16
    Caption = 'Highest Score'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblAs: TLabel
    Left = 328
    Top = 139
    Width = 97
    Height = 16
    Caption = 'Average Score'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblTs: TLabel
    Left = 328
    Top = 161
    Width = 73
    Height = 16
    Caption = 'Total Score'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblbs: TLabel
    Left = 32
    Top = 192
    Width = 4
    Height = 16
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 465
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = -75
      Width = 59
      Height = 110
      Caption = #61679
      Font.Charset = SYMBOL_CHARSET
      Font.Color = clBlue
      Font.Height = -96
      Font.Name = 'Wingdings 3'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 81
      Top = 7
      Width = 150
      Height = 34
      Caption = 'PYRAMID'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -29
      Font.Name = 'Cooper Black'
      Font.Style = []
      ParentFont = False
    end
    object Panel2: TPanel
      Left = 0
      Top = 38
      Width = 465
      Height = 3
      Align = alBottom
      BevelOuter = bvNone
      Color = clBlue
      ParentBackground = False
      TabOrder = 0
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 79
    Width = 620
    Height = 2
    TabOrder = 1
  end
  object Panel4: TPanel
    Left = 0
    Top = 217
    Width = 465
    Height = 32
    BevelOuter = bvNone
    Caption = 'Back'
    Color = clBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 2
    OnClick = Panel4Click
  end
end
