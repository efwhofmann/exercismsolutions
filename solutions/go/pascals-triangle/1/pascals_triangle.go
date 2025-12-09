package pascal

func binom(n int, k int) int {
    if n==0 || k==0 || k==n {
        return 1
    } else {
        return binom(n-1,k)+binom(n-1,k-1)
    }
}

func Triangle(n int) [][]int {
	var p_triangle [][]int
    for N:=0; N<=n-1; N++ {
        var row []int
    	for k:=0;k<=N;k++ {
        	row = append(row, binom(N,k))
    	} 
    	p_triangle = append(p_triangle, row)
    }
    return p_triangle
}
