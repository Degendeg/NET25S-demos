USE VetDb;

-- Hämta alla ägare som har ett djur där arten framgår
SELECT
	CONCAT(o.FirstName, ' ', o.LastName) AS FullName,
	a.Name AS AnimalName,
	s.Name AS SpeciesName
FROM Owner AS o
INNER JOIN Animal AS a ON o.OwnerId = a.OwnerId
INNER JOIN Species AS s ON a.SpeciesId = s.SpeciesId

/*
  ------------------------------------------
*/

USE Northwind;

-- INNER JOIN - Visa alla ordrar med kundens namn och land
SELECT 
    o.OrderID, 
    c.CompanyName AS CustomerName, 
    c.Country AS CustomerCountry,
    o.OrderDate, 
    o.ShipCity, 
    o.ShipCountry
FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID
ORDER BY c.Country, o.OrderDate;

/*
  Kommentar:
  Visar endast ordrar som har en matchande kund.
  Med JOIN får vi in CompanyName och Country i resultatet.
  Kunder utan ordrar visas inte.
*/

-- INNER JOIN med flera tabeller – order + kund + anställd
SELECT o.OrderID, c.CompanyName AS Customer, 
       e.FirstName + ' ' + e.LastName AS Employee, 
       o.OrderDate
FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID
INNER JOIN Employees e ON o.EmployeeID = e.EmployeeID;

/*
  Kommentar:
  Kopplar ihop tre tabeller (`Orders`, `Customers`, `Employees`)
  för att visa vilken anställd tog emot vilken order.
*/

-- INNER JOIN – produkter och deras kategorier
SELECT p.ProductName, c.CategoryName
FROM Products p
INNER JOIN Categories c ON p.CategoryID = c.CategoryID;

/*
  Kommentar:
  Varje produkt tillhör en kategori.
  Visar endast produkter som faktiskt har en kategori angiven.
*/

-- LEFT JOIN – visa alla produkter, även de utan kategori
SELECT p.ProductName, c.CategoryName
FROM Products p
LEFT JOIN Categories c ON p.CategoryID = c.CategoryID;

-- För att ändra en befintlig produkt (CategoryID är NULLable):
--UPDATE Products
--SET CategoryID = NULL
--WHERE ProductID = 1;

/*
  Kommentar:
  Till skillnad från `INNER JOIN` visas alla produkter,
  även de som inte har någon kategori (`NULL` i CategoryName).
*/

-- RIGHT JOIN – visa alla kategorier, även tomma
SELECT p.ProductName, c.CategoryName
FROM Products p
RIGHT JOIN Categories c ON p.CategoryID = c.CategoryID;

/*
  Kommentar:
  Visar alla kategorier, även de som inte har några produkter.
*/

-- INNER JOIN – orderdetaljer + produkter (visa pris & kvantitet)
SELECT od.OrderID, p.ProductName, od.UnitPrice, od.Quantity, (od.UnitPrice * od.Quantity) AS Total
FROM OrderDetails od
INNER JOIN Products p ON od.ProductID = p.ProductID;

/*
  Kommentar:
  Visar varje orderrad – produkt, pris, antal och total summa.
*/

-- JOIN med alias och beräknad kolumn
SELECT e.FirstName + ' ' + e.LastName AS Employee,
       COUNT(o.OrderID) AS OrdersHandled
FROM Employees e
JOIN Orders o ON e.EmployeeID = o.EmployeeID
GROUP BY e.FirstName, e.LastName
ORDER BY OrdersHandled DESC;

/*
  Kommentar:
  Visar antalet ordrar per anställd.
*/