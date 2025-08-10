import Base: +, -, *, /, abs
import Base: ==, !=, isapprox
import Base: real, imag, conj
import Base: zero, one 
import Base: show, inv
import Base: exp


struct ComplexNumber <: Number
    re::Real
    im::Real
    
    function ComplexNumber(u::Real, v::Real)
        new(u,v)
    end
end


ComplexNumber(x::Real) = ComplexNumber(x,zero(x))


zero(::Type{ComplexNumber})  = ComplexNumber(0,0)  
one(::Type{ComplexNumber}) = ComplexNumber(1,1)  
const jm = ComplexNumber(0,1)

abs(z::ComplexNumber) = sqrt(z.re^2 + z.im^2)


real(z::ComplexNumber)  = z.re
real(r::Real) = r
imag(z::ComplexNumber)  = z.im
imag(r::Real) = zero(r)
conj(z::ComplexNumber) = ComplexNumber(z.re, - z.im)
conj(r::Real) = r
-(z::ComplexNumber) = ComplexNumber(-z.re, -z.im)

==(z::ComplexNumber, w::ComplexNumber) = (z.re == w.re && z.im == w.im)
==(r::Real, w::ComplexNumber) = (r == w.re &&  w.im == 0)
==(w::ComplexNumber,r::Real) = (r == w.re &&  w.im == 0)
!=(z::ComplexNumber, w::ComplexNumber) = !(z == w)
isappox(z::ComplexNumber, w::ComplexNumber) = (isapprox(z.re,w.re) && isapprox(z.im, w.im))



+(z::ComplexNumber, w::ComplexNumber) =  ComplexNumber(z.re + w.re, z.im + w.im)
-(z::ComplexNumber, w::ComplexNumber) =  ComplexNumber(z.re - w.re, z.im - w.im)
+(r::Real, w::ComplexNumber) =  ComplexNumber( w.re + r, w.im)
-(r::Real, w::ComplexNumber) =  ComplexNumber(r - w.re, - w.im)
-(w::ComplexNumber,r::Real) =  ComplexNumber(w.re - r, w.im)

function *(z::ComplexNumber, w::ComplexNumber) 
    new_re = z.re*w.re - z.im*w.im
    new_im = z.re*w.im + z.im*w.re
    ComplexNumber(new_re, new_im)
end

*(r::Real, w::ComplexNumber)  = ComplexNumber(r*w.re, r*w.im)
*(z::ComplexNumber, r::Real)  = ComplexNumber(r*w.re, r*w.im)

function inv(z::ComplexNumber) 
    denom = real(z*conj(z))
    ComplexNumber(z.re/denom, z.im/denom)
end

function /(z::ComplexNumber, w::ComplexNumber) 
    denom = real(w*conj(w))
    new_re = z.re*w.re + z.im*w.im
    new_im = z.im * w.re - z.re*w.im
    ComplexNumber(new_re/denom, new_im/denom)
end

function /(z::ComplexNumber, r::Real) 
      ComplexNumber(z.re/r, z.im/r)
end

show(io::IO,c::ComplexNumber) = imag(c)>=0 ? print(io, "$(c.re) + $(c.im)i") : print(io, "$(c.re) - $(-c.im)i")

function exp(z::ComplexNumber)
    a = real(z); b = imag(z)
    ComplexNumber(exp(a)*cos(b),exp(a)*sin(b))
end