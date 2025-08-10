function rows(letter)
    rows = String[]
    m = letter[1] - 'A'
    nr = 2*(m+1)-1
    for i in 0:nr-1 
        curRow = "";
        curLtIdx = i <= m ? i : 2*m -i
        curChar = 'A' + curLtIdx
        for j in -m:m
            ch = (j == -curLtIdx || j == curLtIdx) ? curChar : ' '
            curRow = curRow * ch
        end
        push!(rows, curRow)
    end
    rows
end
