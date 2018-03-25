USE [master]
GO
IF EXISTS
   (SELECT name FROM sys.databases
   WHERE name ='Bakery')
BEGIN
DROP DATABASE Bakery
END
GO
/****** Object:  Database [Bakery]    Script Date: 3/18/2018 1:26:52 PM ******/
CREATE DATABASE [Bakery]
Go
USE [Bakery]
GO
/****** Object:  UserDefinedFunction [dbo].[fx_CreatePassword]    Script Date: 3/18/2018 1:26:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create function [dbo].[fx_CreatePassword]
(@GUI uniqueIdentifier, @pwd nvarchar(50))
returns varbinary(500)
As
Begin 
Declare @identifier nvarchar(40)
Set @Identifier=convert(nvarchar(40),@GUI)
Declare @pwdString nvarchar(90)= @Identifier + @pwd
Declare @HashedPwd varbinary(500) = hashbytes('sha2_512',@pwdString)
return @Hashedpwd
end
GO
/****** Object:  Table [dbo].[BakeryLog]    Script Date: 3/18/2018 1:26:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BakeryLog](
	[BakeryLogKey] [int] IDENTITY(1,1) NOT NULL,
	[PersonKey] [int] NULL,
	[BakeryLogTimeStamp] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[BakeryLogKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BusinessRules]    Script Date: 3/18/2018 1:26:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusinessRules](
	[BusinessRuleKey] [int] IDENTITY(1,1) NOT NULL,
	[RuleName] [nvarchar](255) NOT NULL,
	[RuleDescription] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[BusinessRuleKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 3/18/2018 1:26:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeKey] [int] IDENTITY(1,1) NOT NULL,
	[PersonKey] [int] NULL,
	[EmployeeTitle] [nvarchar](255) NULL,
	[EmployeeStatus] [nchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 3/18/2018 1:26:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[PersonKey] [int] IDENTITY(1,1) NOT NULL,
	[PersonLastName] [nvarchar](255) NOT NULL,
	[PersonFirstName] [nvarchar](255) NULL,
	[PersonEmail] [nvarchar](255) NULL,
	[PersonPhone] [nchar](11) NULL,
	[PersonDateAdded] [datetime] NULL,
	[PersonPassword] [varbinary](500) NULL,
	[PersonIdentityCode] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[PersonKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 3/18/2018 1:26:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductKey] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](255) NOT NULL,
	[ProductPrice] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sale]    Script Date: 3/18/2018 1:26:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sale](
	[SaleKey] [int] IDENTITY(1,1) NOT NULL,
	[SaleDate] [datetime] NULL,
	[CustomerKey] [int] NULL,
	[EmployeeKey] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SaleKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SaleDetail]    Script Date: 3/18/2018 1:26:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SaleDetail](
	[SaleDetailKey] [int] IDENTITY(1,1) NOT NULL,
	[SaleKey] [int] NULL,
	[ProductKey] [int] NULL,
	[SaleDetailPriceCharged] [money] NOT NULL,
	[SaleDetailQuantity] [int] NOT NULL,
	[SaleDetailDiscount] [decimal](10, 2) NULL,
	[SaleDetailSaleTaxPercent] [decimal](10, 2) NULL,
	[SaleDetailEatInTax] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[SaleDetailKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BakeryLog] ON 
GO
INSERT [dbo].[BakeryLog] ([BakeryLogKey], [PersonKey], [BakeryLogTimeStamp]) VALUES (1, 6, CAST(N'2018-03-18T12:53:21.747' AS DateTime))
GO
INSERT [dbo].[BakeryLog] ([BakeryLogKey], [PersonKey], [BakeryLogTimeStamp]) VALUES (2, 12, CAST(N'2018-03-18T13:08:15.080' AS DateTime))
GO
INSERT [dbo].[BakeryLog] ([BakeryLogKey], [PersonKey], [BakeryLogTimeStamp]) VALUES (3, 12, CAST(N'2018-03-18T13:11:11.240' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[BakeryLog] OFF
GO
SET IDENTITY_INSERT [dbo].[BusinessRules] ON 
GO
INSERT [dbo].[BusinessRules] ([BusinessRuleKey], [RuleName], [RuleDescription]) VALUES (1, N'Passwords', N'all passwords consist of the user Last Name and the word "Pass". Thus "AndersonPass"')
GO
INSERT [dbo].[BusinessRules] ([BusinessRuleKey], [RuleName], [RuleDescription]) VALUES (2, N'UserNames', N'User names are the person email')
GO
INSERT [dbo].[BusinessRules] ([BusinessRuleKey], [RuleName], [RuleDescription]) VALUES (3, N'Hashes', N'all passwords are hashed. The personIdentityCode is the seed combined with the plain text password-not stored in table')
GO
INSERT [dbo].[BusinessRules] ([BusinessRuleKey], [RuleName], [RuleDescription]) VALUES (4, N'Inserts into Person', N'All inserts into person should use the stored procedure usp_newPerson')
GO
INSERT [dbo].[BusinessRules] ([BusinessRuleKey], [RuleName], [RuleDescription]) VALUES (5, N'logins', N'Logins must match hashes, so all logins should use the usp_login procedure')
GO
INSERT [dbo].[BusinessRules] ([BusinessRuleKey], [RuleName], [RuleDescription]) VALUES (6, N'Logging user Logins', N'All logins are logged in the BakeryLog table. Automatic with usp_login procedure"')
GO
INSERT [dbo].[BusinessRules] ([BusinessRuleKey], [RuleName], [RuleDescription]) VALUES (7, N'Unique emails', N'Because emails are the username, all emails must be unique')
GO
SET IDENTITY_INSERT [dbo].[BusinessRules] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 
GO
INSERT [dbo].[Employee] ([EmployeeKey], [PersonKey], [EmployeeTitle], [EmployeeStatus]) VALUES (1, 2, N'Barista', N'Full time ')
GO
INSERT [dbo].[Employee] ([EmployeeKey], [PersonKey], [EmployeeTitle], [EmployeeStatus]) VALUES (2, 5, N'Barista', N'Part time ')
GO
INSERT [dbo].[Employee] ([EmployeeKey], [PersonKey], [EmployeeTitle], [EmployeeStatus]) VALUES (3, 6, N'Dishwasher', N'Part time ')
GO
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Person] ON 
GO
INSERT [dbo].[Person] ([PersonKey], [PersonLastName], [PersonFirstName], [PersonEmail], [PersonPhone], [PersonDateAdded], [PersonPassword], [PersonIdentityCode]) VALUES (1, N'Smith', N'Jason', N'jsmith@gmail.com', N'2065551234 ', CAST(N'2017-11-25T20:02:21.457' AS DateTime), 0x4C888FE3642ADFF9FE421A6F34D6F01DA63DF39827934C82F9AC98485BA5CFD45970AF3C5A4F3FCF1CFC64DB1E2161294898F40068D414BDD71DE44CE3B2CC6E, N'1e0d0564-8f90-494c-b8ba-23dae08ee72f')
GO
INSERT [dbo].[Person] ([PersonKey], [PersonLastName], [PersonFirstName], [PersonEmail], [PersonPhone], [PersonDateAdded], [PersonPassword], [PersonIdentityCode]) VALUES (2, N'Larson', N'Meredith', N'ml@gmail.com', N'2065551235 ', CAST(N'2017-11-25T20:02:21.457' AS DateTime), 0x2ECF3146E6DAC297F7AD999C8F6B347D9650E3592D43C16FAA9986DB5D11D834B6F675C9AF5F56578A3C1A3184030F474EC4844874710FD144B1F1AABF0FB4D3, N'6368e6a6-ca35-49f2-8d02-6d5c97ec4ebe')
GO
INSERT [dbo].[Person] ([PersonKey], [PersonLastName], [PersonFirstName], [PersonEmail], [PersonPhone], [PersonDateAdded], [PersonPassword], [PersonIdentityCode]) VALUES (3, N'Natt', N'Morgan', N'natt@gmail.com', N'2065551236 ', CAST(N'2017-11-25T20:02:21.457' AS DateTime), 0x43CE367F19904C3B013CD964A903118A379D144F6E9CD86B3DA2A9FBF1AD1F265AFED86B315DB239E275D77BC0DDF8110F5127BE4AB366D0D317EDED914F1D5B, N'03b2f60c-5576-4687-b8c1-aa9b94fbacff')
GO
INSERT [dbo].[Person] ([PersonKey], [PersonLastName], [PersonFirstName], [PersonEmail], [PersonPhone], [PersonDateAdded], [PersonPassword], [PersonIdentityCode]) VALUES (4, N'Taylor', N'Robert', N'rtaylor@gmail.com', N'2065551237 ', CAST(N'2017-11-25T20:02:21.457' AS DateTime), 0x919F656F9A22BF4C193465D565223D3DE9A5DD73760252C5F7F1877175D1AA5573AB5DD1A0FA218E4DD8D07394A30344966B3000A9FF6993E9F030AC8A22B44F, N'dd2e8758-c915-4d3f-92cd-909e39f4dd3c')
GO
INSERT [dbo].[Person] ([PersonKey], [PersonLastName], [PersonFirstName], [PersonEmail], [PersonPhone], [PersonDateAdded], [PersonPassword], [PersonIdentityCode]) VALUES (5, N'Jones', N'Tabitha', N'tabathaj@gmail.com', N'2065551238 ', CAST(N'2017-11-25T20:02:21.457' AS DateTime), 0xEE77A72C0752623C4CB94CE354C71B1F154C263E59ABA79CAB9275391FE5E76DCD0137BCB2AB1A61AB3F43F8D6F039407A43681B0F343606329EBAEF6D738F17, N'7dc438bf-ee6c-4ca0-9437-2f0c439c0e2e')
GO
INSERT [dbo].[Person] ([PersonKey], [PersonLastName], [PersonFirstName], [PersonEmail], [PersonPhone], [PersonDateAdded], [PersonPassword], [PersonIdentityCode]) VALUES (6, N'Lewis', N'Mark', N'lewis@gmail.com', NULL, CAST(N'2017-11-25T20:02:21.457' AS DateTime), 0x1C5802DA954F8E6BA4647C395BB22BBF2FA7E8231FB8ADC331C628936B7C7AE41B84AC589C42C8F058DA251489BACFAB2F9F8734FED07293B1ED3259F0AF5FCA, N'3f1f5ee7-1e4f-49ac-98fb-54da2b1a82e2')
GO
INSERT [dbo].[Person] ([PersonKey], [PersonLastName], [PersonFirstName], [PersonEmail], [PersonPhone], [PersonDateAdded], [PersonPassword], [PersonIdentityCode]) VALUES (7, N'Stevenson', N'Fred', N'fs@gmail.com', N'2065551239 ', CAST(N'2017-11-25T20:02:21.457' AS DateTime), 0xE022A7A87F5DCB750DA6E7285668644476DB851B8AB6B1A5FBE6A33E53BA0E1E820AC58BDC55D11860DE5615D362195193522357AFD010951CB1E37B5FC406A5, N'4820c9c2-dd97-431f-ab83-daf48a31e6d2')
GO
INSERT [dbo].[Person] ([PersonKey], [PersonLastName], [PersonFirstName], [PersonEmail], [PersonPhone], [PersonDateAdded], [PersonPassword], [PersonIdentityCode]) VALUES (8, N'Anderson', N'Beth', N'Beth.Anderson@yahoo,com', N'2065551240 ', CAST(N'2017-11-25T20:02:21.457' AS DateTime), 0x4DBE010152B76C9B72DC9D12E598FC6A6233B7BCADFC090F6DDEDA201A05D05BF056018E5AE1C0D6C29F87D686CBD3E1F454A063FF7A3C38863C41F6572E5920, N'8cd99e6e-2e87-453e-b9ce-cce613de6ac0')
GO
INSERT [dbo].[Person] ([PersonKey], [PersonLastName], [PersonFirstName], [PersonEmail], [PersonPhone], [PersonDateAdded], [PersonPassword], [PersonIdentityCode]) VALUES (9, N'Carlson', N'Sue', N'jsCarlson@gmail.com', N'2065551241 ', CAST(N'2017-11-25T20:02:21.457' AS DateTime), 0xD2A9F44F0C122BA482B22270F061A4E2D90DDC61097ADFCB9515B4897BA070B90E7FC2FA678CBB90FED4EE2458FD315533D37EA0C39BDF48B86231C18BD99A17, N'bcf3503d-60d2-4d26-80d3-b9d4b4ecf2e7')
GO
INSERT [dbo].[Person] ([PersonKey], [PersonLastName], [PersonFirstName], [PersonEmail], [PersonPhone], [PersonDateAdded], [PersonPassword], [PersonIdentityCode]) VALUES (10, N'Daniels', N'Zak', N'zDaniels@gmail.com', N'20655512342', CAST(N'2017-11-25T20:02:21.457' AS DateTime), 0x2D639BE3881FFCB789DC736CBB185A174AC122AC6A050512A7A574D0FCD9DD10646661A161FADC59E3B6E895272B27D6D58F39DAE2509BA0DC215962A58CB289, N'05694c00-8602-451d-86c1-a5a798157a03')
GO
INSERT [dbo].[Person] ([PersonKey], [PersonLastName], [PersonFirstName], [PersonEmail], [PersonPhone], [PersonDateAdded], [PersonPassword], [PersonIdentityCode]) VALUES (11, N'Sanders', N'Mary', N'Mary.Sanders@msn.com', N'2065551390 ', CAST(N'2017-12-20T11:43:02.453' AS DateTime), 0x3E9BED8EAF12654218AC48E227F10FF4A39F96D94B0D543AFF931FF6A772A16DC7AD5369246FAD748D41FC263633B8875D6117CBD8850AAC967F36B9CA5128A4, N'76e28051-67a7-445c-9ac4-ec8d4dd03d01')
GO
INSERT [dbo].[Person] ([PersonKey], [PersonLastName], [PersonFirstName], [PersonEmail], [PersonPhone], [PersonDateAdded], [PersonPassword], [PersonIdentityCode]) VALUES (12, N'Lawrence', N'Leah', N'LLawrence@msn.com', N'2065551390 ', CAST(N'2018-03-18T13:06:08.940' AS DateTime), 0x9FEA97ACB8FB1AFA4329FAF9FB590D03E2690C0D8AE4D51CC280A19BF59B30241C3D94D823039D91D4694336C49F3D6361D027850754BFC11FA63B25ADEB904C, N'298ce40c-0eea-46a5-804a-56046f7a6d9c')
GO
SET IDENTITY_INSERT [dbo].[Person] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 
GO
INSERT [dbo].[Product] ([ProductKey], [ProductName], [ProductPrice]) VALUES (1, N'Glazed Donut', 1.0000)
GO
INSERT [dbo].[Product] ([ProductKey], [ProductName], [ProductPrice]) VALUES (2, N'Maple Bar', 1.2500)
GO
INSERT [dbo].[Product] ([ProductKey], [ProductName], [ProductPrice]) VALUES (3, N'Cinnamon Roll', 2.2500)
GO
INSERT [dbo].[Product] ([ProductKey], [ProductName], [ProductPrice]) VALUES (4, N'Brownie', 2.2500)
GO
INSERT [dbo].[Product] ([ProductKey], [ProductName], [ProductPrice]) VALUES (5, N'Danish', 3.1500)
GO
INSERT [dbo].[Product] ([ProductKey], [ProductName], [ProductPrice]) VALUES (6, N'Drip coffee', 1.2500)
GO
INSERT [dbo].[Product] ([ProductKey], [ProductName], [ProductPrice]) VALUES (7, N'Americano', 2.0000)
GO
INSERT [dbo].[Product] ([ProductKey], [ProductName], [ProductPrice]) VALUES (8, N'Latte', 3.0000)
GO
INSERT [dbo].[Product] ([ProductKey], [ProductName], [ProductPrice]) VALUES (9, N'Slice of pie', 4.2500)
GO
INSERT [dbo].[Product] ([ProductKey], [ProductName], [ProductPrice]) VALUES (10, N'Deli Sandwhich', 6.7500)
GO
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Sale] ON 
GO
INSERT [dbo].[Sale] ([SaleKey], [SaleDate], [CustomerKey], [EmployeeKey]) VALUES (1, CAST(N'2017-11-25T20:02:21.557' AS DateTime), 1, 1)
GO
INSERT [dbo].[Sale] ([SaleKey], [SaleDate], [CustomerKey], [EmployeeKey]) VALUES (2, CAST(N'2017-11-25T20:02:21.557' AS DateTime), 4, 1)
GO
INSERT [dbo].[Sale] ([SaleKey], [SaleDate], [CustomerKey], [EmployeeKey]) VALUES (3, CAST(N'2017-11-25T20:02:21.557' AS DateTime), 7, 2)
GO
SET IDENTITY_INSERT [dbo].[Sale] OFF
GO
SET IDENTITY_INSERT [dbo].[SaleDetail] ON 
GO
INSERT [dbo].[SaleDetail] ([SaleDetailKey], [SaleKey], [ProductKey], [SaleDetailPriceCharged], [SaleDetailQuantity], [SaleDetailDiscount], [SaleDetailSaleTaxPercent], [SaleDetailEatInTax]) VALUES (1, 1, 2, 1.2500, 3, CAST(0.00 AS Decimal(10, 2)), CAST(0.09 AS Decimal(10, 2)), CAST(0.02 AS Decimal(10, 2)))
GO
INSERT [dbo].[SaleDetail] ([SaleDetailKey], [SaleKey], [ProductKey], [SaleDetailPriceCharged], [SaleDetailQuantity], [SaleDetailDiscount], [SaleDetailSaleTaxPercent], [SaleDetailEatInTax]) VALUES (2, 1, 6, 1.2500, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.09 AS Decimal(10, 2)), CAST(0.02 AS Decimal(10, 2)))
GO
INSERT [dbo].[SaleDetail] ([SaleDetailKey], [SaleKey], [ProductKey], [SaleDetailPriceCharged], [SaleDetailQuantity], [SaleDetailDiscount], [SaleDetailSaleTaxPercent], [SaleDetailEatInTax]) VALUES (3, 2, 5, 3.1500, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.09 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[SaleDetail] ([SaleDetailKey], [SaleKey], [ProductKey], [SaleDetailPriceCharged], [SaleDetailQuantity], [SaleDetailDiscount], [SaleDetailSaleTaxPercent], [SaleDetailEatInTax]) VALUES (4, 2, 8, 3.0000, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.09 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[SaleDetail] ([SaleDetailKey], [SaleKey], [ProductKey], [SaleDetailPriceCharged], [SaleDetailQuantity], [SaleDetailDiscount], [SaleDetailSaleTaxPercent], [SaleDetailEatInTax]) VALUES (5, 3, 1, 1.0000, 12, CAST(5.00 AS Decimal(10, 2)), CAST(0.09 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[SaleDetail] ([SaleDetailKey], [SaleKey], [ProductKey], [SaleDetailPriceCharged], [SaleDetailQuantity], [SaleDetailDiscount], [SaleDetailSaleTaxPercent], [SaleDetailEatInTax]) VALUES (6, 3, 8, 1.2500, 2, CAST(0.00 AS Decimal(10, 2)), CAST(0.09 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[SaleDetail] ([SaleDetailKey], [SaleKey], [ProductKey], [SaleDetailPriceCharged], [SaleDetailQuantity], [SaleDetailDiscount], [SaleDetailSaleTaxPercent], [SaleDetailEatInTax]) VALUES (7, 3, 7, 2.0000, 1, CAST(0.00 AS Decimal(10, 2)), CAST(0.09 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)))
GO
SET IDENTITY_INSERT [dbo].[SaleDetail] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Unique_Email]    Script Date: 3/18/2018 1:26:54 PM ******/
ALTER TABLE [dbo].[Person] ADD  CONSTRAINT [Unique_Email] UNIQUE NONCLUSTERED 
(
	[PersonEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BakeryLog] ADD  DEFAULT (getdate()) FOR [BakeryLogTimeStamp]
GO
ALTER TABLE [dbo].[Person] ADD  DEFAULT (getdate()) FOR [PersonDateAdded]
GO
ALTER TABLE [dbo].[Sale] ADD  DEFAULT (getdate()) FOR [SaleDate]
GO
ALTER TABLE [dbo].[SaleDetail] ADD  DEFAULT ((0)) FOR [SaleDetailDiscount]
GO
ALTER TABLE [dbo].[BakeryLog]  WITH CHECK ADD FOREIGN KEY([PersonKey])
REFERENCES [dbo].[Person] ([PersonKey])
GO

ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([PersonKey])
REFERENCES [dbo].[Person] ([PersonKey])
GO


ALTER TABLE [dbo].[Sale]  WITH CHECK ADD FOREIGN KEY([CustomerKey])
REFERENCES [dbo].[Person] ([PersonKey])
GO


ALTER TABLE [dbo].[Sale]  WITH CHECK ADD FOREIGN KEY([EmployeeKey])
REFERENCES [dbo].[Employee] ([EmployeeKey])
GO


ALTER TABLE [dbo].[SaleDetail]  WITH CHECK ADD FOREIGN KEY([ProductKey])
REFERENCES [dbo].[Product] ([ProductKey])

GO
ALTER TABLE [dbo].[SaleDetail]  WITH CHECK ADD FOREIGN KEY([SaleKey])
REFERENCES [dbo].[Sale] ([SaleKey])
GO


/****** Object:  StoredProcedure [dbo].[usp_Login]    Script Date: 3/18/2018 1:26:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[usp_Login]
@useremail nvarchar(255), 
@password nvarchar(50)
As
Declare @ident uniqueIdentifier
Declare @pass varbinary(500)
Declare @Compare varbinary(500)
Select @Ident =PersonIdentityCode from Person
Where PersonEmail=@userEmail
Select @Pass=PersonPassword from Person
Where PersonEmail=@userEmail
Set @compare=dbo.fx_CreatePassword(@ident,@password)
If @pass=@compare 
Begin
print 'logged in'
Declare @personKey int
Select @PersonKey=personkey from Person
where PersonEmail =@useremail
Insert into BakeryLog(PersonKey) Values(@PersonKey)
return 1
end
Else 
print 'invalid login'
begin
return -1
end
GO
/****** Object:  StoredProcedure [dbo].[usp_newPerson]    Script Date: 3/18/2018 1:26:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[usp_newPerson]
@lastName nvarchar(255),
@FirstName nvarchar(255),
@email nvarchar(255),
@phone nchar(11)=null,
@Password nvarchar(50)
As
if not exists
(Select PersonKey from Person
  where PersonEmail=@Email)
Begin
Begin try
Begin tran
Declare @ident uniqueIdentifier
Declare @HashPass varbinary(500)
Set @Ident = newID()
Set @HashPass=dbo.fx_CreatePassword(@ident,@password)
Insert into person(
[PersonLastName], 
[PersonFirstName], 
[PersonEmail], 
[PersonPhone], 
[PersonDateAdded], 
[PersonPassword], 
[PersonIdentityCode]
)
Values(
@LastName,
@firstName,
@email,
@Phone,
GetDate(),
@HashPass,
@ident
)
Commit Tran
End try
Begin Catch
Rollback tran
end Catch
End
GO
USE [master]
GO
ALTER DATABASE [Bakery] SET  READ_WRITE 
GO
