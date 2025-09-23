while (true)
{
    try
    {
        Console.Write("Skriv ett tal: ");
        string? input = Console.ReadLine();
        int number = int.Parse(input ?? "");
        int result = number / 0;
        Console.WriteLine($"Resultat: {result}");
    }
    catch (Exception ex)
    {
        Console.WriteLine($"Fel: {ex.Message}");
    }
    finally
    {
        Console.WriteLine($"Redo för nästa input.. \n");
    }
}