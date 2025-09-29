class Program
{
    static void Main()
    {
        // FizzBuzz.DoFizzBuzz();
        var tasks = new List<string>();
        bool running = true;

        while (running)
        {
            Console.Clear();
            Console.WriteLine($"\n -- ToDo app --");
            Console.WriteLine($"1. Lista uppgifter");
            Console.WriteLine($"2. Lägg till uppgift");
            Console.WriteLine($"3. Avsluta");
            Console.Write("Välj: ");

            string? choice = Console.ReadLine();

            switch (choice)
            {
                case "1":
                    if (tasks.Count == 0)
                        Console.WriteLine($"Inga uppgifter ännu, lägg till en ny!");
                    else
                        tasks.ForEach(t => Console.WriteLine($"- {t}"));
                    break;
                case "2":
                    Console.Write("Skriv titel: ");
                    string? title = Console.ReadLine();
                    if (!string.IsNullOrWhiteSpace(title))
                        tasks.Add(title);
                    break;
                case "3":
                    running = false;
                    break;
                default:
                    Console.WriteLine($"Ogiltigt val, försök igen.");
                    break;
            }

            if (running)
            {
                Console.WriteLine($"\nTryck på valfri tangent för att fortsätta..");
                Console.ReadKey();
                Console.Clear();
            }
        }
    }
}