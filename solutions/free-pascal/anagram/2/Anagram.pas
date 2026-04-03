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

function IsAnagram(const candidate : string; const word : string) : boolean;
{* Input: two lowercase strings, result: is candidate and anagram of word? *}
var 
  letterCounts: array[0..25] of integer;
  i : integer;
  c : char;
begin
   if (length(candidate)<>length(word)) or (candidate = word) then 
     exit(false);
   for i:=0 to 25 do 
     letterCounts[i] := 0;

  for c in word do  
    inc(letterCounts[(ord(c) - 97)]);
  
  for c in candidate do
    dec(letterCounts[(ord(c) - 97)]);

  result := true;
  for i:=0 to 25 do
    result := result and (letterCounts[i]=0);
end;

function FindAnagrams(
  const subject    : string;
  const candidates : TStrArray
) : TStrArray;
var 
  current : string;
begin
  result := [];
  for current in candidates do
    if IsAnagram(LowerCase(current), LowerCase(subject)) then
      Insert(current, result, length(result));
end;

end.
