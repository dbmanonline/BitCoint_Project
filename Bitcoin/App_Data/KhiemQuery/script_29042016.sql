USE [master]
GO
/****** Object:  Database [BitCoin]    Script Date: 4/29/2016 5:24:12 PM ******/
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
/****** Object:  Table [dbo].[Bid]    Script Date: 4/29/2016 5:24:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bid](
	[BidID] [varchar](10) NOT NULL,
	[UserID] [int] NOT NULL,
	[Amount] [float] NOT NULL,
	[Currency] [int] NOT NULL,
	[PaidAmount] [float] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Status] [tinyint] NOT NULL,
	[Percentage] [int] NOT NULL,
 CONSTRAINT [PK_Bid] PRIMARY KEY CLUSTERED 
(
	[BidID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Level]    Script Date: 4/29/2016 5:24:12 PM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 4/29/2016 5:24:12 PM ******/
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
	[LevelID] [int] NOT NULL,
	[Rate] [float] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Bid] ([BidID], [UserID], [Amount], [Currency], [PaidAmount], [CreateDate], [Status], [Percentage]) VALUES (N'1788732262', 4, 0.5, 1, 0.1, CAST(0x0000A5F700000000 AS DateTime), 0, 20)
INSERT [dbo].[Bid] ([BidID], [UserID], [Amount], [Currency], [PaidAmount], [CreateDate], [Status], [Percentage]) VALUES (N'3517344721', 6, 0.5, 1, 0.1, CAST(0x0000A5F700000000 AS DateTime), 0, 20)
INSERT [dbo].[Bid] ([BidID], [UserID], [Amount], [Currency], [PaidAmount], [CreateDate], [Status], [Percentage]) VALUES (N'6173111171', 4, 0.5, 1, 0.1, CAST(0x0000A5F600000000 AS DateTime), 0, 20)
INSERT [dbo].[Level] ([LevelID], [Name], [Status], [Rate], [PersonNumber]) VALUES (1, N'Level 1', 1, 15, 0)
INSERT [dbo].[Level] ([LevelID], [Name], [Status], [Rate], [PersonNumber]) VALUES (2, N'Level 2', 1, 13, 5)
INSERT [dbo].[Level] ([LevelID], [Name], [Status], [Rate], [PersonNumber]) VALUES (3, N'Level 3', 1, 11, 3)
INSERT [dbo].[Level] ([LevelID], [Name], [Status], [Rate], [PersonNumber]) VALUES (4, N'Level 4', 1, 9, 3)
INSERT [dbo].[Level] ([LevelID], [Name], [Status], [Rate], [PersonNumber]) VALUES (5, N'Level 5', 1, 7, 3)
INSERT [dbo].[Level] ([LevelID], [Name], [Status], [Rate], [PersonNumber]) VALUES (6, N'Level 6', 1, 5, 3)
INSERT [dbo].[Level] ([LevelID], [Name], [Status], [Rate], [PersonNumber]) VALUES (7, N'Level 7', 1, 3, 5)
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [SponsorID], [EmailID], [Currency], [MobileNo], [AssociateName], [Country], [State], [City], [Password], [Status], [FullName], [CreateDate], [LevelID], [Rate]) VALUES (4, N'dbman.online@photographer.com', N'superman@marven.com', 1, N'123456789', N'SuperMan', N'Vietnam', N'Ha Noi', N'Ha Noi', N'123456', 1, N'Nguyen Superman', CAST(0x0000A48800000000 AS DateTime), 1, 15)
INSERT [dbo].[User] ([UserID], [SponsorID], [EmailID], [Currency], [MobileNo], [AssociateName], [Country], [State], [City], [Password], [Status], [FullName], [CreateDate], [LevelID], [Rate]) VALUES (6, N'dkm@pro.com', N'batman@propro.com', 1, N'342343432', N'Alibaba', N'Vietnam', N'Ho Chi Minh', N'Ho Chi Minh', N'123456', 1, N'Nguyen Van A', CAST(0x0000A5F700000000 AS DateTime), 1, 15)
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[Bid]  WITH CHECK ADD  CONSTRAINT [FK_Bid_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Bid] CHECK CONSTRAINT [FK_Bid_User]
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
