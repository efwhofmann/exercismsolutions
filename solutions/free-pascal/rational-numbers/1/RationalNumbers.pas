unit RationalNumbers;

{$mode ObjFPC}{$H+}

interface

uses SysUtils, Math;

type
  TRational = record
    Numer : integer;
    Denom : integer;
  end;

function Rational(const aNum, aDenom : integer) : TRational;

operator + (const a, b : TRational) : TRational;
operator - (const a, b : TRational) : TRational;
operator * (const a, b : TRational) : TRational;
operator / (const a, b : TRational) : TRational;

function AbsoluteValue(const r : TRational) : TRational;
function ExpRational(const r : TRational; const n : integer) : TRational;
function ExpReal(const x : double; const r : TRational) : double;

implementation

function gcd(a,b : integer) : integer;
var t: integer;
begin
  while b<>0 do
  begin
    t := a;
    a := b;
    b := t mod b;
  end;
  result := a;
end;

function lcm(a,b:integer) : integer;
begin
  result := (a*b) div gcd(a,b); 
end;

function Rational(const aNum, aDenom : integer) : TRational;
var d : integer;
begin
  if aDenom=0 then
    raise Exception.create('denominator cannot be zero')
  else if aNum=0 then 
    with result do
    begin
      numer := 0;
      denom := 1;
    end
  else
    with result do 
    begin
      d := gcd(aNum, aDenom);
      numer := aNum div d;
      denom := aDenom div d;
      if denom<0 then 
      begin
        denom := - denom;
        numer := - numer;
      end;
    end;
end;

operator + (const a, b : TRational) : TRational;
begin
  if a.numer=0 then
    result:= b
  else if b.numer=0 then
    result := a
  else
    result := Rational(a.numer*b.denom + b.numer*a.denom, a.denom*b.denom);    
end;

operator - (const a, b : TRational) : TRational;
var c : TRational;
begin
  c := Rational(-b.numer, b.denom);
  result := a + c;
end;

operator * (const a, b : TRational) : TRational;
begin
  if (a.numer = 0) or (b.numer=0) then
    result:= Rational(0,1)
  else
    result:= Rational(a.numer*b.numer, a.denom*b.denom);
end;

operator / (const a, b : TRational) : TRational;
begin
  if b.numer=0 then 
    raise Exception.create('division by 0')
  else
    result:= Rational(a.numer*b.denom, a.denom*b.numer);
end;

function AbsoluteValue(const r : TRational) : TRational;
begin
  result:= Rational(abs(r.numer), abs(r.denom));
end;

function ExpRational(const r : TRational; const n : integer) : TRational;
var 
  i,p,q:integer;
  a,b: integer;
begin
  if n>=0 then
  begin
    a := r.numer;
    b := r.denom
  end
  else
  begin
    a := r.denom;
    b := r.numer;
  end;
  p:=1; q:=1;
  for i:=1 to abs(n) do
  begin
    p:= a * p;
    q:= b * q;
  end;
  result := Rational(p,q);
end;

function ExpReal(const x : double; const r : TRational) : double;
begin
  result := power(x, r.numer/r.denom);
end;

end.
