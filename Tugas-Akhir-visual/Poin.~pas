unit Poin;

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
  TFPoin = class(TForm)
    lblnamapoin: TLabel;
    lblbobot: TLabel;
    lbljenis: TLabel;
    lblstatus: TLabel;
    Edtnamapoin: TEdit;
    Edtbobot: TEdit;
    bbaru: TButton;
    bsimpan: TButton;
    bedit: TButton;
    bhapus: TButton;
    bbatal: TButton;
    dbgrd1: TDBGrid;
    ZQuery1: TZQuery;
    ds1: TDataSource;
    cbbjenis: TComboBox;
    cbbstatus: TComboBox;
    frxpoin: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    Cetak: TButton;
    procedure edtbersih;
    procedure keawal;
    procedure edtenable;
    procedure bbatalClick(Sender: TObject);
    procedure bbaruClick(Sender: TObject);
    procedure bsimpanClick(Sender: TObject);
    procedure bhapusClick(Sender: TObject);
    procedure beditClick(Sender: TObject);
    procedure dbgrd1CellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure CetakClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPoin: TFPoin;
  id : String;

implementation

uses Unit1;

{$R *.dfm}

procedure TFPoin.edtbersih;
begin
Edtnamapoin.Clear;
Edtbobot.Clear;
end;

procedure TFPoin.edtenable;
begin
Edtnamapoin.Enabled:= True;
Edtbobot.Enabled:= True;
cbbjenis.Enabled:= True;
cbbstatus.Enabled:= True;
end;

procedure TFPoin.keawal;
begin
edtbersih;
Edtnamapoin.Enabled:= False;
Edtbobot.Enabled:= False;
cbbjenis.Enabled:= False;
cbbstatus.Enabled:= False;

bbaru.Enabled:=True;
bsimpan.Enabled:= False;
bedit.Enabled:= False;
bhapus.Enabled:= False;
bbatal.Enabled:= False;

end;

procedure TFPoin.bbatalClick(Sender: TObject);
begin
keawal;
end;

procedure TFPoin.bbaruClick(Sender: TObject);
begin
edtbersih;
edtenable;
bbaru.Enabled:= False;
bsimpan.Enabled:= True;
bedit.Enabled:= False;
bhapus.Enabled:= False;
bbatal.Enabled:= True;

end;

procedure TFPoin.bsimpanClick(Sender: TObject);
begin
if (Edtnamapoin.Text='') or (Edtbobot.Text='') then
  begin
    ShowMessage('DATA TIDAK BOLEH KOSONG!');
  end else
  if (ZQuery1.Locate('nama_poin', Edtnamapoin.Text,[])) then
  begin
    ShowMessage('DATA Poin SUDAH DIGUNAKAN!');
    keawal;
  end else
  begin
  ZQuery1.SQL.Clear;
  ZQuery1.SQL.Add('insert into poin values (null,"'+Edtnamapoin.Text+'","'+Edtbobot.Text+'","'+cbbjenis.Text+'","'+cbbstatus.Text+'")');
  ZQuery1.ExecSQL;

  //ZQuery1.Active:= False;
  //ZQuery1.Active:= True;

  ZQuery1.SQL.Clear;
  ZQuery1.SQL.Add('select*from poin');
  ZQuery1.Open;
  ShowMessage('DATA BERHASIL DISIMPAN');
  keawal;

  end;

end;

procedure TFPoin.bhapusClick(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
id:=dbgrd1.DataSource.DataSet.FieldByName('id').AsString;
ZQuery1.SQL.Clear;
ZQuery1.SQL.Add(' delete from poin where id="'+id+'"');
ZQuery1.ExecSQL;
ZQuery1.SQL.Clear;
ZQuery1.SQL.Add('select * from poin');
ZQuery1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
keawal;
end else
begin
ShowMessage('DATA BATAL DIHAPUS');
keawal;

end;

end;

procedure TFPoin.beditClick(Sender: TObject);
begin
  if (Edtnamapoin.Text='') or (Edtbobot.Text='') then
  begin
    ShowMessage('DATA TIDAK BOLEH KOSONG!');
  end else
  if (Edtnamapoin.Text = ZQuery1.FieldList[1].AsString) and (Edtbobot.Text = ZQuery1.FieldList[2].AsString) and (cbbjenis.Text = ZQuery1.FieldList[3].AsString) and (cbbstatus.Text = ZQuery1.FieldList[4].AsString) then
  begin
    ShowMessage('DATA TIDAK ADA PERUBAHAN');
    keawal;
  end else
  begin
    id:=dbgrd1.DataSource.DataSet.FieldByName('id').AsString;
  ShowMessage('DATA BERHASIL DI UPDATE!');
  ZQuery1.SQL.Clear;
  ZQuery1.SQL.Add('Update poin set nama_poin="'+Edtnamapoin.Text+'", bobot="'+Edtbobot.Text+'", jenis="'+cbbjenis.Text+'", status="'+cbbstatus.Text+'" where id="'+id+'"');
  ZQuery1.ExecSQL;
  ZQuery1.SQL.Clear;
  ZQuery1.SQL.Add('select*from poin');
  ZQuery1.Open;
  keawal;
  end;

end;

procedure TFPoin.dbgrd1CellClick(Column: TColumn);
begin
edtenable;

bbaru.Enabled:=True;
bsimpan.Enabled:= False;
bedit.Enabled:= True;
bhapus.Enabled:= True;
bbatal.Enabled:= True;

Edtnamapoin.Text:= ZQuery1.FieldList[1].AsString;
Edtbobot.Text:= ZQuery1.FieldList[2].AsString;
cbbjenis.Text:= ZQuery1.FieldList[3].AsString;
cbbstatus.Text:= ZQuery1.FieldList[4].AsString;

end;

procedure TFPoin.FormShow(Sender: TObject);
begin
keawal;
end;

procedure TFPoin.CetakClick(Sender: TObject);
begin
frxpoin.ShowReport();
end;

end.
