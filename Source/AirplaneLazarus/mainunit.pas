unit MainUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls;

type

  { TMainForm }

  TMainForm = class(TForm)
    Airplane1: TImage;
    Airplane2: TImage;
    Player: TImage;
    MainLoop: TTimer;
    Bullet: TShape;
    Boombing: TTimer;
    Bomb1: TShape;
    procedure BoombingTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure MainLoopTimer(Sender: TObject);
  private

  public

  end;

var
  MainForm: TMainForm;

implementation
var rightA1,rightA2,MDP,SpeedA1,SpeedA2:shortint;
{$R *.lfm}

{ TMainForm }

procedure TMainForm.FormCreate(Sender: TObject);
begin
  randomize;
  Self.Width:=round(Screen.Width / 2);
  Self.Height:=round(Screen.Height / 2);
  Airplane1.Picture.LoadFromFile('Image/AirplaneRight.png');
  Airplane2.Picture.LoadFromFile('Image/AirplaneRight.png');
  Player.Picture.LoadFromFile('Image/Player.png');

  Player.Top:=self.Height - round(self.height / 8);
  Player.Left:=round(self.Width / 2) - round(player.width / 2);
  MDP:=0;

  SpeedA1:=random(4)+2;
  SpeedA2:=random(4)+2;
  rightA1:=1;
  rightA2:=1;
end;

procedure TMainForm.BoombingTimer(Sender: TObject);
begin
  randomize;
  if random(100) > 50 then
  begin
    Bomb1.Top:=Airplane1.Top;
    Bomb1.left:=Airplane1.left + round(Airplane1.width / 2) - round(Bomb1.width / 2);
  end else begin
    Bomb1.Top:=Airplane2.Top;
    Bomb1.left:=Airplane2.left + round(Airplane2.width / 2) - round(Bomb1.width / 2);
  end;
  Bomb1.visible:=true;
end;

procedure TMainForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 37 then MDP:=-1;
  if Key = 39 then MDP:=1;
  if Key = 32 then
  begin
    if Bullet.Visible = false then
    begin
      Bullet.Top:=Player.Top;
      Bullet.Left:=Player.Left + round(Player.width / 2) - round(Bullet.Width / 2);
      Bullet.Visible:=true;
    end;
  end;
end;

procedure TMainForm.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState
  );
begin
  if key in [37,39] then MDP:=0;
end;

procedure TMainForm.MainLoopTimer(Sender: TObject);
begin
  randomize;
  Airplane1.Left:=Airplane1.Left + SpeedA1;
  Airplane2.Left:=Airplane2.Left + SpeedA2;
  if (Airplane1.Left > Self.Width) then
  begin
    rightA1:=-1;
    Airplane1.Picture.LoadFromFile('Image/AirplaneLeft.png');
    SpeedA1:=SpeedA1*(-1);
  end;
  if (Airplane1.left + Airplane1.Width < 0) then
  begin
    rightA1:=1;
    Airplane1.Picture.LoadFromFile('Image/AirplaneRight.png');
    SpeedA1:=SpeedA1*(-1);
  end;

  if (Airplane2.Left > Self.Width) then
  begin
    rightA2:=-1;
    Airplane2.Picture.LoadFromFile('Image/AirplaneLeft.png');
    SpeedA2:=SpeedA2*(-1);
  end;
  if (Airplane2.left + Airplane2.Width < 0) then
  begin
    rightA1:=1;
    Airplane2.Picture.LoadFromFile('Image/AirplaneRight.png');
    SpeedA2:=SpeedA2*(-1);
  end;

  if MDP = 1 then Player.left:=Player.left + 5;
  if MDP = -1 then Player.left:=Player.left - 5;

  if Bullet.Visible = true then
  begin
    if Bullet.top + Bullet.height < 0 then Bullet.Visible:=false;
    Bullet.Top:=Bullet.top - 12;
    if Bullet.Top < Airplane1.Top + Airplane1.height then
    begin
      if (Bullet.Left + bullet.Width > Airplane1.Left) and (Bullet.Left < Airplane1.left + Airplane1.width) then
      begin
        Airplane1.left:=random(self.width - Airplane1.width);
        SpeedA1:=random(4)+2;
        if rightA1 = -1 then SpeedA1:=SpeedA1*(-1);
        Bullet.visible:=false;
      end;
    end;

    if Bullet.Top < Airplane2.Top + Airplane2.height then
    begin
      if (Bullet.Left + bullet.Width > Airplane2.Left) and (Bullet.Left < Airplane2.left + Airplane2.width) then
      begin
        Airplane2.left:=random(self.width - Airplane2.width);
        SpeedA2:=random(4)+2;
        if rightA2 = -1 then SpeedA2:=SpeedA2*(-1);
        Bullet.visible:=false;
      end;
    end;
  end;

  Bomb1.Top:=Bomb1.top + 12;
  if Bomb1.top > self.height then Bomb1.Visible:=false;
  if Bomb1.visible = true then
  begin
    if (Bomb1.top + Bomb1.height > Player.top) and (Bomb1.top < Player.top + Player.height) then
    begin
      if (Bomb1.Left + Bomb1.Width > Player.Left) and (Bomb1.left < Player.left + Player.Width) then
      begin
        MainLoop.enabled:=false;
        showmessage('GameOver');
        close;
      end;
    end;
  end;
end;

end.

