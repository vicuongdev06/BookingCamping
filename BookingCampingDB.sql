USE [master]
GO
/****** Object:  Database [BookingCampingDb]    Script Date: 4/21/2024 9:42:13 AM ******/
CREATE DATABASE [BookingCampingDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BookingCampingDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BookingCampingDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BookingCampingDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BookingCampingDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BookingCampingDb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookingCampingDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookingCampingDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookingCampingDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookingCampingDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookingCampingDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookingCampingDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookingCampingDb] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BookingCampingDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookingCampingDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookingCampingDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookingCampingDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookingCampingDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookingCampingDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookingCampingDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookingCampingDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookingCampingDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BookingCampingDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookingCampingDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookingCampingDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookingCampingDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookingCampingDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookingCampingDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BookingCampingDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookingCampingDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BookingCampingDb] SET  MULTI_USER 
GO
ALTER DATABASE [BookingCampingDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookingCampingDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookingCampingDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookingCampingDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BookingCampingDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BookingCampingDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BookingCampingDb] SET QUERY_STORE = OFF
GO
USE [BookingCampingDb]
GO
/****** Object:  Table [dbo].[Admins]    Script Date: 4/21/2024 9:42:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admins](
	[AdminID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_Admins] PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bookings]    Script Date: 4/21/2024 9:42:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bookings](
	[BookingID] [int] NOT NULL,
	[CreateAt] [datetime2](7) NULL,
	[FullName] [nvarchar](max) NOT NULL,
	[PhoneNumber] [varchar](10) NOT NULL,
	[Adult] [int] NOT NULL,
	[Children] [int] NOT NULL,
	[YoungChildren] [int] NOT NULL,
	[DayCheckIn] [datetime2](7) NOT NULL,
	[DayCheckOut] [datetime2](7) NOT NULL,
	[LocationID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[PaymentStatus] [bit] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CampsiteCalendars]    Script Date: 4/21/2024 9:42:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CampsiteCalendars](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LocationID] [int] NOT NULL,
	[BookingDate] [datetime2](7) NOT NULL,
	[Status] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_CampsiteCalendars] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 4/21/2024 9:42:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 4/21/2024 9:42:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 4/21/2024 9:42:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedbacks]    Script Date: 4/21/2024 9:42:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedbacks](
	[FeedbackID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Image1] [nvarchar](max) NULL,
	[Image2] [nvarchar](max) NULL,
	[Image3] [nvarchar](max) NULL,
	[CustomerID] [int] NOT NULL,
 CONSTRAINT [PK_Feedbacks] PRIMARY KEY CLUSTERED 
(
	[FeedbackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 4/21/2024 9:42:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[LocationID] [int] IDENTITY(1,1) NOT NULL,
	[LocationName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 4/21/2024 9:42:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[LocationID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[TotalPrice] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 4/21/2024 9:42:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CreateAt] [datetime2](7) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[TotalPrice] [decimal](18, 2) NOT NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 4/21/2024 9:42:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[id] [nvarchar](50) NOT NULL,
	[PaymentContent] [nvarchar](50) NOT NULL,
	[PaymentCurrency] [varchar](10) NULL,
	[PaymentRefld] [nvarchar](50) NULL,
	[RequireAmount] [decimal](18, 0) NULL,
	[PaymentDate] [datetime] NULL,
	[PaymentStatus] [bit] NULL,
	[OrderId] [int] NULL,
	[PaymentDestinationld] [nvarchar](10) NULL,
	[PaidAmount] [decimal](18, 0) NULL,
	[ExpireDate] [datetime] NULL,
	[PaymentLastMessage] [nvarchar](250) NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 4/21/2024 9:42:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](max) NOT NULL,
	[ProductImage] [nvarchar](max) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Capacity] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NOT NULL,
	[CategoryID] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 4/21/2024 9:42:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tents]    Script Date: 4/21/2024 9:42:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tents](
	[TentID] [int] IDENTITY(1,1) NOT NULL,
	[TentName] [nvarchar](max) NOT NULL,
	[Capacity] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NOT NULL,
	[PricePerNight] [decimal](18, 2) NOT NULL,
	[LocationID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[TentCoordinateX] [int] NULL,
	[TentCoordinateY] [int] NULL,
	[PaymentStatus] [bit] NOT NULL,
 CONSTRAINT [PK_Tents] PRIMARY KEY CLUSTERED 
(
	[TentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 4/21/2024 9:42:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](max) NOT NULL,
	[PasswordHash] [varbinary](max) NULL,
	[PasswordSatl] [varbinary](max) NULL,
	[RefreshToken] [nvarchar](max) NOT NULL,
	[TokenCreatedAt] [datetime2](7) NULL,
	[TokenExpiresAt] [datetime2](7) NULL,
	[PhoneNumber] [varchar](10) NOT NULL,
	[FullName] [nvarchar](max) NOT NULL,
	[Image] [nvarchar](max) NOT NULL,
	[RoleID] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Admins] ([AdminID], [UserID]) VALUES (3, 3)
INSERT [dbo].[Admins] ([AdminID], [UserID]) VALUES (4, 4)
GO
INSERT [dbo].[Bookings] ([BookingID], [CreateAt], [FullName], [PhoneNumber], [Adult], [Children], [YoungChildren], [DayCheckIn], [DayCheckOut], [LocationID], [CustomerID], [PaymentStatus]) VALUES (9746, CAST(N'2024-04-19T03:05:04.7229195' AS DateTime2), N'dsd', N'5454', 1, 0, 0, CAST(N'2024-04-20T00:00:00.0000000' AS DateTime2), CAST(N'2024-04-21T00:00:00.0000000' AS DateTime2), 4, 5, 0)
INSERT [dbo].[Bookings] ([BookingID], [CreateAt], [FullName], [PhoneNumber], [Adult], [Children], [YoungChildren], [DayCheckIn], [DayCheckOut], [LocationID], [CustomerID], [PaymentStatus]) VALUES (12312, CAST(N'2024-04-19T03:07:29.5538905' AS DateTime2), N'string', N'string', 1, 0, 0, CAST(N'2024-04-21T20:07:04.2630000' AS DateTime2), CAST(N'2024-04-22T20:07:04.2630000' AS DateTime2), 2, 5, 0)
INSERT [dbo].[Bookings] ([BookingID], [CreateAt], [FullName], [PhoneNumber], [Adult], [Children], [YoungChildren], [DayCheckIn], [DayCheckOut], [LocationID], [CustomerID], [PaymentStatus]) VALUES (11777, CAST(N'2024-04-19T03:27:50.7115511' AS DateTime2), N'fdfd', N'fdfdf', 1, 0, 0, CAST(N'2024-04-20T00:00:00.0000000' AS DateTime2), CAST(N'2024-04-21T00:00:00.0000000' AS DateTime2), 1, 5, 1)
INSERT [dbo].[Bookings] ([BookingID], [CreateAt], [FullName], [PhoneNumber], [Adult], [Children], [YoungChildren], [DayCheckIn], [DayCheckOut], [LocationID], [CustomerID], [PaymentStatus]) VALUES (10759, CAST(N'2024-04-19T05:28:09.7156319' AS DateTime2), N'sdssd', N'54545', 1, 0, 0, CAST(N'2024-04-21T00:00:00.0000000' AS DateTime2), CAST(N'2024-04-22T00:00:00.0000000' AS DateTime2), 3, 5, 1)
INSERT [dbo].[Bookings] ([BookingID], [CreateAt], [FullName], [PhoneNumber], [Adult], [Children], [YoungChildren], [DayCheckIn], [DayCheckOut], [LocationID], [CustomerID], [PaymentStatus]) VALUES (3009, CAST(N'2024-04-19T05:37:23.0251344' AS DateTime2), N'ds', N'dsd', 1, 0, 0, CAST(N'2024-04-25T00:00:00.0000000' AS DateTime2), CAST(N'2024-04-26T00:00:00.0000000' AS DateTime2), 2, 5, 1)
INSERT [dbo].[Bookings] ([BookingID], [CreateAt], [FullName], [PhoneNumber], [Adult], [Children], [YoungChildren], [DayCheckIn], [DayCheckOut], [LocationID], [CustomerID], [PaymentStatus]) VALUES (13696, CAST(N'2024-04-19T06:09:03.0664810' AS DateTime2), N'fdfs', N'544', 1, 0, 0, CAST(N'2024-04-26T00:00:00.0000000' AS DateTime2), CAST(N'2024-04-28T00:00:00.0000000' AS DateTime2), 5, 5, 1)
INSERT [dbo].[Bookings] ([BookingID], [CreateAt], [FullName], [PhoneNumber], [Adult], [Children], [YoungChildren], [DayCheckIn], [DayCheckOut], [LocationID], [CustomerID], [PaymentStatus]) VALUES (10336, CAST(N'2024-04-19T06:11:57.9264140' AS DateTime2), N'dsd', N'545', 1, 0, 0, CAST(N'2024-04-28T00:00:00.0000000' AS DateTime2), CAST(N'2024-04-29T00:00:00.0000000' AS DateTime2), 4, 5, 1)
INSERT [dbo].[Bookings] ([BookingID], [CreateAt], [FullName], [PhoneNumber], [Adult], [Children], [YoungChildren], [DayCheckIn], [DayCheckOut], [LocationID], [CustomerID], [PaymentStatus]) VALUES (11318, CAST(N'2024-04-19T10:24:13.3822935' AS DateTime2), N'fdf', N'fdf', 1, 0, 0, CAST(N'2024-04-21T00:00:00.0000000' AS DateTime2), CAST(N'2024-04-22T00:00:00.0000000' AS DateTime2), 9, 5, 0)
INSERT [dbo].[Bookings] ([BookingID], [CreateAt], [FullName], [PhoneNumber], [Adult], [Children], [YoungChildren], [DayCheckIn], [DayCheckOut], [LocationID], [CustomerID], [PaymentStatus]) VALUES (14639, CAST(N'2024-04-19T10:24:37.5905219' AS DateTime2), N'fdf', N'fdf', 1, 0, 0, CAST(N'2024-04-21T00:00:00.0000000' AS DateTime2), CAST(N'2024-04-22T00:00:00.0000000' AS DateTime2), 9, 5, 0)
INSERT [dbo].[Bookings] ([BookingID], [CreateAt], [FullName], [PhoneNumber], [Adult], [Children], [YoungChildren], [DayCheckIn], [DayCheckOut], [LocationID], [CustomerID], [PaymentStatus]) VALUES (8953, CAST(N'2024-04-19T10:26:00.3807283' AS DateTime2), N'dsds', N'dsd', 1, 0, 0, CAST(N'2024-04-22T00:00:00.0000000' AS DateTime2), CAST(N'2024-04-23T00:00:00.0000000' AS DateTime2), 10, 5, 1)
INSERT [dbo].[Bookings] ([BookingID], [CreateAt], [FullName], [PhoneNumber], [Adult], [Children], [YoungChildren], [DayCheckIn], [DayCheckOut], [LocationID], [CustomerID], [PaymentStatus]) VALUES (3150, CAST(N'2024-04-19T10:29:10.1591978' AS DateTime2), N'dsds', N'dsdsd', 1, 0, 0, CAST(N'2024-04-21T00:00:00.0000000' AS DateTime2), CAST(N'2024-04-22T00:00:00.0000000' AS DateTime2), 7, 5, 1)
INSERT [dbo].[Bookings] ([BookingID], [CreateAt], [FullName], [PhoneNumber], [Adult], [Children], [YoungChildren], [DayCheckIn], [DayCheckOut], [LocationID], [CustomerID], [PaymentStatus]) VALUES (4813, CAST(N'2024-04-19T10:30:46.1692212' AS DateTime2), N'dfsf', N'fdfd', 1, 0, 0, CAST(N'2024-04-21T00:00:00.0000000' AS DateTime2), CAST(N'2024-04-23T00:00:00.0000000' AS DateTime2), 6, 5, 1)
INSERT [dbo].[Bookings] ([BookingID], [CreateAt], [FullName], [PhoneNumber], [Adult], [Children], [YoungChildren], [DayCheckIn], [DayCheckOut], [LocationID], [CustomerID], [PaymentStatus]) VALUES (9913, CAST(N'2024-04-21T09:24:55.4634528' AS DateTime2), N'fdf', N'fdfdf', 1, 0, 0, CAST(N'2024-04-25T00:00:00.0000000' AS DateTime2), CAST(N'2024-04-26T00:00:00.0000000' AS DateTime2), 7, 5, 0)
INSERT [dbo].[Bookings] ([BookingID], [CreateAt], [FullName], [PhoneNumber], [Adult], [Children], [YoungChildren], [DayCheckIn], [DayCheckOut], [LocationID], [CustomerID], [PaymentStatus]) VALUES (9481, CAST(N'2024-04-19T05:55:05.4847793' AS DateTime2), N'nkj', N'78', 1, 0, 0, CAST(N'2024-04-28T00:00:00.0000000' AS DateTime2), CAST(N'2024-04-29T00:00:00.0000000' AS DateTime2), 6, 5, 1)
INSERT [dbo].[Bookings] ([BookingID], [CreateAt], [FullName], [PhoneNumber], [Adult], [Children], [YoungChildren], [DayCheckIn], [DayCheckOut], [LocationID], [CustomerID], [PaymentStatus]) VALUES (6446, CAST(N'2024-04-19T09:22:27.9013724' AS DateTime2), N'string', N'string', 1, 0, 0, CAST(N'2024-04-22T02:19:21.3330000' AS DateTime2), CAST(N'2024-04-24T02:19:21.3330000' AS DateTime2), 8, 5, 0)
INSERT [dbo].[Bookings] ([BookingID], [CreateAt], [FullName], [PhoneNumber], [Adult], [Children], [YoungChildren], [DayCheckIn], [DayCheckOut], [LocationID], [CustomerID], [PaymentStatus]) VALUES (12474, CAST(N'2024-04-19T09:23:28.6126136' AS DateTime2), N'dsd', N'dsds', 1, 0, 0, CAST(N'2024-04-27T00:00:00.0000000' AS DateTime2), CAST(N'2024-04-28T00:00:00.0000000' AS DateTime2), 7, 5, 1)
INSERT [dbo].[Bookings] ([BookingID], [CreateAt], [FullName], [PhoneNumber], [Adult], [Children], [YoungChildren], [DayCheckIn], [DayCheckOut], [LocationID], [CustomerID], [PaymentStatus]) VALUES (14306, CAST(N'2024-04-19T09:40:54.0158457' AS DateTime2), N'nkl', N'6767', 1, 0, 0, CAST(N'2024-05-25T00:00:00.0000000' AS DateTime2), CAST(N'2024-05-28T00:00:00.0000000' AS DateTime2), 8, 5, 1)
GO
SET IDENTITY_INSERT [dbo].[CampsiteCalendars] ON 

INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (1, 1, CAST(N'2024-04-27T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (2, 1, CAST(N'2024-04-20T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (3, 1, CAST(N'2024-04-21T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (4, 1, CAST(N'2024-04-22T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (5, 1, CAST(N'2024-04-23T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (6, 1, CAST(N'2024-04-24T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (7, 1, CAST(N'2024-04-25T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (8, 1, CAST(N'2024-04-26T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (9, 1, CAST(N'2024-04-25T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (10, 1, CAST(N'2024-04-26T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (11, 1, CAST(N'2024-04-27T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (12, 1, CAST(N'2024-04-28T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (13, 1, CAST(N'2024-04-18T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (14, 1, CAST(N'2024-04-19T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (15, 1, CAST(N'2024-04-20T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (16, 1, CAST(N'2024-04-21T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (17, 1, CAST(N'2024-04-22T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (18, 1, CAST(N'2024-04-23T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (19, 1, CAST(N'2024-04-24T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (20, 1, CAST(N'2024-04-25T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (21, 1, CAST(N'2024-04-26T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (22, 1, CAST(N'2024-04-27T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (23, 1, CAST(N'2024-04-18T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (24, 1, CAST(N'2024-04-19T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (25, 1, CAST(N'2024-04-20T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (26, 1, CAST(N'2024-04-21T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (27, 1, CAST(N'2024-04-22T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (28, 1, CAST(N'2024-04-23T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (29, 1, CAST(N'2024-04-24T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (30, 1, CAST(N'2024-04-25T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (31, 1, CAST(N'2024-04-26T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (32, 1, CAST(N'2024-04-27T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (33, 1, CAST(N'2024-04-18T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (34, 1, CAST(N'2024-04-19T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (35, 1, CAST(N'2024-04-20T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (36, 1, CAST(N'2024-04-21T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (37, 1, CAST(N'2024-04-22T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (38, 1, CAST(N'2024-04-23T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (39, 1, CAST(N'2024-04-24T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (40, 1, CAST(N'2024-04-25T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (41, 1, CAST(N'2024-04-26T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (42, 1, CAST(N'2024-04-27T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (43, 1, CAST(N'2024-04-18T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (44, 1, CAST(N'2024-04-19T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (45, 1, CAST(N'2024-04-20T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (46, 1, CAST(N'2024-04-21T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (47, 1, CAST(N'2024-04-22T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (48, 1, CAST(N'2024-04-23T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (49, 1, CAST(N'2024-04-24T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (50, 1, CAST(N'2024-04-25T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (51, 1, CAST(N'2024-04-26T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (52, 1, CAST(N'2024-04-27T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (53, 1, CAST(N'2024-04-14T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (54, 1, CAST(N'2024-04-15T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (55, 1, CAST(N'2024-04-16T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (56, 1, CAST(N'2024-04-14T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (57, 1, CAST(N'2024-04-15T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (58, 1, CAST(N'2024-04-14T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (59, 1, CAST(N'2024-04-15T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (60, 1, CAST(N'2024-04-16T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (61, 1, CAST(N'2024-04-14T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (62, 1, CAST(N'2024-04-15T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (63, 1, CAST(N'2024-04-15T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (64, 1, CAST(N'2024-04-16T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (65, 1, CAST(N'2024-04-17T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (66, 1, CAST(N'2024-04-18T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (67, 1, CAST(N'2024-04-14T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (68, 1, CAST(N'2024-04-15T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (69, 1, CAST(N'2024-04-14T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (70, 1, CAST(N'2024-04-15T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (71, 1, CAST(N'2024-04-18T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (72, 1, CAST(N'2024-04-19T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (73, 1, CAST(N'2024-04-20T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (74, 1, CAST(N'2024-04-14T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (75, 1, CAST(N'2024-04-15T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (76, 1, CAST(N'2024-04-14T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (77, 1, CAST(N'2024-04-15T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (78, 1, CAST(N'2024-04-14T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (79, 1, CAST(N'2024-04-15T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (80, 1, CAST(N'2024-04-14T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (81, 1, CAST(N'2024-04-15T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (82, 1, CAST(N'2024-04-14T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (83, 1, CAST(N'2024-04-15T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (84, 1, CAST(N'2024-04-14T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (85, 1, CAST(N'2024-04-15T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (86, 1, CAST(N'2024-04-14T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (87, 1, CAST(N'2024-04-15T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (88, 1, CAST(N'2024-04-16T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (89, 1, CAST(N'2024-04-17T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (90, 1, CAST(N'2024-04-16T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (91, 1, CAST(N'2024-04-17T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (92, 1, CAST(N'2024-04-19T17:05:02.7870000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (93, 1, CAST(N'2024-04-20T17:05:02.7870000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (94, 1, CAST(N'2024-04-20T18:51:54.5990000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (95, 1, CAST(N'2024-04-21T18:51:54.5990000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (96, 1, CAST(N'2024-04-20T19:08:18.1940000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (97, 1, CAST(N'2024-04-21T19:08:18.1940000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (98, 4, CAST(N'2024-04-20T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (99, 4, CAST(N'2024-04-21T00:00:00.0000000' AS DateTime2), N'Booked')
GO
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (100, 2, CAST(N'2024-04-21T20:07:04.2630000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (101, 2, CAST(N'2024-04-22T20:07:04.2630000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (102, 1, CAST(N'2024-04-20T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (103, 1, CAST(N'2024-04-21T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (104, 3, CAST(N'2024-04-21T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (105, 3, CAST(N'2024-04-22T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (106, 2, CAST(N'2024-04-25T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (107, 2, CAST(N'2024-04-26T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (108, 6, CAST(N'2024-04-28T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (109, 6, CAST(N'2024-04-29T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (110, 5, CAST(N'2024-04-26T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (111, 5, CAST(N'2024-04-27T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (112, 5, CAST(N'2024-04-28T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (113, 4, CAST(N'2024-04-28T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (114, 4, CAST(N'2024-04-29T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (115, 8, CAST(N'2024-04-22T02:19:21.3330000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (116, 8, CAST(N'2024-04-23T02:19:21.3330000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (117, 8, CAST(N'2024-04-24T02:19:21.3330000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (118, 7, CAST(N'2024-04-27T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (119, 7, CAST(N'2024-04-28T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (120, 8, CAST(N'2024-05-25T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (121, 8, CAST(N'2024-05-26T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (122, 8, CAST(N'2024-05-27T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (123, 8, CAST(N'2024-05-28T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (124, 9, CAST(N'2024-04-21T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (125, 9, CAST(N'2024-04-22T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (126, 9, CAST(N'2024-04-21T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (127, 9, CAST(N'2024-04-22T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (128, 10, CAST(N'2024-04-22T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (129, 10, CAST(N'2024-04-23T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (130, 7, CAST(N'2024-04-21T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (131, 7, CAST(N'2024-04-22T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (132, 6, CAST(N'2024-04-21T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (133, 6, CAST(N'2024-04-22T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (134, 6, CAST(N'2024-04-23T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (135, 7, CAST(N'2024-04-25T00:00:00.0000000' AS DateTime2), N'Booked')
INSERT [dbo].[CampsiteCalendars] ([ID], [LocationID], [BookingDate], [Status]) VALUES (136, 7, CAST(N'2024-04-26T00:00:00.0000000' AS DateTime2), N'Booked')
SET IDENTITY_INSERT [dbo].[CampsiteCalendars] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (1, N'Leu
')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (2, N'Homestay')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (3, N'DoAn')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (4, N'ThucUong')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (5, N'PhuKien')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (6, N'GiaiTri')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
INSERT [dbo].[Customers] ([CustomerID], [UserID]) VALUES (5, 5)
GO
INSERT [dbo].[Employees] ([EmployeeID], [UserID]) VALUES (1, 5)
GO
SET IDENTITY_INSERT [dbo].[Locations] ON 

INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (1, N'a1')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (2, N'a2')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (3, N'a3')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (4, N'a4')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (5, N'a5')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (6, N'a6')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (7, N'a7')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (8, N'a8')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (9, N'a9')
INSERT [dbo].[Locations] ([LocationID], [LocationName]) VALUES (10, N'a10')
SET IDENTITY_INSERT [dbo].[Locations] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderID], [CreateAt], [CustomerID], [EmployeeID], [TotalPrice], [Status]) VALUES (5, CAST(N'2001-01-01T00:00:00.0000000' AS DateTime2), 5, 1, CAST(1.00 AS Decimal(18, 2)), 1)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
INSERT [dbo].[Payment] ([id], [PaymentContent], [PaymentCurrency], [PaymentRefld], [RequireAmount], [PaymentDate], [PaymentStatus], [OrderId], [PaymentDestinationld], [PaidAmount], [ExpireDate], [PaymentLastMessage]) VALUES (N'fsf', N'bbb', N'dbd', N'dbdb', CAST(21212 AS Decimal(18, 0)), CAST(N'2001-01-01T00:00:00.000' AS DateTime), 1, 5, N'MOMO', CAST(22211 AS Decimal(18, 0)), CAST(N'2001-01-01T00:00:00.000' AS DateTime), N'feffe')
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImage], [Price], [Capacity], [Description], [CategoryID]) VALUES (35, N'Leu4Eureka', N'https://firebasestorage.googleapis.com/v0/b/bookingcamping-cc653.appspot.com/o/Product%2Fimg4eu.jpg?alt=media&token=1ff28953-f487-4398-a904-91552d8d7c81', CAST(250000.00 AS Decimal(18, 2)), N'2-4 người', N'Lều eureka 4 dành cho nhóm dưới 4 người', 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImage], [Price], [Capacity], [Description], [CategoryID]) VALUES (36, N'Leu6Eureka', N'https://firebasestorage.googleapis.com/v0/b/bookingcamping-cc653.appspot.com/o/Product%2Fimg6eu.jpg?alt=media&token=40c8bd28-3c18-44f3-897a-bc75d738402c', CAST(300000.00 AS Decimal(18, 2)), N'3-6 người', N'Lều eureka 6 dành cho nhóm dưới 6 người', 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImage], [Price], [Capacity], [Description], [CategoryID]) VALUES (37, N'Leu8Eureka', N'https://firebasestorage.googleapis.com/v0/b/bookingcamping-cc653.appspot.com/o/Product%2Fimg8eu.jpg?alt=media&token=c146328b-7a96-4667-8355-d826fce9e0f2', CAST(400000.00 AS Decimal(18, 2)), N'4-8 người', N'Lều eureka 8 dành cho nhóm dưới 8 người', 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImage], [Price], [Capacity], [Description], [CategoryID]) VALUES (38, N'Leu4Vintage', N'https://firebasestorage.googleapis.com/v0/b/bookingcamping-cc653.appspot.com/o/Product%2Fimg4eu.jpg?alt=media&token=1ff28953-f487-4398-a904-91552d8d7c81', CAST(250000.00 AS Decimal(18, 2)), N'2-4 người', N'Lều vintage 4 dành cho nhóm 4 người', 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImage], [Price], [Capacity], [Description], [CategoryID]) VALUES (39, N'Leu6Vintage', N'https://firebasestorage.googleapis.com/v0/b/bookingcamping-cc653.appspot.com/o/Product%2Fimg6vt.jpg?alt=media&token=ae537cdc-68d8-43e1-a74e-a84a2d4e8bdd', CAST(300000.00 AS Decimal(18, 2)), N'3-6 người', N'Lều vintage 6 dành cho nhóm dưới 6 người', 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImage], [Price], [Capacity], [Description], [CategoryID]) VALUES (40, N'Leu8Vintage', N'https://firebasestorage.googleapis.com/v0/b/bookingcamping-cc653.appspot.com/o/Product%2Fimg8vt.jpg?alt=media&token=04c7a9cb-ab0b-4390-a353-2845cff29d55', CAST(400000.00 AS Decimal(18, 2)), N'4-8 người', N'Lều vintage 8 dành cho nhóm dưới 8 người', 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImage], [Price], [Capacity], [Description], [CategoryID]) VALUES (41, N'LeuMongalia', N'https://firebasestorage.googleapis.com/v0/b/bookingcamping-cc653.appspot.com/o/Product%2Fmongolia4.jpg?alt=media&token=1232aaa4-9d98-4fbb-8fdc-81a14c816d02', CAST(300000.00 AS Decimal(18, 2)), N'2-4 người', N'Lều trụ mông cổ dành cho nhóm dưới 4 người', 1)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImage], [Price], [Capacity], [Description], [CategoryID]) VALUES (42, N'Phongdorm10nguoi', N'https://firebasestorage.googleapis.com/v0/b/bookingcamping-cc653.appspot.com/o/Product%2Fdorm10.jpg?alt=media&token=c672a4cb-3cfc-44a0-bddc-929a395b4c15', CAST(1000000.00 AS Decimal(18, 2)), N'6-10 người', N'Phòng dorm phù hợp dành cho nhóm từ 6 đến 10 người ', 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImage], [Price], [Capacity], [Description], [CategoryID]) VALUES (43, N'Homestay4nguoi', N'https://firebasestorage.googleapis.com/v0/b/bookingcamping-cc653.appspot.com/o/Product%2Fhomestay4.jpg?alt=media&token=d5d178de-c76b-4564-b108-4bf8b7151c1b', CAST(500000.00 AS Decimal(18, 2)), N'2-4 người', N'Phòng homestay 2 giường đôi phù hợp cho 4 người ', 2)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImage], [Price], [Capacity], [Description], [CategoryID]) VALUES (44, N'AnSang', N'https://firebasestorage.googleapis.com/v0/b/bookingcamping-cc653.appspot.com/o/Product%2Fansang.jpg?alt=media&token=800a5d5e-ac05-4fad-969a-b8000551aa22', CAST(40000.00 AS Decimal(18, 2)), N'', N'Ăn sáng ', 3)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImage], [Price], [Capacity], [Description], [CategoryID]) VALUES (45, N'ComboBBQ', N'https://firebasestorage.googleapis.com/v0/b/bookingcamping-cc653.appspot.com/o/Product%2Fbbq.jpg?alt=media&token=c1883929-55d3-4690-bc61-ed79a5715c96', CAST(350000.00 AS Decimal(18, 2)), N'', N'Combo BBQ gồm nhiều món', 3)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImage], [Price], [Capacity], [Description], [CategoryID]) VALUES (46, N'BachTuocNuong', N'https://firebasestorage.googleapis.com/v0/b/bookingcamping-cc653.appspot.com/o/Product%2Fbachtuocnuong.jpg?alt=media&token=467acd2f-62ca-4583-89bc-ee674cc30e05', CAST(300000.00 AS Decimal(18, 2)), N'', N'Bạch tuộc nướng', 3)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImage], [Price], [Capacity], [Description], [CategoryID]) VALUES (47, N'HeoNuong', N'https://firebasestorage.googleapis.com/v0/b/bookingcamping-cc653.appspot.com/o/Product%2Fheonuong.jpg?alt=media&token=138dabe8-53ed-443c-b935-1b7b3c1323e4', CAST(250000.00 AS Decimal(18, 2)), N'', N'Heo nướng', 3)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImage], [Price], [Capacity], [Description], [CategoryID]) VALUES (48, N'GaNuong', N'https://firebasestorage.googleapis.com/v0/b/bookingcamping-cc653.appspot.com/o/Product%2Fganuong.jpg?alt=media&token=f7dee41b-de7c-44fd-82b7-467a56f1c8a8', CAST(300000.00 AS Decimal(18, 2)), N'', N'Gà nướng', 3)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImage], [Price], [Capacity], [Description], [CategoryID]) VALUES (49, N'CaNuong', N'https://firebasestorage.googleapis.com/v0/b/bookingcamping-cc653.appspot.com/o/Product%2Fcanuong.jpg?alt=media&token=0ca1b0b2-36e1-4f64-8a0c-84fc372a5f9d', CAST(350000.00 AS Decimal(18, 2)), N'', N'Cá lăng nướng', 3)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImage], [Price], [Capacity], [Description], [CategoryID]) VALUES (50, N'Lau', N'https://firebasestorage.googleapis.com/v0/b/bookingcamping-cc653.appspot.com/o/Product%2Flau.jpg?alt=media&token=fd0b7c71-0066-490e-adc6-501d4ab48b28', CAST(300000.00 AS Decimal(18, 2)), N'', N'Lẩu cá lăng', 3)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImage], [Price], [Capacity], [Description], [CategoryID]) VALUES (51, N'TomNuong', N'https://firebasestorage.googleapis.com/v0/b/bookingcamping-cc653.appspot.com/o/Product%2Ftomnuong.jpg?alt=media&token=6627529e-761a-4175-90ed-7779d1f74339', CAST(250000.00 AS Decimal(18, 2)), N'', N'Tôm nướng', 3)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImage], [Price], [Capacity], [Description], [CategoryID]) VALUES (52, N'Comchien', N'https://firebasestorage.googleapis.com/v0/b/bookingcamping-cc653.appspot.com/o/Product%2Fcomchien.jpg?alt=media&token=65172c4a-7b50-481c-9bb1-ecc63b8b16b1', CAST(100000.00 AS Decimal(18, 2)), N'', N'Cơm chiên trứng', 3)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImage], [Price], [Capacity], [Description], [CategoryID]) VALUES (53, N'Salad', N'https://firebasestorage.googleapis.com/v0/b/bookingcamping-cc653.appspot.com/o/Product%2Fsalad.jpg?alt=media&token=4f2c0b0e-6856-4423-993f-f8e95f5fb2c1', CAST(50000.00 AS Decimal(18, 2)), N'', N'Salad rau củ', 3)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImage], [Price], [Capacity], [Description], [CategoryID]) VALUES (54, N'Khoailangnuong', N'https://firebasestorage.googleapis.com/v0/b/bookingcamping-cc653.appspot.com/o/Product%2Fkhoainuong.jpg?alt=media&token=5c7672dd-41d8-45dd-8308-914562c73970', CAST(50000.00 AS Decimal(18, 2)), N'', N'Khoai lang nướng', 3)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImage], [Price], [Capacity], [Description], [CategoryID]) VALUES (55, N'BiaTiger', N'https://firebasestorage.googleapis.com/v0/b/bookingcamping-cc653.appspot.com/o/Product%2Ftiger.jpg?alt=media&token=62e22ffa-d197-40c6-9709-f9683be0fc0d', CAST(20000.00 AS Decimal(18, 2)), N'', N'Bia Tiger', 4)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImage], [Price], [Capacity], [Description], [CategoryID]) VALUES (56, N'BiaSaigon', N'https://firebasestorage.googleapis.com/v0/b/bookingcamping-cc653.appspot.com/o/Product%2Fsaigon.jpg?alt=media&token=785a2c90-8400-4774-92f9-c603a9bcb0ee', CAST(15000.00 AS Decimal(18, 2)), N'', N'Bia Saigon', 4)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImage], [Price], [Capacity], [Description], [CategoryID]) VALUES (57, N'CocaCola', N'https://firebasestorage.googleapis.com/v0/b/bookingcamping-cc653.appspot.com/o/Product%2Fcoca.jpg?alt=media&token=b0341b25-2e67-4bc5-9e63-98d21096eb44', CAST(10000.00 AS Decimal(18, 2)), N'', N'Nước ngọt', 4)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImage], [Price], [Capacity], [Description], [CategoryID]) VALUES (58, N'Pesi', N'https://firebasestorage.googleapis.com/v0/b/bookingcamping-cc653.appspot.com/o/Product%2Fpesi.jpg?alt=media&token=389cc7a7-c213-49b4-a4a3-602be586bad8', CAST(10000.00 AS Decimal(18, 2)), N'', N'Nước ngọt', 4)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImage], [Price], [Capacity], [Description], [CategoryID]) VALUES (59, N'NuocSuoi', N'https://firebasestorage.googleapis.com/v0/b/bookingcamping-cc653.appspot.com/o/Product%2Fnuocsuoi.jpg?alt=media&token=743cddf4-1c6e-4a05-bb78-a8f9b7d9fc5f', CAST(5000.00 AS Decimal(18, 2)), N'', N'Nước suối', 4)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImage], [Price], [Capacity], [Description], [CategoryID]) VALUES (60, N'BanGhe', N'https://firebasestorage.googleapis.com/v0/b/bookingcamping-cc653.appspot.com/o/Product%2Fbanghe.jpg?alt=media&token=9207496c-fd1d-4847-9432-cc9a0a301079', CAST(100000.00 AS Decimal(18, 2)), N'4 người', N'Bàn ghế ', 5)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImage], [Price], [Capacity], [Description], [CategoryID]) VALUES (61, N'Den', N'https://firebasestorage.googleapis.com/v0/b/bookingcamping-cc653.appspot.com/o/Product%2Fden.jpg?alt=media&token=0030f0dc-27a8-4f79-ae86-244b711e67f7', CAST(100000.00 AS Decimal(18, 2)), N'', N'Đèn chiếu sáng ', 5)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImage], [Price], [Capacity], [Description], [CategoryID]) VALUES (62, N'Quat', N'https://firebasestorage.googleapis.com/v0/b/bookingcamping-cc653.appspot.com/o/Product%2Fquat.jpg?alt=media&token=ace7cc6b-9c22-460c-8232-11c6a6733ad7', CAST(50000.00 AS Decimal(18, 2)), N'', N'Máy quạt', 5)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImage], [Price], [Capacity], [Description], [CategoryID]) VALUES (63, N'LoNuong', N'https://firebasestorage.googleapis.com/v0/b/bookingcamping-cc653.appspot.com/o/Product%2Flonuong.jpg?alt=media&token=7b05b964-44df-4987-bb53-0a833b816f51', CAST(50000.00 AS Decimal(18, 2)), N'', N'Lò nướng', 5)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImage], [Price], [Capacity], [Description], [CategoryID]) VALUES (64, N'MaiChe', N'https://firebasestorage.googleapis.com/v0/b/bookingcamping-cc653.appspot.com/o/Product%2Fmaiche.jpg?alt=media&token=c5244bbf-2859-4595-9148-d6e71dc842b6', CAST(50000.00 AS Decimal(18, 2)), N'', N'Mái che', 5)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImage], [Price], [Capacity], [Description], [CategoryID]) VALUES (65, N'Than', N'https://firebasestorage.googleapis.com/v0/b/bookingcamping-cc653.appspot.com/o/Product%2Fthan.jpg?alt=media&token=704907a2-2993-44e2-97b1-473898683f1b', CAST(20000.00 AS Decimal(18, 2)), N'', N'Than', 5)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImage], [Price], [Capacity], [Description], [CategoryID]) VALUES (66, N'DaUongNuoc', N'https://firebasestorage.googleapis.com/v0/b/bookingcamping-cc653.appspot.com/o/Product%2Fdalanh.jpg?alt=media&token=1f34c502-da62-4ed5-b916-cc318e8cd6ef', CAST(45000.00 AS Decimal(18, 2)), N'', N'Đá lạnh', 5)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImage], [Price], [Capacity], [Description], [CategoryID]) VALUES (67, N'ThuyenSup', N'https://firebasestorage.googleapis.com/v0/b/bookingcamping-cc653.appspot.com/o/Product%2Fsup.jpg?alt=media&token=73361dea-921b-44ea-b8fa-6ea1ebfbe64a', CAST(250000.00 AS Decimal(18, 2)), N'2-3 người', N'Thuyền Sup', 6)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductImage], [Price], [Capacity], [Description], [CategoryID]) VALUES (68, N'ThuyenKayak', N'https://firebasestorage.googleapis.com/v0/b/bookingcamping-cc653.appspot.com/o/Product%2Fkayak.jpg?alt=media&token=34fc33dc-c11f-434a-951a-6c481cb2cb0e', CAST(350000.00 AS Decimal(18, 2)), N'2 người', N'Thuyền Kayak', 6)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (2, N'Employee')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (3, N'Customer')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Tents] ON 

INSERT [dbo].[Tents] ([TentID], [TentName], [Capacity], [Description], [PricePerNight], [LocationID], [ProductID], [TentCoordinateX], [TentCoordinateY], [PaymentStatus]) VALUES (1, N'tent1', N'tent1', N'tent1', CAST(10000.00 AS Decimal(18, 2)), 1, 35, 202, 394, 1)
INSERT [dbo].[Tents] ([TentID], [TentName], [Capacity], [Description], [PricePerNight], [LocationID], [ProductID], [TentCoordinateX], [TentCoordinateY], [PaymentStatus]) VALUES (2, N'tent2', N'tent2', N'tent2', CAST(10000.00 AS Decimal(18, 2)), 2, 35, 519, 120, 1)
INSERT [dbo].[Tents] ([TentID], [TentName], [Capacity], [Description], [PricePerNight], [LocationID], [ProductID], [TentCoordinateX], [TentCoordinateY], [PaymentStatus]) VALUES (3, N'tent3', N'tent1', N'tent3', CAST(15000.00 AS Decimal(18, 2)), 3, 35, 246, 419, 1)
INSERT [dbo].[Tents] ([TentID], [TentName], [Capacity], [Description], [PricePerNight], [LocationID], [ProductID], [TentCoordinateX], [TentCoordinateY], [PaymentStatus]) VALUES (5, N'tent4', N'tent4', N'tent4', CAST(12000.00 AS Decimal(18, 2)), 4, 36, 92, 91, 1)
INSERT [dbo].[Tents] ([TentID], [TentName], [Capacity], [Description], [PricePerNight], [LocationID], [ProductID], [TentCoordinateX], [TentCoordinateY], [PaymentStatus]) VALUES (7, N'tent5', N'tent5', N'tent5', CAST(20000.00 AS Decimal(18, 2)), 5, 35, 158, 169, 1)
INSERT [dbo].[Tents] ([TentID], [TentName], [Capacity], [Description], [PricePerNight], [LocationID], [ProductID], [TentCoordinateX], [TentCoordinateY], [PaymentStatus]) VALUES (8, N'tent6', N'tent6', N'tent6', CAST(20000.00 AS Decimal(18, 2)), 6, 35, 228, 169, 1)
INSERT [dbo].[Tents] ([TentID], [TentName], [Capacity], [Description], [PricePerNight], [LocationID], [ProductID], [TentCoordinateX], [TentCoordinateY], [PaymentStatus]) VALUES (9, N'tent7', N'tent7', N'tent7', CAST(20000.00 AS Decimal(18, 2)), 7, 35, 24, 214, 1)
INSERT [dbo].[Tents] ([TentID], [TentName], [Capacity], [Description], [PricePerNight], [LocationID], [ProductID], [TentCoordinateX], [TentCoordinateY], [PaymentStatus]) VALUES (10, N'tent8', N'tent8', N'tent8', CAST(20000.00 AS Decimal(18, 2)), 8, 35, 299, 173, 1)
INSERT [dbo].[Tents] ([TentID], [TentName], [Capacity], [Description], [PricePerNight], [LocationID], [ProductID], [TentCoordinateX], [TentCoordinateY], [PaymentStatus]) VALUES (11, N'tent9', N'tent9', N'tent9', CAST(20000.00 AS Decimal(18, 2)), 9, 35, 526, 355, 0)
INSERT [dbo].[Tents] ([TentID], [TentName], [Capacity], [Description], [PricePerNight], [LocationID], [ProductID], [TentCoordinateX], [TentCoordinateY], [PaymentStatus]) VALUES (12, N'tent10', N'tent10', N'tent10', CAST(20000.00 AS Decimal(18, 2)), 10, 35, 35, 440, 1)
SET IDENTITY_INSERT [dbo].[Tents] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [UserName], [PasswordHash], [PasswordSatl], [RefreshToken], [TokenCreatedAt], [TokenExpiresAt], [PhoneNumber], [FullName], [Image], [RoleID]) VALUES (3, N'admin', 0xC7091F5793406C2E76C3D04E610DB61D6E9F1B3376E6D719078F25520032FF9833D7A27D06978C9BE7BAC58105E64C8ABA537CD042FFB3A4909B47B9B70D9DA2, 0x2E6743F4319B1E1314079A1FF846EC79558D485B136BB23DCE40C9DA09A2F62E0DC50CB72376A1A25E96ED4870F0214C536A22807832D6E3AC2ECAC3B91F709EB087CD79ECF66D844F1547F4056F5FF22CF23629CE4F400783490EFAA811E09A3BB9581A567F3ADA5429E9DB216C1F488AA01E3F60DBE4EA752C3C7D86EDAC57, N'MHXjaoMw3SMpdOulFkgI7EIZAEUmNQO8Thmxb5NkUusTN5C+YPBFEpvCZf1YfVtFFjt0LpmK1FAsLv2D7PVZLw==', CAST(N'2024-03-26T19:49:40.7577517' AS DateTime2), CAST(N'2024-04-02T19:49:40.7577515' AS DateTime2), N'0388475798', N'Phạm Quốc Toàn', N'string', 1)
INSERT [dbo].[Users] ([UserID], [UserName], [PasswordHash], [PasswordSatl], [RefreshToken], [TokenCreatedAt], [TokenExpiresAt], [PhoneNumber], [FullName], [Image], [RoleID]) VALUES (4, N'kenppi', 0x944792467BAEE5D02E437EABF6F615D15114B74748623FACA30227705E6C292940AAC257567ABDDBB4E8A559955C3F0334F47C72F25F313872128967026074CC, 0x199C6BB3EEBAB7C377A73CAF8413ABB7548910DBAF9C58FC197515F0E435AA63988ABE13BF3154D73B47135D5B38E91F9BBEBB17F6CED69277BB377CCA56CB3BDDB023E1CA369B0B89E66D337624A7B48F7E4E47AFF0D5D2BE98BD77C2F67BC670DC4D2897F2DB9756DF58F33DC1E549AAA3AC05ED794D970A8F6A9C9075E67D, N'MTcKXTH7cQimAT0ecyntNoSGUnyIh/UcVVGSoEQc2vt/82+veTiKlVY5hYZQsSwBYLru7B4QgYVgkBx98JY5DA==', CAST(N'2024-04-19T10:31:55.9187362' AS DateTime2), CAST(N'2024-04-26T10:31:55.9187358' AS DateTime2), N'213', N'string', N'string', 1)
INSERT [dbo].[Users] ([UserID], [UserName], [PasswordHash], [PasswordSatl], [RefreshToken], [TokenCreatedAt], [TokenExpiresAt], [PhoneNumber], [FullName], [Image], [RoleID]) VALUES (5, N'kenppi1269', 0xAB08956C3547EC7470C91EC8A589E252F64CBEE1FAA5B79291F8FD083755A442D75A8DAD2BFCE9E58140B90C41AF187F0CE1E33175D4C7936A61F8714ECC1BE8, 0xE06FE2F0537B8F662316BF858939E0F867BCAB54C8334EB66A3D1AA659A559BF70D9A02CC1BA634D035AB21580EA9C9649F3B81069078915C3AD5F49F039FCC3608E496D2E34729F9D97C589E096A243AEA7E1C00EDD22CD72ACA9060459766870AACD970D6A2C22DCB05BF4ED9F67463247DE84AB22246BA559EA40A7A7AF4C, N'HhbOQRBH8mNd4USi5ajEIVk1/YKQJNmrBuxoTANRUgproxq27BQyjQJq+1nknYUXQSLXthKoxtFasw0kDkM2tw==', CAST(N'2024-04-21T09:24:30.3981929' AS DateTime2), CAST(N'2024-04-28T09:24:30.3979631' AS DateTime2), N'0123', N'anh nguyen', N'hinh', 3)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Admins]  WITH CHECK ADD  CONSTRAINT [FK_Admins_Users_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Admins] CHECK CONSTRAINT [FK_Admins_Users_UserID]
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_Customers_CustomerID] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Bookings] CHECK CONSTRAINT [FK_Bookings_Customers_CustomerID]
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_Locations_LocationID] FOREIGN KEY([LocationID])
REFERENCES [dbo].[Locations] ([LocationID])
GO
ALTER TABLE [dbo].[Bookings] CHECK CONSTRAINT [FK_Bookings_Locations_LocationID]
GO
ALTER TABLE [dbo].[CampsiteCalendars]  WITH CHECK ADD  CONSTRAINT [FK_CampsiteCalendars_Locations_LocationID] FOREIGN KEY([LocationID])
REFERENCES [dbo].[Locations] ([LocationID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CampsiteCalendars] CHECK CONSTRAINT [FK_CampsiteCalendars_Locations_LocationID]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_Users_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_Users_UserID]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Users_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Users_UserID]
GO
ALTER TABLE [dbo].[Feedbacks]  WITH CHECK ADD  CONSTRAINT [FK_Feedbacks_Customers_CustomerID] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Feedbacks] CHECK CONSTRAINT [FK_Feedbacks_Customers_CustomerID]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Locations_LocationID] FOREIGN KEY([LocationID])
REFERENCES [dbo].[Locations] ([LocationID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Locations_LocationID]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders_OrderID]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products_ProductID] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products_ProductID]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers_CustomerID] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers_CustomerID]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Employees_EmployeeID] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Employees_EmployeeID]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories_CategoryID] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories_CategoryID]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles_RoleID] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles_RoleID]
GO
USE [master]
GO
ALTER DATABASE [BookingCampingDb] SET  READ_WRITE 
GO
