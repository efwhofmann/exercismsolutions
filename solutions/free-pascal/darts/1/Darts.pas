unit Darts;

{$mode ObjFPC}{$H+}

interface

function score(const x : single; const y : single) : uint8;

implementation

uses SysUtils;

function score(const x : single; const y : single) : uint8;
var r :  single;
begin
   r:=sqrt(x*x + y*y);
   result:=0;
   if r<=1 then
      result:=10
   else if r<=5 then
      result:=5
   else if r<=10 then
      result:=1;
end;

end.
