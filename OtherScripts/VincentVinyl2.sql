USE [master]
GO
/****** Object:  Database [VincentVinyl]    Script Date: 1/28/2019 2:03:52 PM ******/
CREATE DATABASE [VincentVinyl]
 
GO
USE [VincentVinyl]
GO
/****** Object:  Table [dbo].[Album]    Script Date: 1/28/2019 2:03:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Album](
	[AlbumID] [int] IDENTITY(1,1) NOT NULL,
	[AlbumTitle] [nvarchar](255) NOT NULL,
	[AlbumYear] [int] NULL,
	[AlbumStudion] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[AlbumID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Artist]    Script Date: 1/28/2019 2:03:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Artist](
	[ArtistID] [int] IDENTITY(1,1) NOT NULL,
	[ArtistName] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ArtistID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArtistAlbum]    Script Date: 1/28/2019 2:03:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArtistAlbum](
	[ArtistID] [int] NOT NULL,
	[AlbumID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ArtistID] ASC,
	[AlbumID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Condition]    Script Date: 1/28/2019 2:03:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Condition](
	[ConditionID] [int] IDENTITY(1,1) NOT NULL,
	[ConditionName] [nvarchar](255) NOT NULL,
	[ConditionDescription] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ConditionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 1/28/2019 2:03:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[PersonID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 1/28/2019 2:03:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory](
	[InventoryID] [int] IDENTITY(1,1) NOT NULL,
	[PurchaseDetailID] [int] NULL,
	[ConditionID] [int] NULL,
	[InventorySalePrice] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[InventoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 1/28/2019 2:03:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[PersonID] [int] IDENTITY(1,1) NOT NULL,
	[PersonLastName] [nvarchar](255) NOT NULL,
	[PersonFirstName] [nvarchar](255) NULL,
	[PersonEmail] [nvarchar](255) NULL,
	[PersonAddDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Purchase]    Script Date: 1/28/2019 2:03:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchase](
	[PurchaseID] [int] IDENTITY(1,1) NOT NULL,
	[PurchaseDate] [date] NULL,
	[PersonID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PurchaseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseDetail]    Script Date: 1/28/2019 2:03:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseDetail](
	[PurchaseDetailID] [int] IDENTITY(1,1) NOT NULL,
	[purchaseID] [int] NULL,
	[AlbumID] [int] NULL,
	[PurchasePrice] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[PurchaseDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Request]    Script Date: 1/28/2019 2:03:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request](
	[RequestID] [int] IDENTITY(1,1) NOT NULL,
	[RequestDate] [datetime] NULL,
	[PersonID] [int] NULL,
	[EmployeeID] [int] NULL,
	[AlbumID] [int] NULL,
	[RequestNotes] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[RequestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sale]    Script Date: 1/28/2019 2:03:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sale](
	[SaleID] [int] IDENTITY(1,1) NOT NULL,
	[SaleDate] [datetime] NULL,
	[PersonID] [int] NULL,
	[EmployeeID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SaleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SaleDetail]    Script Date: 1/28/2019 2:03:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SaleDetail](
	[SaleDetailID] [int] IDENTITY(1,1) NOT NULL,
	[SaleID] [int] NULL,
	[InventoryID] [int] NULL,
	[SaleDetailDiscount] [decimal](5, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[SaleDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Album] ON 
GO
INSERT [dbo].[Album] ([AlbumID], [AlbumTitle], [AlbumYear], [AlbumStudion]) VALUES (1, N'Blonde on Blonde', 1967, N'Columbia')
GO
INSERT [dbo].[Album] ([AlbumID], [AlbumTitle], [AlbumYear], [AlbumStudion]) VALUES (2, N'Abby Road', 1969, N'Apple')
GO
INSERT [dbo].[Album] ([AlbumID], [AlbumTitle], [AlbumYear], [AlbumStudion]) VALUES (3, N'Nevermind', 1967, N'Columbia')
GO
INSERT [dbo].[Album] ([AlbumID], [AlbumTitle], [AlbumYear], [AlbumStudion]) VALUES (4, N'Pure Heroine', 2016, N'Atlantic')
GO
INSERT [dbo].[Album] ([AlbumID], [AlbumTitle], [AlbumYear], [AlbumStudion]) VALUES (5, N'Sticky Fingers', 1972, N'Columbia')
GO
SET IDENTITY_INSERT [dbo].[Album] OFF
GO
SET IDENTITY_INSERT [dbo].[Artist] ON 
GO
INSERT [dbo].[Artist] ([ArtistID], [ArtistName]) VALUES (1, N'Bob Dylan')
GO
INSERT [dbo].[Artist] ([ArtistID], [ArtistName]) VALUES (2, N'The Beatles')
GO
INSERT [dbo].[Artist] ([ArtistID], [ArtistName]) VALUES (3, N'Rolling Stones')
GO
INSERT [dbo].[Artist] ([ArtistID], [ArtistName]) VALUES (4, N'Nirvana')
GO
INSERT [dbo].[Artist] ([ArtistID], [ArtistName]) VALUES (5, N'Lorde')
GO
SET IDENTITY_INSERT [dbo].[Artist] OFF
GO
INSERT [dbo].[ArtistAlbum] ([ArtistID], [AlbumID]) VALUES (1, 1)
GO
INSERT [dbo].[ArtistAlbum] ([ArtistID], [AlbumID]) VALUES (2, 2)
GO
INSERT [dbo].[ArtistAlbum] ([ArtistID], [AlbumID]) VALUES (3, 5)
GO
INSERT [dbo].[ArtistAlbum] ([ArtistID], [AlbumID]) VALUES (4, 3)
GO
INSERT [dbo].[ArtistAlbum] ([ArtistID], [AlbumID]) VALUES (5, 4)
GO
SET IDENTITY_INSERT [dbo].[Condition] ON 
GO
INSERT [dbo].[Condition] ([ConditionID], [ConditionName], [ConditionDescription]) VALUES (1, N'mint', N'perfect never played')
GO
INSERT [dbo].[Condition] ([ConditionID], [ConditionName], [ConditionDescription]) VALUES (2, N'good', N'No scratches, no warp, played some')
GO
INSERT [dbo].[Condition] ([ConditionID], [ConditionName], [ConditionDescription]) VALUES (3, N'fair', N'played a lot, some minor scratches')
GO
INSERT [dbo].[Condition] ([ConditionID], [ConditionName], [ConditionDescription]) VALUES (4, N'poor', N'scratches, warped')
GO
SET IDENTITY_INSERT [dbo].[Condition] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 
GO
INSERT [dbo].[Employee] ([EmployeeID], [PersonID]) VALUES (1, 1)
GO
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Inventory] ON 
GO
INSERT [dbo].[Inventory] ([InventoryID], [PurchaseDetailID], [ConditionID], [InventorySalePrice]) VALUES (4, 1, 2, 8.5000)
GO
INSERT [dbo].[Inventory] ([InventoryID], [PurchaseDetailID], [ConditionID], [InventorySalePrice]) VALUES (5, 2, 2, 12.0000)
GO
INSERT [dbo].[Inventory] ([InventoryID], [PurchaseDetailID], [ConditionID], [InventorySalePrice]) VALUES (6, 3, 1, 21.0000)
GO
INSERT [dbo].[Inventory] ([InventoryID], [PurchaseDetailID], [ConditionID], [InventorySalePrice]) VALUES (7, 4, 2, 10.0000)
GO
INSERT [dbo].[Inventory] ([InventoryID], [PurchaseDetailID], [ConditionID], [InventorySalePrice]) VALUES (8, 5, 3, 5.0000)
GO
INSERT [dbo].[Inventory] ([InventoryID], [PurchaseDetailID], [ConditionID], [InventorySalePrice]) VALUES (9, 6, 2, 19.0000)
GO
INSERT [dbo].[Inventory] ([InventoryID], [PurchaseDetailID], [ConditionID], [InventorySalePrice]) VALUES (10, 7, 3, 8.0000)
GO
SET IDENTITY_INSERT [dbo].[Inventory] OFF
GO
SET IDENTITY_INSERT [dbo].[Person] ON 
GO
INSERT [dbo].[Person] ([PersonID], [PersonLastName], [PersonFirstName], [PersonEmail], [PersonAddDate]) VALUES (1, N'Smith', N'Jason', N'jasonsmith@gmail.com', CAST(N'2019-01-23' AS Date))
GO
INSERT [dbo].[Person] ([PersonID], [PersonLastName], [PersonFirstName], [PersonEmail], [PersonAddDate]) VALUES (2, N'Brown', N'Debra', N'debrabrownh@gmail.com', CAST(N'2019-01-12' AS Date))
GO
INSERT [dbo].[Person] ([PersonID], [PersonLastName], [PersonFirstName], [PersonEmail], [PersonAddDate]) VALUES (3, N'Johnson', N'Tina', N'tj@gmail.com', CAST(N'2019-01-25' AS Date))
GO
INSERT [dbo].[Person] ([PersonID], [PersonLastName], [PersonFirstName], [PersonEmail], [PersonAddDate]) VALUES (4, N'Martina', N'Joe', N'martinah@gmail.com', CAST(N'2019-01-25' AS Date))
GO
INSERT [dbo].[Person] ([PersonID], [PersonLastName], [PersonFirstName], [PersonEmail], [PersonAddDate]) VALUES (5, N'Thomas', N'Lynn', N'lthomas@gmail.com', CAST(N'2019-01-26' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Person] OFF
GO
SET IDENTITY_INSERT [dbo].[Purchase] ON 
GO
INSERT [dbo].[Purchase] ([PurchaseID], [PurchaseDate], [PersonID]) VALUES (1, CAST(N'2018-12-15' AS Date), 2)
GO
INSERT [dbo].[Purchase] ([PurchaseID], [PurchaseDate], [PersonID]) VALUES (2, CAST(N'2018-12-20' AS Date), 3)
GO
SET IDENTITY_INSERT [dbo].[Purchase] OFF
GO
SET IDENTITY_INSERT [dbo].[PurchaseDetail] ON 
GO
INSERT [dbo].[PurchaseDetail] ([PurchaseDetailID], [purchaseID], [AlbumID], [PurchasePrice]) VALUES (1, 1, 1, 5.3000)
GO
INSERT [dbo].[PurchaseDetail] ([PurchaseDetailID], [purchaseID], [AlbumID], [PurchasePrice]) VALUES (2, 1, 1, 6.0000)
GO
INSERT [dbo].[PurchaseDetail] ([PurchaseDetailID], [purchaseID], [AlbumID], [PurchasePrice]) VALUES (3, 1, 2, 13.0000)
GO
INSERT [dbo].[PurchaseDetail] ([PurchaseDetailID], [purchaseID], [AlbumID], [PurchasePrice]) VALUES (4, 2, 3, 5.0000)
GO
INSERT [dbo].[PurchaseDetail] ([PurchaseDetailID], [purchaseID], [AlbumID], [PurchasePrice]) VALUES (5, 2, 4, 3.0000)
GO
INSERT [dbo].[PurchaseDetail] ([PurchaseDetailID], [purchaseID], [AlbumID], [PurchasePrice]) VALUES (6, 2, 5, 10.0000)
GO
INSERT [dbo].[PurchaseDetail] ([PurchaseDetailID], [purchaseID], [AlbumID], [PurchasePrice]) VALUES (7, 2, 3, 4.0000)
GO
SET IDENTITY_INSERT [dbo].[PurchaseDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Request] ON 
GO
INSERT [dbo].[Request] ([RequestID], [RequestDate], [PersonID], [EmployeeID], [AlbumID], [RequestNotes]) VALUES (1, CAST(N'2019-01-28T14:03:02.010' AS DateTime), 3, 1, 1, N'Mint condition only')
GO
SET IDENTITY_INSERT [dbo].[Request] OFF
GO
SET IDENTITY_INSERT [dbo].[Sale] ON 
GO
INSERT [dbo].[Sale] ([SaleID], [SaleDate], [PersonID], [EmployeeID]) VALUES (2, CAST(N'2019-01-21T00:00:00.000' AS DateTime), 4, 1)
GO
INSERT [dbo].[Sale] ([SaleID], [SaleDate], [PersonID], [EmployeeID]) VALUES (3, CAST(N'2019-01-24T00:00:00.000' AS DateTime), 5, 1)
GO
SET IDENTITY_INSERT [dbo].[Sale] OFF
GO
SET IDENTITY_INSERT [dbo].[SaleDetail] ON 
GO
INSERT [dbo].[SaleDetail] ([SaleDetailID], [SaleID], [InventoryID], [SaleDetailDiscount]) VALUES (3, 2, 5, CAST(0.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[SaleDetail] ([SaleDetailID], [SaleID], [InventoryID], [SaleDetailDiscount]) VALUES (4, 2, 7, CAST(0.05 AS Decimal(5, 2)))
GO
INSERT [dbo].[SaleDetail] ([SaleDetailID], [SaleID], [InventoryID], [SaleDetailDiscount]) VALUES (5, 3, 6, CAST(0.00 AS Decimal(5, 2)))
GO
INSERT [dbo].[SaleDetail] ([SaleDetailID], [SaleID], [InventoryID], [SaleDetailDiscount]) VALUES (6, 3, 9, CAST(0.05 AS Decimal(5, 2)))
GO
SET IDENTITY_INSERT [dbo].[SaleDetail] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Person__BE4FABF9DB7E5A4B]    Script Date: 1/28/2019 2:03:53 PM ******/
ALTER TABLE [dbo].[Person] ADD UNIQUE NONCLUSTERED 
(
	[PersonEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Person] ADD  DEFAULT (getdate()) FOR [PersonAddDate]
GO
ALTER TABLE [dbo].[Purchase] ADD  DEFAULT (getdate()) FOR [PurchaseDate]
GO
ALTER TABLE [dbo].[Request] ADD  DEFAULT (getdate()) FOR [RequestDate]
GO
ALTER TABLE [dbo].[Sale] ADD  DEFAULT (getdate()) FOR [SaleDate]
GO
ALTER TABLE [dbo].[SaleDetail] ADD  DEFAULT ((0.0)) FOR [SaleDetailDiscount]
GO
ALTER TABLE [dbo].[ArtistAlbum]  WITH CHECK ADD FOREIGN KEY([AlbumID])
REFERENCES [dbo].[Album] ([AlbumID])
GO
ALTER TABLE [dbo].[ArtistAlbum]  WITH CHECK ADD FOREIGN KEY([ArtistID])
REFERENCES [dbo].[Artist] ([ArtistID])
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([PersonID])
REFERENCES [dbo].[Person] ([PersonID])
GO
ALTER TABLE [dbo].[Inventory]  WITH CHECK ADD FOREIGN KEY([ConditionID])
REFERENCES [dbo].[Condition] ([ConditionID])
GO
ALTER TABLE [dbo].[Inventory]  WITH CHECK ADD  CONSTRAINT [FK_Inventory_PurchaseDetail] FOREIGN KEY([PurchaseDetailID])
REFERENCES [dbo].[PurchaseDetail] ([PurchaseDetailID])
GO
ALTER TABLE [dbo].[Inventory] CHECK CONSTRAINT [FK_Inventory_PurchaseDetail]
GO
ALTER TABLE [dbo].[Purchase]  WITH CHECK ADD FOREIGN KEY([PersonID])
REFERENCES [dbo].[Person] ([PersonID])
GO
ALTER TABLE [dbo].[PurchaseDetail]  WITH CHECK ADD FOREIGN KEY([AlbumID])
REFERENCES [dbo].[Album] ([AlbumID])
GO
ALTER TABLE [dbo].[PurchaseDetail]  WITH CHECK ADD FOREIGN KEY([purchaseID])
REFERENCES [dbo].[Purchase] ([PurchaseID])
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD FOREIGN KEY([AlbumID])
REFERENCES [dbo].[Album] ([AlbumID])
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD FOREIGN KEY([PersonID])
REFERENCES [dbo].[Person] ([PersonID])
GO
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([EmployeeID])
GO
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD FOREIGN KEY([PersonID])
REFERENCES [dbo].[Person] ([PersonID])
GO
ALTER TABLE [dbo].[SaleDetail]  WITH CHECK ADD FOREIGN KEY([InventoryID])
REFERENCES [dbo].[Inventory] ([InventoryID])
GO
ALTER TABLE [dbo].[SaleDetail]  WITH CHECK ADD FOREIGN KEY([SaleID])
REFERENCES [dbo].[Sale] ([SaleID])
GO
USE [master]
GO
ALTER DATABASE [VincentVinyl] SET  READ_WRITE 
GO
