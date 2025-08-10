# Define the pythagorean_triplets(N) function

function get_m_n_vec(N,k)
    res = []
    for m in max(1, div(isqrt(N),4)):div(N,2)
        if mod(N,2*m) == 0
            n = div(N, 2*m) - m 
                if n in 1:m-1
                    push!(res, tuple(m,n,k))
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
    L=[]
    for k in range(1,N-1,step=2)
        if mod(N, k) == 0
            T = get_m_n_vec(div(N,k),k)
            if T!=[] && !(T in L)
                push!(L,T) 
            end
        end
    end
    for i in 1:length(L)
        for j in 1:length(L[i])
            t = build_triplet(L[i][j][1],L[i][j][2], L[i][j][3])
            if !(t in triples)
                push!(triples, t)
            end
        end
    end
    sort(triples)
end