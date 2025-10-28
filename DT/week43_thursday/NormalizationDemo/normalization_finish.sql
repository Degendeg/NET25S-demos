-- Skapa tabell för kunders beställningar
CREATE TABLE customer_orders (
    order_id INT IDENTITY(1,1) PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Ny kolumn för koppling mot customer_orders
ALTER TABLE food_orders
ADD main_order_id INT;

-- Lägg till främmande nyckel
ALTER TABLE food_orders
ADD CONSTRAINT FK_food_orders_customer_orders
FOREIGN KEY (main_order_id) REFERENCES customer_orders(order_id);

-- Infoga beställningar
INSERT INTO customer_orders (customer_id, order_date) VALUES (1, '2024-10-10');  -- John Doe
INSERT INTO customer_orders (customer_id, order_date) VALUES (2, '2024-10-11');  -- Foo Bar

-- Koppla ihop items till respektive order
UPDATE food_orders SET main_order_id = 1 WHERE order_id IN (1, 2, 3);
UPDATE food_orders SET main_order_id = 2 WHERE order_id IN (4, 5, 6);

-- John Doe gör en ny beställning
INSERT INTO customer_orders (customer_id, order_date) VALUES (1, '2024-10-12');
UPDATE food_orders SET main_order_id = 3 WHERE order_id IN (7, 8, 9);

-- Byt namn på food_orders till order_items
EXEC sp_rename 'food_orders', 'order_items';

-- Visa kunders orderinformation
SELECT 
    co.order_id AS main_order_id,
    co.order_date,
    c.customer_name,
    oi.item
FROM customer_orders co
JOIN order_items oi ON co.order_id = oi.main_order_id
JOIN customers c ON co.customer_id = c.customer_id
ORDER BY co.order_id;

-- Visa hela order_items-tabellen
SELECT * FROM order_items;
