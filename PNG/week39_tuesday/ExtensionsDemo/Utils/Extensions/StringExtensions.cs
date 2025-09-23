public static class StringExtensions // statisk klass
{
    public static int WordCount(this string str) // statisk metod + this inparam
    {
        string[] userStr = str.Split(' ', StringSplitOptions.RemoveEmptyEntries);
        return userStr.Length;
    }
}