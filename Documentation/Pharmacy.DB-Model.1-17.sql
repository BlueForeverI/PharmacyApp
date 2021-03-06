USE [master]
GO
/****** Object:  Database [PharmacyDB]    Script Date: 13.3.2016 г. 13:22:21 ч. ******/
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
/****** Object:  Table [dbo].[Addresses]    Script Date: 13.3.2016 г. 13:22:21 ч. ******/
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
/****** Object:  Table [dbo].[Allergies]    Script Date: 13.3.2016 г. 13:22:21 ч. ******/
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
/****** Object:  Table [dbo].[Allergies_Clients]    Script Date: 13.3.2016 г. 13:22:21 ч. ******/
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
/****** Object:  Table [dbo].[Attachments]    Script Date: 13.3.2016 г. 13:22:21 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Attachments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FileName] [nvarchar](250) NOT NULL,
	[Data] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_Attachments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Barcode]    Script Date: 13.3.2016 г. 13:22:21 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Barcode](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BarcodeNumber] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Barcode] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CashCollections]    Script Date: 13.3.2016 г. 13:22:21 ч. ******/
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
/****** Object:  Table [dbo].[Clients]    Script Date: 13.3.2016 г. 13:22:21 ч. ******/
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
/****** Object:  Table [dbo].[Commodities]    Script Date: 13.3.2016 г. 13:22:21 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Commodities](
	[ID] [int] NOT NULL,
	[AttachmendId] [int] NOT NULL,
	[DocumentRefNo] [nvarchar](50) NOT NULL,
	[ExpiryDate] [date] NOT NULL,
	[BatchNumber] [nvarchar](50) NOT NULL,
	[Quantity] [float] NOT NULL,
	[MarginalPrice] [money] NOT NULL,
	[PurchasePrice] [money] NOT NULL,
	[Discount] [money] NULL,
	[Price] [money] NOT NULL,
	[ItemSalePrice] [money] NOT NULL,
	[SubItemSalePrice] [money] NOT NULL,
 CONSTRAINT [PK_Commodities] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CommodityItems]    Script Date: 13.3.2016 г. 13:22:21 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommodityItems](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CommodityId] [int] NOT NULL,
	[ItemName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_CommodityItems] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Couriers]    Script Date: 13.3.2016 г. 13:22:21 ч. ******/
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
/****** Object:  Table [dbo].[Diagnoses]    Script Date: 13.3.2016 г. 13:22:21 ч. ******/
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
/****** Object:  Table [dbo].[Diagnoses_Clients]    Script Date: 13.3.2016 г. 13:22:21 ч. ******/
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
/****** Object:  Table [dbo].[EquipmentParts]    Script Date: 13.3.2016 г. 13:22:21 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquipmentParts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](80) NOT NULL,
 CONSTRAINT [PK_EquipmentParts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Equipments]    Script Date: 13.3.2016 г. 13:22:21 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](150) NULL,
	[EquipmentTypeId] [int] NOT NULL,
	[SerialNumber] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Equipments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EquipmentStates]    Script Date: 13.3.2016 г. 13:22:21 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquipmentStates](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_EquipmentStates] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EquipmentTypes]    Script Date: 13.3.2016 г. 13:22:21 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EquipmentTypes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_EquipmentTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FormulaCalculationResults]    Script Date: 13.3.2016 г. 13:22:21 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormulaCalculationResults](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FormulaId] [int] NOT NULL,
	[FormulaInput] [nvarchar](50) NOT NULL,
	[FormulaOutput] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_FormulaCalculationResults] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Formulas]    Script Date: 13.3.2016 г. 13:22:21 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Formulas](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](60) NOT NULL,
	[CalculatingFunction] [nvarchar](200) NOT NULL,
	[Variables] [nvarchar](50) NOT NULL,
	[Parameters] [nvarchar](50) NOT NULL,
	[NotationLegend] [nvarchar](200) NULL,
 CONSTRAINT [PK_Formulas] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Medicines]    Script Date: 13.3.2016 г. 13:22:21 ч. ******/
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
/****** Object:  Table [dbo].[Medicines_Clients]    Script Date: 13.3.2016 г. 13:22:21 ч. ******/
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
/****** Object:  Table [dbo].[Messages]    Script Date: 13.3.2016 г. 13:22:21 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Classifier] [nvarchar](50) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Text] [text] NOT NULL,
	[SentAt] [datetime] NOT NULL,
	[SentById] [int] NOT NULL,
	[MessageSeverityId] [int] NOT NULL,
 CONSTRAINT [PK_Messages] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Messages_Recipients]    Script Date: 13.3.2016 г. 13:22:21 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages_Recipients](
	[MessageId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[SeenAt] [datetime] NULL,
 CONSTRAINT [PK_Messages_Recipients] PRIMARY KEY CLUSTERED 
(
	[MessageId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MessageSeverity]    Script Date: 13.3.2016 г. 13:22:21 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MessageSeverity](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Severity] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_MessageSeverity] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NomenclatureAttributes]    Script Date: 13.3.2016 г. 13:22:21 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NomenclatureAttributes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AttributeName] [nvarchar](50) NOT NULL,
	[AttributeValue] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_NomenclatureAttributes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Nomenclatures]    Script Date: 13.3.2016 г. 13:22:21 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nomenclatures](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Nomenclatures] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Nomenclatures_NomenclatureAttributes]    Script Date: 13.3.2016 г. 13:22:21 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nomenclatures_NomenclatureAttributes](
	[NomenclatureId] [int] NOT NULL,
	[NomenclatureAttributeId] [int] NOT NULL,
 CONSTRAINT [PK_Nomenclatures_NomenclatureAttributes] PRIMARY KEY CLUSTERED 
(
	[NomenclatureId] ASC,
	[NomenclatureAttributeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 13.3.2016 г. 13:22:21 ч. ******/
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
/****** Object:  Table [dbo].[OrderTrackingEntries]    Script Date: 13.3.2016 г. 13:22:21 ч. ******/
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
/****** Object:  Table [dbo].[Payments]    Script Date: 13.3.2016 г. 13:22:21 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PaymentTypeId] [int] NOT NULL,
 CONSTRAINT [PK_Payments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PaymentType]    Script Date: 13.3.2016 г. 13:22:21 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PaymentType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhoneNumbers]    Script Date: 13.3.2016 г. 13:22:21 ч. ******/
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
/****** Object:  Table [dbo].[Recipes]    Script Date: 13.3.2016 г. 13:22:21 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recipes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[ReferenceNumber] [int] NOT NULL,
	[DateTimeAccepted] [datetime] NOT NULL,
	[CarrierName] [nvarchar](150) NOT NULL,
	[CarrierPhoneNumberId] [int] NOT NULL,
	[AttachmentId] [int] NOT NULL,
 CONSTRAINT [PK_Recipes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ReferenceTemplates]    Script Date: 13.3.2016 г. 13:22:21 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReferenceTemplates](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[Description] [text] NOT NULL,
	[CreatedById] [int] NOT NULL,
	[DataSortedBy] [nvarchar](30) NOT NULL,
	[FromDate] [datetime] NOT NULL,
	[ToDate] [datetime] NOT NULL,
	[ReferenceTypeId] [int] NOT NULL,
 CONSTRAINT [PK_ReferenceTemplates] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ReferenceTypes]    Script Date: 13.3.2016 г. 13:22:21 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReferenceTypes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ReferenceTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RepairServicePhoneCalls]    Script Date: 13.3.2016 г. 13:22:21 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RepairServicePhoneCalls](
	[ID] [int] NOT NULL,
	[CallDateTime] [datetime] NOT NULL,
	[Result] [nvarchar](50) NOT NULL,
	[CallerNumber] [nvarchar](30) NOT NULL,
	[RepairServiceId] [int] NOT NULL,
 CONSTRAINT [PK_RepairServicePhoneCalls] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RepairServices]    Script Date: 13.3.2016 г. 13:22:21 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RepairServices](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ReferenceNumber] [nvarchar](50) NOT NULL,
	[DateTimeOrdered] [datetime] NOT NULL,
	[ContactPhone] [nvarchar](30) NOT NULL,
	[EquipmentId] [int] NOT NULL,
	[EquipmentComplaints] [nvarchar](150) NULL,
	[EquipmentStateId] [int] NOT NULL,
	[PrepaidSum] [money] NULL,
	[TechnicianRecommendations] [nvarchar](250) NULL,
	[RepairmentActions] [nvarchar](250) NULL,
	[InformedDate] [date] NULL,
	[LeftServiceDate] [date] NULL,
	[ReceivedByClientDateTime] [datetime] NULL,
	[AdditionalPayment] [money] NULL,
 CONSTRAINT [PK_RepairServices_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RepairServices_EquipmentParts]    Script Date: 13.3.2016 г. 13:22:21 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RepairServices_EquipmentParts](
	[RepairServiceId] [int] NOT NULL,
	[EquipmentPartId] [int] NOT NULL,
 CONSTRAINT [PK_RepairServices_EquipmentParts] PRIMARY KEY CLUSTERED 
(
	[RepairServiceId] ASC,
	[EquipmentPartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RescheduledStatuses]    Script Date: 13.3.2016 г. 13:22:21 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RescheduledStatuses](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_RescheduledStatuses] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SalesDesks]    Script Date: 13.3.2016 г. 13:22:21 ч. ******/
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
/****** Object:  Table [dbo].[SalesOperations]    Script Date: 13.3.2016 г. 13:22:21 ч. ******/
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
	[PaymentTypeId] [int] NOT NULL,
	[HasInvoice] [bit] NOT NULL,
 CONSTRAINT [PK_SalesOperations] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Shipments]    Script Date: 13.3.2016 г. 13:22:21 ч. ******/
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
/****** Object:  Table [dbo].[Statuses]    Script Date: 13.3.2016 г. 13:22:21 ч. ******/
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
/****** Object:  Table [dbo].[TaskReports]    Script Date: 13.3.2016 г. 13:22:21 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskReports](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TaskId] [int] NOT NULL,
	[ReportDescription] [nvarchar](250) NOT NULL,
	[ReportDateTime] [datetime] NOT NULL,
	[ReportState] [nvarchar](100) NOT NULL,
	[ReportedById] [int] NOT NULL,
 CONSTRAINT [PK_TaskReports] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TaskRescheduleRequests]    Script Date: 13.3.2016 г. 13:22:21 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskRescheduleRequests](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TaskId] [int] NOT NULL,
	[RescheduledFor] [datetime] NOT NULL,
	[RescheduledReason] [nvarchar](350) NOT NULL,
	[RescheduledStatusId] [int] NOT NULL,
	[RescheduledById] [int] NOT NULL,
 CONSTRAINT [PK_TaskRescheduleRequests] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tasks]    Script Date: 13.3.2016 г. 13:22:21 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tasks](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](250) NOT NULL,
	[AssignedDateTime] [datetime] NOT NULL,
	[ScheduledFor] [datetime] NOT NULL,
	[CreatedById] [int] NOT NULL,
	[PersonInChargeId] [int] NOT NULL,
	[TaskTypeId] [int] NOT NULL,
	[TaskStatusId] [int] NOT NULL,
 CONSTRAINT [PK_Tasks] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tasks_Attachments]    Script Date: 13.3.2016 г. 13:22:21 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tasks_Attachments](
	[TaskId] [int] NOT NULL,
	[AttachmentId] [int] NOT NULL,
 CONSTRAINT [PK_Tasks_Attachments] PRIMARY KEY CLUSTERED 
(
	[TaskId] ASC,
	[AttachmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TasksHelpers]    Script Date: 13.3.2016 г. 13:22:21 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TasksHelpers](
	[UserId] [int] NOT NULL,
	[TaskId] [int] NOT NULL,
 CONSTRAINT [PK_TasksHelpers] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[TaskId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TaskStatuses]    Script Date: 13.3.2016 г. 13:22:21 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskStatuses](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TaskStatuses] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TaskTypes]    Script Date: 13.3.2016 г. 13:22:21 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskTypes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TaskTypes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserActionHistory]    Script Date: 13.3.2016 г. 13:22:21 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserActionHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Description] [nvarchar](150) NOT NULL,
	[Date] [datetime] NOT NULL,
 CONSTRAINT [PK_UserActionHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserPermissions]    Script Date: 13.3.2016 г. 13:22:21 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserPermissions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[CanSale] [bit] NOT NULL,
	[CanEditSalePrice] [bit] NOT NULL,
	[CanReturnSale] [bit] NOT NULL,
	[CanSeeOldSales] [bit] NOT NULL,
	[CanSeeSalesFromDayStart] [bit] NOT NULL,
	[CanInvoice] [bit] NOT NULL,
	[CanEditInvoice] [bit] NOT NULL,
	[CanDeleteExpense] [bit] NOT NULL,
	[CanGivePositionDiscount] [bit] NOT NULL,
	[CanGiveSaleDiscount] [bit] NOT NULL,
	[CanDoExpenseReference] [bit] NOT NULL,
	[CanReportExpenses] [bit] NOT NULL,
	[CanDoRevision] [bit] NOT NULL,
	[CanInventory] [bit] NOT NULL,
	[CanReadNomenclatures] [bit] NOT NULL,
	[CanCreateNomenclatures] [bit] NOT NULL,
	[CanUpdateNomenclatures] [bit] NOT NULL,
	[CanDeleteNomenclatures] [bit] NOT NULL,
	[CanCreateReferenceTemplate] [bit] NOT NULL,
	[CanCreateReportTemplate] [bit] NOT NULL,
	[CanCreateReference] [bit] NOT NULL,
	[CanCreateReport] [bit] NOT NULL,
	[CanUpdateReferenceTemplate] [bit] NOT NULL,
	[CanUpdateReportTemplate] [bit] NOT NULL,
	[CanDeleteReferenceTemplate] [bit] NOT NULL,
	[CanDeleteReportTemplate] [bit] NOT NULL,
	[CanUpdateReferencePermissions] [bit] NOT NULL,
	[CanSeePaymentReference] [bit] NOT NULL,
	[CanCreateLeasePayment] [int] NOT NULL,
	[CanCeateLeasePaymentReference] [int] NOT NULL,
	[CanDeletePayment] [int] NOT NULL,
 CONSTRAINT [PK_UserPermissions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 13.3.2016 г. 13:22:21 ч. ******/
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
ALTER TABLE [dbo].[Commodities]  WITH CHECK ADD  CONSTRAINT [FK_Commodities_Attachments] FOREIGN KEY([AttachmendId])
REFERENCES [dbo].[Attachments] ([ID])
GO
ALTER TABLE [dbo].[Commodities] CHECK CONSTRAINT [FK_Commodities_Attachments]
GO
ALTER TABLE [dbo].[CommodityItems]  WITH CHECK ADD  CONSTRAINT [FK_CommodityItems_Commodities] FOREIGN KEY([CommodityId])
REFERENCES [dbo].[Commodities] ([ID])
GO
ALTER TABLE [dbo].[CommodityItems] CHECK CONSTRAINT [FK_CommodityItems_Commodities]
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
ALTER TABLE [dbo].[Equipments]  WITH CHECK ADD  CONSTRAINT [FK_Equipments_EquipmentTypes] FOREIGN KEY([EquipmentTypeId])
REFERENCES [dbo].[EquipmentTypes] ([ID])
GO
ALTER TABLE [dbo].[Equipments] CHECK CONSTRAINT [FK_Equipments_EquipmentTypes]
GO
ALTER TABLE [dbo].[FormulaCalculationResults]  WITH CHECK ADD  CONSTRAINT [FK_FormulaCalculationResults_Formulas] FOREIGN KEY([FormulaId])
REFERENCES [dbo].[Formulas] ([ID])
GO
ALTER TABLE [dbo].[FormulaCalculationResults] CHECK CONSTRAINT [FK_FormulaCalculationResults_Formulas]
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
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_Messages_MessageSeverity] FOREIGN KEY([MessageSeverityId])
REFERENCES [dbo].[MessageSeverity] ([ID])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_Messages_MessageSeverity]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_Messages_Users] FOREIGN KEY([SentById])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_Messages_Users]
GO
ALTER TABLE [dbo].[Messages_Recipients]  WITH CHECK ADD  CONSTRAINT [FK_Messages_Recipients_Messages] FOREIGN KEY([MessageId])
REFERENCES [dbo].[Messages] ([ID])
GO
ALTER TABLE [dbo].[Messages_Recipients] CHECK CONSTRAINT [FK_Messages_Recipients_Messages]
GO
ALTER TABLE [dbo].[Messages_Recipients]  WITH CHECK ADD  CONSTRAINT [FK_Messages_Recipients_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Messages_Recipients] CHECK CONSTRAINT [FK_Messages_Recipients_Users]
GO
ALTER TABLE [dbo].[Nomenclatures_NomenclatureAttributes]  WITH CHECK ADD  CONSTRAINT [FK_Nomenclatures_NomenclatureAttributes_NomenclatureAttributes] FOREIGN KEY([NomenclatureAttributeId])
REFERENCES [dbo].[NomenclatureAttributes] ([ID])
GO
ALTER TABLE [dbo].[Nomenclatures_NomenclatureAttributes] CHECK CONSTRAINT [FK_Nomenclatures_NomenclatureAttributes_NomenclatureAttributes]
GO
ALTER TABLE [dbo].[Nomenclatures_NomenclatureAttributes]  WITH CHECK ADD  CONSTRAINT [FK_Nomenclatures_NomenclatureAttributes_Nomenclatures] FOREIGN KEY([NomenclatureId])
REFERENCES [dbo].[Nomenclatures] ([ID])
GO
ALTER TABLE [dbo].[Nomenclatures_NomenclatureAttributes] CHECK CONSTRAINT [FK_Nomenclatures_NomenclatureAttributes_Nomenclatures]
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
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Payments_PaymentType] FOREIGN KEY([PaymentTypeId])
REFERENCES [dbo].[PaymentType] ([ID])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Payments_PaymentType]
GO
ALTER TABLE [dbo].[Recipes]  WITH CHECK ADD  CONSTRAINT [FK_Recipes_Attachments] FOREIGN KEY([AttachmentId])
REFERENCES [dbo].[Attachments] ([ID])
GO
ALTER TABLE [dbo].[Recipes] CHECK CONSTRAINT [FK_Recipes_Attachments]
GO
ALTER TABLE [dbo].[Recipes]  WITH CHECK ADD  CONSTRAINT [FK_Recipes_PhoneNumbers] FOREIGN KEY([CarrierPhoneNumberId])
REFERENCES [dbo].[PhoneNumbers] ([ID])
GO
ALTER TABLE [dbo].[Recipes] CHECK CONSTRAINT [FK_Recipes_PhoneNumbers]
GO
ALTER TABLE [dbo].[ReferenceTemplates]  WITH CHECK ADD  CONSTRAINT [FK_ReferenceTemplates_ReferenceTypes] FOREIGN KEY([ReferenceTypeId])
REFERENCES [dbo].[ReferenceTypes] ([ID])
GO
ALTER TABLE [dbo].[ReferenceTemplates] CHECK CONSTRAINT [FK_ReferenceTemplates_ReferenceTypes]
GO
ALTER TABLE [dbo].[ReferenceTemplates]  WITH CHECK ADD  CONSTRAINT [FK_ReferenceTemplates_Users] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[ReferenceTemplates] CHECK CONSTRAINT [FK_ReferenceTemplates_Users]
GO
ALTER TABLE [dbo].[RepairServicePhoneCalls]  WITH CHECK ADD  CONSTRAINT [FK_RepairServicePhoneCalls_RepairServices] FOREIGN KEY([RepairServiceId])
REFERENCES [dbo].[RepairServices] ([ID])
GO
ALTER TABLE [dbo].[RepairServicePhoneCalls] CHECK CONSTRAINT [FK_RepairServicePhoneCalls_RepairServices]
GO
ALTER TABLE [dbo].[RepairServices]  WITH CHECK ADD  CONSTRAINT [FK_RepairServices_Equipments] FOREIGN KEY([EquipmentId])
REFERENCES [dbo].[Equipments] ([ID])
GO
ALTER TABLE [dbo].[RepairServices] CHECK CONSTRAINT [FK_RepairServices_Equipments]
GO
ALTER TABLE [dbo].[RepairServices]  WITH CHECK ADD  CONSTRAINT [FK_RepairServices_EquipmentStates] FOREIGN KEY([EquipmentStateId])
REFERENCES [dbo].[EquipmentStates] ([ID])
GO
ALTER TABLE [dbo].[RepairServices] CHECK CONSTRAINT [FK_RepairServices_EquipmentStates]
GO
ALTER TABLE [dbo].[RepairServices_EquipmentParts]  WITH CHECK ADD  CONSTRAINT [FK_RepairServices_EquipmentParts_EquipmentParts] FOREIGN KEY([EquipmentPartId])
REFERENCES [dbo].[EquipmentParts] ([ID])
GO
ALTER TABLE [dbo].[RepairServices_EquipmentParts] CHECK CONSTRAINT [FK_RepairServices_EquipmentParts_EquipmentParts]
GO
ALTER TABLE [dbo].[RepairServices_EquipmentParts]  WITH CHECK ADD  CONSTRAINT [FK_RepairServices_EquipmentParts_RepairServices] FOREIGN KEY([RepairServiceId])
REFERENCES [dbo].[RepairServices] ([ID])
GO
ALTER TABLE [dbo].[RepairServices_EquipmentParts] CHECK CONSTRAINT [FK_RepairServices_EquipmentParts_RepairServices]
GO
ALTER TABLE [dbo].[SalesOperations]  WITH CHECK ADD  CONSTRAINT [FK_SalesOperations_PaymentType] FOREIGN KEY([PaymentTypeId])
REFERENCES [dbo].[PaymentType] ([ID])
GO
ALTER TABLE [dbo].[SalesOperations] CHECK CONSTRAINT [FK_SalesOperations_PaymentType]
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
ALTER TABLE [dbo].[TaskReports]  WITH CHECK ADD  CONSTRAINT [FK_TaskReports_Tasks] FOREIGN KEY([TaskId])
REFERENCES [dbo].[Tasks] ([ID])
GO
ALTER TABLE [dbo].[TaskReports] CHECK CONSTRAINT [FK_TaskReports_Tasks]
GO
ALTER TABLE [dbo].[TaskReports]  WITH CHECK ADD  CONSTRAINT [FK_TaskReports_Users] FOREIGN KEY([ReportedById])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[TaskReports] CHECK CONSTRAINT [FK_TaskReports_Users]
GO
ALTER TABLE [dbo].[TaskRescheduleRequests]  WITH CHECK ADD  CONSTRAINT [FK_TaskRescheduleRequests_RescheduledStatuses] FOREIGN KEY([RescheduledStatusId])
REFERENCES [dbo].[RescheduledStatuses] ([ID])
GO
ALTER TABLE [dbo].[TaskRescheduleRequests] CHECK CONSTRAINT [FK_TaskRescheduleRequests_RescheduledStatuses]
GO
ALTER TABLE [dbo].[TaskRescheduleRequests]  WITH CHECK ADD  CONSTRAINT [FK_TaskRescheduleRequests_Tasks] FOREIGN KEY([TaskId])
REFERENCES [dbo].[Tasks] ([ID])
GO
ALTER TABLE [dbo].[TaskRescheduleRequests] CHECK CONSTRAINT [FK_TaskRescheduleRequests_Tasks]
GO
ALTER TABLE [dbo].[TaskRescheduleRequests]  WITH CHECK ADD  CONSTRAINT [FK_TaskRescheduleRequests_Users] FOREIGN KEY([RescheduledById])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[TaskRescheduleRequests] CHECK CONSTRAINT [FK_TaskRescheduleRequests_Users]
GO
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_TaskStatuses] FOREIGN KEY([TaskStatusId])
REFERENCES [dbo].[TaskStatuses] ([ID])
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Tasks_TaskStatuses]
GO
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_TaskTypes] FOREIGN KEY([TaskTypeId])
REFERENCES [dbo].[TaskTypes] ([ID])
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Tasks_TaskTypes]
GO
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_Users_CreatedBy] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Tasks_Users_CreatedBy]
GO
ALTER TABLE [dbo].[Tasks]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_Users_PersonInCharge] FOREIGN KEY([PersonInChargeId])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Tasks] CHECK CONSTRAINT [FK_Tasks_Users_PersonInCharge]
GO
ALTER TABLE [dbo].[Tasks_Attachments]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_Attachments_Attachments] FOREIGN KEY([AttachmentId])
REFERENCES [dbo].[Attachments] ([ID])
GO
ALTER TABLE [dbo].[Tasks_Attachments] CHECK CONSTRAINT [FK_Tasks_Attachments_Attachments]
GO
ALTER TABLE [dbo].[Tasks_Attachments]  WITH CHECK ADD  CONSTRAINT [FK_Tasks_Attachments_Tasks] FOREIGN KEY([TaskId])
REFERENCES [dbo].[Tasks] ([ID])
GO
ALTER TABLE [dbo].[Tasks_Attachments] CHECK CONSTRAINT [FK_Tasks_Attachments_Tasks]
GO
ALTER TABLE [dbo].[TasksHelpers]  WITH CHECK ADD  CONSTRAINT [FK_TasksHelpers_Tasks] FOREIGN KEY([TaskId])
REFERENCES [dbo].[Tasks] ([ID])
GO
ALTER TABLE [dbo].[TasksHelpers] CHECK CONSTRAINT [FK_TasksHelpers_Tasks]
GO
ALTER TABLE [dbo].[TasksHelpers]  WITH CHECK ADD  CONSTRAINT [FK_TasksHelpers_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[TasksHelpers] CHECK CONSTRAINT [FK_TasksHelpers_Users]
GO
ALTER TABLE [dbo].[UserActionHistory]  WITH CHECK ADD  CONSTRAINT [FK_UserActionHistory_UserActionHistory] FOREIGN KEY([ID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[UserActionHistory] CHECK CONSTRAINT [FK_UserActionHistory_UserActionHistory]
GO
ALTER TABLE [dbo].[UserPermissions]  WITH CHECK ADD  CONSTRAINT [FK_UserPermissions_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[UserPermissions] CHECK CONSTRAINT [FK_UserPermissions_Users]
GO
USE [master]
GO
ALTER DATABASE [PharmacyDB] SET  READ_WRITE 
GO
