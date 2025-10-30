using Microsoft.Data.SqlClient;

class Program
{
  static void Main()
  {
    // string connStr =
    // "Server=(localdb)\\MSSQLLocalDB;Database=DemoDb;Trusted_Connection=True;";
    string connectionString =
        "data source=sebbe\\SQLEXPRESS;initial catalog=DmlDb;trusted_connection=true;TrustServerCertificate=true;";

    using SqlConnection conn = new(connectionString);
    conn.Open();

    /*
        INSERT för att lägga in data, mot databas DmlDb
    */
    // string insertQuery = "INSERT INTO Customers (FullName, City, Phone, Salary) " +
    //                       "VALUES ('John Doe', 'Stockholm', '0707707070', 33333)";
    // new SqlCommand(insertQuery, conn).ExecuteNonQuery();

    string query = "SELECT CustomerId, FullName, City FROM Customers";
    using SqlCommand cmd = new(query, conn);
    using SqlDataReader reader = cmd.ExecuteReader();

    while (reader.Read())
    {
      Console.WriteLine($"{reader["CustomerId"]}: {reader["FullName"]} - {reader["City"]}");
    }

    Console.WriteLine("\nTryck på valfri tangent för att avsluta...");
    Console.ReadKey();
  }
}