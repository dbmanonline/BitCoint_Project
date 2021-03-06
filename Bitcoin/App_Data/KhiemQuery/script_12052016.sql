USE [master]
GO
/****** Object:  Database [BitCoin]    Script Date: 5/12/2016 6:32:01 PM ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'BitCoin')
BEGIN
CREATE DATABASE [BitCoin] ON  PRIMARY 
( NAME = N'BitCoin', FILENAME = N'C:\Users\KNguyen04.VIETNAM\BitCoin.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BitCoin_log', FILENAME = N'C:\Users\KNguyen04.VIETNAM\BitCoin_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 COLLATE SQL_Latin1_General_CP1_CI_AS
END

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
/****** Object:  Login [VIETNAM\KNguyen04]    Script Date: 5/12/2016 6:32:01 PM ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'VIETNAM\KNguyen04')
CREATE LOGIN [VIETNAM\KNguyen04] FROM WINDOWS WITH DEFAULT_DATABASE=[master]
GO
/****** Object:  Login [NT SERVICE\SQLWriter]    Script Date: 5/12/2016 6:32:01 PM ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT SERVICE\SQLWriter')
CREATE LOGIN [NT SERVICE\SQLWriter] FROM WINDOWS WITH DEFAULT_DATABASE=[master]
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyTsqlExecutionLogin##]    Script Date: 5/12/2016 6:32:01 PM ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'##MS_PolicyTsqlExecutionLogin##')
CREATE LOGIN [##MS_PolicyTsqlExecutionLogin##] WITH PASSWORD=N'ÜcaeþùÕ81C¦xó¶p!³ÄJ÷_¡<êP«±+', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyTsqlExecutionLogin##] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyEventProcessingLogin##]    Script Date: 5/12/2016 6:32:01 PM ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'##MS_PolicyEventProcessingLogin##')
CREATE LOGIN [##MS_PolicyEventProcessingLogin##] WITH PASSWORD=N' qo$óTTé²< ñ]ØkV@®$ofå	', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyEventProcessingLogin##] DISABLE
GO
ALTER AUTHORIZATION ON DATABASE::[BitCoin] TO [VIETNAM\KNguyen04]
GO
EXEC sys.sp_addsrvrolemember @loginame = N'VIETNAM\KNguyen04', @rolename = N'sysadmin'
GO
EXEC sys.sp_addsrvrolemember @loginame = N'NT SERVICE\SQLWriter', @rolename = N'sysadmin'
GO
USE [BitCoin]
GO
/****** Object:  Table [dbo].[Bank]    Script Date: 5/12/2016 6:32:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Bank]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Bank](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[AccountName] [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[BitcoinAddress] [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_Bank] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[Bank] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Level]    Script Date: 5/12/2016 6:32:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Level]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Level](
	[LevelID] [int] NOT NULL,
	[Name] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Status] [bit] NOT NULL,
	[Rate] [float] NOT NULL,
	[PersonNumber] [int] NOT NULL,
 CONSTRAINT [PK_Level] PRIMARY KEY CLUSTERED 
(
	[LevelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[Level] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Order]    Script Date: 5/12/2016 6:32:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Order]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Order](
	[OrderCode] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[UserID] [int] NOT NULL,
	[Amount] [float] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Status] [tinyint] NOT NULL,
	[OrderNumber] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[BitcoinAddress] [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_Bid] PRIMARY KEY CLUSTERED 
(
	[OrderCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[Order] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 5/12/2016 6:32:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OrderDetail]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OrderDetail](
	[OrderDetailCode] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[OrderCode] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[SenderId] [int] NOT NULL,
	[ReceiverId] [int] NOT NULL,
	[Amount] [float] NOT NULL,
	[Confirmation] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK__OrderDet__6AC97AB8774BEC40] PRIMARY KEY CLUSTERED 
(
	[OrderDetailCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[OrderDetail] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[User]    Script Date: 5/12/2016 6:32:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[SponsorID] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[EmailID] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Currency] [int] NOT NULL,
	[MobileNo] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[AssociateName] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Country] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[State] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[City] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Password] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Status] [tinyint] NOT NULL,
	[FullName] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LevelID] [int] NOT NULL,
	[Rate] [float] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[User] TO  SCHEMA OWNER 
GO
SET IDENTITY_INSERT [dbo].[Bank] ON 

INSERT [dbo].[Bank] ([Id], [UserID], [AccountName], [BitcoinAddress]) VALUES (3, 4, N'franky', N'112we13reewq23rgkfto22sr2w')
INSERT [dbo].[Bank] ([Id], [UserID], [AccountName], [BitcoinAddress]) VALUES (4, 4, N'mudma', N'134weuiouej3ja23123mng')
INSERT [dbo].[Bank] ([Id], [UserID], [AccountName], [BitcoinAddress]) VALUES (10003, 6, N'hula la', N'756fg3djhfdt5432fcs76bbdsa12zxh532dfryy453')
SET IDENTITY_INSERT [dbo].[Bank] OFF
INSERT [dbo].[Level] ([LevelID], [Name], [Status], [Rate], [PersonNumber]) VALUES (1, N'Level 1', 1, 15, 0)
INSERT [dbo].[Level] ([LevelID], [Name], [Status], [Rate], [PersonNumber]) VALUES (2, N'Level 2', 1, 13, 5)
INSERT [dbo].[Level] ([LevelID], [Name], [Status], [Rate], [PersonNumber]) VALUES (3, N'Level 3', 1, 11, 3)
INSERT [dbo].[Level] ([LevelID], [Name], [Status], [Rate], [PersonNumber]) VALUES (4, N'Level 4', 1, 9, 3)
INSERT [dbo].[Level] ([LevelID], [Name], [Status], [Rate], [PersonNumber]) VALUES (5, N'Level 5', 1, 7, 3)
INSERT [dbo].[Level] ([LevelID], [Name], [Status], [Rate], [PersonNumber]) VALUES (6, N'Level 6', 1, 5, 3)
INSERT [dbo].[Level] ([LevelID], [Name], [Status], [Rate], [PersonNumber]) VALUES (7, N'Level 7', 1, 3, 5)
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderCode], [UserID], [Amount], [CreateDate], [Status], [OrderNumber], [Type], [BitcoinAddress]) VALUES (N'2137875331', 6, 0.2, CAST(0x0000A60400000000 AS DateTime), 0, 2, N'GH', N'756fg3djhfdt5432fcs76bbdsa12zxh532dfryy453')
INSERT [dbo].[Order] ([OrderCode], [UserID], [Amount], [CreateDate], [Status], [OrderNumber], [Type], [BitcoinAddress]) VALUES (N'4323576801', 9, 0.5, CAST(0x0000A60400000000 AS DateTime), 0, 4, N'PH', NULL)
INSERT [dbo].[Order] ([OrderCode], [UserID], [Amount], [CreateDate], [Status], [OrderNumber], [Type], [BitcoinAddress]) VALUES (N'7481255627', 4, 0.5, CAST(0x0000A60400000000 AS DateTime), 0, 3, N'PH', NULL)
INSERT [dbo].[Order] ([OrderCode], [UserID], [Amount], [CreateDate], [Status], [OrderNumber], [Type], [BitcoinAddress]) VALUES (N'7711361425', 8, 0.5, CAST(0x0000A60400000000 AS DateTime), 0, 1, N'PH', NULL)
SET IDENTITY_INSERT [dbo].[Order] OFF
INSERT [dbo].[OrderDetail] ([OrderDetailCode], [OrderCode], [SenderId], [ReceiverId], [Amount], [Confirmation]) VALUES (N'6082870321', N'2137875331', 8, 6, 0.1, NULL)
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [SponsorID], [EmailID], [Currency], [MobileNo], [AssociateName], [Country], [State], [City], [Password], [Status], [FullName], [CreateDate], [LevelID], [Rate]) VALUES (4, N'dbman.online@photographer.com', N'superman@marven.com', 1, N'123456789', N'Super Man', N'Vietnam', N'Ha Noi', N'Ha Noi', N'123456', 1, N'Nguyen Superman', CAST(0x0000A48800000000 AS DateTime), 1, 15)
INSERT [dbo].[User] ([UserID], [SponsorID], [EmailID], [Currency], [MobileNo], [AssociateName], [Country], [State], [City], [Password], [Status], [FullName], [CreateDate], [LevelID], [Rate]) VALUES (6, N'dkm@pro.com', N'batman@propro.com', 1, N'342343432', N'Alibaba', N'Vietnam', N'Ho Chi Minh', N'Ho Chi Minh', N'123456', 1, N'Nguyen Van A', CAST(0x0000A5F700000000 AS DateTime), 1, 15)
INSERT [dbo].[User] ([UserID], [SponsorID], [EmailID], [Currency], [MobileNo], [AssociateName], [Country], [State], [City], [Password], [Status], [FullName], [CreateDate], [LevelID], [Rate]) VALUES (8, N'alimama@kaka.com', N'lulu@abc.com', 1, N'123423432', N'Iron man', N'USA', N'California', N'California', N'123456', 1, N'Iron Nguyen', CAST(0x0000A60200000000 AS DateTime), 1, 15)
INSERT [dbo].[User] ([UserID], [SponsorID], [EmailID], [Currency], [MobileNo], [AssociateName], [Country], [State], [City], [Password], [Status], [FullName], [CreateDate], [LevelID], [Rate]) VALUES (9, N'bullbull@alak.com', N'bubu@kool.net', 1, N'123545643', N'America Captain', N'USA', N'Texas', N'Texacs', N'123456', 1, N'Captain My', CAST(0x0000A60200000000 AS DateTime), 1, 15)
SET IDENTITY_INSERT [dbo].[User] OFF
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Bank_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[Bank]'))
ALTER TABLE [dbo].[Bank]  WITH CHECK ADD  CONSTRAINT [FK_Bank_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Bank_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[Bank]'))
ALTER TABLE [dbo].[Bank] CHECK CONSTRAINT [FK_Bank_User]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Bid_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[Order]'))
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Bid_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Bid_User]') AND parent_object_id = OBJECT_ID(N'[dbo].[Order]'))
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Bid_User]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OrderDetail_Order]') AND parent_object_id = OBJECT_ID(N'[dbo].[OrderDetail]'))
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderCode])
REFERENCES [dbo].[Order] ([OrderCode])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OrderDetail_Order]') AND parent_object_id = OBJECT_ID(N'[dbo].[OrderDetail]'))
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_Level]') AND parent_object_id = OBJECT_ID(N'[dbo].[User]'))
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Level] FOREIGN KEY([LevelID])
REFERENCES [dbo].[Level] ([LevelID])
ON UPDATE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_User_Level]') AND parent_object_id = OBJECT_ID(N'[dbo].[User]'))
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Level]
GO
USE [master]
GO
ALTER DATABASE [BitCoin] SET  READ_WRITE 
GO
