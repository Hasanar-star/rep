CREATE TABLE Emporg  
(  
  Id INT PRIMARY KEY,  
  Name VARCHAR(45),  
  Salary INT,  
  Gender VARCHAR(12),  
  DepartmentId INT,
  total_working_hrs int,
 
)  

drop table Emporg

select*from Emporg

INSERT INTO Emporg VALUES (1,'Hasan', 12000, 'Male', 3,9),  
(2,'Shashank', 32000, 'Male', 1,9), 
(4,'Ashwin', 42000, 'Male', 2,9),  
(5,'Purshotham', 44000, 'Male', 3,9)  ;



----insert trigger----
create table EmpHIstory
(
Id int identity,
numbr_actions text
)

drop table EmpHIstory

select*from emphistory 

CREATE TRIGGER dbo.trInsertEmporg   
ON dbo.Emporg  
FOR INSERT  
AS  
BEGIN  
  Declare @Id int 
  SELECT @Id = Id from inserted
  INSERT INTO EmpHIstory
  VALUES ('New employee with Id  = ' 
  + CAST(@Id AS VARCHAR(10))+ ' is added at ' 
  + CAST(Getdate() AS VARCHAR(22)))  
END  

INSERT INTO Emporg VALUES (74,'Luqmaan', 12000, 'Male', 3,10)  

select*from Emporg
Select*from EmpHIstory
-----delete trigger-------


CREATE TRIGGER trDeleteEmporg   
ON dbo.emporg  
FOR DELETE  
AS  
BEGIN  
  Declare @Id int  
  SELECT @Id = Id from deleted  
  INSERT INTO emphistory  
  VALUES ('An existing employee with Id = ' + CAST(@Id AS VARCHAR(10)) + ' is deleted at ' + CAST(Getdate() AS VARCHAR(22)))  
END 

DELETE FROM Emporg WHERE Id = 2; 

select*from Emporg
Select*from EmpHIstory


----update trigger----
Create trigger tr_tblEmployee_ForUpdate
on emporg
for Update
as
Begin
 Select * from deleted
 Select * from inserted 
End

Update emporg set Name = 'Sahil', Salary = 20010, 
Gender = 'Male' where Id = 5


Alter trigger tr_tblEmployee_ForUpdate
on emporg
for Update
as
Begin

      Declare @Id int
      Declare @OldName nvarchar(20), @NewName nvarchar(20)
      Declare @OldSalary int, @NewSalary int
      Declare @OldGender nvarchar(20), @NewGender nvarchar(20)
      Declare @OldDeptId int, @NewDeptId int

      Declare @AuditString nvarchar(1000)
      

      Select *
      into #TempTable
      from inserted
 
      While(Exists(Select Id from #TempTable))
      Begin
     
            Set @AuditString = ''
           
        
            Select Top 1 @Id = Id, @NewName = Name, 
            @NewGender = Gender, @NewSalary = Salary,
            @NewDeptId = DepartmentId
            from #TempTable
           
           
            Select @OldName = Name, @OldGender = Gender, 
            @OldSalary = Salary, @OldDeptId = DepartmentId
            from deleted where Id = @Id
   
           
            Set @AuditString = 'Employee with Id = ' + Cast(@Id as nvarchar(4)) + ' changed'
            if(@OldName <> @NewName)
                  Set @AuditString = @AuditString + ' NAME from ' + @OldName + ' to ' + @NewName
                 
            if(@OldGender <> @NewGender)
                  Set @AuditString = @AuditString + ' GENDER from ' + @OldGender + ' to ' + @NewGender
                 
            if(@OldSalary <> @NewSalary)
                  Set @AuditString = @AuditString + ' SALARY from ' + Cast(@OldSalary as nvarchar(10))+ ' to ' + Cast(@NewSalary as nvarchar(10))
                  
     if(@OldDeptId <> @NewDeptId)
                  Set @AuditString = @AuditString + ' DepartmentId from ' + Cast(@OldDeptId as nvarchar(10))+ ' to ' + Cast(@NewDeptId as nvarchar(10))
           
            insert into emphistory values(@AuditString)
            
         
            Delete from #TempTable where Id = @Id
      End
End


drop trigger if exists trupdateEmporg

select*from EmpHIstory
select*from emporg
---delete trigger---

drop trigger if exists trupdateEmporg

DROP TRIGGER IF EXISTS tr_emporg,trInsertEmporg,trUpdateEmporg,tr_emporg_forupdate;


