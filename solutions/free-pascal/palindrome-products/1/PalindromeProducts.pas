unit PalindromeProducts;

{$mode ObjFPC}{$H+}

interface

function smallest(const min, max : UInt64) : UInt64;
function largest(const min, max : UInt64) : UInt64;

implementation

uses SysUtils;

function ispalindrome(const n : UInt64) : boolean;
var str : string;
    i, len: integer;
begin
  if (n>=1) and (n<=9) then
    exit(true);
  str := IntToStr(n);
  len := length(str);  
  result := true;
  for i:=1 to (len div 2) do
  begin
    result := result and (str[i] = str[len +1 - i]);    
  end
end;

function FindPalindrome(const min, max: UInt64; least : boolean) : UInt64;
var
  i,j, prod: UInt64;
  found : boolean;
begin
  found := false;
  result := 0;
  if (min>max) then
    raise exception.create('min must be <= max');
  for i:=min to max do
  begin
    for j:= i to max do
    begin
      prod := i*j;
      if ispalindrome(prod) then
        if (not found) or (least and (prod<result) or ((not least) and (prod>result))) then
        begin
          result := prod;
          found := true;
        end;
        // else we've already got this 
    end;
  end;
  if not found then
    raise exception.create('no solution');
end;

function smallest(const min, max : UInt64) : UInt64;
begin
  result:=FindPalindrome(min, max, true); 
end;

function largest(const min, max : UInt64) : UInt64;
begin
result:=FindPalindrome(min,max,false);    
  
end;


end.
