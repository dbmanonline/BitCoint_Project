USE [master]
GO
/****** Object:  Database [BitCoin]    Script Date: 5/11/2016 5:30:01 PM ******/
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
/****** Object:  Table [dbo].[Bank]    Script Date: 5/11/2016 5:30:01 PM ******/
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
/****** Object:  Table [dbo].[Bid]    Script Date: 5/11/2016 5:30:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bid](
	[BidCode] [varchar](10) NOT NULL,
	[UserID] [int] NOT NULL,
	[Amount] [float] NOT NULL,
	[Percentage] [float] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Status] [tinyint] NOT NULL,
	[Order] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Bid] PRIMARY KEY CLUSTERED 
(
	[BidCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BidDetail]    Script Date: 5/11/2016 5:30:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BidDetail](
	[BidDetailCode] [varchar](10) NOT NULL,
	[BidCode] [varchar](10) NOT NULL,
	[Percentage] [float] NULL,
	[PhotoConfirmation] [varchar](250) NULL,
	[IFSCCode] [varchar](250) NULL,
	[BankName] [varchar](250) NULL,
	[AccountNumber] [varchar](250) NULL,
	[AccountName] [varchar](250) NULL,
	[BranchName] [varchar](250) NULL,
	[BitCoinAddress] [varchar](250) NULL,
	[Status] [bit] NULL,
	[CreateDate] [datetime] NULL,
	[Order] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_BidDetail] PRIMARY KEY CLUSTERED 
(
	[BidDetailCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BidPercentage]    Script Date: 5/11/2016 5:30:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BidPercentage](
	[BPID] [varchar](5) NOT NULL,
	[Percentage] [float] NOT NULL,
	[Status] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BPID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Level]    Script Date: 5/11/2016 5:30:01 PM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 5/11/2016 5:30:01 PM ******/
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
SET IDENTITY_INSERT [dbo].[Bank] ON 

INSERT [dbo].[Bank] ([Id], [UserID], [AccountName], [BitcoinAddress]) VALUES (3, 4, N'franky', N'112we13reewq23rgkfto22sr2w')
INSERT [dbo].[Bank] ([Id], [UserID], [AccountName], [BitcoinAddress]) VALUES (4, 4, N'mudma', N'134weuiouej3ja23123mng')
INSERT [dbo].[Bank] ([Id], [UserID], [AccountName], [BitcoinAddress]) VALUES (5, 6, N'luala', N'se2456sdghr342dfdl')
SET IDENTITY_INSERT [dbo].[Bank] OFF
SET IDENTITY_INSERT [dbo].[Bid] ON 

INSERT [dbo].[Bid] ([BidCode], [UserID], [Amount], [Percentage], [CreateDate], [Status], [Order]) VALUES (N'1516248833', 4, 0.5, 0, CAST(0x0000A60300000000 AS DateTime), 0, 42)
SET IDENTITY_INSERT [dbo].[Bid] OFF
INSERT [dbo].[BidPercentage] ([BPID], [Percentage], [Status], [CreateDate]) VALUES (N'BP20', 20, 1, CAST(0x0000A48B00000000 AS DateTime))
INSERT [dbo].[Level] ([LevelID], [Name], [Status], [Rate], [PersonNumber]) VALUES (1, N'Level 1', 1, 15, 0)
INSERT [dbo].[Level] ([LevelID], [Name], [Status], [Rate], [PersonNumber]) VALUES (2, N'Level 2', 1, 13, 5)
INSERT [dbo].[Level] ([LevelID], [Name], [Status], [Rate], [PersonNumber]) VALUES (3, N'Level 3', 1, 11, 3)
INSERT [dbo].[Level] ([LevelID], [Name], [Status], [Rate], [PersonNumber]) VALUES (4, N'Level 4', 1, 9, 3)
INSERT [dbo].[Level] ([LevelID], [Name], [Status], [Rate], [PersonNumber]) VALUES (5, N'Level 5', 1, 7, 3)
INSERT [dbo].[Level] ([LevelID], [Name], [Status], [Rate], [PersonNumber]) VALUES (6, N'Level 6', 1, 5, 3)
INSERT [dbo].[Level] ([LevelID], [Name], [Status], [Rate], [PersonNumber]) VALUES (7, N'Level 7', 1, 3, 5)
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [SponsorID], [EmailID], [Currency], [MobileNo], [AssociateName], [Country], [State], [City], [Password], [Status], [FullName], [CreateDate], [LevelID], [Rate]) VALUES (4, N'dbman.online@photographer.com', N'superman@marven.com', 1, N'123456789', N'Super Man', N'Vietnam', N'Ha Noi', N'Ha Noi', N'123456', 1, N'Nguyen Superman', CAST(0x0000A48800000000 AS DateTime), 1, 15)
INSERT [dbo].[User] ([UserID], [SponsorID], [EmailID], [Currency], [MobileNo], [AssociateName], [Country], [State], [City], [Password], [Status], [FullName], [CreateDate], [LevelID], [Rate]) VALUES (6, N'dkm@pro.com', N'batman@propro.com', 1, N'342343432', N'Alibaba', N'Vietnam', N'Ho Chi Minh', N'Ho Chi Minh', N'123456', 1, N'Nguyen Van A', CAST(0x0000A5F700000000 AS DateTime), 1, 15)
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[Bid]  WITH CHECK ADD  CONSTRAINT [FK_Bid_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Bid] CHECK CONSTRAINT [FK_Bid_User]
GO
ALTER TABLE [dbo].[BidDetail]  WITH CHECK ADD  CONSTRAINT [FK_BidDetail_Bid] FOREIGN KEY([BidCode])
REFERENCES [dbo].[Bid] ([BidCode])
GO
ALTER TABLE [dbo].[BidDetail] CHECK CONSTRAINT [FK_BidDetail_Bid]
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
