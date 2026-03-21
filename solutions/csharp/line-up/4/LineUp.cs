public static class LineUp
{
    public static string Format(string name, int number)
    {
        string[] suffixes = {"st", "nd","rd"};
        List<int> special = new List<int>{11,12,13};
        string suffix = "th";
        int final_digit = number%10;
        if (final_digit !=0 && final_digit <=3 && !special.Contains(number%100)) {
            suffix = suffixes[final_digit-1];
        }
       return $"{name}, you are the {number.ToString()}{suffix} customer we serve today. Thank you!";
    }
}
