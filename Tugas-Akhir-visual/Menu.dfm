object MenuUtama: TMenuUtama
  Left = 588
  Top = 218
  Width = 480
  Height = 541
  Caption = 'Main Menu'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Century Gothic'
  Font.Style = []
  Menu = mm1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 16
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
      object USER1: TMenuItem
        Caption = 'User'
        OnClick = USER1Click
      end
      object KELAS1: TMenuItem
        Caption = 'Kelas'
        OnClick = KELAS1Click
      end
      object POIN1: TMenuItem
        Caption = 'Poin'
        OnClick = POIN1Click
      end
      object SEMESTER1: TMenuItem
        Caption = 'Semester'
        OnClick = SEMESTER1Click
      end
      object WALIKELAS1: TMenuItem
        Caption = 'Wali Kelas'
        OnClick = WALIKELAS1Click
      end
      object CLOSE1: TMenuItem
        OnClick = CLOSE1Click
      end
    end
  end
end
