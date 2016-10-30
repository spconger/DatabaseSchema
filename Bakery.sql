Use Master
go
if exists
  (Select name from sysDatabases
       where name = 'Bakery')
Begin
Drop database Bakery
End
Go
Create Database Bakery
Go
Use Bakery
Go
Create table Product
(
  ProductKey int identity(1,1) primary key,
  ProductName nvarchar(255) not null,
  ProductPrice Money not null
)

Go

Create table Person
(
   PersonKey int identity(1, 1) primary key,
   PersonLastName nvarchar(255) not null,
   PersonFirstName nvarchar(255) null,
   PersonEmail nvarchar(255) null,
   PersonPhone nchar(11) null,
   PersonDateAdded DateTime default GetDate()

)
Go
Create table Employee
(
   EmployeeKey int identity(1,1) primary key,
   PersonKey int Foreign key references Person(PersonKey),
   EmployeeTitle nvarchar(255),
   EmployeeStatus nchar(10)
)

Go
Create Table Sale
(
   SaleKey int identity(1,1) primary key,
   SaleDate DateTime default GetDate(),
   CustomerKey int foreign key references Person(PersonKey),
   EmployeeKey int foreign Key references Employee(EmployeeKey),
)
Go
Create Table SaleDetail
(
  SaleDetailKey int identity(1,1) primary key,
  SaleKey int foreign key references Sale(SaleKey),
  ProductKey int foreign key references Product(ProductKey),
  SaleDetailPriceCharged money not null,
  SaleDetailQuantity int not null,
  SaleDetailDiscount decimal(10,2) default 0,
  SaleDetailSaleTaxPercent decimal(10,2),
  SaleDetailEatInTax decimal(10,2)
)
Go
Insert into Product(ProductName, ProductPrice)
Values('Glazed Donut',1),
('Maple Bar', 1.25),
('Cinnamon Roll', 2.25),
('Brownie', 2.25),
('Danish',3.15),
('Drip coffee', 1.25),
('Americano', 2),
('Latte', 3),
('Slice of pie', 4.25),
('Deli Sandwhich', 6.75)
Go
Insert into Person(PersonLastName, PersonFirstName, PersonEmail, PersonPhone)
Values('Smith', 'Jason','jsmith@gmail.com','2065551234'),
('Larson', 'Meredith','ml@gmail.com','2065551235'),
('Natt', 'Morgan','natt@gmail.com','2065551236'),
('Taylor', 'Robert','rtaylor@gmail.com','2065551237'),
('Jones', 'Tabitha','tabathaj@gmail.com','2065551238'),
('Lewis', 'Mark','lewis@gmail.com',null),
('Stevenson', 'Fred','fs@gmail.com','2065551239'),
('Anderson', 'Beth',null,'2065551240'),
('Carlson', 'Sue','jsCarlson@gmail.com','2065551241'),
('Daniels', 'Zak','zDaniels@gmail.com','20655512342')
Go
Insert into Employee(PersonKey, EmployeeTitle, EmployeeStatus)
values(2,'Barista','Full time'),
(5,'Barista','Part time'),
(6,'Dishwasher','Part time')
go
Insert into Sale(EmployeeKey, CustomerKey)
values(1,1)
Insert into SaleDetail(SaleKey,ProductKey, SaleDetailPriceCharged, SaleDetailQuantity,
SaleDetailDiscount, SaleDetailSaleTaxPercent, SaleDetailEatInTax)
Values(1,2,1.25,3,0,.09,.02),
(1,6,1.25,2,0,.09,.02)

Insert into Sale(EmployeeKey, CustomerKey)
values(1,4)
Insert into SaleDetail(SaleKey,ProductKey, SaleDetailPriceCharged, SaleDetailQuantity,
SaleDetailDiscount, SaleDetailSaleTaxPercent, SaleDetailEatInTax)
Values(2,5,3.15,1,0,.09,.0),
(2,8,3,2,0,.09,.0)

Insert into Sale(EmployeeKey, CustomerKey)
values(2,7)
Insert into SaleDetail(SaleKey,ProductKey, SaleDetailPriceCharged, SaleDetailQuantity,
SaleDetailDiscount, SaleDetailSaleTaxPercent, SaleDetailEatInTax)
Values(3,1,1.00,12,05,.09,0),
(3,8,1.25,2,0,.09,0),
(3,7,2,1,0,.09,0)
