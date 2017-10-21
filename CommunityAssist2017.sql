Use Master
Go
if exists
  (Select name from sys.Databases where name ='CommunityAssist2017')
Begin
   Drop database CommunityAssist2017
End
Go
Create database CommunityAssist2017
Go
use CommunityAssist2017
go
--create tables
create table Person
(
  PersonKey int identity(1,1) primary key,
  PersonLastName nvarchar(255) not null,
  PersonFirstName nvarchar(255),
  PersonEmail nvarchar(255) not null unique,
  PersonPrimaryPhone nchar(10),
  PersonPassword varbinary(500),
  PersonPassSeed int,
  PersonDateAdded datetime default getDate()

)
go
Create table PersonAddress
(
   PersonAddressKey int identity(1,1) primary Key,
   PersonKey int foreign key references Person(personKey),
   PersonAddressApt nvarchar(20) null,
   PersonAddressStreet nvarchar(255)not null,
   PersonAddressCity nvarchar(255) default 'Seattle',
   PersonAddressState nchar(2) default 'WA',
   PersonAddressPostal nchar(12) not null,
   PersonAddressDateAdded datetime default GetDate()
)
Go
Create Table Position
(
  PositionKey int identity(1,1) primary key,
  PositionName nvarchar(255) not null,
  PositionDescription nvarchar(255),
  PositionDateAdded datetime default GetDate()
)

Go
Create Table Employee
(
  EmployeeKey int identity(1,1) primary key,
  PersonKey int foreign key references Person(personKey),
  EmployeeDateHired Date not null
)
Go
Create Table EmployeePosition
(
   PositionKey int foreign key references Position(positionKey),
   EmployeeKey int foreign key references Employee(EmployeeKey),
   Constraint PK_EmployeePosition primary key (PositionKey, EmployeeKey),
   EmployeePositionDateAdded datetime default getdate()
)
Go
Create table GrantType
(
    GrantTypeKey int identity(1,1) primary key,
	GrantTypeName nvarchar(255) not null,
	GrantTypeDescription nvarchar(255),
	GrantTypemaximum decimal(8,2) not null,
	GrantTypeLifetimeMaximum decimal(10,2) not null,
	GrantTypeDateEntered datetime default getDate()
)
Go
Create table Donation
(
  DonationKey int identity(1,1) primary key,
  PersonKey int foreign key references Person (PersonKey),
  DonationDate datetime default getDate(),
  DonationAmount decimal(10,2) not null,
  DonationConfirmationCode UniqueIdentifier default newid()
)
go
Create Table GrantApplicationStatus
(
  GrantApplicationStatusKey int primary key,
  GrantApplicationStatusTerm nvarchar(20) not null
)
Go
Create table GrantApplication
(
   GrantApplicationKey int identity(1,1) primary key,
   PersonKey int foreign key references Person(personkey),
   GrantAppicationDate datetime default GetDate(),
   GrantTypeKey int foreign key references GrantType(GrantTypeKey),
   GrantApplicationRequestAmount decimal(8,2) not null,
   GrantApplicationReason nvarchar(255) not null,
   GrantApplicationStatusKey int foreign key references GrantApplicationStatus(GrantApplicationStatusKey) default 1,
   GrantApplicationAllocationAmount decimal(8,2) null

)
Go
Create Table GrantApplicationReview
(
    GrantApplicationReviewKey int identity(1,1) primary key,
	GrantApplicationKey int foreign key references GrantApplication(GrantApplicationKey),
	EmployeeKey int foreign key references Employee (EmployeeKey),
	GrantApplicationReviewDate DateTime default getDate(),
	GrantApplicationReviewNotes nvarchar(255) not null
)
go
Create Table LoginHistory
(
    loginHistoryKey int identity(1,1) primary key,
	PersonKey int foreign key references person(personKey),
	LoginHistoryTimeStamp datetime default GetDate()
)
Go
Create table BusinessRule
(
   BusinessRuleKey int identity(1,1) primary key,
   BusinessRuleText nvarchar(255)
)
Go
--create a view to use random function
create view RandomView
as
Select rand() randResult
go

--create functions for hashing passwords

Create Function GetSeed()
returns int
As
Begin
declare @rawseed decimal(10,10)
Select @rawseed = randResult from RandomView
Declare @seed int
Set @seed = @rawseed * 100000000
return @seed
End
Go
Create Function SetPassword
(@password nvarchar(50), @seed int)
returns varbinary(500)
As

Begin
Declare @ToHash nvarchar(70)
Set @ToHash=@password + cast(@seed as nvarchar(10))
Declare @hashed varbinary(500)
set @hashed=hashbytes('sha2_512',@ToHash)
return @hashed

End

Go
--create stored procedure for adding new people
Create proc [dbo].[usp_Register]
@lastname nvarchar(255),
@firstname nvarchar(255)=null,
@email nvarchar(255),
@password nvarchar(50),
@ApartmentNumber Nvarchar(255) =null,
@Street nvarchar(255),
@City nvarchar(255)='Seattle',
@State nchar(2)='WA',
@Zipcode nvarchar(11),
@Phone nvarchar(13) = null
As
--check to make sure person doesn't exit
If not exists
   (Select PersonKey
      From Person
	  Where PersonLastName=@LastName
	  And PersonEmail = @Email)
Begin--begin the block of if not exists
--get seed and hash the password
Declare @Seed int
Set @Seed = dbo.GetSeed()
Declare @hash varbinary(500)
set @hash=dbo.SetPassword(@Password, @seed)
--begin the transaction
Begin tran
--begin the try catch
Begin Try
--insert into tables
Insert into Person
(
   PersonLastName, 
   PersonFirstName, 
   PersonEmail, 
   PersonPassWord, 
   PersonDateAdded, 
   PersonPassSeed,
   PersonPrimaryPhone
)
Values
(
   @LastName,
   @FirstName,
   @Email,
   @hash,
   getDate(),
   @seed,
   @Phone
)
--get the current person key
Declare @PersonKey int
Set @PersonKey=IDENT_CURRENT('Person')
Insert into PersonAddress
(
   PersonAddressApt, 
   PersonAddressStreet, 
   PersonAddressCity, 
   PersonAddressState, 
   PersonAddressPostal, 
   PersonAddressDateAdded,
   PersonKey


)
Values
(
   @ApartmentNumber,
   @Street,
   @City,
   @State,
   @Zipcode,
   GetDate(),
   @PersonKey
  
)

  Commit tran
End try
Begin Catch
Rollback tran
Return -1
End catch
End
Else
Begin
Return -1
End
GO
--create stored porcedure for
--handling logins with hashed password
CREATE Proc [dbo].[usp_Login]
@Email nvarchar(255),
@password nvarchar(50)
As
--get the random seed
Declare @seed int
Declare @personKey int
Select @PersonKey=PersonKey,@seed = PersonPassSeed from Person
Where PersonEmail=@Email
--get the hashed password from the database
Declare @DBHash varbinary(500)
Select @DbHash = PersonPassword from Person
Where PersonEmail=@Email
--create a new hash based on the seed and password
Declare @newHash varbinary(500)
Set @newHash=dbo.setPassword(@password, @seed)
if @DbHash=@newHash
Begin
print 'Login successful'
--get PersonKey
Insert into LoginHistory(PersonKey, LoginHistoryTimeStamp)
Values(@PersonKey, GetDate())
Return @PersonKey
End
else
Begin
print 'login unsuccessful'
return -1
End
go
--insert into grantType
INSERT into GrantType ([GrantTypeName], [GrantTypeMaximum], [GrantTypeLifetimeMaximum], [GrantTypeDescription]) VALUES ( N'Food', 200.0000, 1000.0000, N'assistance for purchasing groceries')
GO
INSERT  GrantType ([GrantTypeName], [GrantTypeMaximum], [GrantTypeLifetimeMaximum], [GrantTypeDescription]) VALUES ( N'Rent', 900.0000, 2700.0000, N'assistance for monthly Rent payments')
GO
INSERT [dbo].[GrantType] ( [GrantTypeName], [GrantTypeMaximum], [GrantTypeLifetimeMaximum], [GrantTypeDescription]) VALUES ( N'Child care', 300.0000, 1000.0000, N'assistance for childcare expenses')
GO
INSERT [dbo].[GrantType] ( [GrantTypeName], [GrantTypeMaximum], [GrantTypeLifetimeMaximum], [GrantTypeDescription]) VALUES ( N'Transportation', 250.0000, 500.0000, N'assistance for transportation to and from work')
GO
INSERT [dbo].[GrantType] ([GrantTypeName], [GrantTypeMaximum], [GrantTypeLifetimeMaximum], [GrantTypeDescription]) VALUES ( N'Medical', 1200.0000, 5000.0000, N'assistance with medical bills')
GO
INSERT [dbo].[GrantType] ( [GrantTypeName], [GrantTypeMaximum], [GrantTypeLifetimeMaximum], [GrantTypeDescription]) VALUES (N'Dental', 950.0000, 5000.0000, N'assistance with dental bills')
GO
INSERT [dbo].[GrantType] ( [GrantTypeName], [GrantTypeMaximum], [GrantTypeLifetimeMaximum], [GrantTypeDescription]) VALUES ( N'Utilities', 250.0000, 1000.0000, N'help with monthly utilites')
GO
INSERT [dbo].[GrantType] ( [GrantTypeName], [GrantTypeMaximum], [GrantTypeLifetimeMaximum], [GrantTypeDescription]) VALUES ( N'home repair', 800.0000, 5000.0000, N'one time assistance with home repair')
GO
INSERT [dbo].[GrantType] ([GrantTypeName], [GrantTypeMaximum], [GrantTypeLifetimeMaximum], [GrantTypeDescription]) VALUES ( N'Education', 700.0000, 2100.0000, N'help with worker retraining')
GO
INSERT [dbo].[GrantType] ( [GrantTypeName], [GrantTypeMaximum], [GrantTypeLifetimeMaximum], [GrantTypeDescription]) VALUES ( N'Clothes', 200.0000, 800.0000, N'help especially with cothes for job search or work clothes')
GO
INSERT [dbo].[GrantType] ( [GrantTypeName], [GrantTypeMaximum], [GrantTypeLifetimeMaximum], [GrantTypeDescription]) VALUES ( N'Funerary', 1500.0000, 1500.0000, N'assistence for funeral costs')
GO
INSERT [dbo].[GrantType] ( [GrantTypeName], [GrantTypeMaximum], [GrantTypeLifetimeMaximum], [GrantTypeDescription]) VALUES (N'holiday', 300.0000, 750.0000, N'holiday assistance (food, gifts, etc)')
GO
INSERT [dbo].[GrantType] ( [GrantTypeName], [GrantTypeMaximum], [GrantTypeLifetimeMaximum], [GrantTypeDescription]) VALUES ( N'Emergency travel', 1000.0000, 1000.0000, N'assistance for emergancy travel needs')

go
--insert into GrantApplicationStatus
Insert into GrantApplicationStatus (GrantApplicationStatusKey, GrantApplicationStatusTerm)
Values(1, 'Pending'),
(2, 'Granted'),
(3, 'Reduced'),
(4, 'Denied')

go 
--Insert into Position
Insert into Position(PositionName, PositionDescription)
Values('Manager', 'Manages other employees, oversees general accounts'),
('Donation Reviewer', 'Reviews donations, contacts donors'),
('Grant Reviewer', 'Reviews and determines grant allocations'),
('Accounts manager', 'Reviews and summarizes accounts'),
('Human Resources', 'Hires and manages payroll'),
('Volunteer', 'Works in various capacities but not on payroll')

Go
--Insert into Business rule
insert into BusinessRule(BusinessRuleText)
Values('All passwords are in the form of [lastname]Pass'),
('All grant requests must be reviewed by at least 2 employees'),
('A reason must be given in review notes for any grant denied or reduced'),
('No one time grant can exceed the grant maximum for that grant type.'),
('No person can recieve more that the lifetime total for a grant type (multiple grants)'),
('When a donor donates they are give a unique donation value.'),
('Whenever anyone logs in they are written to the login history table'),
('There are no anonymous donors')
Go
--Use stored procedure to add employees

exec usp_Register
@lastname ='Nelson',
@firstname ='Nichole',
@email ='Nichole.Nelson@communityAssit.org',
@password='NelsonPass' ,
@ApartmentNumber= '302',
@Street ='1240 Broadway',
@Zipcode='98122',
@Phone='2065551247'
GO
exec usp_Register
@lastname ='Lewis',
@firstname ='Joseph',
@email ='Joseph.Lewis@communityAssit.org',
@password='LewisPass' ,
@Street ='10101 15th Ave',
@Zipcode='98123',
@Phone='2065551356'
Go
exec usp_Register
@lastname ='Thomson',
@firstname ='Lynn',
@email ='Lynn.Thompson@communityAssit.org',
@password='ThomsonPass' ,
@ApartmentNumber= '210',
@Street ='958 Pike',
@Zipcode='98121',
@Phone='2065550872'
Go
exec usp_Register
@lastname ='Martin',
@firstname ='Sara',
@email ='Sara.Martinn@communityAssit.org',
@password='MartinPass' ,
@Street ='1541 Pine',
@Zipcode='98122',
@Phone='2065551567'
Go
exec usp_Register
@lastname ='Nguyen',
@firstname ='Lee',
@email ='Lee.Nguyenn@communityAssit.org',
@password='NguyenPass' ,
@ApartmentNumber= '102',
@Street ='1430 Broadway',
@Zipcode='98122',
@Phone='2065551233'
Go
exec usp_Register
@lastname ='Downing',
@firstname ='Kelsey',
@email ='Kelsey.Downing@communityAssit.org',
@password='DowningPass' ,
@Street ='2323 12th Avenue',
@Zipcode='98123',
@Phone='2065555637'
go
--Insert into Employee
Insert into employee(PersonKey, EmployeeDateHired)
values(1, '5/23/2012'),
(2, '10/1/2012'),
(3, '1/5/2014'),
(4, '5/5/2014'),
(5,'9/23/2017'),
(6, '9/23/2017')
--insert into EmployeePosition
Insert into EmployeePosition(EmployeeKey,PositionKey)
values(1,1),
(1,2),
(1,3),
(1,4),
(2,1),
(3,3),
(4,5),
(5,6),
(6,6)