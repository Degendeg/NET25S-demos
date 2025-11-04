--------- 1. Hämta alla kunder som har gjort en beställning ---------
-- Vi vill lista alla kunder som har lagt minst en order. Istället för att använda en `JOIN`, kan vi använda en subquery för att kontrollera vilka `customer_id` som finns i `order`-tabellen.

SELECT CustomerID, CompanyName
FROM Customers
WHERE CustomerID IN (SELECT CustomerID FROM Orders);

-- Här hämtar subqueryn `(SELECT customer_id FROM order)` alla `customer_id` från `order`-tabellen. Sedan används resultatet av subqueryn som en lista i vår `WHERE`-sats.

--------- 2. Hitta produkter som är dyrare än det genomsnittliga priset ---------
-- Här vill vi lista alla produkter vars pris är högre än genomsnittspriset för alla produkter.

SELECT ProductName, UnitPrice
FROM Products
WHERE UnitPrice > (SELECT AVG(UnitPrice) FROM Products);

-- Subqueryn `(SELECT AVG(unit_price) FROM product)` räknar ut genomsnittspriset för alla produkter. Sedan används detta värde i `WHERE`-satsen för att hitta produkter som är dyrare än detta genomsnitt.

--------- 3. Hämta beställningar som gjorts av kunder från "USA" ---------
-- I det här exemplet listar vi alla order som gjorts av kunder som är baserade i USA. Vi gör detta genom att först hitta `customer_id` för kunder som är från USA.

SELECT OrderID, CustomerID, OrderDate
FROM Orders
WHERE CustomerID IN (SELECT CustomerID FROM Customers WHERE Country = 'USA');

-- Subqueryn `(SELECT customer_id FROM customer WHERE country = 'USA')` tar fram `customer_id` för alla kunder från USA. Huvudfrågan hämtar sedan order med dessa `customer_id`.

--------- 4. Visa anställda som har hanterat order på över $1,000 ---------
-- Låt oss säga att vi vill lista anställda som har hanterat minst en order med ett ordervärde över $1,000.

SELECT EmployeeID, FirstName, LastName
FROM Employees
WHERE EmployeeID IN (SELECT EmployeeID FROM Orders WHERE Freight > 1000);

-- I detta exempel tar subqueryn `(SELECT employee_id FROM order WHERE freight > 1000)` fram `employee_id` för anställda som har hanterat order där fraktvärdet (`freight`) är över 1,000. Sedan hämtar huvudfrågan dessa anställda.

--------- 5. Produkter som har beställts mer än 50 gånger ---------
-- Här vill vi lista alla produkter som har beställts fler än 50 gånger i total kvantitet.

SELECT ProductName
FROM Products
WHERE ProductID IN (
    SELECT ProductID 
    FROM OrderDetails
    GROUP BY ProductID 
    HAVING SUM(Quantity) > 50
);

-- Subqueryn `(SELECT product_id FROM order_detail GROUP BY product_id HAVING SUM(quantity) > 50)` grupperar `product_id` i `order_detail` och summerar kvantiteten för varje produkt. Endast produkter som har en total kvantitet över 50 inkluderas. Huvudfrågan hämtar sedan namn för dessa produkter.