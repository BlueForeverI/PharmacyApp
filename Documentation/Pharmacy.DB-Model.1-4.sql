USE [master]
GO
/****** Object:  Database [PharmacyDB]    Script Date: 1.3.2016 ã. 22:32:33 ÷. ******/
CREATE DATABASE [PharmacyDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PharmacyDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\PharmacyDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PharmacyDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\PharmacyDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PharmacyDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PharmacyDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PharmacyDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PharmacyDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PharmacyDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PharmacyDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PharmacyDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [PharmacyDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PharmacyDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [PharmacyDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PharmacyDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PharmacyDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PharmacyDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PharmacyDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PharmacyDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PharmacyDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PharmacyDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PharmacyDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PharmacyDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PharmacyDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PharmacyDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PharmacyDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PharmacyDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PharmacyDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PharmacyDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PharmacyDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PharmacyDB] SET  MULTI_USER 
GO
ALTER DATABASE [PharmacyDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PharmacyDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PharmacyDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PharmacyDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [PharmacyDB]
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 1.3.2016 ã. 22:32:33 ÷. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CityId] [int] NOT NULL,
	[Address] [nvarchar](250) NOT NULL,
	[Notes] [nvarchar](250) NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Allergies]    Script Date: 1.3.2016 ã. 22:32:33 ÷. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Allergies](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_Allergies] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Allergies_Clients]    Script Date: 1.3.2016 ã. 22:32:33 ÷. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Allergies_Clients](
	[AllergyId] [int] NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_Allergies_Clients] PRIMARY KEY CLUSTERED 
(
	[AllergyId] ASC,
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Attachments]    Script Date: 1.3.2016 ã. 22:32:33 ÷. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attachments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FileName] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Attachments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CashCollections]    Script Date: 1.3.2016 ã. 22:32:33 ÷. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CashCollections](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Value] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[SaleDeskId] [int] NOT NULL,
 CONSTRAINT [PK_CashCollections] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Clients]    Script Date: 1.3.2016 ã. 22:32:33 ÷. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[MiddleName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[ParentFirstName] [nvarchar](50) NOT NULL,
	[ParentLastName] [nvarchar](50) NOT NULL,
	[IDCardAddressId] [int] NOT NULL,
	[ShipmentAddress1Id] [int] NOT NULL,
	[ShipmentAddress2Id] [int] NULL,
	[ShipmentAddress3Id] [int] NULL,
	[PhoneNumber1Id] [int] NOT NULL,
	[PhoneNumber2Id] [int] NULL,
	[PhoneNumber3Id] [int] NULL,
	[Height] [float] NOT NULL,
	[Weight] [float] NOT NULL,
	[Age] [int] NOT NULL,
	[BirthYear] [int] NOT NULL,
	[BirthDate] [date] NOT NULL,
	[PersonalID] [nchar](10) NOT NULL,
	[Notes] [nvarchar](250) NULL,
	[StatusId] [int] NOT NULL,
 CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Couriers]    Script Date: 1.3.2016 ã. 22:32:33 ÷. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Couriers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Couriers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Diagnoses]    Script Date: 1.3.2016 ã. 22:32:33 ÷. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Diagnoses](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_Diagnoses] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Diagnoses_Clients]    Script Date: 1.3.2016 ã. 22:32:33 ÷. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Diagnoses_Clients](
	[DiagnoseId] [int] NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_Diagnoses_Clients] PRIMARY KEY CLUSTERED 
(
	[DiagnoseId] ASC,
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Medicines]    Script Date: 1.3.2016 ã. 22:32:33 ÷. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicines](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Medicines] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Medicines_Clients]    Script Date: 1.3.2016 ã. 22:32:33 ÷. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicines_Clients](
	[MedicineId] [int] NOT NULL,
	[ClientId] [int] NOT NULL,
 CONSTRAINT [PK_Medicines_Clients] PRIMARY KEY CLUSTERED 
(
	[MedicineId] ASC,
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 1.3.2016 ã. 22:32:33 ÷. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NOT NULL,
	[DueDate] [date] NOT NULL,
	[Notes] [nvarchar](250) NULL,
	[AttachmentId] [int] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderTrackingEntries]    Script Date: 1.3.2016 ã. 22:32:33 ÷. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderTrackingEntries](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[Description] [nvarchar](250) NOT NULL,
	[UserId] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
 CONSTRAINT [PK_OrderTrackingEntries] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhoneNumbers]    Script Date: 1.3.2016 ã. 22:32:33 ÷. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhoneNumbers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PhoneNumber] [nvarchar](20) NOT NULL,
	[Notes] [nvarchar](150) NULL,
 CONSTRAINT [PK_PhoneNumbers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SalesDesks]    Script Date: 1.3.2016 ã. 22:32:33 ÷. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesDesks](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_SalesDesks] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SalesOperations]    Script Date: 1.3.2016 ã. 22:32:33 ÷. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesOperations](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[Income] [money] NOT NULL,
	[Expense] [money] NOT NULL,
	[Revenue] [money] NOT NULL,
	[Description] [nvarchar](250) NOT NULL,
	[UserId] [int] NOT NULL,
	[SalesDeskId] [int] NOT NULL,
 CONSTRAINT [PK_SalesOperations] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Shipments]    Script Date: 1.3.2016 ã. 22:32:33 ÷. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ReferenceNumber] [nvarchar](20) NOT NULL,
	[ShippedDate] [datetime] NOT NULL,
	[Insurance] [nvarchar](50) NOT NULL,
	[CashOnDelivery] [bit] NOT NULL,
	[PreferredDeliveryDateTime] [datetime] NOT NULL,
	[CourierId] [int] NOT NULL,
	[ShipperNumber] [nvarchar](20) NOT NULL,
	[Description] [nvarchar](250) NULL,
	[PaidDate] [date] NULL,
	[ExpenseReference] [nvarchar](20) NULL,
	[UserReceivedPaymentId] [int] NULL,
	[IsPaid] [bit] NOT NULL,
	[IsReturned] [bit] NOT NULL,
	[ReturnReason] [nvarchar](150) NULL,
	[ReturnExpense] [money] NULL,
	[ReturnPaidByClient] [bit] NULL,
	[Notes] [nvarchar](250) NULL,
 CONSTRAINT [PK_Shipments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Statuses]    Script Date: 1.3.2016 ã. 22:32:33 ÷. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Statuses](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Statuses] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 1.3.2016 ã. 22:32:33 ÷. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[MiddleName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Allergies_Clients]  WITH CHECK ADD  CONSTRAINT [FK_Allergies_Clients_Allergies] FOREIGN KEY([AllergyId])
REFERENCES [dbo].[Allergies] ([ID])
GO
ALTER TABLE [dbo].[Allergies_Clients] CHECK CONSTRAINT [FK_Allergies_Clients_Allergies]
GO
ALTER TABLE [dbo].[Allergies_Clients]  WITH CHECK ADD  CONSTRAINT [FK_Allergies_Clients_Clients] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([ID])
GO
ALTER TABLE [dbo].[Allergies_Clients] CHECK CONSTRAINT [FK_Allergies_Clients_Clients]
GO
ALTER TABLE [dbo].[CashCollections]  WITH CHECK ADD  CONSTRAINT [FK_CashCollections_SalesDesks] FOREIGN KEY([SaleDeskId])
REFERENCES [dbo].[SalesDesks] ([ID])
GO
ALTER TABLE [dbo].[CashCollections] CHECK CONSTRAINT [FK_CashCollections_SalesDesks]
GO
ALTER TABLE [dbo].[Clients]  WITH CHECK ADD  CONSTRAINT [FK_Clients_IDCardAddressId_Addresses] FOREIGN KEY([IDCardAddressId])
REFERENCES [dbo].[Addresses] ([ID])
GO
ALTER TABLE [dbo].[Clients] CHECK CONSTRAINT [FK_Clients_IDCardAddressId_Addresses]
GO
ALTER TABLE [dbo].[Clients]  WITH CHECK ADD  CONSTRAINT [FK_Clients_PhoneNumber1Id_PhoneNumbers] FOREIGN KEY([PhoneNumber1Id])
REFERENCES [dbo].[PhoneNumbers] ([ID])
GO
ALTER TABLE [dbo].[Clients] CHECK CONSTRAINT [FK_Clients_PhoneNumber1Id_PhoneNumbers]
GO
ALTER TABLE [dbo].[Clients]  WITH CHECK ADD  CONSTRAINT [FK_Clients_PhoneNumber2Id_PhoneNumbers] FOREIGN KEY([PhoneNumber2Id])
REFERENCES [dbo].[PhoneNumbers] ([ID])
GO
ALTER TABLE [dbo].[Clients] CHECK CONSTRAINT [FK_Clients_PhoneNumber2Id_PhoneNumbers]
GO
ALTER TABLE [dbo].[Clients]  WITH CHECK ADD  CONSTRAINT [FK_Clients_PhoneNumber3Id_PhoneNumbers] FOREIGN KEY([PhoneNumber3Id])
REFERENCES [dbo].[PhoneNumbers] ([ID])
GO
ALTER TABLE [dbo].[Clients] CHECK CONSTRAINT [FK_Clients_PhoneNumber3Id_PhoneNumbers]
GO
ALTER TABLE [dbo].[Clients]  WITH CHECK ADD  CONSTRAINT [FK_Clients_ShipmentAddress1Id_Addresses] FOREIGN KEY([ShipmentAddress1Id])
REFERENCES [dbo].[Addresses] ([ID])
GO
ALTER TABLE [dbo].[Clients] CHECK CONSTRAINT [FK_Clients_ShipmentAddress1Id_Addresses]
GO
ALTER TABLE [dbo].[Clients]  WITH CHECK ADD  CONSTRAINT [FK_Clients_ShipmentAddress2Id_Addresses] FOREIGN KEY([ShipmentAddress2Id])
REFERENCES [dbo].[Addresses] ([ID])
GO
ALTER TABLE [dbo].[Clients] CHECK CONSTRAINT [FK_Clients_ShipmentAddress2Id_Addresses]
GO
ALTER TABLE [dbo].[Clients]  WITH CHECK ADD  CONSTRAINT [FK_Clients_ShipmentAddress3Id_Addresses] FOREIGN KEY([ShipmentAddress3Id])
REFERENCES [dbo].[Addresses] ([ID])
GO
ALTER TABLE [dbo].[Clients] CHECK CONSTRAINT [FK_Clients_ShipmentAddress3Id_Addresses]
GO
ALTER TABLE [dbo].[Clients]  WITH CHECK ADD  CONSTRAINT [FK_Clients_Statuses] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Statuses] ([ID])
GO
ALTER TABLE [dbo].[Clients] CHECK CONSTRAINT [FK_Clients_Statuses]
GO
ALTER TABLE [dbo].[Diagnoses_Clients]  WITH CHECK ADD  CONSTRAINT [FK_Diagnoses_Clients_Clients] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([ID])
GO
ALTER TABLE [dbo].[Diagnoses_Clients] CHECK CONSTRAINT [FK_Diagnoses_Clients_Clients]
GO
ALTER TABLE [dbo].[Diagnoses_Clients]  WITH CHECK ADD  CONSTRAINT [FK_Diagnoses_Clients_Diagnoses] FOREIGN KEY([DiagnoseId])
REFERENCES [dbo].[Diagnoses] ([ID])
GO
ALTER TABLE [dbo].[Diagnoses_Clients] CHECK CONSTRAINT [FK_Diagnoses_Clients_Diagnoses]
GO
ALTER TABLE [dbo].[Medicines_Clients]  WITH CHECK ADD  CONSTRAINT [FK_Medicines_Clients_Clients] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([ID])
GO
ALTER TABLE [dbo].[Medicines_Clients] CHECK CONSTRAINT [FK_Medicines_Clients_Clients]
GO
ALTER TABLE [dbo].[Medicines_Clients]  WITH CHECK ADD  CONSTRAINT [FK_Medicines_Clients_Medicines] FOREIGN KEY([MedicineId])
REFERENCES [dbo].[Medicines] ([ID])
GO
ALTER TABLE [dbo].[Medicines_Clients] CHECK CONSTRAINT [FK_Medicines_Clients_Medicines]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Attachments] FOREIGN KEY([AttachmentId])
REFERENCES [dbo].[Attachments] ([ID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Attachments]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Clients] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([ID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Clients]
GO
ALTER TABLE [dbo].[OrderTrackingEntries]  WITH CHECK ADD  CONSTRAINT [FK_OrderTrackingEntries_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([ID])
GO
ALTER TABLE [dbo].[OrderTrackingEntries] CHECK CONSTRAINT [FK_OrderTrackingEntries_Orders]
GO
ALTER TABLE [dbo].[OrderTrackingEntries]  WITH CHECK ADD  CONSTRAINT [FK_OrderTrackingEntries_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[OrderTrackingEntries] CHECK CONSTRAINT [FK_OrderTrackingEntries_Users]
GO
ALTER TABLE [dbo].[SalesOperations]  WITH CHECK ADD  CONSTRAINT [FK_SalesOperations_SalesDesks] FOREIGN KEY([SalesDeskId])
REFERENCES [dbo].[SalesDesks] ([ID])
GO
ALTER TABLE [dbo].[SalesOperations] CHECK CONSTRAINT [FK_SalesOperations_SalesDesks]
GO
ALTER TABLE [dbo].[SalesOperations]  WITH CHECK ADD  CONSTRAINT [FK_SalesOperations_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[SalesOperations] CHECK CONSTRAINT [FK_SalesOperations_Users]
GO
ALTER TABLE [dbo].[Shipments]  WITH CHECK ADD  CONSTRAINT [FK_Shipments_Couriers] FOREIGN KEY([CourierId])
REFERENCES [dbo].[Couriers] ([ID])
GO
ALTER TABLE [dbo].[Shipments] CHECK CONSTRAINT [FK_Shipments_Couriers]
GO
ALTER TABLE [dbo].[Shipments]  WITH CHECK ADD  CONSTRAINT [FK_Shipments_Users] FOREIGN KEY([UserReceivedPaymentId])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Shipments] CHECK CONSTRAINT [FK_Shipments_Users]
GO
USE [master]
GO
ALTER DATABASE [PharmacyDB] SET  READ_WRITE 
GO
