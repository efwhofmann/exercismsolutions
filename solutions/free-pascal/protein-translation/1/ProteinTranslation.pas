unit ProteinTranslation;

{$mode ObjFPC}{$H+}

interface

uses SysUtils;

type
  TStrArray = Array Of String;

function proteins(const strand : string) : TStrArray;

implementation

function peptid(const triple : string) : string;
begin
  case triple of
    'AUG' : result := 'Methionine';
    'UUU', 'UUC' : result := 'Phenylalanine';
    'UUA', 'UUG' : result := 'Leucine';
    'UCU', 'UCC', 'UCA', 'UCG' : result := 'Serine';
    'UAU', 'UAC' : result :='Tyrosine';
    'UGU', 'UGC' : result :='Cysteine';
    'UGG' : result :='Tryptophan';
    'UAA', 'UAG', 'UGA' : result :='STOP';
   else
     result := 'INVALID';
    end;
end;

function proteins(const strand : string) : TStrArray;
var 
  i : integer;
  codon : string;
  amino_acid : string;
begin
  if strand='' then 
    exit([]);
  (* if (length(strand) mod 3) <> 0 then
    raise Exception.Create('Invalid codon'); *)
  i := 1;
  codon := '';
  repeat
    codon := strand[i] + strand[i+1] + strand[i+2];
    if (i+2<length(strand)) and (i+5>length(strand)) then
      raise Exception.Create('Invalid codon');
    
    amino_acid := peptid(codon);    
    if amino_acid = 'STOP' then
      break
    else if amino_acid = 'INVALID' then
      raise Exception.Create('Invalid codon');    
    Insert(amino_acid, result, length(result));
    
    i:= i + 3;
  until (i>=length(strand));
  
  

end;

end.
