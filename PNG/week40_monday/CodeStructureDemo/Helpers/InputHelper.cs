public static class InputHelper
{
    public static int GetInt(string prompt)
    {
        Console.WriteLine(prompt);
        return int.Parse(Console.ReadLine()!);
    }
}
