create table FutureStars(Id int,FirstName varchar(15),MiddleName char(10),LastName nvarchar(15),DOB date,IsMarried bit,HeightInCms  tinyint)

SELECT*FROM FutureStars;
INSERT INTO FutureStars VALUES('1','Hasan','Mohammed','AR','1998-12-31','0','170');
INSERT INTO FutureStars VALUES('2','Jato','Paul',null,'1998-08-30','0','173');
INSERT INTO FutureStars VALUES('3','Mohammed','Sohail',null,'1999-04-26','0','165');

create table FutureStarsEducation(Id int,FutureStarsId int , DegreeName varchar(5), DegreeBranch varchar(5), DateOfCompletion date,
CollegeName varchar(30), SSLC int, PU int, EngORmasters int);


insert into FutureStarsEducation values ('1','01','BE','ECE','2021-08-15','BIT','90','90','90');
insert into FutureStarsEducation values ('2','02','MCA',NULL,'2021-08-15','Nehru college','90','90','90');
 insert into FutureStarsEducation values('3','03','MCA',NULL,'2021-08-15','SMVIT','90','90','90');
select*from FutureStarsEducation;
SELECT*FROM FutureStars;
