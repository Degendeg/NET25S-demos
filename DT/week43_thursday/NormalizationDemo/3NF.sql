-- Separera kunddata till en ny tabell
CREATE TABLE customers (
    customer_id INT IDENTITY(1,1) PRIMARY KEY,
    customer_name NVARCHAR(255)
);

-- Sätt in unika kunder
INSERT INTO customers (customer_name)
SELECT DISTINCT customer_name FROM food_orders;

-- Lägg till en kundreferens i food_orders
ALTER TABLE food_orders
ADD customer_id INT;

-- Koppla beställningarna till kundtabellen
UPDATE fo
SET fo.customer_id = c.customer_id
FROM food_orders fo
JOIN customers c ON fo.customer_name = c.customer_name;

-- Ta bort den redundanta kolumnen customer_name i food_orders
ALTER TABLE food_orders
DROP COLUMN customer_name;

-- Visa resultatet
SELECT fo.order_id, fo.item, c.customer_name
FROM food_orders fo
INNER JOIN customers c ON fo.customer_id = c.customer_id;