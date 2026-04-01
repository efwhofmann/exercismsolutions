unit RnaTranscription;

{$mode ObjFPC}{$H+}

interface

function ToRna(const dna : string) : string;

implementation

uses SysUtils;

function ToRna(const dna : string) : string;
var
  c : string;
  i : integer;
begin
  result := '';
  for i:=1 to length(dna) do
  begin
    case dna[i] of
      'A' : c:='U';
      'T' : c:='A';
      'C' : c:='G';
      'G' : c:='C';
    else
      raise Exception.Create('Invalid Input');
    end;
    result := result + c;
  end;
  

end;

end.
