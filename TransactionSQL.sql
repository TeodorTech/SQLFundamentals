CREATE TABLE Cars (
 ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
 Make char(100),
 Model char(100),
 Category char(100),
 Year_of_production int,
 Price_per_day int,
);

CREATE TABLE Users(
ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
FirstName char(20),
Lastname char(20),
Age INT,
Email char(50),
PhoneNumber char (15),
City char(20),
);
CREATE TABLE CarsUsers(
ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
CarId INT  NOT NULL FOREIGN KEY REFERENCES Cars(ID),
UserId INT NOT NULL FOREIGN KEY REFERENCES Users(ID),
PaymentType char(10),
);


INSERT INTO Cars(Make,Model,Category,Year_of_production,Price_per_day) VALUES('Porche','Cayenne','SUV',2020,200);
INSERT INTO Cars(Make,Model,Category,Year_of_production,Price_per_day) VALUES('BMW','M4','Coupe',2020,200);
INSERT INTO Cars(Make,Model,Category,Year_of_production,Price_per_day) VALUES('Mercedes','S-class','Limo',2020,200);
INSERT INTO Cars(Make,Model,Category,Year_of_production,Price_per_day) VALUES('Audi','R8','Coupe',2007,250);
INSERT INTO Cars(Make,Model,Category,Year_of_production,Price_per_day) VALUES('Chevrolete','Corvette','Coupe',2020,350);
INSERT INTO Cars(Make,Model,Category,Year_of_production,Price_per_day) VALUES('Mercedes','G-class','SUV',2018,300);
INSERT INTO Cars(Make,Model,Category,Year_of_production,Price_per_day) VALUES('Range Rover','Velar','SUV',2021,350);
INSERT INTO Cars(Make,Model,Category,Year_of_production,Price_per_day) VALUES('Lamborghini','Hurachan','Coupe',2018,400);
INSERT INTO Cars(Make,Model,Category,Year_of_production,Price_per_day) VALUES('Dacia','Logan','Sedan',2022,100);
INSERT INTO Cars(Make,Model,Category,Year_of_production,Price_per_day) VALUES('Porche','911','Coupe',2018,400);


INSERT INTO Users(FirstName,LastName,Age,Email,PhoneNumber,City) VALUES('Teodor','Nicolau',23,'teodor.nicolau@gmail.com','0723185255','Bucuresti');
INSERT INTO Users(FirstName,LastName,Age,Email,PhoneNumber,City)VALUES('Alex','Dinca',26,'alex.dinca@gmail.com','0721847224','Brasov');
INSERT INTO Users(FirstName,LastName,Age,Email,PhoneNumber,City) VALUES('Gabriel','Stan',24,'gabriel.stan@yahoo.com','0735469274','Bucuresti');
INSERT INTO Users(FirstName,LastName,Age,email,city) VALUES('Henry','Maguaire',42,'henry.maguire@yahoo.com','London');
INSERT INTO Users(FirstName,LastName,Age,phoneNumber,city) VALUES('Florica','Popescu',71,'0216837866','Calarasi');
INSERT INTO Users(FirstName,LastName,Age,city) VALUES('Galileo','Galilei',99,'Florence');
INSERT INTO Users(FirstName,LastName,Age,city) VALUES('Leonardo','DaVinci',99,'Florence');
INSERT INTO Users(FirstName,LastName,Age,city) VALUES ('Ion','Vasile',68,'Valcea');
INSERT INTO Users(FirstName,LastName,Age,phoneNumber) VALUES('Tony','Montana',45,'0712345698');
INSERT INTO Users(FirstName,LastName,Age,email,phoneNumber,city) VALUES('Florin','Coman',28,'florin.coman@yahoo.com','0731864674','Bucuresti');

INSERT INTO CarsUsers(carId,userId,PaymentType) 
VALUES
(1,1,'Card'),
(1,3,'Card'),
(1,3,'Card'),
(6,1,'Crypto'),
(6,1,'Cash'),
(9,10,'Crypto')

UPDATE CarsUsers
SET PaymentType = 'Crypto'
Where ID = 1

--10 Questions 
--How many eligible users do i have?
SELECT COUNT(ID) as 'eligible users' FROM Users
WHERE Age<65 AND Email IS NOT NULL AND PhoneNumber IS NOT NULL

--Which is the most booked car?
SELECT Make,COUNT(UserId) AS 'TimesBooked' FROM Cars
left join CarsUsers on Cars.ID = CarsUsers.CarId
WHERE UserId is not null
GROUP BY Make
ORDER BY timesbooked DESC;

-- what users to contact to update their details?
SELECT  FirstName,Lastname from Users
WHERE Email IS NOT NULL OR PhoneNumber IS NOT NULL;
--How users pay?
Select PaymentType,COUNT(ID) as 'number of payments' from CarsUsers
GROUP BY PaymentType
--the most popular city?
SELECT COUNT(ID) AS 'Number of Users', City FROM Users
WHERE City IS NOT NULL
GROUP BY City
ORDER BY COUNT(ID) DESC
-- who is my main target as user based on age?
Select AVG(Age) from Users
Where Age<65;
--How much money each car makes?
SELECT Make,COUNT(UserId) AS 'TimesBooked',SUM(Price_per_day) as 'MoneyMade' FROM Cars
left join CarsUsers on Cars.ID = CarsUsers.CarId
WHERE UserId is not null
GROUP BY Make
ORDER BY timesbooked DESC;

-- Types of cars
Select Category,Count(Category) as 'Number of cars' from Cars
Group BY Category
ORDER BY [Number of cars] DESC;

-- High ROller
Select FirstName, COUNT(UserId) from Users
left join CarsUsers on Users.ID = CarsUsers.UserId
WHERE UserId IS NOT NULL
GROUP BY FirstName

-- How paid by crypto?
Select FirstName, COUNT(UserId) as 'CryptoPayers'  from Users
left join CarsUsers on Users.ID = CarsUsers.UserId
Where UserId IS NOT NULL and PaymentType = 'Crypto'
Group BY FirstName

