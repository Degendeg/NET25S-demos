
/*

    Kör ni detta i VSCode så kan ni sätta breakpoints 🔴 på den kodrad ni vill fastna på.
    Steg för steg titta på hur er kod beter sig och undersöka variabler och annat relevant.
    𝗛𝗼𝘄 𝘁𝗼: Tryck på raden du vill stanna på, precis till vänster om kodradens nummer.
    Kör igång med F5 eller i översta menyraden tryck på Run → Start Debugging

*/
class Program
{
    static void Main()
    {
        Console.WriteLine($"-- Debug demo --");

        // List<string>? names = null;
        // names.Add("Anna"); // kommer bli problem
        // names.Add("Johnny");
        // names.Add("Sebbe");

        // // evig loop
        // for (int i = 0; i >= 0; i++)
        // {
        //     Console.WriteLine(i);
        // }

        Console.Write("Ange första talet: ");
        int a = int.Parse(Console.ReadLine()!); // ! null-forgiving operator

        Console.Write("\nAnge andra talet: ");
        int b = int.Parse(Console.ReadLine()!);

        int result = AddNumbers(a, b);

        Console.WriteLine($"Summan av {a} och {b} är: {result}");
    }

    static int AddNumbers(int a, int b)
    {
        return a + b;
    }
}