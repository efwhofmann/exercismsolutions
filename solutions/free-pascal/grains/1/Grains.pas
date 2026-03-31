unit Grains;

{$mode ObjFPC}{$H+}

interface

function square(const ASquare : integer) : UInt64;
function total : UInt64;

implementation

uses SysUtils;

function square(const ASquare : integer) : UInt64;
const
  one : UInt64 = 1;
begin
  if (ASquare < 1) or (ASquare > 64) then
    raise Exception.create('square must be between 1 and 64');
    
  result:= one shl (Asquare-1);
end;

function total : UInt64;
const
  two : UInt64 = 2;
begin
  result:= two*square(64) - 1; 
end;

end.
