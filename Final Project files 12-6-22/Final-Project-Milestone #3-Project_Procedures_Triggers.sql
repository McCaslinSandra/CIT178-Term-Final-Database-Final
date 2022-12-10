/* Final Project Procedures 

--  Retrieves and displays data
USE myTalentBank;
GO
CREATE PROC spDepartment
AS
SELECT * FROM Department
ORDER BY Name;
GO

EXEC spDepartment;

--  Takes an input parameter
USE myTalentBank;
GO 
CREATE PROC spFindJobs
	@Name varchar(50) = '%'
AS 
BEGIN
	SELECT Name, Description, Hourly
	FROM Jobs
	WHERE Name LIKE @Name;
END
GO
EXEC spFindJobs'Evs%';

SELECT * FROM Jobs;

--  Takes one input parameter and returns three output parameters


USE myTalentBank;
GO
CREATE PROC sp_Applicant
	@ID int,
	@FName varchar(15) OUTPUT,
	@LName varchar(25) OUTPUT,
	@Email varchar (30) OUTPUT 
AS
SELECT @FName = FName, @LName = LName, @Email = Email
FROM Applicant
WHERE ID = @ID;
GO
-- Run the procedure

DECLARE @FName varchar(15);
DECLARE @LName varchar(25);
DECLARE @Email varchar (30) ;
EXEC sp_Applicant 2, @FName OUTPUT, @LName OUTPUT, @Email OUTPUT;
SELECT @FName AS 'FName', @LName AS 'LName', @Email AS 'Email';


SELECT * FROM Jobs;

--  Stored procedure that has a return value 
USE myTalentBank;
GO
CREATE PROC spApplicantCount
AS
DECLARE @ApplicantCount int;
SELECT @ApplicantCount = COUNT(*)
FROM Applicant 
RETURN @ApplicantCount;
GO
-- Run Procedure
DECLARE @ApplicantCount int;
EXEC @ApplicantCount = spApplicantCount;
PRINT 'Some ' + CONVERT(varchar, @ApplicantCount) + ' Customers in your database';
GO

SELECT * FROM Applicant;

USE myTalentBank;
GO
CREATE PROC sp_HiringTeamSearch
@LName varchar(15),
@FName nvarchar(25)
AS
SET NOCOUNT ON; -- turns off # rows affected
SELECT FName, LName, Phone#, Email
FROM HiringTeam
WHERE FName = @FName AND LName=@LName
GO

EXEC sp_HiringTeamSearch @FName='Tom', @LName='Mitchell';

EXEC sp_HiringTeamSearch N'Mitchell', N'Tom'; 

SELECT * FROM HiringTeam;



/* Final Project User Defined Functions

--scalar function
USE myTalentBank
GO
CREATE FUNCTION fnID
    (@FName varchar (15))
    RETURNS int
BEGIN
    RETURN (SELECT ID FROM Applicant
            WHERE FName = @FName);
END;
 
-- uses the function

SELECT FName, LName, ZipCode, Email
FROM Applicant
WHERE ID = dbo.fnID ('Sandra Dee');

SELECT * FROM Applicant;

-- table function

USE myTalentBank;
GO
CREATE FUNCTION fn_Applicant
	(@ID int)
	RETURNS table
RETURN
	(SELECT * FROM Applicant WHERE @ID=Applicant.ID);
--Run Function
SELECT * FROM dbo.fn_Applicant (2);
SELECT * FROM dbo.fn_Applicant (4);
SELECT * FROM dbo.fn_Applicant (6);

SELECT * FROM Applicant;

/* Final Project Triggers */

-- create archive table by copying customer table without any rows

USE myTalentBank;
SELECT ID,FName,LName, ZipCode, Email, CellPh INTO TestApplicant
FROM Applicant;

CREATE TABLE ApplicantLogs(
    Id nchar(5),
    status varchar(30)
);
--Trigger
CREATE TRIGGER TestApplicant_INSERT ON TestApplicant
    AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @ID nchar(5)
    SELECT @ID =INSERTED.Id
    FROM INSERTED

	INSERT INTO ApplicantLogs
    VALUES(@Id, 'Inserted')
END


INSERT INTO TestApplicant(ID,FName,LName, ZipCode, Email, CellPh) VALUES ('2','Cheryl', 'Huffman','49660', 'chuffman@gmail.com', '231-398-3040');
INSERT INTO TestApplicant(ID,FName,LName, ZipCode, Email, CellPh) VALUES ('4','Sandra', 'Dee', '49659', 'SandraDee@gmail.com', '231-587-9077');

SELECT * FROM ApplicantLogs;

--Deleted
CREATE TRIGGER TestApplicant_Delete ON TestApplicant
    AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @ID nchar(5)
    SELECT @ID = DELETED.Id
    FROM DELETED

	INSERT INTO ApplicantLogs
    VALUES(@Id, 'Deleted')
END

DELETE FROM TestApplicant WHERE ID='3';
DELETE FROM TestApplicant WHERE ID='4';
SELECT * FROM ApplicantLogs;

-- Update
CREATE TRIGGER TestApplicant_UPDATE ON TestApplicant
    AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @ID nchar(5)
	DECLARE @Action varchar(50)
    SELECT @Id = INSERTED.Id
    FROM INSERTED 

    IF UPDATE(ID)
        SET @Action = 'Updated ID'   

    IF UPDATE(FName)
        SET @Action = 'Updated FName'

    IF UPDATE(LName)
        SET @Action = 'Updated LName'   

	IF UPDATE(ZipCode)
        SET @Action = 'Updated ZipCode'  
		
	IF UPDATE(Email)
        SET @Action = 'Updated Email' 

	IF UPDATE(CellPh)
        SET @Action = 'Updated CellPh' 

    INSERT INTO ApplicantLogs
    VALUES(@Id, @Action)
END

UPDATE TestApplicant SET ID='2' WHERE ID = '3';
UPDATE TestApplicant SET FName='3' WHERE ID = '4';
UPDATE TestApplicant SET LName = '4' WHERE ID='1';

SELECT * FROM ApplicantLogs;

-- Create an insert trigger that adds to the archive or transaction table when a row is inserted 

*/

/*Task

USE MyTalentBank;
SELECT * INTO ApplicantTransactions
FROM Applicant
WHERE 1=0;


ALTER TABLE ApplicantTransactions
DROP COLUMN ID;

ID AS an integer
ApplicantAppliedDate as a Date
Status as varchar(30)

ALTER TABLE ApplicantTransactions
ADD ID int;
GO
ALTER TABLE ApplicantTransactions
ADD ApplicantAppliedDate Date;
GO
ALTER TABLE ApplicantTransactions
ADD status varchar(30);

*/
--Insert Trigger
GO
CREATE TRIGGER Applicant_INSERT ON Applicant
AFTER INSERT
AS
BEGIN
SET NOCOUNT ON;
DECLARE @FName varchar(15)
DECLARE @LName varchar(25)
DECLARE @ZipCode varchar(10)
DECLARE @Email varchar(30)
DECLARE @CellPh char(15)
DECLARE @status varchar(30)


SELECT @LName = INSERTED.LName, @FName = INSERTED.FName, @ZipCode = INSERTED.Zipcode, @Email = INSERTED.Email, @CellPh = INSERTED.CellPh,
 @status='Inserted'
FROM INSERTED
INSERT INTO ApplicantTransactions VALUES ( @LName, @FName,@ZipCode, @Emails, @CellPh, @status)
END
GO

--Delete Trigger
CREATE TRIGGER Applicant_Delete ON Applicant
AFTER DELETE
AS
BEGIN
SET NOCOUNT ON;
DECLARE @FName varchar(15)
DECLARE @LName varchar(25)
DECLARE @ZipCode varchar(10)
DECLARE @Email varchar(30)
DECLARE @CellPh char(15)
DECLARE @status varchar(30)

SELECT @LName = DELETED.LName, @FName = DELETED.FName, @ZipCode = DELETED.Zipcode, @Email = DELETED.Email,
@ID =DELETED.ID, @status='Deleted'
FROM DELETED
INSERT INTO ApplicantTransactions VALUES ( @LName, @FName, @ZipCode, @Email, @State, @CellPh, @status)
END

--Update Trigger
CREATE TRIGGER Applicant_Update ON Applicant
AFTER UPDATE
AS
BEGIN
SET NOCOUNT ON;
DECLARE @FName varchar(15)
DECLARE @LName varchar(25)
DECLARE @ZipCode varchar(10)
DECLARE @Email varchar(30)
DECLARE @CellPh char(15)
DECLARE @status varchar(30)

SELECT @LName = INSERTED.LName, @FName = INSERTED.FName, @ZipCode = INSERTED.Zipcode, @Email = INSERTED.Email,
,@status='Updated'
FROM INSERTED
INSERT INTO ApplicantTransactions VALUES ( @LName, @FName, @ZipCode, @Email, @CellPh,  @status)
END*/

--Testing Triggers

-- Original table before changes
SELECT * FROM Applicant;
GO

INSERT INTO Applicant VALUES('Meadker','Milo','4693 Tumerack St','Manistee', 'MI','49660','231-555-1212',700000000,350000000);

UPDATE Applicant
SET Address='678 Horshoe Bend'
WHERE LName='Meadker' AND FName='Milo';

DELETE FROM Applicant WHERE LName='Meadker' AND FName='Milo';

-- View transactions
SELECT * FROM ApplicantTransactions;

-- Original table should be the same as before the changes
SELECT * FROM Applicant;