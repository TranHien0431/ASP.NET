USE [master]
GO
/****** Object:  Database [WebsiteASP_NET]    Script Date: 1/15/2025 2:02:12 PM ******/
CREATE DATABASE [WebsiteASP_NET]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WebsiteASP_NET', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\WebsiteASP_NET.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WebsiteASP_NET_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\WebsiteASP_NET_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [WebsiteASP_NET] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WebsiteASP_NET].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WebsiteASP_NET] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WebsiteASP_NET] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WebsiteASP_NET] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WebsiteASP_NET] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WebsiteASP_NET] SET ARITHABORT OFF 
GO
ALTER DATABASE [WebsiteASP_NET] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [WebsiteASP_NET] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WebsiteASP_NET] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WebsiteASP_NET] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WebsiteASP_NET] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WebsiteASP_NET] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WebsiteASP_NET] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WebsiteASP_NET] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WebsiteASP_NET] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WebsiteASP_NET] SET  ENABLE_BROKER 
GO
ALTER DATABASE [WebsiteASP_NET] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WebsiteASP_NET] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WebsiteASP_NET] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WebsiteASP_NET] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WebsiteASP_NET] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WebsiteASP_NET] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WebsiteASP_NET] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WebsiteASP_NET] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WebsiteASP_NET] SET  MULTI_USER 
GO
ALTER DATABASE [WebsiteASP_NET] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WebsiteASP_NET] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WebsiteASP_NET] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WebsiteASP_NET] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WebsiteASP_NET] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WebsiteASP_NET] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [WebsiteASP_NET] SET QUERY_STORE = ON
GO
ALTER DATABASE [WebsiteASP_NET] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [WebsiteASP_NET]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 1/15/2025 2:02:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Avatar] [nvarchar](100) NULL,
	[Slug] [varchar](100) NULL,
	[ShowOnHomePage] [bit] NULL,
	[DisplayOrder] [int] NULL,
	[CreatedOnUtc] [datetime] NULL,
	[UpdatedOnUtc] [datetime] NULL,
	[Deleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 1/15/2025 2:02:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Avatar] [nchar](100) NULL,
	[Slug] [varchar](100) NULL,
	[ShowOnHomePage] [bit] NULL,
	[DisplayOrder] [int] NULL,
	[Deleted] [bit] NULL,
	[CreatedOnUtc] [datetime] NULL,
	[UpdatedOnUtc] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 1/15/2025 2:02:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[UserId] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[CreatedOnUtc] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 1/15/2025 2:02:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 1/15/2025 2:02:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Avatar] [nchar](100) NULL,
	[CategoryId] [int] NULL,
	[ShortDes] [nvarchar](100) NULL,
	[FullDescription] [nvarchar](500) NULL,
	[Price] [float] NULL,
	[PriceDiscount] [float] NULL,
	[TypeId] [int] NULL,
	[Slug] [varchar](50) NULL,
	[BrandId] [int] NULL,
	[Deleted] [bit] NULL,
	[ShowOnHomePage] [bit] NULL,
	[DisplayOrder] [int] NULL,
	[CreatedOnUtc] [datetime] NULL,
	[UpdatedOnUtc] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 1/15/2025 2:02:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[IsAdmin] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Deleted]) VALUES (1, N'TeeLab', N'aothun.jpg', N'TeeLab', 1, 1, CAST(N'2024-12-16T09:07:38.627' AS DateTime), NULL, 0)
INSERT [dbo].[Brand] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Deleted]) VALUES (2, N'Ninomaxx', N'ao.jpg', N'Ninomaxx', 1, 2, CAST(N'2024-12-16T09:07:38.627' AS DateTime), NULL, 0)
INSERT [dbo].[Brand] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Deleted]) VALUES (3, N'Vascara', N'aopolo.jpg', N'Vascara', 1, 3, CAST(N'2024-12-16T09:07:38.627' AS DateTime), NULL, 0)
INSERT [dbo].[Brand] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Deleted]) VALUES (4, N'Canifa', N'quan.jpg', N'Canifa', 1, 4, CAST(N'2024-12-16T09:07:38.627' AS DateTime), NULL, 0)
INSERT [dbo].[Brand] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [Deleted]) VALUES (5, N'Lyn', N'chanvay.jpg', N'Chân váy', 1, 5, CAST(N'2024-12-16T09:07:38.627' AS DateTime), NULL, 0)
SET IDENTITY_INSERT [dbo].[Brand] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (1, N'Áo thun ', N'22.jpg                                                                                              ', N'Ao thun ngan tay', 1, 1, 0, CAST(N'2024-12-16T09:07:47.050' AS DateTime), NULL)
INSERT [dbo].[Category] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (2, N'Áo Khoác ', N'77.jpg                                                                                              ', N'Am ap bao ve tien dung phong cach thoi trang', 1, 2, 0, CAST(N'2024-12-16T09:07:47.050' AS DateTime), NULL)
INSERT [dbo].[Category] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (3, N'Mũ', N'7.jpg                                                                                               ', N'Diu dang nu tinh quyen ru thanh lich linh hoat', 1, 3, 0, CAST(N'2024-12-16T09:07:47.050' AS DateTime), NULL)
INSERT [dbo].[Category] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (4, N'Chân váy', N'19.jpg                                                                                              ', N'
Bao ve thoi trang ca tinh tien loi phong cach', 1, 4, 0, CAST(N'2024-12-16T09:07:47.050' AS DateTime), NULL)
INSERT [dbo].[Category] ([Id], [Name], [Avatar], [Slug], [ShowOnHomePage], [DisplayOrder], [Deleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (5, N'Áo CropTop', N'18.jpg                                                                                              ', N'Thoi thuong tre trung thoai mai phong cach nang dong', 1, 5, 0, CAST(N'2024-12-16T09:07:47.050' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (1, N'DonHang-20241225152034', 9, 17, CAST(N'2024-12-25T15:20:34.987' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (2, N'DonHang-20241225154039', 9, 17, CAST(N'2024-12-25T15:40:39.757' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (3, N'DonHang-20241225154630', 9, 17, CAST(N'2024-12-25T15:46:30.797' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (4, N'DonHang-20241225155938', 9, 17, CAST(N'2024-12-25T15:59:38.037' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (5, N'DonHang-20241228102654', 9, 17, CAST(N'2024-12-28T10:26:54.267' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (6, N'DonHang-20241228102702', 9, 17, CAST(N'2024-12-28T10:27:02.973' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (7, N'DonHang-20241228102758', 9, 17, CAST(N'2024-12-28T10:27:58.747' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (8, N'DonHang-20241230110557', 9, 17, CAST(N'2024-12-30T11:05:57.723' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (9, N'DonHang-20241230121400', 9, 17, CAST(N'2024-12-30T12:14:00.667' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (10, N'DonHang-20241230144116', 9, 17, CAST(N'2024-12-30T14:41:16.497' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (11, N'DonHang-20241230155059', 9, 17, CAST(N'2024-12-30T15:50:59.100' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (12, N'DonHang-20241230160736', 10, 17, CAST(N'2024-12-30T16:07:36.547' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (13, N'DonHang-20250113145248', 14, 17, CAST(N'2025-01-13T14:52:48.047' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (14, N'DonHang-20250114094014', 13, 17, CAST(N'2025-01-14T09:40:14.007' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (15, N'DonHang-20250114223044', 14, 17, CAST(N'2025-01-14T22:30:44.117' AS DateTime))
INSERT [dbo].[Order] ([Id], [Name], [UserId], [Status], [CreatedOnUtc]) VALUES (16, N'DonHang-20250115135247', 15, 17, CAST(N'2025-01-15T13:52:47.083' AS DateTime))
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (1, 1, 3, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (2, 2, 5, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (3, 3, 5, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (4, 4, 3, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (5, 5, 3, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (6, 6, 3, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (7, 7, 3, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (8, 8, 5, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (9, 9, 5, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (10, 10, 3, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (11, 11, 5, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (12, 12, 2, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (13, 13, 3, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (14, 14, 3, 3)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (15, 15, 3, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (16, 16, 2, 1)
INSERT [dbo].[OrderDetail] ([Id], [OrderId], [ProductId], [Quantity]) VALUES (17, 16, 3, 1)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (1, N'Áo hoodie local brand', N'5.jpg                                                                                               ', 2, N'Áo thun local brand: Đơn giản, trẻ trung, chất liệu thoáng mát.', N'Được chăm chút từ chất liệu, form dáng, đường may, hình in cho đến khâu đóng gói và hậu mãi, chiếc áo cao cấp này sẽ làm hài lòng cả những ', 100000, 100000, 1, N'Áo Local Brand', 2, 0, 1, 1, CAST(N'2024-12-16T09:08:10.017' AS DateTime), CAST(N'2024-12-16T09:10:38.790' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (2, N'Áo thun đen', N'4b.jpg                                                                                              ', 1, N'Áo sơ mi local brand: Lịch lãm, thoải mái, phù hợp môi trường công sở', N'Có thêm các chi tiết như kẻ sọc, hoa văn, hoặc logo thêu.
Tạo điểm nhấn cho trang phục, phù hợp với phong cách thời trang sáng tạo.', 345000, 345000, 1, N'Áo thun', 5, 0, 1, 1, CAST(N'2024-12-16T09:08:10.017' AS DateTime), CAST(N'2024-12-16T09:10:38.790' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (3, N'Áo local brand', N'4a.jpg                                                                                              ', 1, N'Áo hoodie local brand: Ấm áp, cá tính, thiết kế năng động, thời trang.', N'Phù hợp cho thời tiết mát mẻ hoặc các dịp trang trọng hơn.', 435000, 435000, 2, N'Áo Local Brand', 5, 0, 1, 1, CAST(N'2024-12-16T09:08:10.017' AS DateTime), CAST(N'2024-12-16T09:10:38.790' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (4, N'Áo Polo Teelab Basic', N'4c.jpg                                                                                              ', 1, N'Áo polo local brand: Gọn gàng, thanh lịch, dễ phối đồ, thoải mái mặc', N'Thiết kế cơ bản với cổ bẻ, nút cài ở phần cổ.Thường được làm từ chất liệu cotton hoặc pique, thoáng mát, phù hợp với nhiều dịp.', 235000, 235000, 1, N'Áo Polo', 1, 0, 1, 1, CAST(N'2024-12-16T09:08:10.017' AS DateTime), CAST(N'2024-12-16T09:10:38.790' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (5, N'Áo Polo Teelab Essential', N'4f.jpg                                                                                              ', 1, N'Áo croptop local brand: Quyến rũ, năng động, form dáng thoải mái, trẻ trung', N'Chất liệu co giãn, thấm hút mồ hôi tốt như polyester hoặc spandex.Thường được dùng trong các hoạt động thể thao như golf, tennis.', 367000, 367000, 2, N'Áo Polo', 1, 0, 1, 1, CAST(N'2024-12-16T09:08:10.017' AS DateTime), CAST(N'2024-12-16T09:10:38.790' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (6, N'Áo Polo Teelab Essential', N'4g.jpg                                                                                              ', 1, N'Áo tank top local brand: Mát mẻ, khỏe khoắn, phù hợp mùa hè năng động', N'Thiết kế ôm sát cơ thể, tôn dáng người mặc.
Phù hợp cho những người yêu thích phong cách trẻ trung, hiện đại.', 450000, 450000, 2, N'Áo Polo', 1, 0, 1, 1, CAST(N'2024-12-16T09:08:10.017' AS DateTime), CAST(N'2024-12-16T09:10:38.790' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (7, N'Áo Polo Teelab Basic', N'4f.jpg                                                                                              ', 1, N'Áo cardigan local brand: Nhẹ nhàng, dễ phối đồ, phong cách hiện đạ', N'Có thiết kế tương tự áo polo cổ điển nhưng tay áo dài.
Phù hợp cho thời tiết mát mẻ hoặc các dịp trang trọng hơn', 340000, 340000, 2, N'Áo Polo', 1, 0, 1, 1, CAST(N'2024-12-16T09:13:08.947' AS DateTime), CAST(N'2024-12-16T09:14:11.077' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (8, N'Áo Polo Teelab Simple', N'4b.jpg                                                                                              ', 1, N'Áo len local brand: Ấm áp, mềm mại, thiết kế độc đáo, chất lượng tố', N'Biến tấu hiện đại, không có cổ bẻ, tạo vẻ trẻ trung và cá tính.
Phù hợp với phong cách năng động, thường được mặc đi chơi hoặc dạo phố.', 565000, 565000, 2, N'Áo Polo', 1, 0, 1, 1, CAST(N'2024-12-16T09:13:08.947' AS DateTime), CAST(N'2024-12-16T09:14:11.077' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (10, N'Chân váy', N'3.jpg                                                                                               ', 4, N'Chân váy mini', N'
Chân váy ngắn trẻ trung, thanh lịch, tôn dáng, đa phong cách', 200000, 200000, 1, N'Chân váy', 4, 0, 1, 1, CAST(N'2024-12-30T00:00:00.000' AS DateTime), CAST(N'2024-12-30T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (11, N'Áo croptop thể thao', N'1.jpg                                                                                               ', 5, N'Là kiểu áo croptop được thiết kế dành cho các hoạt động thể thao', N'ó mang lại sự thoải mái và linh hoạt, phù hợp khi tập gym, yoga, hoặc các môn thể thao khác.', 130000, 130000, 1, N'Áo Croptop', 4, 0, 1, 1, CAST(N'2024-12-30T00:00:00.000' AS DateTime), CAST(N'2024-12-30T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (12, N'Áo croptop ôm', N'1a.jpg                                                                                              ', 5, N'Đây là kiểu áo croptop với phần cổ được thiết kế theo kiểu yếm', N'Đây là kiểu áo croptop với phần cổ được thiết kế theo kiểu yếm, giúp khoe vai và lưng một cách gợi cảm. Phù hợp cho mùa hè hoặc các dịp đi chơi, dạo phố.', 200000, 200000, 1, N'Áo Croptop', 4, 0, 1, 1, CAST(N'2024-12-30T00:00:00.000' AS DateTime), CAST(N'2024-12-30T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (14, N'Áo croptop dáng suông', N'1c.jpg                                                                                              ', 5, N'Kiểu áo này có dáng suông, không ôm sát cơ thể', N'Kiểu áo này có dáng suông, không ôm sát cơ thể, tạo cảm giác thoải mái và dễ chịu. Thường được làm từ các chất liệu mềm mại như cotton, linen. ', 300000, 300000, 1, N'Áo Croptop', 3, 0, 1, 1, CAST(N'2024-12-30T00:00:00.000' AS DateTime), CAST(N'2024-12-30T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (15, N'Áo khoác bomber', N'6.jpg                                                                                               ', 2, N'Áo khoác bomber có thiết kế ngắn và dáng ôm', N'Áo khoác bomber có thể có phần cổ áo cao và tay áo bo chun, mang lại vẻ năng động và cá tính.', 450000, 450000, 2, N'Áo Croptop', 2, 0, 1, 1, CAST(N'2024-12-30T00:00:00.000' AS DateTime), CAST(N'2024-12-30T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (16, N'Áo khoác denim', N'6a.jpg                                                                                              ', 2, N'Là áo khoác được làm từ chất liệu vải denim', N'Áo khoác denim là một item cổ điển trong tủ đồ của nhiều người, có thể dễ dàng phối hợp với quần jeans hoặc váy để tạo ra phong cách casual, thoải mái.', 230000, 230000, 2, N'Áo Croptop', 2, 0, 1, 1, CAST(N'2024-12-30T00:00:00.000' AS DateTime), CAST(N'2024-12-30T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (17, N'Áo khoác cardigan', N'6b.jpg                                                                                              ', 2, N'Là kiểu áo khoác mỏng, thường được làm từ chất liệu len hoặc cotton', N'Cardigan là lựa chọn hoàn hảo cho mùa thu hoặc khi cần thêm lớp ấm áp mà không quá dày, dễ dàng phối hợp với nhiều trang phục khác nhau.', 400000, 400000, 2, N'Áo Croptop', 2, 0, 1, 1, CAST(N'2024-12-30T00:00:00.000' AS DateTime), CAST(N'2024-12-30T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (18, N'Chân váy chữ A ', N'3a.jpg                                                                                              ', 4, N'Chân váy có dáng chữ A, rộng ở dưới và thon dần lên trên, phù hợp với nhiều dáng người.', N'Chân váy chữ A là lựa chọn tuyệt vời cho những ai muốn che khuyết điểm hông lớn và tạo sự mềm mại.', 230000, 230000, 2, N'Chân váy', 3, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (19, N'Chân váy xòe ', N'3b.jpg                                                                                              ', 4, N'Chân váy xòe ', N'Chân váy xòe rộng từ eo xuống dưới, với độ xòe nhiều giúp tạo sự nữ tính và dễ thương. Thiết kế này rất thoải mái và dễ dàng di chuyển.', 250000, 250000, 2, N'Chân váy', 3, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (23, N'Chân váy thể thao', N'3c.jpg                                                                                              ', 4, N'Dáng váy ngắn, xòe rộng, thường được làm từ chất liệu vải co giãn', N'Chân váy thể thao mang đến vẻ năng động và dễ chịu, phù hợp cho những ai yêu thích phong cách thể thao.', 300000, 300000, 2, N'Chân váy', 3, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (24, N'Mũ fedora', N'7.jpg                                                                                               ', 3, N'Phong cách thanh lịch, thời trang công sở, dạo phố.', N'Mũ fedora có phần vành mềm và uốn cong nhẹ, phần trên của mũ thường làm từ len hoặc vải dạ. Mũ này có vẻ ngoài cổ điển và sang trọng', 150000, 150000, 1, N'Mu', 5, 0, 1, 1, NULL, NULL)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [CategoryId], [ShortDes], [FullDescription], [Price], [PriceDiscount], [TypeId], [Slug], [BrandId], [Deleted], [ShowOnHomePage], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (25, N'Mũ beanie', N'7a.jpg                                                                                              ', 3, N'Mùa đông, phong cách thoải mái, thể thao, đi chơi.', N'Mũ beanie là loại mũ ôm sát đầu, thường làm từ len hoặc sợi dệt kim, giúp giữ ấm trong mùa đông. Mũ này không có vành', 200000, 200000, 1, N'Mu', NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (1, N'Ðang', N'Nguy?n', N'dangnguyen@example.com', N'dang123', 0)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (2, N'Hoa', N'Tr?n', N'hoatran@example.com', N'hoa123', 0)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (3, N'H?i', N'Lê', N'haile@example.com', N'hai123', 0)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (5, N'Phúc', N'Ph?m', N'phucpham@example.com', N'phuc123', 0)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (7, N'Hien', N'Tran', N'tranthihien@gmail.com', N'202cb962ac59075b964b07152d234b70', 0)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (8, N'Dung', N'Tran', N'tranhien@gmail.com', N'81dc9bdb52d04dc20036dbd8313ed055', 0)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (9, N'ThiHien', N'Tran', N'tranthihien123@gmail.com', N'81dc9bdb52d04dc20036dbd8313ed055', 0)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (10, N'Hi?n', N'Tr?n', N'hien@gmail.com', N'81dc9bdb52d04dc20036dbd8313ed055', 0)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (11, N'Hien', N'Tran', N'tranthihien@gmail.com', N'pmWkWSBCL51Bfkhn79xPuKBKHz//H6B+mY6G9/eieuM=', 0)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (12, N'Hien', N'Tran', N'tranthihien12a2pbc@gmail.com', N'pmWkWSBCL51Bfkhn79xPuKBKHz//H6B+mY6G9/eieuM=', 0)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (13, N'HienTran', N'Tran', N'tranthihien02@gmail.com', N'827ccb0eea8a706c4c34a16891f84e7b', 0)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (14, N'Hien', N'Tran', N'tranthihien02022004@gmail.com', N'e10adc3949ba59abbe56e057f20f883e', 1)
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [Password], [IsAdmin]) VALUES (15, N'Hien', N'TranThi  ', N'tranthihien022004@gmail.com', N'827ccb0eea8a706c4c34a16891f84e7b', NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brand] ([Id])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1:Giảm giá sốc, 2:Đề xuất' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Product', @level2type=N'COLUMN',@level2name=N'TypeId'
GO
USE [master]
GO
ALTER DATABASE [WebsiteASP_NET] SET  READ_WRITE 
GO
