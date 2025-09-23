
class Program
{
    static void Main()
    {
        Console.WriteLine("-- DEMO felhantering --");
        // DemoRuntimeError();
        // DemoTryCatchFinally();
        // DemoUsingDispose();
        DemoThrowCustomException();
    }

    static void DemoThrowCustomException()
    {
        Console.WriteLine($"\n4) Throw av eget exception:");
        try
        {
            // vi låtsas att ett ogiltigt villkor uppstår
            int saldo = -100;
            if (saldo < 0)
            {
                throw new NegativeBalanceException("Saldo kan inte vara negativt!");
            }
            Console.WriteLine($"Saldo: {saldo}");
        }
        catch (NegativeBalanceException ex)
        {
            Console.WriteLine($"Fel: {ex.Message}");
        }
    }

    static void DemoUsingDispose()
    {
        Console.WriteLine($"\n3) Using + dispose:");
        string? fileName = "demo.txt";
        try
        {
            using (StreamWriter writer = new StreamWriter(fileName))
            {
                writer.WriteLine("Hej från DemoUsingDispose metoden!");
                Console.WriteLine($"Text har skrivits till {fileName}");
            } // Dispose sker automatiskt här
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Fel vid filhantering: {ex.Message}");

        }
    }

    static void DemoTryCatchFinally()
    {
        Console.WriteLine($"\n2) Try-catch-finally:");
        FileStream? myStream = null;
        try
        {
            myStream = new FileStream("test.txt", FileMode.Open);
            Console.WriteLine("Filen öppnades!");
        }
        catch (FileNotFoundException ex)
        {
            Console.WriteLine($"Filfel: {ex.Message}");
        }
        catch (Exception ex) // fångar alla andra fel
        {
            Console.WriteLine($"Generellt fel: {ex.Message}");
        }
        finally
        {
            if (myStream != null)
            {
                myStream.Close();
                Console.WriteLine("Filestreamen stängdes i finally.");
            }
            else
            {
                Console.WriteLine("Ingen filestream att stänga.");
            }
        }
    }

    static void DemoRuntimeError()
    {
        Console.WriteLine($"\n1) Runtime error (division med noll):");
        try
        {
            int a = 10;
            int b = 0;
            int result = a / b; // leder till runtime error
            Console.WriteLine($"Resultat: {result}");
        }
        catch (DivideByZeroException ex) // subklass till Exception
        {
            Console.WriteLine($"Fel: {ex.Message}");
        }
    }
}