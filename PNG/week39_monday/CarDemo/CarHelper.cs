public static class CarHelper
{
    public static double CalculateTravelTime(int distanceKm, int speedKmPerHour)
    {
        return (double)distanceKm / speedKmPerHour;
    }
}