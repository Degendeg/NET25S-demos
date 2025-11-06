-- Antal ordrar per kund
SELECT CustomerID, COUNT(CustomerID) AS OrderCount
FROM Orders
GROUP BY CustomerID -- utan gruppering så vet inte db hur den ska räkna COUNT(CustomerID) per kund.
ORDER BY OrderCount DESC;

-- Total fraktkostnad per anställd
SELECT
  e.FirstName + ' ' + e.LastName AS EmployeeName,
  SUM(o.Freight) AS TotalFreight
FROM Orders AS o
JOIN Employees AS e ON e.EmployeeID = o.EmployeeID
GROUP BY o.EmployeeID, e.FirstName, e.LastName
ORDER BY TotalFreight DESC;

-- Genomsnittligt pris per leverantör
SELECT SupplierID, AVG(UnitPrice) AS AvgPrice
FROM Products
GROUP BY SupplierID;

-- Ovanstående resultat utan GROUP BY, subquery beroende av huvudfråga
SELECT DISTINCT
	p1.SupplierID,
	(SELECT AVG(UnitPrice)
	 FROM Products p2
	 WHERE p2.SupplierID = p1.SupplierID) AS AvgPrice
FROM Products p1

-- Totalt orderbelopp för varje kund
-- där orderbeloppet per kund är mer än 500
SELECT
	c.CompanyName AS CustomerName,
	SUM(od.UnitPrice * od.Quantity) AS TotalAmount
FROM Customers AS c
JOIN Orders o ON o.CustomerID = c.CustomerID
JOIN OrderDetails od ON od.OrderID = o.OrderID
GROUP BY c.CompanyName, c.CustomerID
HAVING SUM(od.UnitPrice * od.Quantity) > 500
ORDER BY TotalAmount;

------------------------------------------------------------------

-- Totalt orderbelopp för varje kund
-- För att visa totalvärdet på alla ordrar per kund använder vi GROUP BY
-- för att gruppera datan på kundnivå och sedan SUM-funktionen
-- på kolumnen Products.Price * OrderDetails.Quantity.

SELECT 
    Customers.CustomerName, 
    SUM(OrderDetails.Quantity * Products.Price) AS TotalOrderAmount
FROM 
    Customers
JOIN 
    Orders ON Customers.CustomerID = Orders.CustomerID
JOIN 
    OrderDetails ON Orders.OrderID = OrderDetails.OrderID
JOIN
    Products ON OrderDetails.ProductID = Products.ProductID
GROUP BY 
    Customers.CustomerID, Customers.CustomerName
ORDER BY 
    TotalOrderAmount DESC;

-- Detta ger en lista på varje kunds namn och den totala summan av deras ordrar,
-- sorterat i fallande ordning efter totalvärde.

------------------------------------------------------------------

-- Totalt orderbelopp för varje kund under ett specifikt år (med WHERE och HAVING)
-- Om vi vill filtrera fram det totala orderbeloppet för varje kund under ett specifikt år, till exempel 1996, 
-- och samtidigt endast visa de kunder vars totalorder är över ett visst belopp, använder vi både WHERE och HAVING.

SELECT 
    Customers.CustomerName, 
    SUM(OrderDetails.Quantity * Products.Price) AS TotalOrderAmount
FROM 
    Customers
JOIN 
    Orders ON Customers.CustomerID = Orders.CustomerID
JOIN 
    OrderDetails ON Orders.OrderID = OrderDetails.OrderID
JOIN
    Products ON OrderDetails.ProductID = Products.ProductID
WHERE 
    YEAR(Orders.OrderDate) = 1996
GROUP BY 
    Customers.CustomerID, Customers.CustomerName
HAVING 
    SUM(OrderDetails.Quantity * Products.Price) > 500
ORDER BY 
    Customers.CustomerName;

-- WHERE YEAR(Orders.OrderDate) = 1996 filtrerar ordrar till de som är från år 1996.
-- HAVING SUM(OrderDetails.Quantity * Products.Price) > 500 ser till att endast kunder med en total orderbelopp över 500 visas.
-- GROUP BY: Grupperar datan på Customers.CustomerID och Customers.CustomerName.
-- SUM: Summerar kolumnen Products.Price * OrderDetails.Quantity för varje kund.
-- HAVING: Filtrerar grupperade resultat för att endast inkludera kunder med en total orderbelopp över 500.
-- ORDER BY: Sorterar resultatet efter kundens namn i alfabetisk ordning.