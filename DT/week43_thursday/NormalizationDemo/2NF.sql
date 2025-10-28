-- Lägg till order_id för att identifiera varje beställning
ALTER TABLE food_orders
ADD order_id INT IDENTITY(1,1) PRIMARY KEY;

-- Visa resultatet
SELECT * FROM food_orders;

-- I SQL Server kan du inte ändra kolumnordningen direkt (som med MODIFY i MySQL).
-- Om du vill ha order_id först, skapa en ny tabell med rätt ordning istället.