CREATE DATABASE normalization_demo;
GO

USE normalization_demo;
GO

CREATE TABLE food_orders (
    customer_name NVARCHAR(100),
    [order] NVARCHAR(100)
);

INSERT INTO food_orders (customer_name, [order])
VALUES ('John Doe', 'Burger, Fries, Coke');

INSERT INTO food_orders (customer_name, [order])
VALUES ('Foo Bar', 'Nuggets, Fries, Fanta');

SELECT * FROM food_orders;