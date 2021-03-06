USE [master]
GO
/****** Object:  Database [BitCoin]    Script Date: 5/23/2016 5:29:25 PM ******/
CREATE DATABASE [BitCoin] ON  PRIMARY 
( NAME = N'BitCoin', FILENAME = N'C:\Users\KNguyen04.VIETNAM\BitCoin.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BitCoin_log', FILENAME = N'C:\Users\KNguyen04.VIETNAM\BitCoin_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
USE [BitCoin]
GO
/****** Object:  Table [dbo].[Bank]    Script Date: 5/23/2016 5:29:25 PM ******/
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
/****** Object:  Table [dbo].[Level]    Script Date: 5/23/2016 5:29:25 PM ******/
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
/****** Object:  Table [dbo].[Order]    Script Date: 5/23/2016 5:29:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Order](
	[OrderCode] [varchar](10) NOT NULL,
	[UserID] [int] NOT NULL,
	[Amount] [float] NOT NULL,
	[RemainingAmount] [float] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Status] [tinyint] NOT NULL,
	[OrderNumber] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](5) NOT NULL,
	[BitcoinAddress] [varchar](250) NULL,
 CONSTRAINT [PK_Bid] PRIMARY KEY CLUSTERED 
(
	[OrderCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 5/23/2016 5:29:25 PM ******/
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
	[Amount] [float] NOT NULL,
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
/****** Object:  Table [dbo].[User]    Script Date: 5/23/2016 5:29:25 PM ******/
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
 CONSTRAINT [PK_User_1] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Bank] ON 

INSERT [dbo].[Bank] ([Id], [UserID], [AccountName], [BitcoinAddress]) VALUES (1, 1, N'kakalot', N'24fgr64hgu56k754kl99vbx40d7xbb377sxcx73127aal')
INSERT [dbo].[Bank] ([Id], [UserID], [AccountName], [BitcoinAddress]) VALUES (2, 1, N'kakalot nguyen', N'nv9438dj49sjf09583hf008lhjk25dhj54859ggfshg333')
INSERT [dbo].[Bank] ([Id], [UserID], [AccountName], [BitcoinAddress]) VALUES (3, 2, N'songoku', N'123hdu78687kh45j5k686633hdj465ebm3223k1242')
INSERT [dbo].[Bank] ([Id], [UserID], [AccountName], [BitcoinAddress]) VALUES (4, 3, N'Martial', N'9d73hfjskd8739kjh84756398fkjh83745ysjdf83472823')
INSERT [dbo].[Bank] ([Id], [UserID], [AccountName], [BitcoinAddress]) VALUES (5, 4, N'vo ky', N'453kjfhsjdf9345876dkj929dkv99sk8382ss2vbt445645')
INSERT [dbo].[Bank] ([Id], [UserID], [AccountName], [BitcoinAddress]) VALUES (6, 5, N'Thanh Giong', N'vbc9872394hjkse9823849sdfh23hh3h5j4ka9sd0024354')
SET IDENTITY_INSERT [dbo].[Bank] OFF
INSERT [dbo].[Level] ([LevelID], [Name], [Status], [Rate], [PersonNumber]) VALUES (1, N'Level 1', 1, 15, 0)
INSERT [dbo].[Level] ([LevelID], [Name], [Status], [Rate], [PersonNumber]) VALUES (2, N'Level 2', 1, 13, 5)
INSERT [dbo].[Level] ([LevelID], [Name], [Status], [Rate], [PersonNumber]) VALUES (3, N'Level 3', 1, 11, 3)
INSERT [dbo].[Level] ([LevelID], [Name], [Status], [Rate], [PersonNumber]) VALUES (4, N'Level 4', 1, 9, 3)
INSERT [dbo].[Level] ([LevelID], [Name], [Status], [Rate], [PersonNumber]) VALUES (5, N'Level 5', 1, 7, 3)
INSERT [dbo].[Level] ([LevelID], [Name], [Status], [Rate], [PersonNumber]) VALUES (6, N'Level 6', 1, 5, 3)
INSERT [dbo].[Level] ([LevelID], [Name], [Status], [Rate], [PersonNumber]) VALUES (7, N'Level 7', 1, 3, 5)
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderCode], [UserID], [Amount], [RemainingAmount], [CreateDate], [Status], [OrderNumber], [Type], [BitcoinAddress]) VALUES (N'111111111', 1, 0.7, 0.7, CAST(0x0000A60B00000000 AS DateTime), 1, 2, N'GH', N'24fgr64hgu56k754kl99vbx40d7xbb377sxcx73127aal')
SET IDENTITY_INSERT [dbo].[Order] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [SponsorID], [EmailID], [Currency], [MobileNo], [AssociateName], [Country], [State], [City], [Password], [Status], [FullName], [CreateDate]) VALUES (1, N'dbman.neobux@gmail.com', N'kakalot@japan.com', 1, N'346921745', N'kakalot', N'Japan', N'Hokio', N'Tokyo', N'123456', 1, N'Kakalot', CAST(0x0000A60B00000000 AS DateTime))
INSERT [dbo].[User] ([UserID], [SponsorID], [EmailID], [Currency], [MobileNo], [AssociateName], [Country], [State], [City], [Password], [Status], [FullName], [CreateDate]) VALUES (2, N'dbman.neobux@gmail.com', N'songoku@japan.com', 1, N'342786214', N'songoku', N'Japan', N'Hokai', N'Hokaido', N'123456', 1, N'Songoku', CAST(0x0000A60B00000000 AS DateTime))
INSERT [dbo].[User] ([UserID], [SponsorID], [EmailID], [Currency], [MobileNo], [AssociateName], [Country], [State], [City], [Password], [Status], [FullName], [CreateDate]) VALUES (3, N'songoku@japan.co', N'superman@sieunhan.com', 1, N'123985647', N'Robert Martial', N'France', N'Paris', N'Paris', N'123456', 1, N'Robert Martial', CAST(0x0000ED6200000000 AS DateTime))
INSERT [dbo].[User] ([UserID], [SponsorID], [EmailID], [Currency], [MobileNo], [AssociateName], [Country], [State], [City], [Password], [Status], [FullName], [CreateDate]) VALUES (4, N'kaklot@japan.com', N'truongvoky@kimung.com', 1, N'753214789', N'Truong Vo Ky', N'China', N'Shanghai', N'Shanghai', N'123456', 1, N'Tr Vo Ky', CAST(0x0000A60C00000000 AS DateTime))
INSERT [dbo].[User] ([UserID], [SponsorID], [EmailID], [Currency], [MobileNo], [AssociateName], [Country], [State], [City], [Password], [Status], [FullName], [CreateDate]) VALUES (5, N'superman@sieunhan.com', N'thanhgiong@pro.com', 1, N'098657364', N'Thanh Giong', N'Vietnam', N'Ha Noi', N'Ha Noi', N'123456', 1, N'Thanh Giong', CAST(0x0000A60D00000000 AS DateTime))
INSERT [dbo].[User] ([UserID], [SponsorID], [EmailID], [Currency], [MobileNo], [AssociateName], [Country], [State], [City], [Password], [Status], [FullName], [CreateDate]) VALUES (6, N'dbman.neobux@gmail.com', N'ironman@zizi.com', 1, N'897562166', N'Iron man', N'USA', N'Texas', N'Texas', N'123456', 1, N'Iron man', CAST(0x0000A60D00000000 AS DateTime))
INSERT [dbo].[User] ([UserID], [SponsorID], [EmailID], [Currency], [MobileNo], [AssociateName], [Country], [State], [City], [Password], [Status], [FullName], [CreateDate]) VALUES (7, N'dbman.neobux@gmail.com', N'americancaptain@zizi.com', 1, N'894231447', N'American Captain', N'USA', N'Ohio', N'Ohio', N'123456', 1, N'American captain', CAST(0x0000A60D00000000 AS DateTime))
INSERT [dbo].[User] ([UserID], [SponsorID], [EmailID], [Currency], [MobileNo], [AssociateName], [Country], [State], [City], [Password], [Status], [FullName], [CreateDate]) VALUES (8, N'songoku@japan.co', N'mabu@dragon.com', 1, N'345879147', N'Mabu', N'Japan', N'Hokaido', N'Hokaido', N'123456', 1, N'Mabu', CAST(0x0000A60E00000000 AS DateTime))
INSERT [dbo].[User] ([UserID], [SponsorID], [EmailID], [Currency], [MobileNo], [AssociateName], [Country], [State], [City], [Password], [Status], [FullName], [CreateDate]) VALUES (9, N'superman@sieunhan.com', N'mocuradop@runing.com', 1, N'498723145', N'Mocu radop', N'Russia', N'Maxcova', N'Maxcova', N'123456', 1, N'Mocu radop', CAST(0x0000A60E00000000 AS DateTime))
INSERT [dbo].[User] ([UserID], [SponsorID], [EmailID], [Currency], [MobileNo], [AssociateName], [Country], [State], [City], [Password], [Status], [FullName], [CreateDate]) VALUES (10, N'kaklot@japan.com', N'kingso@bboy.com', 1, N'398214567', N'King So', N'Korea', N'Seoul', N'Seoul', N'123456', 1, N'King So', CAST(0x0000A60E00000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[Bank]  WITH CHECK ADD  CONSTRAINT [FK_Bank_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Bank] CHECK CONSTRAINT [FK_Bank_User]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order2] FOREIGN KEY([PHOrderCode])
REFERENCES [dbo].[Order] ([OrderCode])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order2]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order3] FOREIGN KEY([GHOrderCode])
REFERENCES [dbo].[Order] ([OrderCode])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order3]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_User] FOREIGN KEY([SenderId])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_User]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_User1] FOREIGN KEY([ReceiverId])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_User1]
GO
USE [master]
GO
ALTER DATABASE [BitCoin] SET  READ_WRITE 
GO
