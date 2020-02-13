drop schema AshesiBusSystems;
CREATE SCHEMA AshesiBusSystems;

use AshesiBusSystems;

CREATE TABLE Drivers(
	id int auto_increment primary key,
	DriverId smallint unique,
    fname varchar(50),
    lname varchar(50),
    telNumber varchar(50),
    gender enum('Female','male','other'),
    email varchar(250)unique,
    password char(60)
);

CREATE TABLE Bus(
	id int auto_increment primary key,
	RegistrationN0 varchar (50) unique,
    DriverId int not null,
    foreign key (DriverId) references Drivers(DriverId),
    Route tinytext,
    MorningArrival time,
    EveningDeparture time
    );

CREATE TABLE Employees(
	id int auto_increment primary key,
	EmployeeID smallint ,
    fname varchar(50),
    lname varchar(50),
    Occupation enum('Faculty','Faculty Intern','Staff'),
    email varchar(50),
    gender enum('Female','male','other')
    
);

CREATE TABLE BusTransaction(
	TransID bigint  auto_increment primary key,
    BusNo varchar(50) not null,
    employeeID  int not null,
    stop_point varchar(100),
    fare int not null,
    Transaction_time timestamp,
	
    foreign key(BusNo) references Bus(RegistrationN0),
    foreign key(employeeID) references Employees(EmployeeID)
    
);



INSERT INTO Drivers 
	values();

INSERT INTO Bus
	values();
    
INSERT INTO Employees
	values();

INSERT INTO BusTransaction
	values();