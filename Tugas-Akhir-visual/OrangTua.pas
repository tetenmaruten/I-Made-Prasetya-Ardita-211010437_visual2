unit OrangTua;

interface

uses
  Windows, Messages  , SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB,
  frxClass, frxDBSet,  ZAbstractDataset, ZDataset,
  StdCtrls, ZAbstractConnection, ZConnection,
  ZAbstractRODataset   ;

type
  TFOrtu = class(TForm)
    lblnik: TLabel;
    lblnama: TLabel;
    lblpendidikan: TLabel;
    lblpekerjaan: TLabel;
    lbltelp: TLabel;
    lblalamat: TLabel;
    lbljk: TLabel;
    lblagama: TLabel;
    lblisactive: TLabel;
    Edtnik: TEdit;
    Edtnama: TEdit;
    Edtpendidikan: TEdit;
    Edtpekerjaan: TEdit;
    Edttelp: TEdit;
    Edtalamat: TEdit;
    Edtagama: TEdit;
    Edtisactive: TEdit;
    bbaru: TButton;
    bsimpan: TButton;
    bedit: TButton;
    bhapus: TButton;
    bbatal: TButton;
    ZQuery1: TZQuery;
    ds1: TDataSource;
    dbgrd1: TDBGrid;
    cbbjk: TComboBox;
    frxorangtua: TfrxReport;
    DBDataset1: TfrxDBDataset;
    Cetak: TButton;
    procedure edtbersih;
    procedure keawal;
    procedure edtenable;
    procedure bbatalClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbaruClick(Sender: TObject);
    procedure bsimpanClick(Sender: TObject);
    procedure dbgrd1CellClick(Column: TColumn);
    procedure bhapusClick(Sender: TObject);
    procedure beditClick(Sender: TObject);
    procedure CetakClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOrtu: TFOrtu;
  id : string;

implementation

uses
  WaliKelas,
  Unit1;

{$R *.dfm}

procedure TFOrtu.edtbersih;
begin
Edtnik.Clear;
Edtnama.Clear;
Edtpendidikan.Clear;
Edtpekerjaan.Clear;
Edttelp.Clear;
Edtalamat.Clear;
Edtalamat.Clear;
Edtagama.Clear;
Edtisactive.Clear;
end;

procedure TFOrtu.edtenable;
begin
Edtnik.Enabled:= True;
Edtnama.Enabled:= True;
Edtpendidikan.Enabled:= True;
Edtpekerjaan.Enabled:= True;
Edttelp.Enabled:= True;
Edtalamat.Enabled:= True;
cbbjk.Enabled:= True;
Edtagama.Enabled:= True;
Edtisactive.Enabled:= True;
end;

procedure TFOrtu.keawal;
begin
edtbersih;
Edtnik.Enabled:= False;
Edtnama.Enabled:= False;
Edtpendidikan.Enabled:= False;
Edtpekerjaan.Enabled:= False;
Edttelp.Enabled:= False;
Edtalamat.Enabled:= False;
cbbjk.Enabled:= False;
Edtagama.Enabled:= False;
Edtisactive.Enabled:= False;

bbaru.Enabled:=True;
bsimpan.Enabled:= False;
bedit.Enabled:= False;
bhapus.Enabled:= False;
bbatal.Enabled:= False;

end;

procedure TFOrtu.bbatalClick(Sender: TObject);
begin
keawal;
end;

procedure TFOrtu.FormShow(Sender: TObject);
begin
keawal;
end;

procedure TFOrtu.bbaruClick(Sender: TObject);
begin
edtenable;
edtbersih;
bbaru.Enabled:= False;
bsimpan.Enabled:= True;
bedit.Enabled:= False;
bhapus.Enabled:= False;
bbatal.Enabled:= True;

end;

procedure TFOrtu.bsimpanClick(Sender: TObject);
begin
  if (Edtnik.Text='') or (Edtnama.Text='') or (Edtpendidikan.Text='') or (Edtpekerjaan.Text='') or (Edttelp.Text='') or (Edtalamat.Text='') or (Edtagama.Text='') or (Edtisactive.Text='') then
  begin
    ShowMessage('DATA TIDAK BOLEH KOSONG!');
  end else
  if (ZQuery1.Locate('nik', Edtnik.Text,[])) then
  begin
    ShowMessage('DATA CUSTOMER SUDAH DIGUNAKAN!');
    keawal;
  end else
  begin
  ZQuery1.SQL.Clear;
  ZQuery1.SQL.Add('insert into ortu values (null,"'+Edtnik.Text+'","'+Edtnama.Text+'","'+Edtpendidikan.Text+'","'+Edtpekerjaan.Text+'","'+Edttelp.Text+'","'+Edtalamat.Text+'","'+cbbjk.Text+'","'+Edtagama.Text+'","'+Edtisactive.Text+'")');
  ZQuery1.ExecSQL;

  //ZQuery1.Active:= False;
  //ZQuery1.Active:= True;

  ZQuery1.SQL.Clear;
  ZQuery1.SQL.Add('select*from ortu');
  ZQuery1.Open;
  ShowMessage('DATA BERHASIL DISIMPAN');
  keawal;

  end;

end;

procedure TFOrtu.dbgrd1CellClick(Column: TColumn);
begin
edtenable;

bbaru.Enabled:=True;
bsimpan.Enabled:= False;
bedit.Enabled:= True;
bhapus.Enabled:= True;
bbatal.Enabled:= True;

Edtnik.Text:= ZQuery1.FieldList[1].AsString;
Edtnama.Text:= ZQuery1.FieldList[2].AsString;
Edtpendidikan.Text:= ZQuery1.FieldList[3].AsString;
Edtpekerjaan.Text:= ZQuery1.FieldList[4].AsString;
Edttelp.Text:= ZQuery1.FieldList[5].AsString;
Edtalamat.Text:= ZQuery1.FieldList[6].AsString;
cbbjk.Text:= ZQuery1.FieldList[7].AsString;
Edtagama.Text:= ZQuery1.FieldList[8].AsString;
Edtisactive.Text:= ZQuery1.FieldList[9].AsString;

end;

procedure TFOrtu.bhapusClick(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
id:=dbgrd1.DataSource.DataSet.FieldByName('id').AsString;
ZQuery1.SQL.Clear;
ZQuery1.SQL.Add(' delete from ortu where id="'+id+'"');
ZQuery1.ExecSQL;
ZQuery1.SQL.Clear;
ZQuery1.SQL.Add('select * from ortu');
ZQuery1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
keawal;
end else
begin
ShowMessage('DATA BATAL DIHAPUS');
keawal;

end;

end;

procedure TFOrtu.beditClick(Sender: TObject);
begin
  if (Edtnik.Text='') or (Edtnama.Text='') or (Edtpendidikan.Text='') or (Edtpekerjaan.Text='') or (Edttelp.Text='') or (Edtalamat.Text='') or (Edtagama.Text='') or (Edtisactive.Text='') then
  begin
    ShowMessage('DATA TIDAK BOLEH KOSONG!');
  end else
    if (Edtnik.Text = ZQuery1.FieldList[1].AsString) and (Edtnama.Text = ZQuery1.FieldList[2].AsString) and (Edtpendidikan.Text = ZQuery1.FieldList[3].AsString) and (Edtagama.Text = ZQuery1.FieldList[8].AsString) then
  begin
    ShowMessage('DATA TIDAK ADA PERUBAHAN');
    keawal;
  end else
  begin
    id:=dbgrd1.DataSource.DataSet.FieldByName('id').AsString;
  ShowMessage('DATA BERHASIL DI UPDATE!');
  ZQuery1.SQL.Clear;
  ZQuery1.SQL.Add('Update ortu set nik="'+Edtnik.Text+'", nama="'+Edtnama.Text+'", pendidikan="'+Edtpendidikan.Text+'", pekerjaan="'+Edtpekerjaan.Text+'", telp="'+Edttelp.Text+'", alamat="'+Edtalamat.Text+'", jk="'+cbbjk.Text+'", agama="'+Edtagama.Text+'", is_active="'+Edtisactive.Text+'" where id="'+id+'"');
  ZQuery1.ExecSQL;
  ZQuery1.SQL.Clear;
  ZQuery1.SQL.Add('select*from ortu');
  ZQuery1.Open;
  keawal;
  end;

end;

procedure TFOrtu.CetakClick(Sender: TObject);
begin
frxorangtua.ShowReport();
end;

end.
