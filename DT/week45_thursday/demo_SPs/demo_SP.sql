-- Vi kör mot Northwind
USE Northwind;

----------------------------------------------------
-- 0. Lista alla Stored Procedures i databasen
----------------------------------------------------
SELECT name AS ProcedureName
FROM sys.procedures
ORDER BY name;

SELECT * 
  FROM Northwind.INFORMATION_SCHEMA.ROUTINES
 WHERE ROUTINE_TYPE = 'PROCEDURE';

----------------------------------------------------
-- 1. Enkel Stored Procedure – hämta alla produkter
----------------------------------------------------
CREATE OR ALTER PROCEDURE GetAllProducts
AS
BEGIN
    SELECT * 
    FROM Products;
END;
GO

-- Anrop:
EXEC GetAllProducts;
GO


----------------------------------------------------
-- 2. Stored Procedure – filtrera kunder efter namn och stad
----------------------------------------------------
CREATE OR ALTER PROCEDURE GetCustomerList
    @CompanyName NVARCHAR(40),
    @City NVARCHAR(15)
AS
BEGIN
    SELECT * 
    FROM Customers
    WHERE CompanyName LIKE '%' + @CompanyName + '%'
      AND City LIKE '%' + @City + '%';
END;
GO

-- Anrop:
EXEC GetCustomerList @CompanyName = '', @City = 'London';
EXEC GetCustomerList @CompanyName = 'Antonio', @City = '';
GO


----------------------------------------------------
-- 3. Stored Procedure – hämta ordrar över visst belopp
----------------------------------------------------
CREATE OR ALTER PROCEDURE GetLargeOrders
    @MinAmount DECIMAL(20,4)
AS
BEGIN
    SELECT OrderID, CustomerID, OrderDate, Freight
    FROM Orders
    WHERE Freight > @MinAmount;
END;
GO

-- Anrop:
EXEC GetLargeOrders @MinAmount = 500;
GO


----------------------------------------------------
-- 4. Stored Procedure – lägg till ny kund
----------------------------------------------------
CREATE OR ALTER PROCEDURE AddNewCustomer
    @CustomerID NVARCHAR(5),
    @CompanyName NVARCHAR(40),
    @ContactName NVARCHAR(30),
    @ContactTitle NVARCHAR(30),
    @Address NVARCHAR(60),
    @City NVARCHAR(15),
    @Region NVARCHAR(15),
    @PostalCode NVARCHAR(10),
    @Country NVARCHAR(15),
    @Phone NVARCHAR(24),
    @Fax NVARCHAR(24)
AS
BEGIN
    INSERT INTO Customers
        (CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax)
    VALUES
        (@CustomerID, @CompanyName, @ContactName, @ContactTitle, @Address, @City, @Region, @PostalCode, @Country, @Phone, @Fax);
END;
GO

-- Anrop:
EXEC AddNewCustomer
    @CustomerID = 'C001',
    @CompanyName = 'ABC Corp',
    @ContactName = 'John Doe',
    @ContactTitle = 'Manager',
    @Address = '123 Main St',
    @City = 'Stockholm',
    @Region = 'Vällingby',
    @PostalCode = '10101',
    @Country = 'Sweden',
    @Phone = '+467707070',
    @Fax = NULL;
GO

-- Ta bort SP
DROP PROCEDURE GetAllProducts;


----------------------------------------------------
-- Förklaring (kort)
----------------------------------------------------
-- * CREATE OR ALTER PROCEDURE: Skapar eller uppdaterar proceduren.
-- * @ParamName Datatyp: Inparameter.
-- * EXEC ProcedureName: Kör proceduren.
-- * Sys.procedures: Systemvy för att lista alla SP i databasen.
