# Define the pythagorean_triplets(N) function

# using Euclid's formula

function get_m_n_vec(N)
    res = []
    for m in max(1, div(isqrt(N),4)):div(N,2)
        if mod(N,2*m) == 0
            n = div(N, 2*m) - m 
                if n in 1:m-1
                    push!(res, tuple(m,n))
            end
        end
    end
    res
end

function build_triplet(m,n,k)
    a = k*(m^2 - n^2); b = 2*m*n*k; c=k*(m^2 + n^2)
    if (a>b) 
        t=a; a=b; b=t
    end
    tuple(a,b,c)
end

function pythagorean_triplets(N)
    triples = []
    for k in range(1,N-1,step=2)
        if mod(N, k) == 0
            T = get_m_n_vec(div(N,k))
            if T!=[] 
                for i in 1:length(T)
                    t = build_triplet(T[i][1], T[i][2], k)
                    if !(t in triples)
                        push!(triples,t)
                    end
                end
            end
        end
    end
    sort(triples)
end