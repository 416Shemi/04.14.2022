CREATE DATABASE Cinema
Use Cinema
CREATE TABLE Genres(
Id int identity(1,1) PRIMARY KEY,
Name varchar(255) NOT NULL,

)
--INSERT INTO Genres(Name)
--VALUES ('Dram'),('Qorxu'),('Romantik'),('Bedii'),('Dedaktiv')

--Select * from Genres

CREATE TABLE Actors(
Id int identity (1,1) PRIMARY KEY,
Name varchar (255) NOT NULL,
Surname varchar (255) NOT NULL DEFAULT 'XXX',
Age binary NOT NULL CHECK(Age>0)

)
--INSERT INTO Actors(Name,Surname,Age)
--VALUES('Semseddin','Amanov',19),('Ali','Aliyev',21),
--('Hafiz','Ezizov',56),('Mahir','Zahidov',23),
--('Seydheyder','Aslanov',34),('Sebuhi','Esmetov',12),('Murad','Aliyev',45),('Eziz','Semedov',28),
--('Behrem ','Amanov',24),('Heyder','Imranov',67)
--Select * From Actors
		
CREATE TABLE Halls(
Id int identity(1,1) PRIMARY KEY,
Name varchar(255) NOT NULL,
SeatCount int,
)
--INSERT INTO Halls(Name,SeatCount)
--VALUES('Genclik',230),('Deniz Moll',450),('28 Moll',500)

--Select *from Halls


CREATE TABLE Sessions(
Id int identity(1,1) PRIMARY KEY,
[Time] time
)
--INSERT INTO Sessions([Time])
--DECLARE  time('12:15:04') 
CREATE TABLE Customers(
Id int identity (1,1) PRIMARY KEY,
[Name] varchar(255) NOT NULL,
Surname varchar(255) NOT NULL DEFAULT 'XXX',
Age int NOT NULL CHECK(Age>0)
)
INSERT INTO Customers(Name,Surname,Age)
VALUES('Selim','Hesenov',21),('Nezer','Agayev',34),
		('Hesenov' ,'Orxan',35),('Nergiz','Cahangirova' ,16)
Select *from Customers
CREATE TABLE Tickets(
Id int identity (1,1) PRIMARY KEY,
SoldDate datetime NOT NULL,
Price decimal NOT NULL,
Place int NOT NULL,
HallId int references Halls(Id),
FilmId int references Films(Id),
SessionId int references Sessions(Id)
)
INSERT INTO Tickets(SoldDate,Price,Place,HallId,FilmId,SessionId)
VALUES('12.05.2022',10,2,1,1,2)

CREATE TABLE Films(
Id int identity(1,1) PRIMARY KEY,
Name varchar(255) NOT NULL,
ReleaseDate date
)
--INSERT INTO Films(Name,ReleaseDate)
--VALUES('Annabelli','03.05.2001'),('21 Gram','2000.12.03'),('300 Spartali','1995.09.12'),
		('Akrep Kral','1996.04.23'),('Batman','1998.01.23')
--Select * from Films
CREATE TABLE FilmGenres(
Id int identity(1,1) PRIMARY KEY,
FilmId int references Films(Id),
GenreId int references Genres(Id)
)
--INSERT INTO FilmsGeneres(FilmId,GenreId)

CREATE TABLE FilmActors(
Id int identity (1,1) PRIMARY KEY,
FilmId int references Films(Id),
ActorsId int references Actors(Id)
)