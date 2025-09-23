class Program
{
    static void Main()
    {
        // använda vår egen extension metod på en sträng
        string sentence = "This is a sentence without any further meaning.";
        int numberOfWords = sentence.WordCount();
        Console.WriteLine(numberOfWords);

        // vi kan skapa fler extension metoder, nu på en int
        int num = 999999999;
        int squareResult = num.Square();
        Console.WriteLine($"{num} i kvadrat är {squareResult}");

        // här kommer vår extension metod att kasta ett undantag
        // string? text = null;
        // men inte om strängen har ett värde, då passerar den CheckForNull extension metoden
        string? text = "hej";
        try
        {
            text.CheckForNull(nameof(text));
            Console.WriteLine($"Textens längd är {text.Length}");
        }
        catch (ArgumentNullException ex)
        {
            Console.WriteLine($"Fel upptäckt {ex.Message}");
        }
    }
}