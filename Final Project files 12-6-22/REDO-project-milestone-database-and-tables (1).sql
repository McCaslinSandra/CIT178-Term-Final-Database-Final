CREATE DATABASE myTalentBank;
GO
USE myTalentBank;
CREATE TABLE Job(
	ID int NOT NULL,
	Name varchar(50) NOT NULL,
	Description varchar(100) NOT NULL,
	Hourly money,
	PRIMARY KEY(ID)
);
GO
CREATE TABLE Department(
	ID int NOT NULL,
	Name varchar(50) NOT NULL,
	HiringContactPerson varchar(50) NOT NULL,
	PhoneNumber varchar(12) NOT NULL,
	Email varchar(40),
	PRIMARY KEY(ID)
);
GO
CREATE TABLE HiringTeam(
	ID int NOT NULL,
	FName varchar(15) NOT NULL,
	LName varchar(25) NOT NULL,
	Phone# varchar(15),
	Email varchar(40),
	PRIMARY KEY(ID)
);
GO
CREATE TABLE JobPosting(
	ID int NOT NULL,
	OpeningDate datetime,
	ClosingDate datetime,
	JobID int NOT NULL,
	DeptID int NOT NULL,
	HiringID int NOT NULL,
	PRIMARY KEY(ID)
);
GO
CREATE TABLE Applicant(
	ID int NOT NULL,
	FName varchar(15) NOT NULL,
	LName varchar(25) NOT NULL,
	Zipcode varchar(10) NOT NULL,
	Email varchar(30),
	CellPh varchar(15),
	PRIMARY KEY(ID)
);
GO
CREATE TABLE ZipCode(
	Zipcode varchar (10) NOT NULL,
	City varchar(30) NOT NULL,
	State varchar(2) NOT NULL,
	PRIMARY KEY(Zipcode)

DROP Table ZipCode;

CREATE TABLE ZipCode(
	ZipCodeID varchar (10) NOT NULL,
	City varchar(30) NOT NULL,
	State varchar(2) NOT NULL,
	PRIMARY KEY(ZipCodeID)
);
GO
CREATE TABLE JobSeekerSource(
	JobSeekerID int NOT NULL,
	Name varchar (50) Not Null,
	PRIMARY KEY(JobSeekerID)
);
GO
CREATE TABLE AvailableJobs(
	ID int NOT NULL,
	JobsAvailable int NOT NULL,
	ApplicantID int NOT NULL,
	JobSeekerSourceID int,
	DateApplied datetime,
	PRIMARY KEY(ID)
	);
GO