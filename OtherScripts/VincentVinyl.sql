Use Master
Go
If exists
   (Select name from sys.Databases 
     Where name='VincentVinyl')
Begin
Drop Database VincentVinyl
End
Go
Create Database VincentVinyl
go
Use VincentVinyl
go
Create table Album
(
   AlbumID int identity(1,1) primary Key,
   AlbumTitle nvarchar(255) not null,
   AlbumYear int,
   AlbumStudion nvarchar(255)
)
Go
Create table Artist
(
    ArtistID int identity(1,1) primary key,
	ArtistName nvarchar(255) not null
)
Go
Create table ArtistAlbum
(
   ArtistID int foreign key references Artist(ArtistID),
   AlbumID int foreign key references Album(AlbumID),
   primary key (ArtistID, AlbumID)
)
go
Create table Person
(
   PersonID int identity(1,1) primary key,
   PersonLastName nvarchar(255) not null,
   PersonFirstName nvarchar(255),
   PersonEmail nvarchar(255) unique,
   PersonAddDate Date default getDate()
)
Go
Create table Purchase
(
   PurchaseID int identity(1,1) primary key,
   PurchaseDate Date default getDate(),
   PersonID int foreign key references Person(PersonID)
)
go
Create Table PurchaseDetail
(
   PurchaseDetailID int identity(1,1) primary key,
   purchaseID int foreign key references purchase(purchaseID),
   AlbumID int foreign key references Album(AlbumID),
   PurchasePrice money
)
Go
Create table Condition
(
   ConditionID int identity(1,1) primary Key,
   ConditionName nvarchar(255) not null,
   ConditionDescription nvarchar(255)
)
Go
Create table Inventory
(
   InventoryID int identity(1,1) primary key,
   PurchaseID int foreign key references Purchase(PurchaseID),
   ConditionID int foreign key references Condition(ConditionID),
   InventorySalePrice money not null
)
go
Create table Employee
(
   EmployeeID int identity(1,1) primary key,
   PersonID int foreign key references person(personID)
)
go
Create table Sale
(
   SaleID int identity(1,1) primary key,
   SaleDate DateTime default GetDate(),
   PersonID int null foreign key references Person(PersonID),
   EmployeeID int foreign key references Employee(EmployeeID)
)
go
Create table SaleDetail
(
   SaleDetailID int identity(1,1) primary Key,
   SaleID int foreign key references Sale(SaleID),
   InventoryID int foreign key references inventory(inventoryID),
   SaleDetailDiscount decimal(5,2) default 0.0
)
Go
Create table Request
(
   RequestID int identity(1,1) primary key,
   RequestDate DateTime default getDate(),
   PersonID int foreign key references Person(personID),
   EmployeeID int foreign Key references Employee(EmployeeID),
   AlbumID int Foreign Key references Album(AlbumID),
   RequestNotes nvarchar(255)
)
Go
Insert into Album(AlbumTitle, AlbumYear, AlbumStudion)
Values('Blonde on Blonde', 1967,'Columbia'),
('Abby Road', 1969,'Apple'),
('Nevermind', 1967,'Columbia'),
('Pure Heroine',2016,'Atlantic'),
('Sticky Fingers',1972,'Columbia')



