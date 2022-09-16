

CREATE DATABASE Normalization
USE Normalization

--Before 1st NF---
CREATE TABLE dbo.EmployeeDetailsAndTheirDepartments(
EmpName varchar(30),Gender varchar(6),Salary int,DeptName varchar(20),
DeptHeadName varchar(20),DeptLocation varchar(30));

INSERT INTO dbo.EmployeeDetailsAndTheirDepartments VALUES(
'Hasan','Male',25000,'IT','XYZ','Bangalore')

INSERT INTO dbo.EmployeeDetailsAndTheirDepartments VALUES(
'Jato','Male',30000,'HR','ABC','Palakkad')

INSERT INTO dbo.EmployeeDetailsAndTheirDepartments VALUES(
'Sohail','Male',25000,'IT','XYZ','Raichur')





SELECT * FROM dbo.EmployeeDetailsAndTheirDepartments

-- Duplicate data is present in the current table,duplicate data increases the spaces to solve this problem we need apply 1st NF.
-- Applying 1st Normal form to EmployeeDetailsAndTheirDepartments table.
--In this process we need to break the into two one is having the employee data and onother is having the department data.

--Creating employee table
CREATE TABLE dbo.Employee(
EmpId int primary key,
EmpName varchar(30),
Gender varchar(6),
Salary int,)

Drop table Employee

--inserting the data
INSERT INTO dbo.Employee VALUES(
1,'Hasan','Male',25000)

INSERT INTO dbo.Employee VALUES(
2,'Jato','Male',55000)

INSERT INTO dbo.Employee VALUES(
3,'Sohail','Male',45000)


--creating department table
CREATE TABLE dbo.Department(
DeptId int primary key,
DeptName varchar(20),
DeptHeadName varchar(20),
DeptLocation varchar(30)
);

DROP TABLE Department

INSERT INTO dbo.Department VALUES(
1,'HR','XYZ','Bangalore')

INSERT INTO dbo.Department VALUES(
2,'IT','ABC','Mangalore')

SELECT * FROM dbo.Employee;

SELECT * FROM dbo.Department;

--After applying 1NF we are able to solve the problem of space waste/Data duplication.

--Applying 2nd NF
	-- To proceed with 2nf, the table must follows the 1NF rules
	--In 2nd NF built the relationship with other table using Foriegn key.

CREATE TABLE dbo.Employee(
EmpId int PRIMARY KEY,
EmpName varchar(30),
Gender varchar(6),
Salary int,
DeptId int FOREIGN KEY REFERENCES dbo.Department(DeptId))       

INSERT INTO dbo.Employee VALUES(
1,'Hasan','Male',25000,1)

INSERT INTO dbo.Employee VALUES(
2,'Jato','Male',55000,2)

INSERT INTO dbo.Employee VALUES(
3,'Sohail','Male',45000,1)



CREATE TABLE dbo.Department(
DeptId int primary key,
DeptName varchar(20),
DeptHeadName varchar(20),
DeptLocation varchar(30)
);

INSERT INTO dbo.Department VALUES(
1,'HR','XYZ','Bangalore')

INSERT INTO dbo.Department VALUES(
2,'IT','ABC','Mangalore')

SELECT * FROM dbo.Employee;

SELECT * FROM dbo.Department;


--Applying 3rd NF
	--It must follows 1NF and 2NF.
	--Does not contain column that not fully dependent on primary key.
	--If a table contains non dependent column we need to take further steps to solve it.

	SELECT EmpId,EmpName,Gender,Salary FROM dbo.Employee;

	
--10.2	
select * from FactSales;
SELECT FactSales.SalesAmount,
RANK() OVER(ORDER BY SalesAmount) Rank
FROM FactSales
where ProductKey=956;