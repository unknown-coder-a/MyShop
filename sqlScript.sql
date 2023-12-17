USE [master]
GO
/****** Object:  Database [MyShop]    Script Date: 18/12/2023 12:35:33 AM ******/
CREATE DATABASE [MyShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MyShop', FILENAME = N'C:\Users\cvtai\MyShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MyShop_log', FILENAME = N'C:\Users\cvtai\MyShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MyShop] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MyShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MyShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MyShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MyShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MyShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MyShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [MyShop] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [MyShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MyShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MyShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MyShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MyShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MyShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MyShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MyShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MyShop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MyShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MyShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MyShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MyShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MyShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MyShop] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [MyShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MyShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MyShop] SET  MULTI_USER 
GO
ALTER DATABASE [MyShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MyShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MyShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MyShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MyShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MyShop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MyShop] SET QUERY_STORE = OFF
GO
USE [MyShop]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 18/12/2023 12:35:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 18/12/2023 12:35:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 18/12/2023 12:35:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Quantity] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
	[ImportPrice] [int] NOT NULL,
	[SalePrice] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 18/12/2023 12:35:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderPlaced] [datetime2](7) NOT NULL,
	[OrderFulfilled] [datetime2](7) NULL,
	[CustomerId] [int] NOT NULL,
	[Payment] [int] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 18/12/2023 12:35:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[SalePrice] [decimal](6, 2) NOT NULL,
	[ImportPrice] [decimal](18, 2) NOT NULL,
	[Quantity] [int] NOT NULL,
	[CategoryId] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name]) VALUES (1, N'Laptop')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (2, N'Monitor')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (3, N'Mouse')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (4, N'Keyboard')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (5, N'Ram')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (6, N'Speaker')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([Id], [FirstName], [LastName], [Address], [Phone], [Email]) VALUES (1, N'John', N'Doe', N'123 Main St, Cityville', N'+1 555-1234', N'john.doe@email.com')
INSERT [dbo].[Customers] ([Id], [FirstName], [LastName], [Address], [Phone], [Email]) VALUES (2, N'Jane', N'Smith', N'456 Oak Ave, Townsville', N'+1 555-5678', N'jane.smith@email.com')
INSERT [dbo].[Customers] ([Id], [FirstName], [LastName], [Address], [Phone], [Email]) VALUES (3, N'Bob', N'Johnson', N'789 Pine Rd, Villagetown', N'+1 555-9012', N'bob.johnson@email.com')
INSERT [dbo].[Customers] ([Id], [FirstName], [LastName], [Address], [Phone], [Email]) VALUES (4, N'Alice', N'Williams', N'101 Elm Blvd, Hamletville', N'+1 555-3456', N'alice.williams@email.com')
INSERT [dbo].[Customers] ([Id], [FirstName], [LastName], [Address], [Phone], [Email]) VALUES (5, N'Charlie', N'Brown', N'202 Maple Ln, Riverside', N'+1 555-7890', N'charlie.brown@email.com')
INSERT [dbo].[Customers] ([Id], [FirstName], [LastName], [Address], [Phone], [Email]) VALUES (6, N'Eva', N'Davis', N'303 Birch Dr, Lakeside', N'+1 555-2345', N'eva.davis@email.com')
INSERT [dbo].[Customers] ([Id], [FirstName], [LastName], [Address], [Phone], [Email]) VALUES (7, N'Michael', N'Miller', N'404 Cedar St, Hilltop', N'+1 555-5678', N'michael.miller@email.com')
INSERT [dbo].[Customers] ([Id], [FirstName], [LastName], [Address], [Phone], [Email]) VALUES (8, N'Emily', N'Taylor', N'505 Pine Ave, Lakeshore', N'+1 555-9012', N'emily.taylor@email.com')
INSERT [dbo].[Customers] ([Id], [FirstName], [LastName], [Address], [Phone], [Email]) VALUES (9, N'Daniel', N'Anderson', N'606 Oak Blvd, Mountainside', N'+1 555-1234', N'daniel.anderson@email.com')
INSERT [dbo].[Customers] ([Id], [FirstName], [LastName], [Address], [Phone], [Email]) VALUES (10, N'Olivia', N'Moore', N'707 Maple Rd, Valleytown', N'+1 555-3456', N'olivia.moore@email.com')
INSERT [dbo].[Customers] ([Id], [FirstName], [LastName], [Address], [Phone], [Email]) VALUES (11, N'David', N'White', N'808 Birch Pkwy, Riverside', N'+1 555-7890', N'david.white@email.com')
INSERT [dbo].[Customers] ([Id], [FirstName], [LastName], [Address], [Phone], [Email]) VALUES (12, N'Sophia', N'Martin', N'909 Elm Dr, Hillside', N'+1 555-2345', N'sophia.martin@email.com')
INSERT [dbo].[Customers] ([Id], [FirstName], [LastName], [Address], [Phone], [Email]) VALUES (13, N'William', N'Wilson', N'111 Oak St, Cityville', N'+1 555-1111', N'william.wilson@email.com')
INSERT [dbo].[Customers] ([Id], [FirstName], [LastName], [Address], [Phone], [Email]) VALUES (14, N'Emma', N'Jones', N'222 Pine Ave, Townsville', N'+1 555-2222', N'emma.jones@email.com')
INSERT [dbo].[Customers] ([Id], [FirstName], [LastName], [Address], [Phone], [Email]) VALUES (15, N'Christopher', N'Brown', N'333 Cedar Rd, Villagetown', N'+1 555-3333', N'christopher.brown@email.com')
INSERT [dbo].[Customers] ([Id], [FirstName], [LastName], [Address], [Phone], [Email]) VALUES (16, N'Ava', N'Davis', N'444 Maple Blvd, Hamletville', N'+1 555-4444', N'ava.davis@email.com')
INSERT [dbo].[Customers] ([Id], [FirstName], [LastName], [Address], [Phone], [Email]) VALUES (17, N'James', N'Taylor', N'555 Birch Ln, Riverside', N'+1 555-5555', N'james.taylor@email.com')
INSERT [dbo].[Customers] ([Id], [FirstName], [LastName], [Address], [Phone], [Email]) VALUES (18, N'Grace', N'Smith', N'666 Elm Dr, Lakeside', N'+1 555-6666', N'grace.smith@email.com')
INSERT [dbo].[Customers] ([Id], [FirstName], [LastName], [Address], [Phone], [Email]) VALUES (19, N'Joseph', N'Johnson', N'777 Pine Pkwy, Hilltop', N'+1 555-7777', N'joseph.johnson@email.com')
INSERT [dbo].[Customers] ([Id], [FirstName], [LastName], [Address], [Phone], [Email]) VALUES (20, N'Mia', N'Miller', N'888 Oak St, Lakeshore', N'+1 555-8888', N'mia.miller@email.com')
INSERT [dbo].[Customers] ([Id], [FirstName], [LastName], [Address], [Phone], [Email]) VALUES (21, N'Benjamin', N'Moore', N'999 Cedar Ave, Mountainside', N'+1 555-9999', N'benjamin.moore@email.com')
INSERT [dbo].[Customers] ([Id], [FirstName], [LastName], [Address], [Phone], [Email]) VALUES (22, N'Lily', N'Anderson', N'101 Maple Rd, Valleytown', N'+1 555-1010', N'lily.anderson@email.com')
INSERT [dbo].[Customers] ([Id], [FirstName], [LastName], [Address], [Phone], [Email]) VALUES (23, N'Elijah', N'White', N'202 Birch Blvd, Riverside', N'+1 555-2020', N'elijah.white@email.com')
INSERT [dbo].[Customers] ([Id], [FirstName], [LastName], [Address], [Phone], [Email]) VALUES (24, N'Charlotte', N'Martin', N'303 Elm Pkwy, Hillside', N'+1 555-3030', N'charlotte.martin@email.com')
INSERT [dbo].[Customers] ([Id], [FirstName], [LastName], [Address], [Phone], [Email]) VALUES (25, N'Daniel', N'Wilson', N'404 Oak St, Cityville', N'+1 555-4040', N'daniel.wilson@email.com')
INSERT [dbo].[Customers] ([Id], [FirstName], [LastName], [Address], [Phone], [Email]) VALUES (26, N'Avery', N'Jones', N'505 Pine Ave, Townsville', N'+1 555-5050', N'avery.jones@email.com')
INSERT [dbo].[Customers] ([Id], [FirstName], [LastName], [Address], [Phone], [Email]) VALUES (27, N'Isaac', N'Brown', N'606 Cedar Rd, Villagetown', N'+1 555-6060', N'isaac.brown@email.com')
INSERT [dbo].[Customers] ([Id], [FirstName], [LastName], [Address], [Phone], [Email]) VALUES (28, N'Hannah', N'Davis', N'707 Maple Blvd, Hamletville', N'+1 555-7070', N'hannah.davis@email.com')
INSERT [dbo].[Customers] ([Id], [FirstName], [LastName], [Address], [Phone], [Email]) VALUES (29, N'Samuel', N'Taylor', N'808 Birch Rd, Riverside', N'+1 555-8080', N'samuel.taylor@email.com')
INSERT [dbo].[Customers] ([Id], [FirstName], [LastName], [Address], [Phone], [Email]) VALUES (30, N'Evelyn', N'Smith', N'909 Elm Dr, Hillside', N'+1 555-9090', N'evelyn.smith@email.com')
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [OrderPlaced], [OrderFulfilled], [CustomerId], [Payment]) VALUES (1, CAST(N'2023-01-15T08:30:00.0000000' AS DateTime2), CAST(N'2023-01-16T12:45:00.0000000' AS DateTime2), 1, NULL)
INSERT [dbo].[Orders] ([Id], [OrderPlaced], [OrderFulfilled], [CustomerId], [Payment]) VALUES (2, CAST(N'2023-01-16T10:15:00.0000000' AS DateTime2), CAST(N'2023-01-17T14:20:00.0000000' AS DateTime2), 2, NULL)
INSERT [dbo].[Orders] ([Id], [OrderPlaced], [OrderFulfilled], [CustomerId], [Payment]) VALUES (3, CAST(N'2023-01-17T11:45:00.0000000' AS DateTime2), CAST(N'2023-01-18T16:30:00.0000000' AS DateTime2), 3, NULL)
INSERT [dbo].[Orders] ([Id], [OrderPlaced], [OrderFulfilled], [CustomerId], [Payment]) VALUES (4, CAST(N'2023-01-18T14:00:00.0000000' AS DateTime2), CAST(N'2023-01-19T18:15:00.0000000' AS DateTime2), 4, NULL)
INSERT [dbo].[Orders] ([Id], [OrderPlaced], [OrderFulfilled], [CustomerId], [Payment]) VALUES (5, CAST(N'2023-01-19T16:30:00.0000000' AS DateTime2), CAST(N'2023-01-20T20:45:00.0000000' AS DateTime2), 5, NULL)
INSERT [dbo].[Orders] ([Id], [OrderPlaced], [OrderFulfilled], [CustomerId], [Payment]) VALUES (6, CAST(N'2023-01-20T18:45:00.0000000' AS DateTime2), CAST(N'2023-01-21T22:00:00.0000000' AS DateTime2), 6, NULL)
INSERT [dbo].[Orders] ([Id], [OrderPlaced], [OrderFulfilled], [CustomerId], [Payment]) VALUES (7, CAST(N'2023-02-01T08:30:00.0000000' AS DateTime2), CAST(N'2023-02-02T12:45:00.0000000' AS DateTime2), 7, NULL)
INSERT [dbo].[Orders] ([Id], [OrderPlaced], [OrderFulfilled], [CustomerId], [Payment]) VALUES (8, CAST(N'2023-02-02T10:15:00.0000000' AS DateTime2), CAST(N'2023-02-03T14:20:00.0000000' AS DateTime2), 12, NULL)
INSERT [dbo].[Orders] ([Id], [OrderPlaced], [OrderFulfilled], [CustomerId], [Payment]) VALUES (9, CAST(N'2023-02-03T11:45:00.0000000' AS DateTime2), CAST(N'2023-02-04T16:30:00.0000000' AS DateTime2), 18, NULL)
INSERT [dbo].[Orders] ([Id], [OrderPlaced], [OrderFulfilled], [CustomerId], [Payment]) VALUES (10, CAST(N'2023-02-04T14:00:00.0000000' AS DateTime2), CAST(N'2023-02-05T18:15:00.0000000' AS DateTime2), 25, NULL)
INSERT [dbo].[Orders] ([Id], [OrderPlaced], [OrderFulfilled], [CustomerId], [Payment]) VALUES (11, CAST(N'2023-02-05T16:30:00.0000000' AS DateTime2), CAST(N'2023-02-06T20:45:00.0000000' AS DateTime2), 30, NULL)
INSERT [dbo].[Orders] ([Id], [OrderPlaced], [OrderFulfilled], [CustomerId], [Payment]) VALUES (12, CAST(N'2023-02-06T18:45:00.0000000' AS DateTime2), CAST(N'2023-02-07T22:00:00.0000000' AS DateTime2), 9, NULL)
INSERT [dbo].[Orders] ([Id], [OrderPlaced], [OrderFulfilled], [CustomerId], [Payment]) VALUES (13, CAST(N'2023-02-07T09:30:00.0000000' AS DateTime2), CAST(N'2023-02-08T13:45:00.0000000' AS DateTime2), 15, NULL)
INSERT [dbo].[Orders] ([Id], [OrderPlaced], [OrderFulfilled], [CustomerId], [Payment]) VALUES (14, CAST(N'2023-02-08T11:15:00.0000000' AS DateTime2), CAST(N'2023-02-09T15:20:00.0000000' AS DateTime2), 21, NULL)
INSERT [dbo].[Orders] ([Id], [OrderPlaced], [OrderFulfilled], [CustomerId], [Payment]) VALUES (15, CAST(N'2023-02-09T12:45:00.0000000' AS DateTime2), CAST(N'2023-02-10T16:30:00.0000000' AS DateTime2), 27, NULL)
INSERT [dbo].[Orders] ([Id], [OrderPlaced], [OrderFulfilled], [CustomerId], [Payment]) VALUES (16, CAST(N'2023-02-10T14:00:00.0000000' AS DateTime2), CAST(N'2023-02-11T18:15:00.0000000' AS DateTime2), 4, NULL)
INSERT [dbo].[Orders] ([Id], [OrderPlaced], [OrderFulfilled], [CustomerId], [Payment]) VALUES (17, CAST(N'2023-02-11T15:30:00.0000000' AS DateTime2), CAST(N'2023-02-12T19:45:00.0000000' AS DateTime2), 11, NULL)
INSERT [dbo].[Orders] ([Id], [OrderPlaced], [OrderFulfilled], [CustomerId], [Payment]) VALUES (18, CAST(N'2023-02-12T18:00:00.0000000' AS DateTime2), CAST(N'2023-02-13T22:15:00.0000000' AS DateTime2), 28, NULL)
INSERT [dbo].[Orders] ([Id], [OrderPlaced], [OrderFulfilled], [CustomerId], [Payment]) VALUES (19, CAST(N'2023-02-13T20:15:00.0000000' AS DateTime2), CAST(N'2023-02-14T23:30:00.0000000' AS DateTime2), 16, NULL)
INSERT [dbo].[Orders] ([Id], [OrderPlaced], [OrderFulfilled], [CustomerId], [Payment]) VALUES (20, CAST(N'2023-02-14T22:30:00.0000000' AS DateTime2), CAST(N'2023-02-15T02:45:00.0000000' AS DateTime2), 23, NULL)
INSERT [dbo].[Orders] ([Id], [OrderPlaced], [OrderFulfilled], [CustomerId], [Payment]) VALUES (21, CAST(N'2023-02-15T00:45:00.0000000' AS DateTime2), CAST(N'2023-02-16T04:00:00.0000000' AS DateTime2), 5, NULL)
INSERT [dbo].[Orders] ([Id], [OrderPlaced], [OrderFulfilled], [CustomerId], [Payment]) VALUES (22, CAST(N'2023-02-16T02:00:00.0000000' AS DateTime2), CAST(N'2023-02-17T06:15:00.0000000' AS DateTime2), 13, NULL)
INSERT [dbo].[Orders] ([Id], [OrderPlaced], [OrderFulfilled], [CustomerId], [Payment]) VALUES (23, CAST(N'2023-02-17T08:30:00.0000000' AS DateTime2), CAST(N'2023-02-18T12:45:00.0000000' AS DateTime2), 19, NULL)
INSERT [dbo].[Orders] ([Id], [OrderPlaced], [OrderFulfilled], [CustomerId], [Payment]) VALUES (24, CAST(N'2023-02-18T10:15:00.0000000' AS DateTime2), CAST(N'2023-02-19T14:20:00.0000000' AS DateTime2), 26, NULL)
INSERT [dbo].[Orders] ([Id], [OrderPlaced], [OrderFulfilled], [CustomerId], [Payment]) VALUES (25, CAST(N'2023-02-19T11:45:00.0000000' AS DateTime2), CAST(N'2023-02-20T16:30:00.0000000' AS DateTime2), 3, NULL)
INSERT [dbo].[Orders] ([Id], [OrderPlaced], [OrderFulfilled], [CustomerId], [Payment]) VALUES (26, CAST(N'2023-02-20T14:00:00.0000000' AS DateTime2), CAST(N'2023-02-21T18:15:00.0000000' AS DateTime2), 10, NULL)
INSERT [dbo].[Orders] ([Id], [OrderPlaced], [OrderFulfilled], [CustomerId], [Payment]) VALUES (27, CAST(N'2023-02-22T09:30:00.0000000' AS DateTime2), CAST(N'2023-02-23T13:45:00.0000000' AS DateTime2), 14, NULL)
INSERT [dbo].[Orders] ([Id], [OrderPlaced], [OrderFulfilled], [CustomerId], [Payment]) VALUES (28, CAST(N'2023-02-23T11:15:00.0000000' AS DateTime2), CAST(N'2023-02-24T15:20:00.0000000' AS DateTime2), 22, NULL)
INSERT [dbo].[Orders] ([Id], [OrderPlaced], [OrderFulfilled], [CustomerId], [Payment]) VALUES (29, CAST(N'2023-02-24T12:45:00.0000000' AS DateTime2), CAST(N'2023-02-25T16:30:00.0000000' AS DateTime2), 29, NULL)
INSERT [dbo].[Orders] ([Id], [OrderPlaced], [OrderFulfilled], [CustomerId], [Payment]) VALUES (30, CAST(N'2023-02-25T14:00:00.0000000' AS DateTime2), CAST(N'2023-02-26T18:15:00.0000000' AS DateTime2), 6, NULL)
INSERT [dbo].[Orders] ([Id], [OrderPlaced], [OrderFulfilled], [CustomerId], [Payment]) VALUES (31, CAST(N'2023-02-26T15:30:00.0000000' AS DateTime2), CAST(N'2023-02-27T19:45:00.0000000' AS DateTime2), 17, NULL)
INSERT [dbo].[Orders] ([Id], [OrderPlaced], [OrderFulfilled], [CustomerId], [Payment]) VALUES (32, CAST(N'2023-02-27T18:00:00.0000000' AS DateTime2), CAST(N'2023-02-28T22:15:00.0000000' AS DateTime2), 2, NULL)
INSERT [dbo].[Orders] ([Id], [OrderPlaced], [OrderFulfilled], [CustomerId], [Payment]) VALUES (33, CAST(N'2023-02-28T20:15:00.0000000' AS DateTime2), CAST(N'2023-03-01T23:30:00.0000000' AS DateTime2), 24, NULL)
INSERT [dbo].[Orders] ([Id], [OrderPlaced], [OrderFulfilled], [CustomerId], [Payment]) VALUES (34, CAST(N'2023-03-01T22:30:00.0000000' AS DateTime2), CAST(N'2023-03-02T02:45:00.0000000' AS DateTime2), 8, NULL)
INSERT [dbo].[Orders] ([Id], [OrderPlaced], [OrderFulfilled], [CustomerId], [Payment]) VALUES (35, CAST(N'2023-03-02T00:45:00.0000000' AS DateTime2), CAST(N'2023-03-03T04:00:00.0000000' AS DateTime2), 20, NULL)
INSERT [dbo].[Orders] ([Id], [OrderPlaced], [OrderFulfilled], [CustomerId], [Payment]) VALUES (36, CAST(N'2023-03-03T02:00:00.0000000' AS DateTime2), CAST(N'2023-03-04T06:15:00.0000000' AS DateTime2), 16, NULL)
INSERT [dbo].[Orders] ([Id], [OrderPlaced], [OrderFulfilled], [CustomerId], [Payment]) VALUES (37, CAST(N'2023-03-04T08:30:00.0000000' AS DateTime2), CAST(N'2023-03-05T12:45:00.0000000' AS DateTime2), 30, NULL)
INSERT [dbo].[Orders] ([Id], [OrderPlaced], [OrderFulfilled], [CustomerId], [Payment]) VALUES (38, CAST(N'2023-03-05T10:15:00.0000000' AS DateTime2), CAST(N'2023-03-06T14:20:00.0000000' AS DateTime2), 12, NULL)
INSERT [dbo].[Orders] ([Id], [OrderPlaced], [OrderFulfilled], [CustomerId], [Payment]) VALUES (39, CAST(N'2023-03-06T11:45:00.0000000' AS DateTime2), CAST(N'2023-03-07T16:30:00.0000000' AS DateTime2), 26, NULL)
INSERT [dbo].[Orders] ([Id], [OrderPlaced], [OrderFulfilled], [CustomerId], [Payment]) VALUES (40, CAST(N'2023-03-07T14:00:00.0000000' AS DateTime2), CAST(N'2023-03-08T18:15:00.0000000' AS DateTime2), 4, NULL)
INSERT [dbo].[Orders] ([Id], [OrderPlaced], [OrderFulfilled], [CustomerId], [Payment]) VALUES (41, CAST(N'2023-03-08T15:30:00.0000000' AS DateTime2), CAST(N'2023-03-09T19:45:00.0000000' AS DateTime2), 10, NULL)
INSERT [dbo].[Orders] ([Id], [OrderPlaced], [OrderFulfilled], [CustomerId], [Payment]) VALUES (42, CAST(N'2023-03-09T18:00:00.0000000' AS DateTime2), CAST(N'2023-03-10T22:15:00.0000000' AS DateTime2), 18, NULL)
INSERT [dbo].[Orders] ([Id], [OrderPlaced], [OrderFulfilled], [CustomerId], [Payment]) VALUES (43, CAST(N'2023-03-10T20:15:00.0000000' AS DateTime2), CAST(N'2023-03-11T23:30:00.0000000' AS DateTime2), 25, NULL)
INSERT [dbo].[Orders] ([Id], [OrderPlaced], [OrderFulfilled], [CustomerId], [Payment]) VALUES (44, CAST(N'2023-03-11T22:30:00.0000000' AS DateTime2), CAST(N'2023-03-12T02:45:00.0000000' AS DateTime2), 5, NULL)
INSERT [dbo].[Orders] ([Id], [OrderPlaced], [OrderFulfilled], [CustomerId], [Payment]) VALUES (45, CAST(N'2023-03-12T00:45:00.0000000' AS DateTime2), CAST(N'2023-03-13T04:00:00.0000000' AS DateTime2), 13, NULL)
INSERT [dbo].[Orders] ([Id], [OrderPlaced], [OrderFulfilled], [CustomerId], [Payment]) VALUES (46, CAST(N'2023-03-13T02:00:00.0000000' AS DateTime2), CAST(N'2023-03-14T06:15:00.0000000' AS DateTime2), 21, NULL)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (35, N'Dell Inspiron', CAST(1200.00 AS Decimal(6, 2)), CAST(900.00 AS Decimal(18, 2)), 10, 1)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (36, N'Samsung Monitor', CAST(300.00 AS Decimal(6, 2)), CAST(220.00 AS Decimal(18, 2)), 15, 2)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (37, N'Logitech Wireless Mouse', CAST(20.00 AS Decimal(6, 2)), CAST(15.00 AS Decimal(18, 2)), 50, 3)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (38, N'Corsair Mechanical Keyboard', CAST(50.00 AS Decimal(6, 2)), CAST(35.00 AS Decimal(18, 2)), 25, 4)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (39, N'Crucial 8GB RAM', CAST(80.00 AS Decimal(6, 2)), CAST(60.00 AS Decimal(18, 2)), 30, 5)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (40, N'Bose Speakers', CAST(70.00 AS Decimal(6, 2)), CAST(50.00 AS Decimal(18, 2)), 20, 6)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (41, N'HP Pavilion', CAST(1300.00 AS Decimal(6, 2)), CAST(950.00 AS Decimal(18, 2)), 5, 1)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (42, N'LG UltraWide Monitor', CAST(350.00 AS Decimal(6, 2)), CAST(260.00 AS Decimal(18, 2)), 8, 2)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (43, N'Microsoft Wireless Mouse', CAST(25.00 AS Decimal(6, 2)), CAST(18.00 AS Decimal(18, 2)), 40, 3)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (44, N'Razer BlackWidow Keyboard', CAST(60.00 AS Decimal(6, 2)), CAST(42.00 AS Decimal(18, 2)), 20, 4)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (45, N'Kingston 16GB RAM', CAST(120.00 AS Decimal(6, 2)), CAST(90.00 AS Decimal(18, 2)), 15, 5)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (46, N'JBL Bluetooth Speakers', CAST(90.00 AS Decimal(6, 2)), CAST(65.00 AS Decimal(18, 2)), 15, 6)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (47, N'Lenovo ThinkPad', CAST(1400.00 AS Decimal(6, 2)), CAST(1000.00 AS Decimal(18, 2)), 7, 1)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (48, N'ASUS Gaming Monitor', CAST(320.00 AS Decimal(6, 2)), CAST(240.00 AS Decimal(18, 2)), 10, 2)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (49, N'SteelSeries Gaming Mouse', CAST(18.00 AS Decimal(6, 2)), CAST(12.00 AS Decimal(18, 2)), 60, 3)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (50, N'Corsair RGB Keyboard', CAST(55.00 AS Decimal(6, 2)), CAST(38.00 AS Decimal(18, 2)), 22, 4)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (51, N'G.SKILL 32GB RAM', CAST(180.00 AS Decimal(6, 2)), CAST(130.00 AS Decimal(18, 2)), 12, 5)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (52, N'Sony Bookshelf Speakers', CAST(80.00 AS Decimal(6, 2)), CAST(58.00 AS Decimal(18, 2)), 12, 6)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (53, N'Acer Aspire', CAST(1100.00 AS Decimal(6, 2)), CAST(850.00 AS Decimal(18, 2)), 8, 1)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (54, N'ViewSonic Gaming Monitor', CAST(380.00 AS Decimal(6, 2)), CAST(280.00 AS Decimal(18, 2)), 5, 2)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (55, N'Logitech Gaming Mouse', CAST(22.00 AS Decimal(6, 2)), CAST(16.00 AS Decimal(18, 2)), 45, 3)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (56, N'HyperX Mechanical Keyboard', CAST(65.00 AS Decimal(6, 2)), CAST(45.00 AS Decimal(18, 2)), 18, 4)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (57, N'Corsair 64GB RAM', CAST(250.00 AS Decimal(6, 2)), CAST(180.00 AS Decimal(18, 2)), 8, 5)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (58, N'Harman Kardon Speakers', CAST(95.00 AS Decimal(6, 2)), CAST(70.00 AS Decimal(18, 2)), 10, 6)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (59, N'MSI Gaming Laptop', CAST(1200.00 AS Decimal(6, 2)), CAST(900.00 AS Decimal(18, 2)), 6, 1)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (60, N'Dell Ultrasharp Monitor', CAST(300.00 AS Decimal(6, 2)), CAST(220.00 AS Decimal(18, 2)), 12, 2)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (61, N'Razer Naga Mouse', CAST(20.00 AS Decimal(6, 2)), CAST(15.00 AS Decimal(18, 2)), 50, 3)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (62, N'Apple Magic Keyboard', CAST(55.00 AS Decimal(6, 2)), CAST(40.00 AS Decimal(18, 2)), 20, 4)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (63, N'Corsair 128GB RAM', CAST(350.00 AS Decimal(6, 2)), CAST(260.00 AS Decimal(18, 2)), 5, 5)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (64, N'Bose SoundTouch Speakers', CAST(110.00 AS Decimal(6, 2)), CAST(80.00 AS Decimal(18, 2)), 8, 6)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (65, N'Lenovo Legion', CAST(1250.00 AS Decimal(6, 2)), CAST(920.00 AS Decimal(18, 2)), 9, 1)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (66, N'AOC Curved Monitor', CAST(370.00 AS Decimal(6, 2)), CAST(270.00 AS Decimal(18, 2)), 6, 2)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (67, N'SteelSeries Rival Mouse', CAST(24.00 AS Decimal(6, 2)), CAST(17.00 AS Decimal(18, 2)), 38, 3)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (68, N'Ducky Mechanical Keyboard', CAST(70.00 AS Decimal(6, 2)), CAST(50.00 AS Decimal(18, 2)), 15, 4)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (69, N'Crucial 256GB RAM', CAST(320.00 AS Decimal(6, 2)), CAST(240.00 AS Decimal(18, 2)), 10, 5)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (70, N'Sony SRS-X9 Speakers', CAST(120.00 AS Decimal(6, 2)), CAST(85.00 AS Decimal(18, 2)), 12, 6)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (71, N'HP EliteBook', CAST(1350.00 AS Decimal(6, 2)), CAST(980.00 AS Decimal(18, 2)), 7, 1)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (72, N'Dell Alienware Monitor', CAST(400.00 AS Decimal(6, 2)), CAST(290.00 AS Decimal(18, 2)), 5, 2)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (73, N'Logitech MX Master Mouse', CAST(28.00 AS Decimal(6, 2)), CAST(20.00 AS Decimal(18, 2)), 42, 3)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (74, N'Corsair K95 RGB Keyboard', CAST(75.00 AS Decimal(6, 2)), CAST(55.00 AS Decimal(18, 2)), 18, 4)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (75, N'Samsung 512GB RAM', CAST(380.00 AS Decimal(6, 2)), CAST(280.00 AS Decimal(18, 2)), 8, 5)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (76, N'Bose SoundLink Speakers', CAST(100.00 AS Decimal(6, 2)), CAST(75.00 AS Decimal(18, 2)), 10, 6)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (77, N'ASUS ROG Strix', CAST(1400.00 AS Decimal(6, 2)), CAST(1050.00 AS Decimal(18, 2)), 8, 1)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (78, N'LG 4K HDR Monitor', CAST(450.00 AS Decimal(6, 2)), CAST(320.00 AS Decimal(18, 2)), 5, 2)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (79, N'Corsair Harpoon Mouse', CAST(26.00 AS Decimal(6, 2)), CAST(18.00 AS Decimal(18, 2)), 35, 3)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (80, N'Razer Huntsman Keyboard', CAST(80.00 AS Decimal(6, 2)), CAST(60.00 AS Decimal(18, 2)), 20, 4)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (81, N'G.SKILL 512GB RAM', CAST(420.00 AS Decimal(6, 2)), CAST(310.00 AS Decimal(18, 2)), 7, 5)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (82, N'JBL Pulse Speakers', CAST(110.00 AS Decimal(6, 2)), CAST(85.00 AS Decimal(18, 2)), 12, 6)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (83, N'MSI GS66 Stealth', CAST(1500.00 AS Decimal(6, 2)), CAST(1100.00 AS Decimal(18, 2)), 6, 1)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (84, N'BenQ Gaming Monitor', CAST(420.00 AS Decimal(6, 2)), CAST(300.00 AS Decimal(18, 2)), 6, 2)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (85, N'Logitech G Pro Mouse', CAST(30.00 AS Decimal(6, 2)), CAST(22.00 AS Decimal(18, 2)), 40, 3)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (86, N'Ducky One 2 Mini Keyboard', CAST(85.00 AS Decimal(6, 2)), CAST(65.00 AS Decimal(18, 2)), 15, 4)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (87, N'HyperX 1TB RAM', CAST(500.00 AS Decimal(6, 2)), CAST(380.00 AS Decimal(18, 2)), 5, 5)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (88, N'Sonos Play:5 Speakers', CAST(250.00 AS Decimal(6, 2)), CAST(190.00 AS Decimal(18, 2)), 8, 6)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (89, N'Dell XPS', CAST(1600.00 AS Decimal(6, 2)), CAST(1200.00 AS Decimal(18, 2)), 10, 1)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (90, N'Samsung Odyssey Monitor', CAST(500.00 AS Decimal(6, 2)), CAST(380.00 AS Decimal(18, 2)), 8, 2)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (91, N'Razer DeathAdder Mouse', CAST(32.00 AS Decimal(6, 2)), CAST(24.00 AS Decimal(18, 2)), 30, 3)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (92, N'Apple Magic Keyboard Pro', CAST(90.00 AS Decimal(6, 2)), CAST(70.00 AS Decimal(18, 2)), 18, 4)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (93, N'Corsair 1TB NVMe SSD', CAST(550.00 AS Decimal(6, 2)), CAST(400.00 AS Decimal(18, 2)), 5, 5)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (94, N'Bose Soundbar 700', CAST(450.00 AS Decimal(6, 2)), CAST(350.00 AS Decimal(18, 2)), 10, 6)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (95, N'Lenovo ThinkPad X1 Carbon', CAST(1800.00 AS Decimal(6, 2)), CAST(1400.00 AS Decimal(18, 2)), 6, 1)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (96, N'Acer Predator Gaming Monitor', CAST(600.00 AS Decimal(6, 2)), CAST(450.00 AS Decimal(18, 2)), 7, 2)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (97, N'Logitech MX Anywhere Mouse', CAST(35.00 AS Decimal(6, 2)), CAST(28.00 AS Decimal(18, 2)), 25, 3)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (98, N'Mechanical Eagle Keyboard', CAST(70.00 AS Decimal(6, 2)), CAST(50.00 AS Decimal(18, 2)), 20, 4)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (99, N'Kingston 2TB SSD', CAST(700.00 AS Decimal(6, 2)), CAST(520.00 AS Decimal(18, 2)), 5, 5)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (100, N'Sonos Beam Soundbar', CAST(380.00 AS Decimal(6, 2)), CAST(300.00 AS Decimal(18, 2)), 8, 6)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (101, N'Dell XPS', CAST(1600.00 AS Decimal(6, 2)), CAST(1200.00 AS Decimal(18, 2)), 10, 1)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (102, N'Samsung Odyssey Monitor', CAST(500.00 AS Decimal(6, 2)), CAST(380.00 AS Decimal(18, 2)), 8, 2)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (103, N'Razer DeathAdder Mouse', CAST(32.00 AS Decimal(6, 2)), CAST(24.00 AS Decimal(18, 2)), 30, 3)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (104, N'Apple Magic Keyboard Pro', CAST(90.00 AS Decimal(6, 2)), CAST(70.00 AS Decimal(18, 2)), 18, 4)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (105, N'Corsair 1TB NVMe SSD', CAST(550.00 AS Decimal(6, 2)), CAST(400.00 AS Decimal(18, 2)), 5, 5)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (106, N'Bose Soundbar 700', CAST(450.00 AS Decimal(6, 2)), CAST(350.00 AS Decimal(18, 2)), 10, 6)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (107, N'Lenovo ThinkPad X1 Carbon', CAST(1800.00 AS Decimal(6, 2)), CAST(1400.00 AS Decimal(18, 2)), 6, 1)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (108, N'Acer Predator Gaming Monitor', CAST(600.00 AS Decimal(6, 2)), CAST(450.00 AS Decimal(18, 2)), 7, 2)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (109, N'Logitech MX Anywhere Mouse', CAST(35.00 AS Decimal(6, 2)), CAST(28.00 AS Decimal(18, 2)), 25, 3)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (110, N'Mechanical Eagle Keyboard', CAST(70.00 AS Decimal(6, 2)), CAST(50.00 AS Decimal(18, 2)), 20, 4)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (111, N'Kingston 2TB SSD', CAST(700.00 AS Decimal(6, 2)), CAST(520.00 AS Decimal(18, 2)), 5, 5)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (112, N'Sonos Beam Soundbar', CAST(380.00 AS Decimal(6, 2)), CAST(300.00 AS Decimal(18, 2)), 8, 6)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (113, N'Alienware m17 R4', CAST(2000.00 AS Decimal(6, 2)), CAST(1500.00 AS Decimal(18, 2)), 5, 1)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (114, N'LG UltraFine 5K Monitor', CAST(800.00 AS Decimal(6, 2)), CAST(600.00 AS Decimal(18, 2)), 4, 2)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (115, N'Logitech G Pro X Superlight', CAST(40.00 AS Decimal(6, 2)), CAST(30.00 AS Decimal(18, 2)), 20, 3)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (116, N'SteelSeries Apex Pro', CAST(100.00 AS Decimal(6, 2)), CAST(80.00 AS Decimal(18, 2)), 12, 4)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (117, N'Corsair 4TB NVMe SSD', CAST(1200.00 AS Decimal(6, 2)), CAST(900.00 AS Decimal(18, 2)), 3, 5)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (118, N'Sony WH-1000XM4 Headphones', CAST(300.00 AS Decimal(6, 2)), CAST(220.00 AS Decimal(18, 2)), 8, 6)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (119, N'MSI GE76 Raider', CAST(1800.00 AS Decimal(6, 2)), CAST(1300.00 AS Decimal(18, 2)), 6, 1)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (120, N'Dell Alienware AW3420DW', CAST(1200.00 AS Decimal(6, 2)), CAST(900.00 AS Decimal(18, 2)), 5, 2)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (121, N'Razer Basilisk Ultimate', CAST(50.00 AS Decimal(6, 2)), CAST(40.00 AS Decimal(18, 2)), 15, 3)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (122, N'HyperX Alloy FPS Pro', CAST(80.00 AS Decimal(6, 2)), CAST(60.00 AS Decimal(18, 2)), 18, 4)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (123, N'Samsung 8TB SSD', CAST(1600.00 AS Decimal(6, 2)), CAST(1200.00 AS Decimal(18, 2)), 4, 5)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (124, N'Bose Home Speaker 500', CAST(400.00 AS Decimal(6, 2)), CAST(300.00 AS Decimal(18, 2)), 6, 6)
INSERT [dbo].[Products] ([Id], [Name], [SalePrice], [ImportPrice], [Quantity], [CategoryId]) VALUES (125, N'Acer Aspire Black', CAST(1200.00 AS Decimal(6, 2)), CAST(850.00 AS Decimal(18, 2)), 10, 1)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
/****** Object:  Index [IX_OrderDetails_OrderId]    Script Date: 18/12/2023 12:35:33 AM ******/
CREATE NONCLUSTERED INDEX [IX_OrderDetails_OrderId] ON [dbo].[OrderDetails]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderDetails_ProductId]    Script Date: 18/12/2023 12:35:33 AM ******/
CREATE NONCLUSTERED INDEX [IX_OrderDetails_ProductId] ON [dbo].[OrderDetails]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Orders_CustomerId]    Script Date: 18/12/2023 12:35:33 AM ******/
CREATE NONCLUSTERED INDEX [IX_Orders_CustomerId] ON [dbo].[Orders]
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_CategoryId]    Script Date: 18/12/2023 12:35:33 AM ******/
CREATE NONCLUSTERED INDEX [IX_Products_CategoryId] ON [dbo].[Products]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OrderDetails] ADD  DEFAULT ((0)) FOR [ImportPrice]
GO
ALTER TABLE [dbo].[OrderDetails] ADD  DEFAULT ((0)) FOR [SalePrice]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0.0)) FOR [ImportPrice]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders_OrderId]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products_ProductId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers_CustomerId] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers_CustomerId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories_CategoryId]
GO
USE [master]
GO
ALTER DATABASE [MyShop] SET  READ_WRITE 
GO
