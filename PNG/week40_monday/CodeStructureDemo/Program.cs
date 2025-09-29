class Program
{
    static void Main()
    {
        Console.WriteLine("Välkommen till kalkylatorn!");

        Console.WriteLine("Ange första talet:");
        int tal1 = int.Parse(Console.ReadLine()!);

        Console.WriteLine("Ange andra talet:");
        int tal2 = int.Parse(Console.ReadLine()!);

        int summa = tal1 + tal2;
        int produkt = tal1 * tal2;

        Console.WriteLine($"Summan är: {summa}");
        Console.WriteLine($"Produkten är: {produkt}");
    }
}

// class Program
// {
//     static void Main()
//     {
//         Console.WriteLine("Välkommen till kalkylatorn!");

//         int tal1 = InputHelper.GetInt("Ange första talet:");
//         int tal2 = InputHelper.GetInt("Ange andra talet:");

//         var calc = new CalculatorService();
//         Console.WriteLine($"Summan är: {calc.Add(tal1, tal2)}");
//         Console.WriteLine($"Produkten är: {calc.Multiply(tal1, tal2)}");
//     }
// }
