-- Skapa databas & peka på den
CREATE DATABASE DmlDb;
USE DmlDb;

-- Skapa tabellen Customers
CREATE TABLE Customers (
  CustomerId INT IDENTITY(1,1) PRIMARY KEY,
  FullName NVARCHAR(100) NOT NULL,
  City VARCHAR(50),
  Phone VARCHAR(25),
  Salary DECIMAL(10, 2) CHECK (Salary > 0)
);

INSERT INTO Customers (FullName, City, Phone, Salary)
VALUES
('Gärd Åmark', 'Stockholm', '08-123456', 35000),
('Erik Larsson', 'Göteborg', '031-654321', 45000),
('Lisa Berg', 'Malmö', '040-987654', 50000),
('John Doe', 'Stockholm', '08-111222', 40000),
('Karin Nilsson', 'Uppsala', '018-223344', 38000),
('Oskar Holm', 'Stockholm', '08-555666', 52000),
('Sara Lind', 'Göteborg', '031-222333', 47000),
('Peter Andersson', 'Malmö', '040-112233', 36000),
('Maria Eriksson', 'Umeå', '090-998877', 41000),
('Johan Bergström', 'Västerås', '021-556677', 39000);

-- Hämta alla kolumner från tabellen Customers (alla kunder)
SELECT * FROM Customers;

-- Hämta kunder från Stockholm med Salary > 35000
SELECT *
FROM Customers
WHERE Salary > 35000 AND City = 'Stockholm';

-- Visa unika städer
SELECT DISTINCT City FROM Customers;

-- Sortera kunder efter Salary (stigande)
SELECT FullName, Salary
FROM Customers
ORDER BY Salary ASC;

-- Sortera kunder efter Salary (fallande)
SELECT FullName, Salary
FROM Customers
ORDER BY Salary DESC;

-- Uppdatera en kunds telefonnummer
UPDATE Customers
SET Salary = 410000.99
WHERE CustomerId = 4;

-- Ta bort en kund
DELETE FROM Customers
WHERE CustomerId = 4 AND FullName = 'John Doe';

-- Ändra kolumntypen
ALTER TABLE Customers
ALTER COLUMN FullName VARCHAR(100);