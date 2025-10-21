-- Skapa databasen
CREATE DATABASE VetDb;
GO
USE VetDb;
GO

-- Skapa tabell Owner
CREATE TABLE Owner (
    OwnerId INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100),
    PhoneNumber NVARCHAR(50)
);
GO

-- Skapa tabell Animal med relation till Owner
CREATE TABLE Animal (
    AnimalId INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100),
    Breed NVARCHAR(100),
    DateOfBirth DATE,
    OwnerId INT NOT NULL,
    FOREIGN KEY (OwnerId) REFERENCES Owner(OwnerId)
);
GO
