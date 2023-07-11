program tugasakhir;

uses
  Forms,
  Siswa in 'Siswa.pas' {FSiswa},
  Menu in 'Menu.pas' {MenuUtama},
  OrangTua in 'OrangTua.pas' {FOrtu},
  User in 'User.pas' {FUser},
  Hubungan in 'Hubungan.pas' {FHubungan},
  Semester in 'Semester.pas' {FSemester},
  WaliKelas in 'WaliKelas.pas' {FWaliKelas},
  Poin in 'Poin.pas' {FPoin},
  Kelas in 'Kelas.pas' {FKelas},
  Unit1 in 'Unit1.pas' {DataModule1: TDataModule},
  Unit2 in 'Unit2.pas' {login},
  Unit3 in 'Unit3.pas' {MenuUtamaUser};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(Tlogin, login);
  Application.CreateForm(TMenuUtamaUser, MenuUtamaUser);
  Application.CreateForm(TMenuUtama, MenuUtama);
  Application.CreateForm(TFSiswa, FSiswa);
  Application.CreateForm(TFOrtu, FOrtu);
  Application.CreateForm(TFUser, FUser);
  Application.CreateForm(TFHubungan, FHubungan);
  Application.CreateForm(TFSemester, FSemester);
  Application.CreateForm(TFWaliKelas, FWaliKelas);
  Application.CreateForm(TFPoin, FPoin);
  Application.CreateForm(TFKelas, FKelas);
  Application.Run;
end.
