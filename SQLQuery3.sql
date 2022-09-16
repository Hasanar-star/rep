use test

--1. Create a table 
   
create table Employee(
EmpId int primary key,
FirstName varchar(15) NOT NULL,
MiddleName char(10),
LastName nvarchar(15),
DOB date,
IsMarried bit,
)

SELECT * FROM Employee

--2. Drop the table
drop table Employee

--3. Create and Drop using If exists

IF NOT EXISTS(SELECT NAME FROM sys.tables) 
BEGIN
create table Employee1(
EmpId int primary key,
FirstName varchar(15) NOT NULL,
MiddleName char(10),
LastName nvarchar(15),
DOB date,
IsMarried bit,
)
END

SELECT * FROM Employee1

IF EXISTS(SELECT NAME FROM sys.tables)
BEGIN
DROP TABLE Employee1
END

--4. Rename the table

sp_rename 'Employee1', 'Employee2'

--5.  Change the data type of a column using ALTER table
ALTER TABLE Employee
ALTER COLUMN FirstName nvarchar(20);

insert into Employee(EmpId,FirstName) values(
001,N'ಸಾಲಾ');



--6. Rename a Column using sp_rename.
EXEC sp_rename 'Employee.DOB', 'DOJ', 'column';