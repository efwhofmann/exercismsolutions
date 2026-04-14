unit Yacht;

{$mode ObjFPC}{$H+}

interface

type
  TDie = 1..6;
  TCategory = (kYacht, kOnes, kTwos, kThrees, kFours, kFives, kSixes,
               kFullHouse, kFourOfAKind, kLittleStraight, kBigStraight, kChoice);

function score(const category : TCategory; const dice : array of TDie) : integer;

implementation

uses SysUtils;

function countByNumber(const dice : array of TDie; const n : integer) : integer;
var d : TDie;
begin
  result := 0;
  for d in dice do
  begin
    if d=n then
      inc(result);
  end;
end;

function scoreByNumber(const dice : array of TDie; const n : integer) : integer;
begin
  result:= countByNumber(dice, n)*n;
end;

function scoreYacht(const dice : array of TDie) : integer;
begin
  if countByNumber(dice, dice[0]) = 5 then
    exit(50)
  else exit(0);
end;

function scoreChoice(const dice : array of TDie) : integer;
var d : TDie;
begin
  result := 0;
  for d in dice do
  begin
    inc(result, d);
  end;
end;

function hasTwoToFive(const dice : array of TDie) : boolean;
begin
  result:= false;
  if (countByNumber(dice,2) = 1) and
  (countByNumber(dice,3) = 1) and
  (countByNumber(dice,4) = 1) and
  (countByNumber(dice,5) = 1) then
    result := true;
end;

function scoreLtStraight(const dice : array of TDie) : integer;
begin
  if (countByNumber(dice,1) = 1) and hasTwoToFive(dice) then
    result:= 30
  else
    result := 0;
end;

function scoreBgStraight(const dice : array of TDie) : integer;
begin
  if (countByNumber(dice,6) = 1) and hasTwoToFive(dice) then
    result:= 30
  else
    result := 0;
end;

function scoreFourOfAKind(const dice : array of TDie) : integer;
var i, value: integer;
begin
  value := 0;
  for i:=1 to 6 do
  begin
    if countByNumber(dice,i)>=4 then
      value:=i;
  end;
  result:= 4*value;
end;

function scoreFullHouse(const dice : array of TDie) : integer;
var
  i, k: integer;
  twoFound, threeFound : boolean;
begin
  result:=0;
  twoFound := false;
  threeFound := false;
  for i:=1 to 6 do
  begin
    k := countByNumber(dice,i);
    if k=2 then twoFound:=true;
    if k=3 then threeFound:=true;
  end;
  if twoFound and threeFound then
    result:= scoreChoice(dice);
end;

function score(const category : TCategory; const dice : array of TDie) : integer;
begin
  result:=0;
  case category of 
    kOnes, kTwos, kThrees, kFours, kFives, kSixes:
      result:= scoreByNumber(dice, (ord(category)));
    kFullHouse:  result:=scoreFullHouse(dice);
    kFourOfAKind: result:= scoreFourOfAKind(dice);
    kLittleStraight: result := scoreLtStraight(dice);
    kBigStraight: result := scoreBgStraight(dice);
    kChoice: result := scoreChoice(dice);
    kYacht: result := scoreYacht(dice);    
  end;


end;

end.
