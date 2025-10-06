class Program
{
    public static int Answer { get; set; }
    public static bool Playing { get; set; } = true;
    public static void Main()
    {
        Console.WriteLine($"Guess the number between 1-100");
        GenerateAnswer();

        while (Playing)
        {
            Console.Write("Your guess: ");
            string input = Console.ReadLine()!;
            if (int.TryParse(input, out int guess))
            {
                if (Answer == guess)
                {
                    Console.WriteLine($"Congratulations, you guessed correctly!");
                    Console.Write($"Play again (y/n)? ");
                    if (Console.ReadLine()!.Equals("n", StringComparison.CurrentCultureIgnoreCase))
                    {
                        Playing = false;
                    }
                    GenerateAnswer();
                }
                else if (Answer > guess)
                {
                    Console.WriteLine($"The number I am thinking of is higher than yours, try again.");
                }
                else
                {
                    Console.WriteLine($"The number I am thinking of is lower than yours, try again.");
                }
            }
            else
            {
                Console.WriteLine($"Not a valid number, try again!");
            }
        }
    }

    private static void GenerateAnswer()
    {
        var rnd = new Random();
        Answer = rnd.Next(1, 101);
    }
}