unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  Tlogin = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Label5: TLabel;
    ZQuery1: TZQuery;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  login: Tlogin;

implementation

uses Unit1, Menu, Unit3;

{$R *.dfm}

procedure Tlogin.Button1Click(Sender: TObject);
var
  UserName, Password: string;
  UserLevel: string;
begin
  // Get the username and password entered by the user
  UserName := Edit1.Text;
  Password := Edit2.Text;

  // Check if username or password is empty
  if (UserName = '') or (Password = '') then
  begin
    ShowMessage('DATA TIDAK BOLEH KOSONG!');
  end
  else
  begin
    // Check the credentials against the database
    if DataModule1.ZConnection1.Connected then
    begin
      // Query the user table for the provided username and password
      ZQuery1.SQL.Text :=
        'SELECT * FROM user WHERE username = :username AND password = :password';
      ZQuery1.Params.ParamByName('username').AsString := UserName;
      ZQuery1.Params.ParamByName('password').AsString := Password;
      ZQuery1.Open;

      // Check if a matching record is found
      if not ZQuery1.IsEmpty then
      begin
        // Retrieve the user's level
        UserLevel := ZQuery1.FieldByName('level').AsString;

        // Successful login
        ShowMessage('Login Success!');

        if UserLevel = 'Admin' then
        begin
          MenuUtama.ShowModal; // Show the MenuUtama form for Admin level
        end
        else if UserLevel = 'User' then
        begin
          MenuUtamaUser.ShowModal; // Show the MenuUtamaAdmin form for User level
        end
        else
        begin
          ShowMessage('Invalid user level!');
        end;

        Close; // Close the login form
      end
      else
      begin
        // Invalid username or password
        ShowMessage('Username or password is incorrect!');
      end;
    end
    else
    begin
      // Database connection is not established
      ShowMessage('Database connection is not established!');
    end;
  end;
end;



end.
