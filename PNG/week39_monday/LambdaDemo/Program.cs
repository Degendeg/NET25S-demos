class Program
{
    static void Main()
    {
        var numbers = new List<int>() { 10, 20, 31, 40, 55, 62, 73 };

        // hämta alla tal som är större än 20
        // Lambda först (metoduttryck)
        // LINQ sedan (frågespråk, liknar SQL)
        var lambdaNumsBiggerThan20 = numbers.Where(x => x > 20).ToList();
        var linqNumsBiggerThan20 = (from n in numbers
                                    where n > 20
                                    select n).ToList();

        Console.WriteLine("Lambda approach:");
        lambdaNumsBiggerThan20.ForEach(n => Console.WriteLine(n));
        Console.WriteLine("\nLINQ approach:");
        linqNumsBiggerThan20.ForEach(n => Console.WriteLine(n));

        // räkna hur många jämna tal det finns i listan
        var evenCount = numbers.Count(x => x % 2 == 0);
        Console.WriteLine($"\nJämna tal: {evenCount}");

        // hitta största talet
        int maxOver20 = numbers.Where(x => x > 20).Max();
        Console.WriteLine($"\nStörsta tal över 20: {maxOver20}");

        // hitta näst största talet
        int secondLargestNumber = numbers.OrderByDescending(n => n).Skip(1).Max();
        Console.WriteLine($"\nNäst största talet i listan: {secondLargestNumber}\n");

        // Skapar en array med "anonyma objekt", dvs objekt utan egen klass
        // Varje objekt har två properties: Name (string) och Age (int)
        var persons = new[]
        {
            new { Name = "Anna", Age = 11 },
            new { Name = "Jonas", Age = 14 },
            new { Name = "Jane", Age = 18 },
            new { Name = "Maria", Age = 25 },
            new { Name = "Jesper", Age = 30 },
        };

        var adultsStartsWithJ = persons.Where(p => p.Age >= 18 && p.Name.StartsWith('J')).ToList();
        adultsStartsWithJ.ForEach(a => Console.WriteLine(a.Name));
    }
}