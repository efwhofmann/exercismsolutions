unit Change;

{$mode ObjFPC}{$H+}

interface

type
  TIntArray = Array Of Integer;

function findFewestCoins(
  const coins : TIntArray;
  const target : Integer
) : TIntArray;

implementation

uses SysUtils;

function findSolutions(const coins : TIntArray;
  const target : Integer) : TIntArray;
var
  p,i,coin,min : integer;
  cnums : TIntArray = ();
begin
  Setlength(cnums, target+1);
  cnums[0] := 0;
  
  result := [];  
  Setlength(result, target+1);
  result[0] := 0;  
  
  for p:=1 to target do
  begin
    coin := 0;
    min := MaxInt;
    for i:=low(coins) to  high(coins) do
    begin
      if coins[i]<=p then
        if cnums[p-coins[i]]<min then
        begin
          min := 1 + cnums[p-coins[i]];
          coin := i;
        end;
    end;
    if (p=target) and (min = MaxInt) then
      raise Exception.create('cannot make target with given coins');
    cnums[p]:=min;
    result[p]:=coin;
  end;
 end;

function makeSolution(const sols : TIntArray; const coins : TIntArray; target : Integer) : TIntArray;
var 
  coin : integer;
begin
  result:= [];
  while target>0 do
  begin
    coin := coins[sols[target]];
    Insert(coin, result, 0);
    target := target - coin;
  end;
end;

function findFewestCoins(
  const coins : TIntArray;
  const target : Integer
) : TIntArray;
var 
  solutions : TIntArray = ();
begin
  if target<0 then
    raise Exception.create('target cannot be negative')
  else if target=0 then
    exit([]);

 solutions := findSolutions(coins, target);
 result := makeSolution(solutions, coins, target);
end;

end.
