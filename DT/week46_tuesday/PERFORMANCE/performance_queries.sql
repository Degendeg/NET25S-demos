IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'PerformanceDB')
BEGIN
    CREATE DATABASE PerformanceDB;
END;

USE PerformanceDB;

/*
  -----------------------------------------------
*/

CREATE TABLE Customers (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    FullName NVARCHAR(50),
    Address NVARCHAR(100),
    City NVARCHAR(50),
    Income INT
);

/*
  -----------------------------------------------
*/

CREATE OR ALTER PROCEDURE PopulateCustomers
    @NumOfCustomers INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @i INT = 0;
    DECLARE @City NVARCHAR(50);

    WHILE @i < @NumOfCustomers
    BEGIN
        -- Slumpa en stad
        SET @City = 
            CASE FLOOR(RAND() * 5) + 1
                WHEN 1 THEN 'Stockholm'
                WHEN 2 THEN 'Göteborg'
                WHEN 3 THEN 'Malmö'
                WHEN 4 THEN 'Uppsala'
                ELSE 'Västerås'
            END;

        INSERT INTO Customers (FullName, Address, City, Income)
        VALUES (
            'Kund' + CAST(@i + 1 AS NVARCHAR(10)),
            'Adress' + CAST(@i + 1 AS NVARCHAR(10)),
            @City,
            FLOOR(RAND() * 100000)
        );

        SET @i += 1;
    END
END;
GO

/*
  -----------------------------------------------
*/

-- EXEC PopulateCustomers @NumOfCustomers = 333333;

SELECT COUNT(*) FROM Customers;
SELECT TOP 10 * FROM Customers;

CREATE INDEX IX_City ON Customers(City);
DROP INDEX IX_City ON Customers;

-- I SQL Server används Query Execution Plan istället för EXPLAIN.
-- Tryck Ctrl + M (eller klicka på "Include Actual Execution Plan")

SELECT * FROM Customers WHERE City = 'Stockholm';