-- CPSC 408: Assignment 2

-- 1.
CREATE TABLE Player (
    pID SMALLINT UNSIGNED,
    name VARCHAR (20) NOT NULL,
    teamName VARCHAR(20),
    PRIMARY KEY (pID)
);

-- 2.
ALTER TABLE Player
ADD age TINYINT UNSIGNED;

-- 3.
INSERT INTO Player
VALUES (1, 'Player 1', 'Team A', 23),
       (3, 'Player 3', 'Team B', 28);

INSERT INTO Player (pID, name, teamName)
VALUES (2, 'Player 2', 'Team A'),
       (4, 'Player 4', 'Team B');

-- 4.
DELETE FROM Player
WHERE pID = 2;

-- 5.
UPDATE Player
SET age = 25
WHERE age IS NULL;

-- 6.
SELECT COUNT(*), AVG(age)
FROM Player;

-- 7.
DROP TABLE Player;

-- Chinook database
-- 8.
SELECT AVG(Total)
FROM Invoice
WHERE BillingCountry = 'Brazil';

-- 9.
SELECT BillingCity, AVG(Total)
FROM Invoice
WHERE BillingCountry = 'Brazil'
GROUP BY BillingCity;

-- 10.
SELECT Album.Title, COUNT(*)
FROM Track, Album
WHERE Track.AlbumId = Album.AlbumId
GROUP BY Album.Title
HAVING COUNT(*) > 20;

-- 11.
SELECT COUNT(InvoiceDate)
FROM Invoice
WHERE InvoiceDate LIKE '2010%';

-- 12.
SELECT BillingCountry, COUNT(DISTINCT BillingCity)
FROM Invoice
GROUP BY BillingCountry;

-- 13.
SELECT Album.Title, Track.Name, MediaType.Name
FROM Album, Track, MediaType
WHERE Track.MediaTypeId = MediaType.MediaTypeId
AND Album.AlbumId = Track.AlbumId
GROUP BY Album.Title;

-- 14.
SELECT COUNT(Invoice.InvoiceId)
FROM Invoice, Customer
WHERE Invoice.CustomerId = Customer.CustomerId
AND Customer.SupportRepId =
    (SELECT EmployeeId
     FROM Employee
     WHERE FirstName = 'Jane'
     AND LastName = 'Peacock');