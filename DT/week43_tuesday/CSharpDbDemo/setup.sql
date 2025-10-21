CREATE DATABASE DemoDb;
GO

USE DemoDb;
GO

CREATE TABLE Customers (
    CustomerId INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100),
    City NVARCHAR(100)
);

INSERT INTO Customers (Name, City)
VALUES ('Anna Svensson', 'Stockholm'),
       ('Erik Larsson', 'Göteborg'),
       ('Lisa Berg', 'Malmö');