using Microsoft.Data.SqlClient;

class Program
{
  static void Main()
  {
    string connectionString =
        "Server=(localdb)\\MSSQLLocalDB;Database=DemoDb;Trusted_Connection=True;";

    using SqlConnection conn = new(connectionString);
    conn.Open();

    string query = "SELECT CustomerId, Name, City FROM Customers";
    using SqlCommand cmd = new(query, conn);
    using SqlDataReader reader = cmd.ExecuteReader();

    while (reader.Read())
    {
      Console.WriteLine($"{reader["CustomerId"]}: {reader["Name"]} - {reader["City"]}");
    }

    Console.WriteLine("\nTryck på valfri tangent för att avsluta...");
    Console.ReadKey();
  }
}