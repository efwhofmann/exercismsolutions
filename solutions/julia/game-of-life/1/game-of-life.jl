function gameoflife(matrix)
    length = size(matrix,1)
    width = size(matrix,2)
    if 0==length || 0==width
        return reshape([],0,2)
    end
    result = Array{Int64}(undef, length, width)
    for i in 1:length
        for j in 1:width
            sum = 0
            sum  += (i>1 && j>1) ? matrix[i-1, j-1] : 0    
            sum  += (i>1) ? matrix[i-1, j] : 0
            sum  += (i>1 && j+1<=width) ? matrix[i-1, j+1] : 0
            sum  += (j>1) ? matrix[i, j-1] : 0
            sum  += (j+1<=width) ? matrix[i, j+1] : 0
            sum  += (i+1<=length && j>1) ? matrix[i+1, j-1] : 0
            sum  += (i+1<=length) ? matrix[i+1, j] : 0
            sum  += (i+1<=length && j+1<=width) ? matrix[i+1, j+1] : 0
            result[i, j] = 
                ((3==sum) || (1== matrix[i, j] && 2==sum)) ? 1 : 0
        end
    end
    result
end
