unit MainUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, DB, Forms, Controls, Graphics, Dialogs, DBGrids, StdCtrls,
  ZConnection, ZDataset;

type

  { TMainForm }

  TMainForm = class(TForm)
    TableList: TComboBox;
    DataSource: TDataSource;
    DBGrid1: TDBGrid;
    ZConnection: TZConnection;
    ZTable: TZTable;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure TableListChange(Sender: TObject);
  private

  public

  end;

var
  MainForm: TMainForm;

implementation

{$R *.lfm}

procedure CorrectComponentsPos();
begin
  MainForm.TableList.top:=0;
  MainForm.TableList.Left:=0;
  MainForm.TableList.width:=MainForm.Width;
  MainForm.DBGrid1.Top:=MainForm.TableList.height;
  MainForm.DBGrid1.left:=0;
  MainForm.DBGrid1.width:=MainForm.width;
  MainForm.DBGrid1.height:=MainForm.height - MainForm.TableList.height;
end;

{ TMainForm }

procedure TMainForm.FormCreate(Sender: TObject);
begin
  self.width:=round(screen.width / 2);
  self.height:=round(screen.height / 2);
  CorrectComponentsPos();
end;

procedure TMainForm.FormResize(Sender: TObject);
begin
  CorrectComponentsPos();
end;

procedure TMainForm.TableListChange(Sender: TObject);
begin
  case TableList.ItemIndex of
    0:ZTable.TableName:='book_fond';
    1:ZTable.TableName:='catalog';
    2:ZTable.TableName:='chitateli';
    3:ZTable.TableName:='vidacha';
  end;
  ZTable.open;
end;

end.

