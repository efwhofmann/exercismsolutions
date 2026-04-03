unit Anagram;

{$mode ObjFPC}{$H+}

interface

type
  TStrArray = Array Of String;

function FindAnagrams(
  const subject    : string;
  const candidates : TStrArray
) : TStrArray;

implementation

uses SysUtils;

function BitVector(const word : string) : longint;
var 
  c : char;
  lt : longint;
begin
  result := 0;
  for c in word do  
  begin
    lt := ord(c) or 32;  
    if (lt>=97) and (lt<=122) then
    begin
        lt := 1 shl (lt - 97);
        result := result xor lt;
    end;
  end;
end;

function FindAnagrams(
  const subject    : string;
  const candidates : TStrArray
) : TStrArray;
var 
  subject_bits : longint;  
  current : string;
  current_bits : longint;
begin
  result := [];
  subject_bits := BitVector(subject);
  for current in candidates do
  begin
    if (length(current)<>length(subject)) or (UpperCase(current)=UpperCase(subject)) then
      continue;
    current_bits := BitVector(current);
    if (current_bits = subject_bits) then
      Insert(current, result, length(result));
  end;
end;

end.
