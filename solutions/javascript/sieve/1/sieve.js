//
// classical sieve

export const primes = (N) => {
  if(N<2) return [];
  let numbers = Array.from(Array(N-1), (_,k)=>k+2);
  let n=2
  while(n<=N){
    for(let k=n*n; k<=N; k+=n){
      numbers[k-2]=0;
    }  
    n++;
  }
  return numbers.filter(p=>p!=0);
};
