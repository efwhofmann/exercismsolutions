unit NucleotideCount;

{$mode ObjFPC}{$H+}

interface

function NucleotideCounts(const strand : string) : string;

implementation

uses SysUtils;

function NucleotideCounts(const strand : string) : string;
var
  i,a,t,g,c : integer;
begin
  a := 0; t := 0; g := 0; c := 0;
  for i:=1 to length(strand) do
  begin
    case strand[i] of
      'A' : a:= a + 1;
      'T' : t:= t + 1;
      'G' : g:= g + 1;
      'C' : c:= c + 1;
    else
      raise Exception.Create('Invalid nucleotide in strand');
    end;
  end;
  result := 'A: ' + IntToStr(a) + #10 + 
    'C: ' + IntToStr(c) + #10 +
    'G: ' + IntToStr(g) +  #10 +
    'T: ' + IntToStr(t);
end;

end.
