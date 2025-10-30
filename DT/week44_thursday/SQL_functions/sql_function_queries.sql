-- Lägg till Email kolumn i Customers tabellen
ALTER TABLE Customers
ADD Email VARCHAR(50);

-- Lägg till Email på vissa kunder
UPDATE Customers
SET Email = 'temp@mail.io'
WHERE CustomerId IN (2,5,7,9,11);

-- Hämta alla kunder
SELECT * FROM Customers;

-- Visa alla kunder som HAR en Email
SELECT * FROM Customers
WHERE Email IS NOT NULL;

-- Kunder vars namn börjar på bokstaven 'A'
SELECT FullName
FROM Customers
WHERE FullName LIKE '%A';

-- Kunders vars namn innehåller Anna (case sensitive)
SELECT FullName
FROM Customers
WHERE FullName COLLATE Latin1_General_CS_AS LIKE '%Anna%';

-- Kunder som finns i Västerås eller Malmö och har en Email
SELECT FullName, City, Email
FROM Customers
WHERE City IN ('Västerås', 'Malmö') AND Email IS NOT NULL;

-- Ändra så att åtminstone en kund har det ☝️
UPDATE Customers
SET Email = 'foo@bar.org'
WHERE CustomerId = 10;

-- Visa dem tre SISTA siffrorna i telefonnumret för alla kunder
SELECT FullName, Phone, REVERSE(SUBSTRING(REVERSE(Phone), 1, 3)) AS ThreeLastDigits
FROM Customers;

-- Smidigare sätt nedan 👇
SELECT RIGHT(Phone, 3) AS ThreeLastDigits FROM Customers;

-- Visa stad i stora bokstäver
SELECT FullName, UPPER(City) AS CapitalLettersCity
FROM Customers;

-- Visa stad i små bokstäver
SELECT FullName, UPPER(City) AS SmallCapsCity
FROM Customers;

-- Visa kundinfo i formatet "NAMN - STAD" i stora bokstäver
SELECT UPPER(FullName) + ' - ' + UPPER(City) AS KundInfo
FROM Customers;

-- Visa förnamn (allt före första mellanslaget)
SELECT FullName,
       SUBSTRING(FullName, 1, CHARINDEX(' ', FullName) - 1) AS Förnamn
FROM Customers
WHERE CHARINDEX(' ', FullName) > 0;