public static class NucleotideCount
{
    public static IDictionary<char, int> Count(string sequence)
    { 
        var result =  new Dictionary<char, int> 
        {
            ['A'] = 0,
            ['C'] = 0,
            ['G'] = 0,
            ['T'] = 0            
        };
        foreach(char n in sequence){
            if (result.ContainsKey(n)){
                result[n] += 1;
            }
            else {
                throw new ArgumentException("Invalid nucleotid.");
            }
        }
        return result;
    }
}