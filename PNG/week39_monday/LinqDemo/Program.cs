/* Inbyggda namespaces är 
    System,
    System.IO,
    System.Net.Http,
    System.Linq
    System.Collections.Generic
*/




class Program
{
    static void Main()
    {
        var persons = CreatePersons();

        ShowAll(persons);
        Show_K_Names(persons);
        ShowSorted(persons);
        ShowYoungWith_A(persons);
        ShowAgeStats(persons);
    }

    static List<Person> CreatePersons()
    {
        return new List<Person>
        {
            new Person { Name = "Kalle", Age = 25 },
            new Person { Name = "Anna", Age = 30 },
            new Person { Name = "Pelle", Age = 19 },
            new Person { Name = "Kristina", Age = 40 },
            new Person { Name = "Karin", Age = 22 },
            new Person { Name = "Mikael", Age = 23 },
        };
    }
    static void ShowAll(List<Person> persons)
    {
        Console.WriteLine("-- Alla personer --");
        foreach (var person in persons)
        {
            Console.WriteLine(person.Name + " " + person.Age);
        }
    }

    static void Show_K_Names(List<Person> persons)
    {
        var k_names = (from p in persons
                       where p.Name.StartsWith('K')
                       select p).ToList();
        k_names.ForEach(p => Console.WriteLine(p.Name));
    }

    static void ShowSorted(List<Person> persons)
    {
        var sortedPersons = (from p in persons
                             orderby p.Name descending
                             select p).ToList();
        sortedPersons.ForEach(sp => Console.WriteLine(sp.Name));
    }

    static void ShowYoungWith_A(List<Person> persons)
    {
        var youngWithA = (from p in persons
                          where p.Age <= 30 &&
                          p.Name.ToLower().Contains('a')
                          select p).ToList();
        Console.WriteLine("Antal: " + youngWithA.Count());
        youngWithA.ForEach(p => Console.WriteLine($"{p.Name} {p.Age}"));
    }

    static void ShowAgeStats(List<Person> persons)
    {
        int maxAge = (from p in persons select p.Age).Max();
        int minAge = (from p in persons select p.Age).Min();
        int sumOfAges = (from p in persons select p.Age).Sum();

        Console.WriteLine($"Max ålder: {maxAge}");
        Console.WriteLine($"Min ålder: {minAge}");
        Console.WriteLine($"Summan av åldrar: {sumOfAges}");
    }
}