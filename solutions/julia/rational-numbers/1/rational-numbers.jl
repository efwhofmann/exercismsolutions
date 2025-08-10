import Base: +, -, *, /, abs, ^
import Base: ==, !=, <, <=, >, >=
import Base: zero, one 
import Base: show, inv 
import Base: numerator, denominator, isfinite

struct RationalNumber{T <: Integer} <: Real
    num::T
    den::T
  
    function RationalNumber{T}(a::T, b::T) where T<: Integer
         a == b == 0 && throw(ArgumentError("Invalid Rational $(a)//$(b)"))
         s = signbit(b) ? -1 : 1 
         d = gcd(a,b)
         new(div(s*a,d),div(s*b,d))
     end
end

RationalNumber(a::T, b::T) where T<:Integer = RationalNumber{T}(a,b)
    
  
RationalNumber{T}(n::T) where T<:Integer = RationalNumber{T}(n,1)
RationalNumber(n::T) where T<:Integer = RationalNumber{T}(n,1)   
    
zero(::Type{T}) where T<:RationalNumber{Int} = RationalNumber(0,1)  
one(::Type{T}) where T<:RationalNumber{Int} = RationalNumber(1,1)     

    
inv(r::RationalNumber) = RationalNumber(r.den, r.num)
show(io::IO,r::RationalNumber) = print(io, "$(r.num)//$(r.den)")
    
numerator(r::RationalNumber) = r.num
denominator(r::RationalNumber) = r.den
    
isfinite(r::RationalNumber) = !(iszero(r.den))
isinf(r::RationalNumber) = (iszero(r.den))
 
function *(r1::RationalNumber, r2::RationalNumber)
    RationalNumber(r1.num*r2.num, r1.den*r2.den)
end

function/(r1::RationalNumber, r2::RationalNumber)
    RationalNumber(r1.num*r2.den, r2.num*r1.den)
end

function +(r1::RationalNumber, r2::RationalNumber)
    RationalNumber(r1.num*r2.den + r2.num*r1.den, r1.den*r2.den)
end

function -(r1::RationalNumber, r2::RationalNumber)
    r1 + RationalNumber(-r2.num, r2.den)
end
    
abs(r::RationalNumber) =  RationalNumber(abs(r.num), abs(r.den))

^(r::RationalNumber, n::Integer) = RationalNumber(r.num^n, r.den^n)
^(r::RationalNumber, s::RationalNumber) = (r.num/r.den)^(s.num/s.den)
^(r::RationalNumber, x::Real) = r.num^x/r.den^x
^(x::Real, q::RationalNumber) = x^(q.num/q.den)

==(r::RationalNumber, x::Real) =  r.den == 1 && r.num == x 
==(r1::RationalNumber, r2::RationalNumber) =  
   iszero(r1.den) ? iszero(r2.den) && signbit(r1.num) == signbit(r2.num)  :  r1.num == r2.num && r1.den == r2.den  


!=(r::RationalNumber, x::Real) = !(r == x)
!=(r1::RationalNumber, r2::RationalNumber) = !(r1 == r2)

>(r::RationalNumber, x::Real) = r.num/r.den > x
>(r1::RationalNumber, r2::RationalNumber) =  
    begin
        if isfinite(r1) && isfinite(r2) 
            r1.num*r2.den > r2.num*r1.den 
        elseif  (isinf(r1) && !signbit(r1.num))  
            isfinite(r2) || (isinf(r2) && signbit(r2.num))
        else 
            isfinite(r1) &&  (isinf(r2) && signbit(r2.num))   
        end
    end
    
<(r::RationalNumber, x::Real) = r.num/r.den < x
<(r1::RationalNumber, r2::RationalNumber) =
   begin
        if isfinite(r1) && isfinite(r2) 
            r1.num*r2.den < r2.num*r1.den 
        elseif  (isinf(r1) &&  (signbit(r1.num)))  
            isfinite(r2) || (isinf(r2) && !signbit(r2.num))
        else 
            isfinite(r1) &&  (isinf(r2) && !signbit(r2.num))   
        end
    end

>=(r::RationalNumber, x::Real)= r>x || r==x
<=(r::RationalNumber, x::Real)= r<x || r==x
>=(r1::RationalNumber, r2::RationalNumber)= r1>r2 || r1==r2
<=(r1::RationalNumber, r2::RationalNumber)= r1<r2 || r1==r2
