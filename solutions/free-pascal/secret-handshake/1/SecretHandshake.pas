unit SecretHandshake;

{$mode ObjFPC}{$H+}

interface

type
  TStrArray = Array Of String;

function commands(const number : integer) : TStrArray;

implementation

uses SysUtils;


function reverse(acts : TStrArray) : TStrArray;
var
  n, i : integer;
begin
  result := nil;
  n := length(acts);
  setlength(result,n);
  for i:=low(acts) to high(acts) do
  begin
    result[i]:=acts[high(acts) - i];
  end;
end; 

function commands(const number : integer) : TStrArray;
const 
  actions : array[0..3] of string = ('wink', 'double blink', 'close your eyes', 'jump');
var 
  i : integer;
begin
  result := [];
  for i:=0 to 3 do 
  begin 
   if (number and (1 shl i))<>0 then
     insert(actions[i], result, length(result));
  end;
  if (number and (1 shl 4))<>0 then
    result := reverse(result);
end;

end.
