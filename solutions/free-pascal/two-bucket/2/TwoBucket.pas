unit TwoBucket;

{$mode ObjFPC}{$H+}

interface

type
  BucketId = (One, Two);

  TResult = record
    moves: UInt64;
    goalBucket: BucketId;
    otherBucket: UInt64;
  end;

function measure(bucketOne, bucketTwo, goal : UInt64; startBucket: BucketId) : TResult;

implementation

uses SysUtils, Math;

(* Use extended gcd to determine Bezout coefficients u,v s.t. 
d = u*a + v*b
*)

type 
TGcdX = record
  d : UInt64;
  u : Int64;
  v : Int64;
end;

function gcdx(a,b : UInt64) : TGcdX;
var 
  u1,v1 : Int64;
begin
  if b = 0 then
   with result do
   begin
     d := a;
     u := 1; 
     v := 0;
   end
  else
    begin
      result := gcdx(b, (a mod b));
      v1 :=  result.v;
      u1 :=  result.u;
      result.u:= v1;
      result.v:= u1 - v1 * (a div b);
    end;    
end;

(* Solve the two bucket problem for the case that bucket One is the first to fill *)

function measureOne(bOne, bTwo, goal : UInt64) : TResult;
var gcd: TGcdx;
    t : Int64;
begin
  if goal = bOne then
    with result do
      begin
        moves := 1;
        goalBucket:=One;
        otherBucket := 0;
      end
  else if goal = bTwo then
    with result do
      begin
        moves := 2;
        goalBucket := Two;
        otherBucket := bOne;
      end 
  else
  begin
    gcd := gcdx(bOne, bTwo);
    if (goal mod gcd.d)<>0 then
      raise Exception.create('impossible');
    (* rescale coefficients s.t. 
    u*b1 + v*b2 = goal *)
    gcd.u := gcd.u * (goal div gcd.d);
    gcd.v := gcd.v * (goal div gcd.d);
    if gcd.u < 0 then
    begin
      t:= ((-gcd.u *gcd.d) div bTwo)+1;
      gcd.u := gcd.u + (bTwo div gcd.d)*t;
      gcd.v := gcd.v - (bOne div gcd.d)*t;
    end;
    if bOne>=goal then 
    (* If target volume fits in bucket One,
    we can elimnate the last last "empty two"
    and "pour into two" op.*)
      with result do
      begin
        moves := abs(2*(gcd.u - gcd.v) - 2);
        goalBucket := One;
        otherBucket := bTwo;
      end
    else
      with result do
      begin 
        moves := abs(2*(gcd.u - gcd.v));
        goalBucket := Two;
        otherBucket := 0;  
      end;
    end;
end;

function measure(bucketOne, bucketTwo, goal : UInt64; startBucket: BucketId) : TResult;
begin
  if goal = 0 then
    with result do
    begin
      moves := 0;
      goalBucket := startBucket;
      otherBucket := 0;
    end;
  if goal>max(bucketOne, bucketTwo) then
    raise Exception.create('impossible');
    
  if startBucket = One then 
    result:=measureOne(bucketOne,bucketTwo,goal)
  else
  (*Start bucket is Two: Switch the buckets and switch back id of start bucket*)
    begin
      result:=measureOne(bucketTwo, bucketOne, goal);
      if result.goalBucket=One then
        result.goalBucket:=Two
      else
        result.goalBucket:=One;
    end;
end;

end.
