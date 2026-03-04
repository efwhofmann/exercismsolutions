function dft(x)
    N = length(x)
    freqs(n) = [cispi(-2*k*n/N) for k in 0:(N-1)]
    [sum(x.* freqs(n)) for n in 0:(N-1)]
 end

function fft(x)
    N = length(x)
    N == 1 && return x
    even, odd = fft(x[1:2:N]), fft(x[2:2:N])
    c = Vector{Complex{Float64}}(undef,N)
    for k in 1:(N÷2)
        q = cispi(-2*(k-1)/N)
        c[k] = even[k] + q*odd[k]
        c[k+ N÷2] = even[k] - q*odd[k]
    end        
    c
end
