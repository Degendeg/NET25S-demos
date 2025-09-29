class FizzBuzz
{
    public static void DoFizzBuzz()
    {
        Enumerable.Range(1, 100).Select(x =>
            (x % 15 == 0) ? "FizzBuzz"
            : (x % 5 == 0) ? "Buzz"
            : (x % 3 == 0) ? "Fizz"
            : x.ToString()
        )
        .ToList()
        .ForEach(Console.WriteLine);
    }
}