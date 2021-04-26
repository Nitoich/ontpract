unit MainUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, mysql56conn, mysql57conn, SQLDB, DB, Forms, Controls,
  Graphics, Dialogs, DBGrids, StdCtrls, ActnList;

type

  { TMainForm }

  TMainForm = class(TForm)
    TablesList: TComboBox;
    SaveButton: TButton;
    DataSource: TDataSource;
    DBGrid: TDBGrid;
    MySQL57Connection: TMySQL57Connection;
    SQLQuery: TSQLQuery;
    SQLTransaction: TSQLTransaction;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure SaveButtonClick(Sender: TObject);
    procedure TablesListChange(Sender: TObject);
    procedure TablesListClick(Sender: TObject);
    procedure TablesListKeyPress(Sender: TObject; var Key: char);
  private

  public

  end;

var
  MainForm: TMainForm;

implementation

{$R *.lfm}

procedure SetComponentCorrectPos();
begin
  MainForm.SaveButton.width:=round(MainForm.width / 10);
  MainForm.SaveButton.top:=0;
  MainForm.SaveButton.left:=MainForm.Width - MainForm.SaveButton.Width;
  MainForm.DBGrid.top:=MainForm.TablesList.height; MainForm.DBGrid.Left:=1;
  MainForm.DBGrid.width:=MainForm.width;
  MainForm.DBGrid.height:=MainForm.height - MainForm.TablesList.Height;
  MainForm.TablesList.Top:=1;
  MainForm.TablesList.left:=1;
  MainForm.TablesList.width:=MainForm.width - MainForm.SaveButton.width;
end;

{ TMainForm }

procedure TMainForm.FormCreate(Sender: TObject);
begin
  self.Width:=round(screen.Width / 2);
  self.height:=round(screen.Height / 2);

  SQLQuery.SQL.Text:='select * from book_fond';
  SetComponentCorrectPos();
end;

procedure TMainForm.FormResize(Sender: TObject);
begin
  SetComponentCorrectPos();
end;

procedure TMainForm.SaveButtonClick(Sender: TObject);
begin
  SQLQuery.ApplyUpdates;
  SQLTransaction.Commit;
  SQLQuery.open;
end;

procedure TMainForm.TablesListChange(Sender: TObject);
begin
  SQLQuery.close;
  case TablesList.ItemIndex of
    0:SQLQuery.SQL.Text:='select * from book_fond';
    1:SQLQuery.SQL.Text:='select * from catalog';
    2:SQLQuery.SQL.Text:='select * from chitateli';
    3:SQLQuery.SQL.Text:='select * from vidacha';
  end;
  SQLQuery.Open;
end;

procedure TMainForm.TablesListClick(Sender: TObject);
begin

end;

procedure TMainForm.TablesListKeyPress(Sender: TObject; var Key: char);
begin
  Key:=#0;
end;

end.

