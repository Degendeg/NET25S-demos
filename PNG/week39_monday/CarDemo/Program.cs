class Program
{
    static void Main()
    {
        // interface + class
        var myCar = new Car("Volvo", 200);
        myCar.Drive();
        myCar.Stop();

        // static exempel
        int distance = 150; // km
        int speed = 100; // km/h
        double hours = CarHelper.CalculateTravelTime(distance, speed);

        Console.WriteLine($"Att köra {distance} km i {speed} km/h tar ca {hours} timmar.");
    }
}