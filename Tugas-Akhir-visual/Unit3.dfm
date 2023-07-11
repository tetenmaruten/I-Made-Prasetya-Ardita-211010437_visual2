object MenuUtamaUser: TMenuUtamaUser
  Left = 300
  Top = 207
  Width = 482
  Height = 435
  Caption = 'MenuUtamaUser'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = mm1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object mm1: TMainMenu
    Left = 32
    Top = 16
    object OPEN1: TMenuItem
      Caption = 'Menu Form'
      object SISWA1: TMenuItem
        Caption = 'Siswa'
        OnClick = SISWA1Click
      end
      object ORANGTUA1: TMenuItem
        Caption = 'Orangtua'
        OnClick = ORANGTUA1Click
      end
      object STATUSHUBUNGAN1: TMenuItem
        Caption = 'Hubungan'
        OnClick = STATUSHUBUNGAN1Click
      end
    end
  end
end
