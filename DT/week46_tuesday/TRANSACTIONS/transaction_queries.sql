-- För att köra manuellt: använd BEGIN TRAN / COMMIT / ROLLBACK
-- Markera varje del i queryn (börja med BEGIN TRAN) -> Execute för att "starta igång en transaktion".

/*
  Basic example
*/
BEGIN TRAN;
UPDATE Orders SET Freight = 33.48 WHERE OrderID = 10248;
UPDATE Orders SET Freight = 12.71 WHERE OrderID = 10249;
SELECT * FROM Orders WHERE OrderID IN (10248, 10249);
-- ROLLBACK; -- ifall du inte vill COMMIT:a någon ändring
COMMIT;

/*
  Exempel med SAVEPOINTs
*/
BEGIN TRAN;

UPDATE Orders SET Freight = 33.48 WHERE OrderID = 10248;
UPDATE Orders SET Freight = 12.71 WHERE OrderID = 10249;
SAVE TRAN step1;

SELECT * FROM Orders WHERE OrderID IN (10248, 10249, 10250, 10251);

UPDATE Orders SET Freight = 10 WHERE OrderID = 10250;
UPDATE Orders SET Freight = 10 WHERE OrderID = 10251;
SAVE TRAN step2;

ROLLBACK TRAN step1;
COMMIT;

-- Kolla om autocommit är på (SQL Server kör implicit OFF som standard)
-- Per default OFF, kolla status
SELECT CASE 
       WHEN @@OPTIONS & 2 = 2 THEN 'ON' 
       ELSE 'OFF' 
       END AS ImplicitTransactions;

-- SQL Server kör automatiskt transaktion varje gång du kör INSERT, UPDATE, DELETE osv.
SET IMPLICIT_TRANSACTIONS ON;

/*
  ---------------------------------------------------------
  Mer omfattande exempel:
*/

BEGIN TRAN;

-- Skapa ny order för kund 103
INSERT INTO Orders (CustomerID, OrderDate)
VALUES (103, GETDATE());

-- Spara OrderID till variabel
DECLARE @NewOrderId INT = SCOPE_IDENTITY();

-- Lägg till en orderrad (5 st av produkt 11)
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, UnitPrice)
SELECT @NewOrderId, 11, 5, UnitPrice
FROM Products
WHERE ProductID = 11;

-- Sänk lagret på produkten
UPDATE Products
SET UnitsInStock = UnitsInStock - 5
WHERE product_id = 11;

-- Kontrollera vad som hänt (innan commit)
SELECT * FROM Orders WHERE OrderID = @NewOrderId;
SELECT * FROM OrderDetails WHERE OrderID = @NewOrderId;
SELECT ProductID, UnitsInStock FROM Products WHERE ProductID = 11;

-- COMMIT;   -- för att spara
-- ROLLBACK; -- för att ångra

-- Kontrollera efter commit/rollback
SELECT * FROM Orders WHERE OrderID = @NewOrderId;
SELECT ProductID, UnitsInStock FROM Products WHERE ProductID = 11;
