-- Skapa vy för kunders totala orderbelopp och antal ordrar
CREATE VIEW CustomerOrderSummary AS
SELECT 
    C.CustomerID,
    C.CompanyName,
    COUNT(DISTINCT O.OrderID) AS TotalOrders,
    ROUND(SUM(OD.UnitPrice * OD.Quantity), 2) AS TotalAmount
FROM Customers AS C
JOIN Orders AS O ON O.CustomerID = C.CustomerID
JOIN OrderDetails AS OD ON OD.OrderID = O.OrderID
GROUP BY C.CustomerID, C.CompanyName;

-- Visa alla kunder med totalt orderbelopp över 5000
SELECT *
FROM CustomerOrderSummary
WHERE TotalAmount > 5000
ORDER BY TotalAmount DESC;

/*
 --------------------------------------
*/

-- Uppdatera vyn (SQL Server kräver DROP + CREATE, ingen "CREATE OR REPLACE")
DROP VIEW IF EXISTS CustomerOrderSummary;

CREATE VIEW CustomerOrderSummary AS
SELECT 
    C.CustomerID,
    C.CompanyName,
    COUNT(O.OrderID) AS TotalOrders,
    SUM(OD.UnitPrice * OD.Quantity) AS TotalAmount,
    AVG(OD.UnitPrice) AS AvgPrice
FROM Customers AS C
JOIN Orders AS O ON O.CustomerID = C.CustomerID
JOIN OrderDetails AS OD ON OD.OrderID = O.OrderID
GROUP BY C.CustomerID, C.CompanyName;