CREATE DATABASE DemoApp

Use DemoApp

CREATE TABLE People(
	Id INT PRIMARY KEY IDENTITY,
	Name nvarchar(50),
	SurName nvarchar(50),
	PhoneNumber nvarchar(50),
	Email nvarchar(50) UNIQUE,
	Age INT,
	Gender nvarchar(50),
	HasCitizenship nvarchar(10) ,
 	CountryId INT,
  CityId INT,
  FOREIGN KEY (CountryId) REFERENCES Countries(Id),
  FOREIGN KEY (CityId) REFERENCES Cities(Id)
) 

Create Table Countries(
	Id INT PRIMARY KEY IDENTITY,
	Name nvarchar(50),
	Area decimal(16,2)

)

Create Table Cities(
	Id INT PRIMARY KEY IDENTITY,
	Name nvarchar(50),
	Area decimal(16,2)

)



INSERT INTO Countries ( Name, Area)
VALUES
  ( 'Azerbaijan', 86600.00),
  ( 'Turkey', 783356.00),
  ('Qazaxistan', 18838730.00);

  INSERT INTO Cities ( Name, Area)
VALUES
  ( 'Baku', 2192.00),
  ( 'Ankara', 2514.00),
  ( 'Nursultan', 1166000.54);

  INSERT INTO People ( Name, Surname, PhoneNumber, Email, Age, Gender, HasCitizenship, CountryId, CityId)
VALUES
  ('Metleb', 'Huseynov', '+123456789', 'metleb@gmail.com', 19, 'Male', 'true', 1, 1),
  ( 'Omer', 'Imanli', '+123456789', 'omer@gmail.com', 20, 'Male', 'true', 1, 1),
  ( 'Ruslan', 'Mirzezade', '+123456789', 'ruslan@gmail.com', 25, 'Male', 'true', 2, 2);


SELECT p.Id, p.Name, c.Name AS Country, ci.Name AS City
FROM People p
JOIN Countries c ON p.CountryId = c.Id
JOIN Cities ci ON p.CityId = ci.Id


SELECT * FROM Countries
ORDER BY Area ASC;


SELECT * FROM Cities
ORDER BY Name DESC;

SELECT COUNT(*) AS NumCountries
FROM Countries
WHERE Area > 20000;


SELECT MAX(Area) AS LargestArea
FROM Countries
WHERE Name LIKE 'I%';

SELECT Name FROM Countries
UNION
SELECT Name FROM Cities;


SELECT ci.Name AS City, COUNT(p.Id) AS NumPeople
FROM People p
JOIN Cities ci ON p.CityId = ci.Id
GROUP BY ci.Name;

SELECT ci.Name AS City, COUNT(p.Id) AS NumPeople
FROM People p
JOIN Cities ci ON p.CityId = ci.Id
GROUP BY ci.Name
HAVING COUNT(p.Id) > 50000;