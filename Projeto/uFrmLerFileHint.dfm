object FrmLerFileHint: TFrmLerFileHint
  Left = 0
  Top = 0
  Caption = 'Leitor de Arquivo Hint'
  ClientHeight = 390
  ClientWidth = 666
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 386
    Top = 25
    Width = 7
    Height = 365
  end
  object BtnCarregarArquivo: TBitBtn
    Left = 0
    Top = 0
    Width = 666
    Height = 25
    Align = alTop
    Caption = 'Carregar Arquivo'
    TabOrder = 0
    OnClick = BtnCarregarArquivoClick
    ExplicitLeft = 8
    ExplicitTop = 8
    ExplicitWidth = 145
  end
  object mmArquivo: TMemo
    Left = 0
    Top = 25
    Width = 386
    Height = 365
    Align = alLeft
    Lines.Strings = (
      'mmArquivo')
    TabOrder = 1
    ExplicitLeft = 16
  end
  object mmDetalhes: TMemo
    Left = 393
    Top = 25
    Width = 273
    Height = 365
    Align = alClient
    Lines.Strings = (
      'mmDetalhes')
    TabOrder = 2
    ExplicitLeft = 432
    ExplicitWidth = 234
  end
  object opnFile: TOpenTextFileDialog
    Left = 64
    Top = 48
  end
end
