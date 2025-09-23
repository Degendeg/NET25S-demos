public class NegativeBalanceException : Exception
{
    public NegativeBalanceException(string message) : base(message) { }

    // nu har vi ett InnerException
    public NegativeBalanceException(string message, Exception innerException) : base(message, innerException) { }
}