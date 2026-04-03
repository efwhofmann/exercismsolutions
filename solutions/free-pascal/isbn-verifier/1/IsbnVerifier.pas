unit IsbnVerifier;

{$mode ObjFPC}{$H+}

interface

function IsValid(const isbn : string) : boolean;

implementation

uses SysUtils;

function IsValid(const isbn : string) : boolean;
var 
  sum : integer;
  factor : integer;
  ch : char;
  val : integer;
  valid : boolean;
begin
  sum := 0;
  factor := 10;
  for ch in isbn do
  begin
    if ch='-' then
      continue;
      
    valid := ((ord(ch)>=ord('0')) and (ord(ch)<=ord('9'))) 
      or ((ch='X') and (factor=1));
    if not valid then
      exit(false);
      
    if ch='X' then 
      val := 10
    else
      val := ord(ch) - ord('0');
    sum := sum + val*factor;
    dec(factor);
  end;
  result := (factor=0) and (sum mod 11 = 0);
end;

end.
