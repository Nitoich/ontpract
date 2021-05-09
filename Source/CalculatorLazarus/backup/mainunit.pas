unit MainUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TMainForm }

  TMainForm = class(TForm)
    Button1: TButton;
    Button0: TButton;
    DivButton: TButton;
    PlusButton: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    MinusButton: TButton;
    MultiButton: TButton;
    ResultButton: TButton;
    ResultEdit: TEdit;
    procedure ButtonClick(Sender: TObject);
    procedure ResultEditKeyPress(Sender: TObject; var Key: char);
  private

  public

  end;

var
  MainForm: TMainForm;

implementation
var Znak:char;
    FirstNumber,Res:real;

{$R *.lfm}

{ TMainForm }

procedure TMainForm.ButtonClick(Sender: TObject);
begin
  if Sender is TButton then
  begin
    case (Sender as TButton).tag of
    1:ResultEdit.Text:=ResultEdit.Text + (Sender as TButton).Caption;
    2:begin
        FirstNumber:=StrToFloat(ResultEdit.Text);
        ResultEdit.clear;
        Znak:=(Sender as TButton).Caption[1];
      end;
    0:if ResultEdit.Text <> '' then
        case Znak of
        '+':ResultEdit.Text:=FloatToStr(FirstNumber + StrToFloat(ResultEdit.Text));
        '-':ResultEdit.Text:=FloatToStr(FirstNumber - StrToFloat(ResultEdit.Text));
        '*':ResultEdit.Text:=FloatToStr(FirstNumber * StrToFloat(ResultEdit.Text));
        '/':if StrToFloat(ResultEdit.Text) <> 0 then ResultEdit.Text:=FloatToStr(FirstNumber / StrToFloat(ResultEdit.Text));
        end;
    end;
  end;
end;

procedure TMainForm.ResultEditKeyPress(Sender: TObject; var Key: char);
begin
  if not (Key in ['0'..'9', #8]) then key:=#0;
end;

end.

