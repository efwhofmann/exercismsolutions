unit RobotSimulator;

{$mode ObjFPC}{$H+}

interface

type
  TPosition = record
    x: Int64;
    y: Int64;
  end;

  TDirection = (north, east, south, west);

  TRobot = class
  private
    position : TPosition;
    bearing : TDirection;
    procedure advance();
    procedure turnRight();
    procedure turnLeft();    
  public
    constructor Create(const pos: TPosition; const dir: TDirection);
    procedure Move(const instructions : String);
    function ToString: String; override;
  end;

implementation

uses SysUtils;

constructor TRobot.Create(const pos: TPosition; const dir: TDirection);
begin
  position := pos;
  bearing := dir;
end;

procedure TRobot.advance();
begin
  case bearing of 
    north : Inc(position.y);
    east  : Inc(position.x);
    south : Dec(position.y);
    west  : Dec(position.x);
  end;
end;

procedure TRobot.turnRight();
begin
  case bearing of 
    north : bearing:= east;
    east  : bearing:= south;
    south : bearing:= west;
    west  : bearing:= north;
  end;
end;

procedure TRobot.turnLeft();
begin
  case bearing of 
    north : bearing:= west;
    east  : bearing:= north;
    south : bearing:= east;
    west  : bearing:= south;
  end;
end;


procedure TRobot.Move(const instructions : String);
var inst : char;
begin
  for inst in instructions do
  begin
    case inst of 
      'A' : advance();
      'L' : turnLeft();
      'R' : turnRight();
     else
       raise Exception.create('invalid instruction');     
    end;
  end;
end;


function TRobot.ToString: String;
begin
  result:=IntToStr(position.x)+','+IntToStr(position.y)+' ';
  case bearing of 
    north : result += 'N';
    east : result += 'E';
    south : result += 'S';
    west : result += 'W';
  end;  
end;

end.
