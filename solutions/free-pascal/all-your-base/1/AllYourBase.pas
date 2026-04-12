unit AllYourBase;

{$mode ObjFPC}{$H+}

interface

type
  TIntArray = Array Of Integer;

function rebase(
  const InputBase   : integer;
  const InputDigits : TIntArray;
  const OutputBase  : integer
) : TIntArray;

implementation

uses SysUtils;


function isValid(const base: Integer; const Digits : TIntArray) : boolean;
var
  d : integer;
begin  
  for d in Digits do
  begin
    if (d<0) or (d>= base) then 
      exit(false);
  end;
  result := true;
end;

function digitsToInt(const Base: Integer; const Digits : TIntArray) : integer;
var 
  power, i: integer;
begin
  result := 0;  
  power := 1;
  for i:= (Length(Digits)-1) downto 0 do
  begin
    result := result +  Digits[i]*power;
    power := power * base;
  end;
end;

function IntToDigits(const base: integer; const number: integer) : TIntArray;
var 
  n : integer;
begin
  n := number;
  result := [];
  if n=0 then
    result := [0]
  else
    while n>0 do 
    begin
      Insert((n mod base), result, 0);
      n:= n div base;
    end;
end;

function rebase(
  const InputBase   : integer;
  const InputDigits : TIntArray;
  const OutputBase  : integer
) : TIntArray;
var 
  errmsg : string;
begin
  result := [];
  if ((InputBase>1) and (OutputBase>1)) and isValid(InputBase, InputDigits) then    
    result := intToDigits(OutputBase, digitsToInt(InputBase, InputDigits))
  else
    begin
      errmsg := '';
      if (InputBase<2) then
        errmsg := 'input base must be >= 2'
      else if (OutPutBase<2) then
        errmsg := 'output base must be >= 2'
      else
        errmsg := 'all digits must satisfy 0 <= d < input base';
      raise Exception.create(errmsg);
    end;    
end;

end.
