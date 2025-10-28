-- Skapa databas
CREATE DATABASE DemoDB;
GO

-- Byt till databasen
USE DemoDB;
GO

-- Skapa en tabell för kundtyper
CREATE TABLE CustomerType (
    CustomerTypeID INT IDENTITY(1,1) PRIMARY KEY,
    TypeName NVARCHAR(50) NOT NULL
);
GO

-- Lägg till några kundtyper
INSERT INTO CustomerType (TypeName) VALUES
('Regular'),
('Premium'),
('VIP');
GO

-- Skapa Customer-tabellen med FK till CustomerType
CREATE TABLE Customer (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    FullName NVARCHAR(100) NOT NULL,
    Phone NVARCHAR(50),
    Salary DECIMAL(18,2),
    CustomerTypeID INT NOT NULL,
    CONSTRAINT FK_Customer_CustomerType FOREIGN KEY (CustomerTypeID)
        REFERENCES CustomerType(CustomerTypeID)
);
GO

-- Lägg till några kunder
INSERT INTO Customer (FullName, Phone, Salary, CustomerTypeID)
VALUES
('Anna Svensson', '08-123456', 35000, 1),
('Erik Larsson', '031-654321', 45000, 2),
('Lisa Berg', '040-987654', 50000, 3);
GO

-- Visa alla kunder med deras kundtyp
SELECT c.CustomerID, c.FullName, c.Phone, c.Salary, t.TypeName AS CustomerType
FROM Customer c
JOIN CustomerType t ON c.CustomerTypeID = t.CustomerTypeID;
GO

-- Ändra tabellen – lägg till Age-kolumn
ALTER TABLE Customer ADD Age INT;
GO

-- Ändra datatyp på Phone
ALTER TABLE Customer ALTER COLUMN Phone NVARCHAR(100);
GO

-- Visa tabellstruktur
EXEC sp_help 'Customer';
GO