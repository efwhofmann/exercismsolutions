unit ScrabbleScore;

{$mode ObjFPC}{$H+}

interface

function score(const word : string) : integer;

implementation

uses SysUtils;

function score(const word : string) : integer;
var
  lc_word : string;
  lt : char;
  lt_score : integer;
begin
  lc_word := LowerCase(word);
  result := 0;
  for lt in lc_word do
  begin
      case lt of
        'a','e','i','o','u','l','n','r','s','t' : lt_score:=1;   
        'd', 'g': lt_score:=2;
        'b', 'c', 'm', 'p' : lt_score:=3;
        'f', 'h', 'v', 'w', 'y': lt_score:=4;
        'k' : lt_score := 5;
        'j', 'x' : lt_score := 8;
        'q', 'z' : lt_score := 10;
        else
          lt_score:=0;
        end;
      result := result + lt_score;
  end;

end;

end.
