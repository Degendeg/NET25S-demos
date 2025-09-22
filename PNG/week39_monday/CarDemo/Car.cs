using CarDemo;

public class Car : IDriveable
{
    public string Brand { get; set; }
    public int MaxSpeed { get; set; }

    public Car(string brand, int maxSpeed)
    {
        Brand = brand;
        MaxSpeed = maxSpeed;
    }

    public void Drive()
    {
        Console.WriteLine($"{Brand} kör iväg. Maxhastighet: {MaxSpeed} km/h.");
    }

    public void Stop()
    {
        Console.WriteLine($"{Brand} har stannat.");
    }
}