unit FoodChain;

{$mode ObjFPC}{$H+}

interface

function recite(const StartVerse, EndVerse : int8) : string;

implementation

uses SysUtils;


function verseNo(const no : int8) : string;
const
  lineOne : string = 'I know an old lady who swallowed a ';
  spider : string =  ' that wriggled and jiggled and tickled inside her';
  lastLine : string = 'I don''t know why she swallowed the fly. Perhaps she''ll die.';
  animals : array [1..8] of string = ('fly', 'spider', 'bird', 'cat', 'dog', 'goat', 'cow', 'horse');
  phrases : array [1..8] of string = ('',
      'It wriggled and jiggled and tickled inside her.', 
        'How absurd to swallow a bird!',
        'Imagine that, to swallow a cat!',
        'What a hog, to swallow a dog!',
        'Just opened her throat and swallowed a goat!',
        'I don''t know how she swallowed a cow!',
        'She''s dead, of course!');
var
  k : int8;
begin
  result := lineOne + animals[no] + '.' + #10 + phrases[no];
  if (no>1) and (no<8) then
  begin
    for k:=no downto 2 do
    begin
      result:= result + #10 + 'She swallowed the ' + animals[k] +' to catch the ' + animals[(k-1)];
      if k=3 then 
        result:= result + spider;
        
     result := result + '.';    
    end;
      result := result + #10;
  end;
    if (no<8) then
      result := result + lastLine;  
end; 

function recite(const StartVerse, EndVerse : int8) : string;
var 
  i : int8;
begin
  result := '';
  for i:= StartVerse to EndVerse do
  begin
    result := result + verseNo(i) ;
    if i<>EndVerse then
      result := result + #10 + #10;
  end;
end;

end.
