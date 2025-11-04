--CREATE DATABASE CustomerInvoiceDb;
--USE CustomerInvoiceDemoDb;

--CREATE TABLE Customer (
--	CustomerId INT IDENTITY(1,1) PRIMARY KEY,
--	FirstName NVARCHAR(50) NOT NULL,
--	LastName NVARCHAR(50) NOT NULL,
--	Adress VARCHAR(100),
--	PhoneNr VARCHAR(25),
--	Email VARCHAR(100)
--)

--CREATE TABLE Invoice (
--	InvoiceId INT IDENTITY(101,1) PRIMARY KEY,
--	InvoiceAmount DECIMAL(12, 3),
--	CustomerId INT NOT NULL,
--	CONSTRAINT FK_Invoice_CustomerId
--	FOREIGN KEY (CustomerId)
--	REFERENCES Customer(CustomerId)
--)

/*
	Lägg till 3-4 kunder
	Lägg till ett par fakturor, skippa någon kund
*/

-- Hämtar kunden (eller kunderna) som har den högsta fakturan
SELECT c.FirstName + ' ' + c.LastName AS CustomerName,
c.Adress, c.PhoneNr, c.Email
FROM Customer c
INNER JOIN Invoice i ON c.CustomerId = i.CustomerId
WHERE i.InvoiceAmount = (SELECT
MAX(InvoiceAmount) FROM Invoice)

-- Hämtar alla kunder som har handlat och visar varje kunds största fakturabelopp.
SELECT DISTINCT
	c.CustomerId,
	c.FirstName + ' ' + c.LastName AS CustomerName,
	(SELECT MAX(InvoiceAmount) FROM Invoice i2
	 WHERE i2.CustomerId = c.CustomerId) AS MostExpInv
FROM Customer c
INNER JOIN Invoice i ON c.CustomerId = i.CustomerId