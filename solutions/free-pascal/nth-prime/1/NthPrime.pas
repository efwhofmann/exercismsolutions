unit NthPrime;

{$mode ObjFPC}{$H+}

interface

function prime(const number : dword) : cardinal;

implementation

uses SysUtils;

function prime(const number : dword) : cardinal;
var count: integer;
var k : integer;
var j : integer;
var is_prime : boolean;
begin
  if number=0 then
    raise Exception.Create('there is no zeroth prime');
  if number=1 then
    exit(2);
  
  count := 1;
  k := 1; 
  while count<number do
  begin 
    k := k + 2;
    is_prime := true;
    for j:=2 to Round(sqrt(k)) do
    begin
      if k mod j = 0 then
      begin
        is_prime := false;
        break;
      end;
    end;
    if is_prime then inc(count); 
  end;
  result := k;

end;

end.
