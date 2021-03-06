USE [master]
GO
/****** Object:  Database [BitCoin]    Script Date: 6/2/2016 5:25:49 PM ******/
CREATE DATABASE [BitCoin]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BitCoin', FILENAME = N'C:\Users\KNguyen04.VIETNAM\BitCoin.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BitCoin_log', FILENAME = N'C:\Users\KNguyen04.VIETNAM\BitCoin_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BitCoin] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BitCoin].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BitCoin] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BitCoin] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BitCoin] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BitCoin] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BitCoin] SET ARITHABORT OFF 
GO
ALTER DATABASE [BitCoin] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BitCoin] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [BitCoin] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BitCoin] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BitCoin] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BitCoin] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BitCoin] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BitCoin] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BitCoin] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BitCoin] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BitCoin] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BitCoin] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BitCoin] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BitCoin] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BitCoin] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BitCoin] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BitCoin] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BitCoin] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BitCoin] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BitCoin] SET  MULTI_USER 
GO
ALTER DATABASE [BitCoin] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BitCoin] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BitCoin] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BitCoin] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [BitCoin]
GO
/****** Object:  Table [dbo].[AdminUser]    Script Date: 6/2/2016 5:25:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AdminUser](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](256) NOT NULL,
	[Email] [varchar](256) NOT NULL,
	[FullName] [varchar](100) NULL,
	[Active] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Bank]    Script Date: 6/2/2016 5:25:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bank](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[AccountName] [varchar](250) NOT NULL,
	[BitcoinAddress] [varchar](250) NOT NULL,
 CONSTRAINT [PK_Bank] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Commission]    Script Date: 6/2/2016 5:25:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Commission](
	[CommissionId] [int] IDENTITY(1,1) NOT NULL,
	[FromUserId] [int] NOT NULL,
	[ToUserId] [int] NOT NULL,
	[CommissionPrice] [float] NOT NULL,
	[CommissionDate] [datetime] NOT NULL,
	[CommissionType] [int] NOT NULL,
 CONSTRAINT [PK_Commission] PRIMARY KEY CLUSTERED 
(
	[CommissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Level]    Script Date: 6/2/2016 5:25:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Level](
	[LevelID] [int] NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[Status] [bit] NOT NULL,
	[Rate] [float] NOT NULL,
	[PersonNumber] [int] NOT NULL,
 CONSTRAINT [PK_Level] PRIMARY KEY CLUSTERED 
(
	[LevelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order]    Script Date: 6/2/2016 5:25:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Order](
	[OrderCode] [varchar](10) NOT NULL,
	[UserID] [int] NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[RemainingAmount] [decimal](18, 2) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Status] [tinyint] NOT NULL,
	[OrderNumber] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](5) NOT NULL,
	[BitcoinAddress] [varchar](250) NULL,
	[LastOrderCode] [varchar](10) NULL,
 CONSTRAINT [PK_Bid] PRIMARY KEY CLUSTERED 
(
	[OrderCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 6/2/2016 5:25:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderDetailCode] [varchar](10) NOT NULL,
	[PHOrderCode] [varchar](10) NOT NULL,
	[GHOrderCode] [varchar](10) NOT NULL,
	[SenderId] [int] NOT NULL,
	[ReceiverId] [int] NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[Confirmation] [nvarchar](max) NULL,
	[Status] [tinyint] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[OrderNumber] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK__OrderDet__6AC97AB8774BEC40] PRIMARY KEY CLUSTERED 
(
	[OrderDetailCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PipCoin]    Script Date: 6/2/2016 5:25:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PipCoin](
	[PipCoinId] [int] IDENTITY(1,1) NOT NULL,
	[OrderCode] [varchar](10) NOT NULL,
	[Amount] [float] NOT NULL,
	[Type] [int] NOT NULL,
	[InterestByDay] [float] NOT NULL,
	[DateCreate] [datetime] NOT NULL,
 CONSTRAINT [PK_PipCoin] PRIMARY KEY CLUSTERED 
(
	[PipCoinId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 6/2/2016 5:25:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[SponsorID] [nvarchar](250) NOT NULL,
	[EmailID] [nvarchar](250) NOT NULL,
	[Currency] [int] NOT NULL,
	[MobileNo] [nvarchar](50) NOT NULL,
	[AssociateName] [nvarchar](250) NOT NULL,
	[Country] [nvarchar](250) NOT NULL,
	[State] [nvarchar](250) NOT NULL,
	[City] [nvarchar](250) NOT NULL,
	[Password] [nvarchar](250) NOT NULL,
	[Status] [tinyint] NOT NULL,
	[FullName] [nvarchar](250) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LevelID] [int] NULL,
	[Rate] [float] NULL,
 CONSTRAINT [PK_User_1] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[AdminUser] ON 

INSERT [dbo].[AdminUser] ([Id], [UserName], [Password], [Email], [FullName], [Active]) VALUES (7, N'admin', N'e10adc3949ba59abbe56e057f20f883e', N'admin@admin.com', N'Admin', 1)
SET IDENTITY_INSERT [dbo].[AdminUser] OFF
SET IDENTITY_INSERT [dbo].[Bank] ON 

INSERT [dbo].[Bank] ([Id], [UserID], [AccountName], [BitcoinAddress]) VALUES (12, 4, N'Nguyen Superman', N'H2812hjasdu9G627sadjh22h1jsudqwx23875sd235gh456')
INSERT [dbo].[Bank] ([Id], [UserID], [AccountName], [BitcoinAddress]) VALUES (14, 3, N'Do Man', N'1EdgdFmtXkfgubJYDnJjHYyqK8CQPtCbJ2')
INSERT [dbo].[Bank] ([Id], [UserID], [AccountName], [BitcoinAddress]) VALUES (15, 5, N'Lu', N'H32948fe2384908qdGTwuHHgtw78172418Hhst312442')
SET IDENTITY_INSERT [dbo].[Bank] OFF
SET IDENTITY_INSERT [dbo].[Commission] ON 

INSERT [dbo].[Commission] ([CommissionId], [FromUserId], [ToUserId], [CommissionPrice], [CommissionDate], [CommissionType]) VALUES (5, 5, 3, 0.15000000596046448, CAST(0x0000A60F0187B08D AS DateTime), 0)
INSERT [dbo].[Commission] ([CommissionId], [FromUserId], [ToUserId], [CommissionPrice], [CommissionDate], [CommissionType]) VALUES (6, 9, 13, 0.15000000596046448, CAST(0x0000A60F018805F4 AS DateTime), 1)
INSERT [dbo].[Commission] ([CommissionId], [FromUserId], [ToUserId], [CommissionPrice], [CommissionDate], [CommissionType]) VALUES (7, 13, 3, 0.022500000894069672, CAST(0x0000A60F018805F6 AS DateTime), 2)
INSERT [dbo].[Commission] ([CommissionId], [FromUserId], [ToUserId], [CommissionPrice], [CommissionDate], [CommissionType]) VALUES (8, 9, 13, 0.015000000596046448, CAST(0x0000A60F01884549 AS DateTime), 1)
INSERT [dbo].[Commission] ([CommissionId], [FromUserId], [ToUserId], [CommissionPrice], [CommissionDate], [CommissionType]) VALUES (9, 13, 3, 0.0022500001359730959, CAST(0x0000A60F0188454B AS DateTime), 2)
INSERT [dbo].[Commission] ([CommissionId], [FromUserId], [ToUserId], [CommissionPrice], [CommissionDate], [CommissionType]) VALUES (10, 5, 3, 0.015000000596046448, CAST(0x0000A61000107E7F AS DateTime), 1)
INSERT [dbo].[Commission] ([CommissionId], [FromUserId], [ToUserId], [CommissionPrice], [CommissionDate], [CommissionType]) VALUES (11, 5, 3, 0.060000002384185791, CAST(0x0000A61000192EEF AS DateTime), 1)
INSERT [dbo].[Commission] ([CommissionId], [FromUserId], [ToUserId], [CommissionPrice], [CommissionDate], [CommissionType]) VALUES (12, 5, 3, 0.0099999997764825821, CAST(0x0000A614000715ED AS DateTime), 1)
INSERT [dbo].[Commission] ([CommissionId], [FromUserId], [ToUserId], [CommissionPrice], [CommissionDate], [CommissionType]) VALUES (13, 7, 3, 0.0099999997764825821, CAST(0x0000A6140008D0CF AS DateTime), 1)
INSERT [dbo].[Commission] ([CommissionId], [FromUserId], [ToUserId], [CommissionPrice], [CommissionDate], [CommissionType]) VALUES (14, 8, 3, 0.0099999997764825821, CAST(0x0000A6140009D9D9 AS DateTime), 1)
INSERT [dbo].[Commission] ([CommissionId], [FromUserId], [ToUserId], [CommissionPrice], [CommissionDate], [CommissionType]) VALUES (15, 9, 13, 0.015000000596046448, CAST(0x0000A6140009DFBA AS DateTime), 1)
INSERT [dbo].[Commission] ([CommissionId], [FromUserId], [ToUserId], [CommissionPrice], [CommissionDate], [CommissionType]) VALUES (16, 13, 3, 0.001500000013038516, CAST(0x0000A6140009DFBB AS DateTime), 2)
INSERT [dbo].[Commission] ([CommissionId], [FromUserId], [ToUserId], [CommissionPrice], [CommissionDate], [CommissionType]) VALUES (17, 9, 13, 0.015000000596046448, CAST(0x0000A614000A07DF AS DateTime), 1)
INSERT [dbo].[Commission] ([CommissionId], [FromUserId], [ToUserId], [CommissionPrice], [CommissionDate], [CommissionType]) VALUES (18, 13, 3, 0.001500000013038516, CAST(0x0000A614000A07E7 AS DateTime), 2)
INSERT [dbo].[Commission] ([CommissionId], [FromUserId], [ToUserId], [CommissionPrice], [CommissionDate], [CommissionType]) VALUES (19, 13, 3, 0.0099999997764825821, CAST(0x0000A614000EF7F9 AS DateTime), 1)
INSERT [dbo].[Commission] ([CommissionId], [FromUserId], [ToUserId], [CommissionPrice], [CommissionDate], [CommissionType]) VALUES (20, 9, 13, 0.060000002384185791, CAST(0x0000A6140017C82D AS DateTime), 1)
INSERT [dbo].[Commission] ([CommissionId], [FromUserId], [ToUserId], [CommissionPrice], [CommissionDate], [CommissionType]) VALUES (21, 13, 3, 0.0060000000521540642, CAST(0x0000A6140017C831 AS DateTime), 2)
INSERT [dbo].[Commission] ([CommissionId], [FromUserId], [ToUserId], [CommissionPrice], [CommissionDate], [CommissionType]) VALUES (22, 8, 3, 0.0099999997764825821, CAST(0x0000A61400FB59E7 AS DateTime), 1)
INSERT [dbo].[Commission] ([CommissionId], [FromUserId], [ToUserId], [CommissionPrice], [CommissionDate], [CommissionType]) VALUES (23, 7, 3, 0.0099999997764825821, CAST(0x0000A61400FB67A9 AS DateTime), 1)
INSERT [dbo].[Commission] ([CommissionId], [FromUserId], [ToUserId], [CommissionPrice], [CommissionDate], [CommissionType]) VALUES (24, 5, 3, 0.0099999997764825821, CAST(0x0000A61400FB799B AS DateTime), 1)
INSERT [dbo].[Commission] ([CommissionId], [FromUserId], [ToUserId], [CommissionPrice], [CommissionDate], [CommissionType]) VALUES (25, 5, 3, 0.0099999997764825821, CAST(0x0000A614010FED79 AS DateTime), 1)
INSERT [dbo].[Commission] ([CommissionId], [FromUserId], [ToUserId], [CommissionPrice], [CommissionDate], [CommissionType]) VALUES (26, 5, 3, 0.0099999997764825821, CAST(0x0000A614011035E9 AS DateTime), 1)
INSERT [dbo].[Commission] ([CommissionId], [FromUserId], [ToUserId], [CommissionPrice], [CommissionDate], [CommissionType]) VALUES (27, 5, 3, 0.0099999997764825821, CAST(0x0000A6140110C4C9 AS DateTime), 1)
INSERT [dbo].[Commission] ([CommissionId], [FromUserId], [ToUserId], [CommissionPrice], [CommissionDate], [CommissionType]) VALUES (28, 5, 3, 0.0099999997764825821, CAST(0x0000A614011218EA AS DateTime), 1)
INSERT [dbo].[Commission] ([CommissionId], [FromUserId], [ToUserId], [CommissionPrice], [CommissionDate], [CommissionType]) VALUES (29, 8, 3, 0.0099999997764825821, CAST(0x0000A619009CE42E AS DateTime), 1)
INSERT [dbo].[Commission] ([CommissionId], [FromUserId], [ToUserId], [CommissionPrice], [CommissionDate], [CommissionType]) VALUES (30, 7, 3, 0.0099999997764825821, CAST(0x0000A619009CE8F8 AS DateTime), 1)
INSERT [dbo].[Commission] ([CommissionId], [FromUserId], [ToUserId], [CommissionPrice], [CommissionDate], [CommissionType]) VALUES (31, 5, 3, 0.0099999997764825821, CAST(0x0000A619009CF80C AS DateTime), 1)
INSERT [dbo].[Commission] ([CommissionId], [FromUserId], [ToUserId], [CommissionPrice], [CommissionDate], [CommissionType]) VALUES (32, 10, 3, 0.0099999997764825821, CAST(0x0000A61900AF24E0 AS DateTime), 1)
INSERT [dbo].[Commission] ([CommissionId], [FromUserId], [ToUserId], [CommissionPrice], [CommissionDate], [CommissionType]) VALUES (33, 5, 3, 0.0099999997764825821, CAST(0x0000A61900DD78D6 AS DateTime), 1)
INSERT [dbo].[Commission] ([CommissionId], [FromUserId], [ToUserId], [CommissionPrice], [CommissionDate], [CommissionType]) VALUES (34, 5, 3, 0.039999999105930328, CAST(0x0000A61900DDD605 AS DateTime), 1)
INSERT [dbo].[Commission] ([CommissionId], [FromUserId], [ToUserId], [CommissionPrice], [CommissionDate], [CommissionType]) VALUES (35, 5, 3, 0.0099999997764825821, CAST(0x0000A61900DF9884 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Commission] OFF
INSERT [dbo].[Level] ([LevelID], [Name], [Status], [Rate], [PersonNumber]) VALUES (1, N'Level giới thiệu', 1, 15, 5)
INSERT [dbo].[Level] ([LevelID], [Name], [Status], [Rate], [PersonNumber]) VALUES (2, N'Level 2', 1, 10, 3)
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderCode], [UserID], [Amount], [RemainingAmount], [CreateDate], [Status], [OrderNumber], [Type], [BitcoinAddress], [LastOrderCode]) VALUES (N'1111111111', 3, CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(0x0000A60E00000000 AS DateTime), 0, 1039, N'GH', N'1EdgdFmtXkfgubJYDnJjHYyqK8CQPtCbJ2', NULL)
INSERT [dbo].[Order] ([OrderCode], [UserID], [Amount], [RemainingAmount], [CreateDate], [Status], [OrderNumber], [Type], [BitcoinAddress], [LastOrderCode]) VALUES (N'2377275387', 14, CAST(0.50 AS Decimal(18, 2)), CAST(0.50 AS Decimal(18, 2)), CAST(0x0000A6190117A3A2 AS DateTime), 0, 3076, N'PH', NULL, N'2377275387')
SET IDENTITY_INSERT [dbo].[Order] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [SponsorID], [EmailID], [Currency], [MobileNo], [AssociateName], [Country], [State], [City], [Password], [Status], [FullName], [CreateDate], [LevelID], [Rate]) VALUES (3, N'dbman.online@gmail.com', N'dbman.neobux@gmail.com', 1, N'0906367747', N'', N'+84', N'Ho Chi Minh', N'Ho Chi Minh', N'e10adc3949ba59abbe56e057f20f883e', 1, N'Do Ba Man', CAST(0x0000A5F7010AEEB9 AS DateTime), 2, NULL)
INSERT [dbo].[User] ([UserID], [SponsorID], [EmailID], [Currency], [MobileNo], [AssociateName], [Country], [State], [City], [Password], [Status], [FullName], [CreateDate], [LevelID], [Rate]) VALUES (4, N'dbman.online@photographer.com', N'superman@marvel.com', 1, N'123456789', N'SuperMan', N'Vietnam', N'Ha Noi', N'Ha Noi', N'e10adc3949ba59abbe56e057f20f883e', 1, N'Nguyen Superman', CAST(0x0000A48800000000 AS DateTime), 1, NULL)
INSERT [dbo].[User] ([UserID], [SponsorID], [EmailID], [Currency], [MobileNo], [AssociateName], [Country], [State], [City], [Password], [Status], [FullName], [CreateDate], [LevelID], [Rate]) VALUES (5, N'dbman.neobux@gmail.com', N'dbman.link@gmail.com', 1, N'0123456789', N'', N'+84', N'Ho chi Minh', N'Ho Chi Minh', N'e10adc3949ba59abbe56e057f20f883e', 1, N'Đỗ Mẫn', CAST(0x0000A5F701566B9E AS DateTime), 1, NULL)
INSERT [dbo].[User] ([UserID], [SponsorID], [EmailID], [Currency], [MobileNo], [AssociateName], [Country], [State], [City], [Password], [Status], [FullName], [CreateDate], [LevelID], [Rate]) VALUES (6, N'dkm@pro.com', N'batman@propro.com', 1, N'342343432', N'Alibaba', N'Vietnam', N'Ho Chi Minh', N'Ho Chi Minh', N'e10adc3949ba59abbe56e057f20f883e', 1, N'Nguyen Van A', CAST(0x0000A5F700000000 AS DateTime), 1, NULL)
INSERT [dbo].[User] ([UserID], [SponsorID], [EmailID], [Currency], [MobileNo], [AssociateName], [Country], [State], [City], [Password], [Status], [FullName], [CreateDate], [LevelID], [Rate]) VALUES (7, N'dbman.neobux@gmail.com', N'dbman.link2@gmail.com', 1, N'0123456789', N'', N'+84', N'Ho chi Minh', N'Ho Chi Minh', N'e10adc3949ba59abbe56e057f20f883e', 1, N'dbman2', CAST(0x0000A5F701566A98 AS DateTime), 1, NULL)
INSERT [dbo].[User] ([UserID], [SponsorID], [EmailID], [Currency], [MobileNo], [AssociateName], [Country], [State], [City], [Password], [Status], [FullName], [CreateDate], [LevelID], [Rate]) VALUES (8, N'dbman.neobux@gmail.com', N'dbman.link3@gmail.com', 1, N'0123456789', N'', N'+84', N'Ho chi Minh', N'Ho Chi Minh', N'e10adc3949ba59abbe56e057f20f883e', 1, N'dbman3', CAST(0x0000A5F701566A98 AS DateTime), 1, NULL)
INSERT [dbo].[User] ([UserID], [SponsorID], [EmailID], [Currency], [MobileNo], [AssociateName], [Country], [State], [City], [Password], [Status], [FullName], [CreateDate], [LevelID], [Rate]) VALUES (9, N'dbman.link1@gmail.com', N'dbman.link4@gmail.com', 1, N'0123456789', N'', N'+84', N'Ho chi Minh', N'Ho Chi Minh', N'e10adc3949ba59abbe56e057f20f883e', 1, N'dbman4', CAST(0x0000A5F701566A98 AS DateTime), 1, NULL)
INSERT [dbo].[User] ([UserID], [SponsorID], [EmailID], [Currency], [MobileNo], [AssociateName], [Country], [State], [City], [Password], [Status], [FullName], [CreateDate], [LevelID], [Rate]) VALUES (10, N'dbman.neobux@gmail.com', N'dbman.link5@gmail.com', 1, N'0123456789', N'', N'+84', N'Ho chi Minh', N'Ho Chi Minh', N'e10adc3949ba59abbe56e057f20f883e', 1, N'dbman5', CAST(0x0000A5F701566A98 AS DateTime), 1, NULL)
INSERT [dbo].[User] ([UserID], [SponsorID], [EmailID], [Currency], [MobileNo], [AssociateName], [Country], [State], [City], [Password], [Status], [FullName], [CreateDate], [LevelID], [Rate]) VALUES (11, N'dbman.neobux@gmail.com', N'dbman.link6@gmail.com', 1, N'0123456789', N'', N'+84', N'Ho chi Minh', N'Ho Chi Minh', N'e10adc3949ba59abbe56e057f20f883e', 1, N'dbman6', CAST(0x0000A5F701566A98 AS DateTime), 1, NULL)
INSERT [dbo].[User] ([UserID], [SponsorID], [EmailID], [Currency], [MobileNo], [AssociateName], [Country], [State], [City], [Password], [Status], [FullName], [CreateDate], [LevelID], [Rate]) VALUES (12, N'dbman.neobux@gmail.com', N'dbman.link7@gmail.com', 1, N'0123456789', N'', N'+84', N'Ho chi Minh', N'Ho Chi Minh', N'e10adc3949ba59abbe56e057f20f883e', 1, N'dbman7', CAST(0x0000A5F701566A98 AS DateTime), 1, NULL)
INSERT [dbo].[User] ([UserID], [SponsorID], [EmailID], [Currency], [MobileNo], [AssociateName], [Country], [State], [City], [Password], [Status], [FullName], [CreateDate], [LevelID], [Rate]) VALUES (13, N'dbman.neobux@gmail.com', N'dbman.link1@gmail.com', 1, N'0906367747', N'', N'+84', N'Ho Chi Minh', N'Ho Chi Minh', N'e10adc3949ba59abbe56e057f20f883e', 1, N'Do Ba Man', CAST(0x0000A5FC00DDB78F AS DateTime), 1, NULL)
INSERT [dbo].[User] ([UserID], [SponsorID], [EmailID], [Currency], [MobileNo], [AssociateName], [Country], [State], [City], [Password], [Status], [FullName], [CreateDate], [LevelID], [Rate]) VALUES (14, N'dbman.neobux@gmail.com', N'dbman.online123@gmail.com', 1, N'09090909090', N'', N'+84', N'Ho Chi Minh', N'Ho Chi Minh', N'e10adc3949ba59abbe56e057f20f883e', 1, N'Do Man', CAST(0x0000A61000D90427 AS DateTime), 1, 15)
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[Bank]  WITH CHECK ADD  CONSTRAINT [FK_Bank_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Bank] CHECK CONSTRAINT [FK_Bank_User]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([PHOrderCode])
REFERENCES [dbo].[Order] ([OrderCode])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order1] FOREIGN KEY([GHOrderCode])
REFERENCES [dbo].[Order] ([OrderCode])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order1]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order2] FOREIGN KEY([PHOrderCode])
REFERENCES [dbo].[Order] ([OrderCode])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order2]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_User1] FOREIGN KEY([SenderId])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_User1]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_User2] FOREIGN KEY([ReceiverId])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_User2]
GO
ALTER TABLE [dbo].[PipCoin]  WITH CHECK ADD  CONSTRAINT [FK_PipCoin_Order] FOREIGN KEY([OrderCode])
REFERENCES [dbo].[Order] ([OrderCode])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[PipCoin] CHECK CONSTRAINT [FK_PipCoin_Order]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Level] FOREIGN KEY([LevelID])
REFERENCES [dbo].[Level] ([LevelID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Level]
GO
USE [master]
GO
ALTER DATABASE [BitCoin] SET  READ_WRITE 
GO
