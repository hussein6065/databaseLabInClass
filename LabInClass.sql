drop schema AshesiBusSystems;
CREATE SCHEMA AshesiBusSystems;

use AshesiBusSystems;

CREATE TABLE Drivers(
	id int auto_increment primary key,
	DriverId int unique,
    fname varchar(50),
    lname varchar(50),
    telNumber varchar(50),
    gender enum('female','male','other'),
    email varchar(250)unique,
    password varchar(100)
);

CREATE TABLE Bus(
	id int auto_increment primary key,
	RegistrationN0 varchar (50) unique,
    DriverId int not null,
    foreign key (DriverId) references Drivers(id),
    Distination varchar(100),
    MorningArrival time,
    EveningDeparture time
    );

CREATE TABLE Employees(
	id smallint auto_increment primary key,
	EmployeeID int unique ,
    fname varchar(50),
    lname varchar(50),
    Occupation enum('Faculty','Faculty Intern','Staff'),
    email varchar(50),
    gender enum('female','male','other')
    
);

CREATE TABLE BusTransaction(
	TransID bigint  auto_increment primary key,
    BusNo int not null,
    employeeID  smallint not null,
    stop_point varchar(100),
    fare int not null,
    Transaction_time timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	
    foreign key(BusNo) references Bus(id),
    foreign key(employeeID) references Employees(id)
    
);

-- Mr McCarthy, Peter Okwei, Peter Tetteh, Peter Akumasi and Uncle Ken


INSERT INTO Drivers(DriverId,fname,lname,telnumber,gender,email,password) 
	values('60653032','Mr','McCarthy','0508836985','male','McCarthy@ashesi.edu.gh','fnbfdluo`xiwjbvkt9tcfo61psn2`dien3phlreqt4mw8cq7n8h`djdtu5ui'),
          ('59638025','Peter','Okwei','054836985','male','Okwei@ashesi.edu.gh','4gn6bdpn8knnnanvi`k9njrmknptu`ehvq8ba7`2vbr35imqpmxips`dpoi1'),
          ('59638925','Peter','Tetteh','057836985','male','Tetteh@ashesi.edu.gh','a4rmu38o2phmjffetettjwpv`nfvirbc7ep9q6tfat51wwjshoovk8ubhmvl'),
          ('59638525','Peter','Akumasi','024836985','male','Akumasi@ashesi.edu.gh','bldjpgvn5d7mrsupjhnev96`mflkha3ojmwhqcqdi8bp8okj1hdbsrbu24ue|'),
          ('59608525','Uncle','Ken','055836985','male','Ken@ashesi.edu.gh','e6ovdj7ruf4s1fg8skfbg9h2jgrlpgg5qeuqqpap8nffr3qnfbdrjjtwcgui');
          
/*
	GR-003-20
    GR-210-19
    GE-639-18
    GE-895-20
    GA-741-18
*/
INSERT INTO Bus(RegistrationN0,DriverId,Distination,MorningArrival,EveningDeparture)
	values('GR-003-20',3,'Atomic Junction','07:35','18:15'),
		  ('GR-210-19',1,'Accra Mall','07:35','17:10'),
          ('GE-639-18',4,'Atomic Junction','8:00','17:10'), -- 8:00pm
          ('GE-895-20',5,'Accra Mall','08:30','18:45'),
          ('GA-741-18',2,'Accra Mall',null,null);
          
-- use AshesiBusSystems;
-- select * from Drivers;
INSERT INTO Employees(EmployeeID,fname,lname,Occupation,email,gender)
	values(10,'Abena','Kwaku','Faculty','Kwaku@ashesi.edu.gh','male'),
		  (11,'Ayorkoh','Korsah','Faculty','AKorsah@ashesi.edu.gh','female'),
          (12,'David','Sampah','Faculty','Sampah@ashesi.edu.gh','male'),
          (13,'Zak','Issahack','Faculty','Issahack@ashesi.edu.gh','male'),
          (14,'Elvis','Okoh','Faculty',' elvis.okoh-asirifi@ashesi.edu.gh','male');
-- 
INSERT INTO BusTransaction(BusNO,employeeID,stop_point,fare)
	values(1,1,'Ashesi',3),
		  (2,3,'Ashesi',3),
          (3,2,'Ashesi',3),
          (4,1,'Ashesi',3),
          (4,1,'Accra Mall',3),
          (3,2,'Atomic Junction',3),
          (2,3,'Accra Mall',3),
          (1,1,'Atomic Junction',3),
          (1,5,'Ashesi',1),
          (1,5,'Berekuso',1);
--     
select * from BusTransaction where stop_point = 'Ashesi';









