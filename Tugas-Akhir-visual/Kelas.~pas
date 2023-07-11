unit Kelas;

interface

uses
  Windows, Messages  , SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB,
  frxClass, frxDBSet, ZAbstractDataset, ZDataset,
  ComCtrls, StdCtrls, Grids, DBGrids,
  ZAbstractConnection, ZConnection,
  ZAbstractRODataset
  ;

type
  TFKelas = class(TForm)
    lblnama: TLabel;
    lbljenis: TLabel;
    lbljurusan: TLabel;
    Edtnama: TEdit;
    Edtjenis: TEdit;
    bbaru: TButton;
    bsimpan: TButton;
    bedit: TButton;
    bhapus: TButton;
    bbatal: TButton;
    dbgrd1: TDBGrid;
    ZQuery1: TZQuery;
    ds1: TDataSource;
    cbbjurusan: TComboBox;
    frxkelas: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    Cetak: TButton;
    procedure keawal;
    procedure edtbersih;
    procedure edtenable;
    procedure bbaruClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbatalClick(Sender: TObject);
    procedure bsimpanClick(Sender: TObject);
    procedure bhapusClick(Sender: TObject);
    procedure beditClick(Sender: TObject);
    procedure dbgrd1CellClick(Column: TColumn);
    procedure CetakClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FKelas: TFKelas;
  id : string;

implementation

uses Unit1;

{$R *.dfm}

procedure TFKelas.edtbersih;
begin
Edtnama.Clear;
Edtjenis.Clear;
end;

procedure TFKelas.edtenable;
begin
Edtnama.Enabled:= True;
Edtjenis.Enabled:= True;
cbbjurusan.Enabled:= True;

end;

procedure TFKelas.keawal;
begin
edtbersih;
Edtnama.Enabled:= False;
Edtjenis.Enabled:= False;
cbbjurusan.Enabled:= False;

bbaru.Enabled:=True;
bsimpan.Enabled:= False;
bedit.Enabled:= False;
bhapus.Enabled:= False;
bbatal.Enabled:= False;

end;

procedure TFKelas.bbaruClick(Sender: TObject);
begin
edtbersih;
edtenable;
bbaru.Enabled:= False;
bsimpan.Enabled:= True;
bedit.Enabled:= False;
bhapus.Enabled:= False;
bbatal.Enabled:= True;

end;

procedure TFKelas.FormShow(Sender: TObject);
begin
keawal;
end;

procedure TFKelas.bbatalClick(Sender: TObject);
begin
keawal;
end;

procedure TFKelas.bsimpanClick(Sender: TObject);
begin
if (Edtnama.Text = '') or (Edtjenis.Text = '') then
begin
  ShowMessage('DATA TIDAK BOLEH KOSONG!');
end
else
begin
  ZQuery1.SQL.Clear;
  ZQuery1.SQL.Add('INSERT INTO kelas VALUES (null, "' + Edtnama.Text + '", "' + Edtjenis.Text + '", "' + cbbjurusan.Text + '")');
  ZQuery1.ExecSQL;

  ZQuery1.Close;
  ZQuery1.SQL.Clear;
  ZQuery1.SQL.Add('SELECT * FROM kelas');
  ZQuery1.Open;
  
  ShowMessage('DATA BERHASIL DISIMPAN');
  keawal;
end;


end;

procedure TFKelas.bhapusClick(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
id:=dbgrd1.DataSource.DataSet.FieldByName('id').AsString;
ZQuery1.SQL.Clear;
ZQuery1.SQL.Add(' delete from kelas where id="'+id+'"');
ZQuery1.ExecSQL;
ZQuery1.SQL.Clear;
ZQuery1.SQL.Add('select * from kelas');
ZQuery1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
keawal;
end else
begin
ShowMessage('DATA BATAL DIHAPUS');
keawal;

end;

end;

procedure TFKelas.beditClick(Sender: TObject);
begin
if (Edtnama.Text='') or (Edtjenis.Text='') then
  begin
    ShowMessage('DATA TIDAK BOLEH KOSONG!');
  end else
  if (Edtnama.Text = ZQuery1.FieldList[1].AsString) and (Edtjenis.Text = ZQuery1.FieldList[2].AsString) and (cbbjurusan.Text = ZQuery1.FieldList[3].AsString) then
  begin
    ShowMessage('DATA TIDAK ADA PERUBAHAN');
    keawal;
  end else
  begin
    id:=dbgrd1.DataSource.DataSet.FieldByName('id').AsString;
  ShowMessage('DATA BERHASIL DI UPDATE!');
  ZQuery1.SQL.Clear;
  ZQuery1.SQL.Add('Update kelas set nama="'+Edtnama.Text+'", jenis="'+Edtjenis.Text+'", jurusan="'+cbbjurusan.Text+'" where id="'+id+'"');
  ZQuery1.ExecSQL;
  ZQuery1.SQL.Clear;
  ZQuery1.SQL.Add('select*from kelas');
  ZQuery1.Open;
  keawal;
  end;

end;

procedure TFKelas.dbgrd1CellClick(Column: TColumn);
begin
edtenable;

bbaru.Enabled:=True;
bsimpan.Enabled:= False;
bedit.Enabled:= True;
bhapus.Enabled:= True;
bbatal.Enabled:= True;

Edtnama.Text:= ZQuery1.FieldList[1].AsString;
Edtjenis.Text:= ZQuery1.FieldList[2].AsString;
cbbjurusan.Text:= ZQuery1.FieldList[3].AsString;


end;

procedure TFKelas.CetakClick(Sender: TObject);
begin
frxkelas.ShowReport();
end;

end.
