unit Sieve;

{$mode ObjFPC}{$H+}

interface

type
  TIntArray = Array Of Integer;
  TBoolArray = Array Of Boolean;

function primes(
  const limit   : Integer
) : TIntArray;

implementation

uses SysUtils;

function primes(
  const limit   : Integer
) : TIntArray;
var 
  table : TBoolArray = ();
  k : integer;
  n : integer;
  next_p : integer;
begin

  SetLength(table, limit+1);
  for k:=Low(table) to High(table) do
    table[k]:=True;
    
  result :=  []; 
  for k:=2 to limit do
  begin
    if table[k]=True then
    begin
      next_p := k;
      insert(next_p, result, Length(result));
      n:= 2*next_p;
      while n<=limit do
      begin
        table[n] := False;
        n := n + next_p;
      end;
    end;
  end;

end;

end.
