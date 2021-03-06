USE [master]
GO
/****** Object:  Database [bookstore]    Script Date: 1.7.2020. 14:41:30 ******/
CREATE DATABASE [bookstore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'bookstore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\bookstore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'bookstore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\bookstore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [bookstore] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bookstore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bookstore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [bookstore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [bookstore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [bookstore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [bookstore] SET ARITHABORT OFF 
GO
ALTER DATABASE [bookstore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [bookstore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [bookstore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [bookstore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [bookstore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [bookstore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [bookstore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [bookstore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [bookstore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [bookstore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [bookstore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [bookstore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [bookstore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [bookstore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [bookstore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [bookstore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [bookstore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [bookstore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [bookstore] SET  MULTI_USER 
GO
ALTER DATABASE [bookstore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [bookstore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [bookstore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [bookstore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [bookstore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [bookstore] SET QUERY_STORE = OFF
GO
USE [bookstore]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 1.7.2020. 14:41:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Authors]    Script Date: 1.7.2020. 14:41:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[FirstName] [nvarchar](15) NOT NULL,
	[LastName] [nvarchar](15) NOT NULL,
	[BirthPlace] [nvarchar](15) NOT NULL,
	[Birth] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Authors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookAuthor]    Script Date: 1.7.2020. 14:41:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookAuthor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BookId] [int] NOT NULL,
	[AuthorId] [int] NOT NULL,
 CONSTRAINT [PK_BookAuthor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 1.7.2020. 14:41:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Title] [nvarchar](20) NOT NULL,
	[Description] [nvarchar](30) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Year] [int] NOT NULL,
	[PublisherId] [int] NOT NULL,
	[GenreId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genres]    Script Date: 1.7.2020. 14:41:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genres](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Name] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_Genres] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderLine]    Script Date: 1.7.2020. 14:41:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderLine](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[OrderId] [int] NOT NULL,
	[BookId] [int] NULL,
 CONSTRAINT [PK_OrderLine] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 1.7.2020. 14:41:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Address] [nvarchar](30) NOT NULL,
	[OrderDate] [datetime2](7) NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Publishers]    Script Date: 1.7.2020. 14:41:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publishers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[City] [nvarchar](20) NOT NULL,
	[State] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Publishers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 1.7.2020. 14:41:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Name] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UseCaseLogs]    Script Date: 1.7.2020. 14:41:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UseCaseLogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime2](7) NOT NULL,
	[UseCaseName] [nvarchar](max) NULL,
	[Data] [nvarchar](max) NULL,
	[Actor] [nvarchar](max) NULL,
 CONSTRAINT [PK_UseCaseLogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 1.7.2020. 14:41:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[FirstName] [nvarchar](15) NOT NULL,
	[LastName] [nvarchar](20) NOT NULL,
	[Username] [nvarchar](15) NOT NULL,
	[Password] [nvarchar](15) NOT NULL,
	[RoleId] [int] NOT NULL,
	[Email] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserUseCases]    Script Date: 1.7.2020. 14:41:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserUseCases](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[UseCaseId] [int] NOT NULL,
 CONSTRAINT [PK_UserUseCases] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200623051831_added_user_role', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200623053854_added_Book_and_Author', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200623054251_added_PublisherBookRelationship', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200623054706_added_GenreTable', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200623061052_added_OrderAndOrderLine', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200628141832_update_book_table_add_quantity', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200629105405_added_UserUseCase__UseCaseLogs', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200630064701_update_user_table_added_email', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200630064836_added_email_configuration', N'3.1.5')
SET IDENTITY_INSERT [dbo].[Authors] ON 

INSERT [dbo].[Authors] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [BirthPlace], [Birth]) VALUES (1, CAST(N'2020-06-28T09:39:59.3295713' AS DateTime2), NULL, NULL, 0, 1, N'dejan', N'dejan', N'kraljevo', CAST(N'1996-05-05T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Authors] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [BirthPlace], [Birth]) VALUES (2, CAST(N'2020-07-01T10:50:43.3821659' AS DateTime2), NULL, NULL, 0, 1, N'ERNEST', N'HEMINGWAY', N'Leskovac', CAST(N'1936-05-05T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Authors] OFF
SET IDENTITY_INSERT [dbo].[BookAuthor] ON 

INSERT [dbo].[BookAuthor] ([Id], [BookId], [AuthorId]) VALUES (1, 2, 1)
INSERT [dbo].[BookAuthor] ([Id], [BookId], [AuthorId]) VALUES (2, 3, 1)
INSERT [dbo].[BookAuthor] ([Id], [BookId], [AuthorId]) VALUES (4, 4, 1)
INSERT [dbo].[BookAuthor] ([Id], [BookId], [AuthorId]) VALUES (5, 3, 2)
INSERT [dbo].[BookAuthor] ([Id], [BookId], [AuthorId]) VALUES (6, 5, 2)
SET IDENTITY_INSERT [dbo].[BookAuthor] OFF
SET IDENTITY_INSERT [dbo].[Books] ON 

INSERT [dbo].[Books] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Title], [Description], [Price], [Year], [PublisherId], [GenreId], [Quantity]) VALUES (2, CAST(N'2020-06-26T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'Knjiga1', N'knjigaOpis', CAST(100.00 AS Decimal(18, 2)), 1997, 1, 8, 10)
INSERT [dbo].[Books] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Title], [Description], [Price], [Year], [PublisherId], [GenreId], [Quantity]) VALUES (3, CAST(N'2020-06-27T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'knjiga23', N'opisknjige23', CAST(123.00 AS Decimal(18, 2)), 2000, 1, 8, 8)
INSERT [dbo].[Books] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Title], [Description], [Price], [Year], [PublisherId], [GenreId], [Quantity]) VALUES (4, CAST(N'2020-06-27T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'opasna knjiga', N'strasan opis', CAST(55555.00 AS Decimal(18, 2)), 2012, 2, 9, 15)
INSERT [dbo].[Books] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Title], [Description], [Price], [Year], [PublisherId], [GenreId], [Quantity]) VALUES (5, CAST(N'2020-06-29T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'naslov2', N'knjiga opis', CAST(300.00 AS Decimal(18, 2)), 1999, 1, 8, 20)
INSERT [dbo].[Books] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Title], [Description], [Price], [Year], [PublisherId], [GenreId], [Quantity]) VALUES (6, CAST(N'2020-06-29T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'gospodar prstenova', N'opis gospodara', CAST(850.00 AS Decimal(18, 2)), 2005, 4, 16, 18)
INSERT [dbo].[Books] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Title], [Description], [Price], [Year], [PublisherId], [GenreId], [Quantity]) VALUES (7, CAST(N'2020-06-29T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'hari poter', N'magija magija', CAST(750.00 AS Decimal(18, 2)), 1999, 3, 20, 25)
INSERT [dbo].[Books] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Title], [Description], [Price], [Year], [PublisherId], [GenreId], [Quantity]) VALUES (8, CAST(N'2020-05-25T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'knjiga 8', N'opise knjige 8', CAST(120.00 AS Decimal(18, 2)), 2019, 4, 20, 10)
INSERT [dbo].[Books] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Title], [Description], [Price], [Year], [PublisherId], [GenreId], [Quantity]) VALUES (10, CAST(N'2020-06-24T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'knjiga9', N'ops knjige9', CAST(85.00 AS Decimal(18, 2)), 2015, 4, 23, 9)
INSERT [dbo].[Books] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Title], [Description], [Price], [Year], [PublisherId], [GenreId], [Quantity]) VALUES (11, CAST(N'2020-06-29T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'knjiga10', N'opisknjige10', CAST(102.00 AS Decimal(18, 2)), 2017, 3, 26, 5)
INSERT [dbo].[Books] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Title], [Description], [Price], [Year], [PublisherId], [GenreId], [Quantity]) VALUES (12, CAST(N'2020-06-30T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'knjiga11', N'opisknjige11', CAST(99.00 AS Decimal(18, 2)), 2000, 2, 10, 3)
INSERT [dbo].[Books] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Title], [Description], [Price], [Year], [PublisherId], [GenreId], [Quantity]) VALUES (13, CAST(N'2020-06-30T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'knjiga12', N'opisknjige12', CAST(350.00 AS Decimal(18, 2)), 2001, 2, 23, 4)
INSERT [dbo].[Books] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Title], [Description], [Price], [Year], [PublisherId], [GenreId], [Quantity]) VALUES (14, CAST(N'2020-06-30T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'knjiga13', N'opisknjige13', CAST(180.00 AS Decimal(18, 2)), 1975, 4, 25, 5)
INSERT [dbo].[Books] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Title], [Description], [Price], [Year], [PublisherId], [GenreId], [Quantity]) VALUES (15, CAST(N'2020-06-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'knjiga14', N'opisknjige14', CAST(500.00 AS Decimal(18, 2)), 1999, 4, 20, 2)
INSERT [dbo].[Books] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Title], [Description], [Price], [Year], [PublisherId], [GenreId], [Quantity]) VALUES (16, CAST(N'2020-06-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'knjiga15', N'opisknjige15', CAST(666.00 AS Decimal(18, 2)), 2004, 1, 26, 5)
INSERT [dbo].[Books] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Title], [Description], [Price], [Year], [PublisherId], [GenreId], [Quantity]) VALUES (17, CAST(N'2020-06-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'knjiga16', N'opisknjige16', CAST(555.00 AS Decimal(18, 2)), 2000, 1, 10, 5)
INSERT [dbo].[Books] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Title], [Description], [Price], [Year], [PublisherId], [GenreId], [Quantity]) VALUES (18, CAST(N'2020-06-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'knjiga17', N'opisknjige17', CAST(444.00 AS Decimal(18, 2)), 2001, 3, 10, 5)
INSERT [dbo].[Books] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Title], [Description], [Price], [Year], [PublisherId], [GenreId], [Quantity]) VALUES (19, CAST(N'2020-05-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'knjiga18', N'opisknjige18', CAST(499.00 AS Decimal(18, 2)), 1999, 3, 10, 8)
INSERT [dbo].[Books] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Title], [Description], [Price], [Year], [PublisherId], [GenreId], [Quantity]) VALUES (20, CAST(N'2020-05-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'knjiga19', N'opisknjige19', CAST(599.00 AS Decimal(18, 2)), 2005, 3, 10, 5)
INSERT [dbo].[Books] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Title], [Description], [Price], [Year], [PublisherId], [GenreId], [Quantity]) VALUES (21, CAST(N'2020-06-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'knjiga20', N'opisknjige20', CAST(999.00 AS Decimal(18, 2)), 2009, 4, 23, 5)
SET IDENTITY_INSERT [dbo].[Books] OFF
SET IDENTITY_INSERT [dbo].[Genres] ON 

INSERT [dbo].[Genres] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (8, CAST(N'2020-06-27T14:00:19.4093462' AS DateTime2), CAST(N'2020-06-27T18:23:56.9899127' AS DateTime2), CAST(N'2020-06-27T18:23:57.0199981' AS DateTime2), 1, 0, N'Horor')
INSERT [dbo].[Genres] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (9, CAST(N'2020-06-27T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'Mistery')
INSERT [dbo].[Genres] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (10, CAST(N'2020-06-27T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'smaracka')
INSERT [dbo].[Genres] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (11, CAST(N'2020-06-27T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'Crime')
INSERT [dbo].[Genres] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (12, CAST(N'2020-07-01T12:01:12.6265435' AS DateTime2), NULL, NULL, 0, 1, N'Romance')
INSERT [dbo].[Genres] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (13, CAST(N'2020-07-01T12:01:49.4531929' AS DateTime2), NULL, NULL, 0, 1, N'Satire')
INSERT [dbo].[Genres] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (14, CAST(N'2020-07-01T12:01:57.8387833' AS DateTime2), NULL, NULL, 0, 1, N'Thriller')
INSERT [dbo].[Genres] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (15, CAST(N'2020-07-01T12:02:05.8191329' AS DateTime2), NULL, NULL, 0, 1, N'Western')
INSERT [dbo].[Genres] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (16, CAST(N'2020-07-01T12:02:16.2797817' AS DateTime2), NULL, NULL, 0, 1, N'Philosophy')
INSERT [dbo].[Genres] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (17, CAST(N'2020-07-01T12:02:23.6543249' AS DateTime2), NULL, NULL, 0, 1, N'Science')
INSERT [dbo].[Genres] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (18, CAST(N'2020-07-01T12:02:31.3145360' AS DateTime2), NULL, NULL, 0, 1, N'Travel')
INSERT [dbo].[Genres] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (19, CAST(N'2020-07-01T12:02:37.8602372' AS DateTime2), NULL, NULL, 0, 1, N'Sports ')
INSERT [dbo].[Genres] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (20, CAST(N'2020-07-01T12:02:50.4341087' AS DateTime2), NULL, NULL, 0, 1, N'Math')
INSERT [dbo].[Genres] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (21, CAST(N'2020-07-01T12:02:57.1909661' AS DateTime2), NULL, NULL, 0, 1, N'History')
INSERT [dbo].[Genres] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (22, CAST(N'2020-07-01T12:03:06.7549084' AS DateTime2), NULL, NULL, 0, 1, N'Health')
INSERT [dbo].[Genres] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (23, CAST(N'2020-07-01T12:03:13.4236255' AS DateTime2), NULL, NULL, 0, 1, N'fitness')
INSERT [dbo].[Genres] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (24, CAST(N'2020-07-01T12:03:20.4704412' AS DateTime2), NULL, NULL, 0, 1, N'Encyclopedia')
INSERT [dbo].[Genres] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (25, CAST(N'2020-07-01T12:03:26.6752952' AS DateTime2), NULL, NULL, 0, 1, N'Cookbook')
INSERT [dbo].[Genres] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (26, CAST(N'2020-07-01T12:03:34.2587376' AS DateTime2), NULL, NULL, 0, 1, N'Biography')
INSERT [dbo].[Genres] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (27, CAST(N'2020-07-01T12:03:40.1251387' AS DateTime2), NULL, NULL, 0, 1, N'Autobiography')
SET IDENTITY_INSERT [dbo].[Genres] OFF
SET IDENTITY_INSERT [dbo].[OrderLine] ON 

INSERT [dbo].[OrderLine] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [BookId]) VALUES (1, CAST(N'2020-06-28T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'knjiga', 1, CAST(200.00 AS Decimal(18, 2)), 2, 3)
INSERT [dbo].[OrderLine] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [BookId]) VALUES (2, CAST(N'2020-06-28T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'knjiga2', 3, CAST(450.00 AS Decimal(18, 2)), 3, 4)
INSERT [dbo].[OrderLine] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [BookId]) VALUES (3, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'knjiga', 2, CAST(300.00 AS Decimal(18, 2)), 15, 8)
INSERT [dbo].[OrderLine] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [BookId]) VALUES (4, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'knjiga4', 1, CAST(150.00 AS Decimal(18, 2)), 18, 20)
INSERT [dbo].[OrderLine] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [BookId]) VALUES (5, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'knjiga5', 1, CAST(999.00 AS Decimal(18, 2)), 15, 5)
INSERT [dbo].[OrderLine] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [BookId]) VALUES (8, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'knjiga6', 3, CAST(444.00 AS Decimal(18, 2)), 10, 12)
INSERT [dbo].[OrderLine] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [BookId]) VALUES (9, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'knjiga7', 2, CAST(500.00 AS Decimal(18, 2)), 7, 8)
INSERT [dbo].[OrderLine] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [BookId]) VALUES (10, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'knjiga8', 1, CAST(549.00 AS Decimal(18, 2)), 4, 3)
INSERT [dbo].[OrderLine] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [BookId]) VALUES (18, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'knjiga9', 2, CAST(449.00 AS Decimal(18, 2)), 15, 4)
INSERT [dbo].[OrderLine] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [BookId]) VALUES (19, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'knjiga10', 2, CAST(399.00 AS Decimal(18, 2)), 19, 16)
INSERT [dbo].[OrderLine] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [BookId]) VALUES (22, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'knjiga11', 1, CAST(259.00 AS Decimal(18, 2)), 19, 2)
INSERT [dbo].[OrderLine] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [BookId]) VALUES (24, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'knjiga12', 1, CAST(687.00 AS Decimal(18, 2)), 9, 5)
INSERT [dbo].[OrderLine] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [BookId]) VALUES (25, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'knjiga13', 1, CAST(289.00 AS Decimal(18, 2)), 5, 5)
INSERT [dbo].[OrderLine] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [BookId]) VALUES (26, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'knjiga14', 1, CAST(255.00 AS Decimal(18, 2)), 20, 20)
INSERT [dbo].[OrderLine] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [BookId]) VALUES (27, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'knjiga15', 3, CAST(499.00 AS Decimal(18, 2)), 6, 6)
INSERT [dbo].[OrderLine] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [BookId]) VALUES (28, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'knjiga16', 4, CAST(155.00 AS Decimal(18, 2)), 7, 7)
INSERT [dbo].[OrderLine] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [BookId]) VALUES (29, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'knjiga17', 1, CAST(799.00 AS Decimal(18, 2)), 11, 11)
INSERT [dbo].[OrderLine] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [BookId]) VALUES (33, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'knjiga18', 3, CAST(269.00 AS Decimal(18, 2)), 14, 16)
INSERT [dbo].[OrderLine] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [BookId]) VALUES (34, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'knjiga19', 1, CAST(188.00 AS Decimal(18, 2)), 18, 18)
INSERT [dbo].[OrderLine] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [Quantity], [Price], [OrderId], [BookId]) VALUES (35, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'knjiga20', 2, CAST(1555.00 AS Decimal(18, 2)), 19, 19)
SET IDENTITY_INSERT [dbo].[OrderLine] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Address], [OrderDate], [UserId]) VALUES (2, CAST(N'2020-06-28T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'Pere perice 21', CAST(N'2020-06-28T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Orders] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Address], [OrderDate], [UserId]) VALUES (3, CAST(N'2020-06-25T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'milosa milosa', CAST(N'2020-06-26T00:00:00.0000000' AS DateTime2), 2)
INSERT [dbo].[Orders] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Address], [OrderDate], [UserId]) VALUES (4, CAST(N'2020-06-06T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'paja patak 123', CAST(N'2020-06-06T00:00:00.0000000' AS DateTime2), 3)
INSERT [dbo].[Orders] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Address], [OrderDate], [UserId]) VALUES (5, CAST(N'2020-05-06T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'mike mikica5 ', CAST(N'2020-05-06T00:00:00.0000000' AS DateTime2), 4)
INSERT [dbo].[Orders] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Address], [OrderDate], [UserId]) VALUES (6, CAST(N'2020-05-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'perice pere 3', CAST(N'2020-05-01T00:00:00.0000000' AS DateTime2), 3)
INSERT [dbo].[Orders] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Address], [OrderDate], [UserId]) VALUES (7, CAST(N'2020-06-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'jovana jovanovica', CAST(N'2020-06-01T00:00:00.0000000' AS DateTime2), 5)
INSERT [dbo].[Orders] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Address], [OrderDate], [UserId]) VALUES (8, CAST(N'2020-06-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'ulica 123', CAST(N'2020-06-01T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Orders] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Address], [OrderDate], [UserId]) VALUES (9, CAST(N'2020-06-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'pored ulice22', CAST(N'2020-06-01T00:00:00.0000000' AS DateTime2), 2)
INSERT [dbo].[Orders] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Address], [OrderDate], [UserId]) VALUES (10, CAST(N'2020-06-09T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'ulica blabla3', CAST(N'2020-06-09T00:00:00.0000000' AS DateTime2), 6)
INSERT [dbo].[Orders] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Address], [OrderDate], [UserId]) VALUES (11, CAST(N'2020-06-26T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'trallaal', CAST(N'2020-06-26T00:00:00.0000000' AS DateTime2), 8)
INSERT [dbo].[Orders] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Address], [OrderDate], [UserId]) VALUES (14, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'blablab323', CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), 8)
INSERT [dbo].[Orders] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Address], [OrderDate], [UserId]) VALUES (15, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'tra33', CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), 6)
INSERT [dbo].[Orders] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Address], [OrderDate], [UserId]) VALUES (16, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'ulicica 54', CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), 5)
INSERT [dbo].[Orders] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Address], [OrderDate], [UserId]) VALUES (17, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'perice 18', CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), 5)
INSERT [dbo].[Orders] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Address], [OrderDate], [UserId]) VALUES (18, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'ustanicka 256', CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), 7)
INSERT [dbo].[Orders] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Address], [OrderDate], [UserId]) VALUES (19, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'ustanicka 87', CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), 7)
INSERT [dbo].[Orders] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Address], [OrderDate], [UserId]) VALUES (20, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'ustanicka ', CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), 7)
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[Publishers] ON 

INSERT [dbo].[Publishers] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [City], [State]) VALUES (1, CAST(N'2020-06-26T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'Stev', N'konjarnik', N'konjarnik')
INSERT [dbo].[Publishers] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [City], [State]) VALUES (2, CAST(N'2020-06-27T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'Vucic', N'Belgrade', N'Serbia')
INSERT [dbo].[Publishers] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [City], [State]) VALUES (3, CAST(N'2020-05-05T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'pera', N'Novi Sad', N'Srbija')
INSERT [dbo].[Publishers] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name], [City], [State]) VALUES (4, CAST(N'2020-03-23T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'Jovana', N'Nis', N'Srbija')
SET IDENTITY_INSERT [dbo].[Publishers] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (1, CAST(N'2020-06-27T18:16:10.1905713' AS DateTime2), NULL, NULL, 0, 1, N'Admin')
INSERT [dbo].[Roles] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (2, CAST(N'2020-06-27T18:16:18.6578448' AS DateTime2), NULL, NULL, 0, 1, N'User')
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[UseCaseLogs] ON 

INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1, CAST(N'2020-07-01T05:05:41.7435038' AS DateTime2), N'Get single User', N'3', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2, CAST(N'2020-07-01T05:26:05.3639467' AS DateTime2), N'Get single User', N'3', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (3, CAST(N'2020-07-01T09:45:00.3210941' AS DateTime2), N'Get Users', N'{"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (4, CAST(N'2020-07-01T09:46:50.0406723' AS DateTime2), N'User Registration', N'{"FirstName":"pera","LastName":"peric","Username":"pekili","Password":"pekili123","Email":"pekilica@gmail.com"}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (5, CAST(N'2020-07-01T09:49:55.5255123' AS DateTime2), N'User Registration', N'{"FirstName":"stevan","LastName":"zdravkovic","Username":"steva123","Password":"steva123","Email":"stevan.zdravkovic.309.16@ict.edu.rs"}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (6, CAST(N'2020-07-01T10:00:10.3224430' AS DateTime2), N'Create genre using ef', N'{"Id":0,"Name":"Romance"}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (7, CAST(N'2020-07-01T10:01:10.0485232' AS DateTime2), N'Create genre using ef', N'{"Id":0,"Name":"Romance"}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (8, CAST(N'2020-07-01T10:01:49.4341139' AS DateTime2), N'Create genre using ef', N'{"Id":0,"Name":"Satire"}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (9, CAST(N'2020-07-01T10:01:57.8253951' AS DateTime2), N'Create genre using ef', N'{"Id":0,"Name":"Thriller"}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (10, CAST(N'2020-07-01T10:02:05.7959981' AS DateTime2), N'Create genre using ef', N'{"Id":0,"Name":"Western"}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (11, CAST(N'2020-07-01T10:02:16.2648842' AS DateTime2), N'Create genre using ef', N'{"Id":0,"Name":"Philosophy"}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (12, CAST(N'2020-07-01T10:02:23.6219760' AS DateTime2), N'Create genre using ef', N'{"Id":0,"Name":"Science"}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (13, CAST(N'2020-07-01T10:02:31.3024674' AS DateTime2), N'Create genre using ef', N'{"Id":0,"Name":"Travel"}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (14, CAST(N'2020-07-01T10:02:37.8522758' AS DateTime2), N'Create genre using ef', N'{"Id":0,"Name":"Sports "}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (15, CAST(N'2020-07-01T10:02:50.4014144' AS DateTime2), N'Create genre using ef', N'{"Id":0,"Name":"Math"}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (16, CAST(N'2020-07-01T10:02:57.1607365' AS DateTime2), N'Create genre using ef', N'{"Id":0,"Name":"History"}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (17, CAST(N'2020-07-01T10:03:06.7359107' AS DateTime2), N'Create genre using ef', N'{"Id":0,"Name":"Health"}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (18, CAST(N'2020-07-01T10:03:13.4124728' AS DateTime2), N'Create genre using ef', N'{"Id":0,"Name":"fitness"}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (19, CAST(N'2020-07-01T10:03:20.4586798' AS DateTime2), N'Create genre using ef', N'{"Id":0,"Name":"Encyclopedia"}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (20, CAST(N'2020-07-01T10:03:26.6601436' AS DateTime2), N'Create genre using ef', N'{"Id":0,"Name":"Cookbook"}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (21, CAST(N'2020-07-01T10:03:34.2248013' AS DateTime2), N'Create genre using ef', N'{"Id":0,"Name":"Biography"}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (22, CAST(N'2020-07-01T10:03:40.0960200' AS DateTime2), N'Create genre using ef', N'{"Id":0,"Name":"Autobiography"}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (23, CAST(N'2020-07-01T10:07:33.1328920' AS DateTime2), N'Create author using ef', N'{"Id":0,"FirstName":"ERNEST","LastName":"HEMINGWAY","BirthPlace":"Leskovac","Birth":"1936-05-05T00:00:00","AuthorBooks":[]}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (24, CAST(N'2020-07-01T08:49:12.4425609' AS DateTime2), N'Create author using ef', N'{"Id":0,"FirstName":"ERNEST","LastName":"HEMINGWAY","BirthPlace":"Leskovac","Birth":"1936-05-05T00:00:00","AuthorBooks":[{"BookId":3,"AuthorId":0},{"BookId":5,"AuthorId":0}]}', N'stevanz')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (25, CAST(N'2020-07-01T08:50:43.2296049' AS DateTime2), N'Create author using ef', N'{"Id":0,"FirstName":"ERNEST","LastName":"HEMINGWAY","BirthPlace":"Leskovac","Birth":"1936-05-05T00:00:00","AuthorBooks":[{"BookId":3,"AuthorId":0},{"BookId":5,"AuthorId":0}]}', N'pera123')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (26, CAST(N'2020-07-01T08:55:07.6789354' AS DateTime2), N'Upload File', N'{"Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"avatar.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"avatar.jpg\""],"Content-Type":["image/jpeg"]},"Length":69569,"Name":"Image","FileName":"avatar.jpg"}}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (27, CAST(N'2020-07-01T08:56:01.5658608' AS DateTime2), N'Upload File', N'{"Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"avatar.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"avatar.jpg\""],"Content-Type":["image/jpeg"]},"Length":69569,"Name":"Image","FileName":"avatar.jpg"}}', N'pera123')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (28, CAST(N'2020-07-01T09:22:24.8849079' AS DateTime2), N'Get books', N'{"Title":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (29, CAST(N'2020-07-01T09:23:07.1343075' AS DateTime2), N'Get books', N'{"Title":null,"PerPage":3,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (30, CAST(N'2020-07-01T09:23:27.4935986' AS DateTime2), N'Get books', N'{"Title":null,"PerPage":3,"Page":2}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (31, CAST(N'2020-07-01T09:25:52.1992589' AS DateTime2), N'Get books', N'{"Title":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (32, CAST(N'2020-07-01T09:32:12.3972613' AS DateTime2), N'Get books', N'{"Title":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (33, CAST(N'2020-07-01T09:32:28.3729779' AS DateTime2), N'Get Single book using ef', N'2', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (34, CAST(N'2020-07-01T09:33:56.5567480' AS DateTime2), N'Get Single book using ef', N'2', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (35, CAST(N'2020-07-01T09:34:50.5114709' AS DateTime2), N'Get Single book using ef', N'2', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (36, CAST(N'2020-07-01T09:35:58.4367350' AS DateTime2), N'Get publishers', N'{"Name":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (37, CAST(N'2020-07-01T09:36:03.7110839' AS DateTime2), N'Get single publisher', N'2', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (38, CAST(N'2020-07-01T09:36:11.3466156' AS DateTime2), N'Get publishers', N'{"Name":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (39, CAST(N'2020-07-01T09:36:18.8804345' AS DateTime2), N'Get single publisher', N'3', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (40, CAST(N'2020-07-01T09:41:45.2044556' AS DateTime2), N'Get single publisher', N'3', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (41, CAST(N'2020-07-01T09:46:06.9473825' AS DateTime2), N'Get single publisher', N'3', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (42, CAST(N'2020-07-01T09:46:43.0417641' AS DateTime2), N'Get Genres', N'{"Name":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (43, CAST(N'2020-07-01T09:47:07.5577397' AS DateTime2), N'Get single genre', N'11', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (44, CAST(N'2020-07-01T10:24:45.8217354' AS DateTime2), N'Upload File', N'{"Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"avatar.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"avatar.jpg\""],"Content-Type":["image/jpeg"]},"Length":69569,"Name":"Image","FileName":"avatar.jpg"}}', N'pera123')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (45, CAST(N'2020-07-01T10:38:30.2507000' AS DateTime2), N'Get books', N'{"Title":null,"MinPrice":0.0,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (46, CAST(N'2020-07-01T10:38:41.5078577' AS DateTime2), N'Get books', N'{"Title":null,"MinPrice":1000.0,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (47, CAST(N'2020-07-01T10:38:51.4664736' AS DateTime2), N'Get books', N'{"Title":null,"MinPrice":500.0,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (48, CAST(N'2020-07-01T10:40:16.3665609' AS DateTime2), N'Get books', N'{"Title":null,"MinPrice":0.0,"MaxPrice":500,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (49, CAST(N'2020-07-01T10:40:39.1259076' AS DateTime2), N'Get books', N'{"Title":"Knjiga","MinPrice":0.0,"MaxPrice":0,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (50, CAST(N'2020-07-01T10:40:48.2467587' AS DateTime2), N'Get books', N'{"Title":"Knjiga10","MinPrice":0.0,"MaxPrice":0,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (51, CAST(N'2020-07-01T10:41:10.1413496' AS DateTime2), N'Get books', N'{"Title":null,"MinPrice":0.0,"MaxPrice":500,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (52, CAST(N'2020-07-01T10:49:20.7673227' AS DateTime2), N'Get authors using ef', N'{"FirstName":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (53, CAST(N'2020-07-01T10:49:31.7326994' AS DateTime2), N'Get authors using ef', N'{"FirstName":"dejan","PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (54, CAST(N'2020-07-01T10:49:45.7017266' AS DateTime2), N'Get authors using ef', N'{"FirstName":"ernest","PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (55, CAST(N'2020-07-01T10:54:56.2405373' AS DateTime2), N'Upload File', N'{"Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"avatar.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"avatar.jpg\""],"Content-Type":["image/jpeg"]},"Length":69569,"Name":"Image","FileName":"avatar.jpg"}}', N'pera123')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (56, CAST(N'2020-07-01T10:55:08.5718692' AS DateTime2), N'Get Users', N'{"FirstName":"pera","LastName":null,"Username":null,"PerPage":10,"Page":1}', N'Anonymus user')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (57, CAST(N'2020-07-01T10:56:02.9409433' AS DateTime2), N'Upload File', N'{"Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"avatar.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"avatar.jpg\""],"Content-Type":["image/jpeg"]},"Length":69569,"Name":"Image","FileName":"avatar.jpg"}}', N'pera123')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (58, CAST(N'2020-07-01T10:56:11.4972513' AS DateTime2), N'Get Users', N'{"FirstName":null,"LastName":null,"Username":null,"PerPage":10,"Page":1}', N'Anonymus user')
SET IDENTITY_INSERT [dbo].[UseCaseLogs] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Username], [Password], [RoleId], [Email]) VALUES (1, CAST(N'2020-05-25T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'steva', N'zdravkovic', N'stevanz', N'steva123', 2, N'aaa@gmail.com')
INSERT [dbo].[Users] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Username], [Password], [RoleId], [Email]) VALUES (2, CAST(N'2020-05-29T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'pera', N'peric', N'pera123', N'pera123', 1, N'steva@gmail.com')
INSERT [dbo].[Users] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Username], [Password], [RoleId], [Email]) VALUES (3, CAST(N'2020-04-29T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'Nikola', N'Nikolic', N'nikola123', N'nikola123', 2, N'nikola@gmail.com')
INSERT [dbo].[Users] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Username], [Password], [RoleId], [Email]) VALUES (4, CAST(N'2020-06-06T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 1, N'paja', N'patak', N'paja123', N'paja123', 2, N'paja@gmail.com')
INSERT [dbo].[Users] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Username], [Password], [RoleId], [Email]) VALUES (5, CAST(N'2020-07-01T06:10:25.5645726' AS DateTime2), NULL, NULL, 0, 1, N'janko', N'veljkovic', N'jankec', N'jankec', 2, N'jankec@gmail.com')
INSERT [dbo].[Users] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Username], [Password], [RoleId], [Email]) VALUES (6, CAST(N'2020-07-01T06:11:03.8801902' AS DateTime2), NULL, NULL, 0, 1, N'nika', N'veljkovic', N'nika', N'jankec', 2, N'n.pule96@gmail.com')
INSERT [dbo].[Users] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Username], [Password], [RoleId], [Email]) VALUES (7, CAST(N'2020-07-01T11:47:22.7640996' AS DateTime2), NULL, NULL, 0, 1, N'pera', N'peric', N'pekili', N'pekili123', 2, N'pekilica@gmail.com')
INSERT [dbo].[Users] ([Id], [CreatedAt], [DeletedAt], [ModifiedAt], [IsDeleted], [IsActive], [FirstName], [LastName], [Username], [Password], [RoleId], [Email]) VALUES (8, CAST(N'2020-07-01T11:49:57.6281223' AS DateTime2), NULL, NULL, 0, 1, N'stevan', N'zdravkovic', N'steva123', N'steva123', 2, N'stevan.zdravkovic.309.16@ict.edu.rs')
SET IDENTITY_INSERT [dbo].[Users] OFF
SET IDENTITY_INSERT [dbo].[UserUseCases] ON 

INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (1, 1, 2)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (2, 1, 3)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (3, 1, 4)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (4, 1, 5)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (5, 1, 6)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (6, 1, 7)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (7, 1, 8)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (8, 1, 9)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (9, 1, 10)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (10, 1, 11)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (11, 1, 12)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (12, 3, 2)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (13, 3, 3)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (14, 3, 4)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (15, 3, 5)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (16, 3, 6)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (17, 3, 7)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (19, 3, 8)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (20, 3, 9)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (21, 3, 10)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (22, 3, 11)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (23, 3, 12)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (24, 4, 2)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (25, 4, 3)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (26, 4, 4)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (27, 4, 5)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (28, 4, 6)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (29, 4, 7)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (30, 4, 8)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (31, 4, 9)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (32, 4, 10)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (33, 4, 11)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (34, 4, 12)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (35, 5, 2)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (36, 5, 3)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (37, 5, 4)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (38, 5, 5)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (39, 5, 6)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (40, 5, 7)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (41, 5, 8)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (42, 5, 9)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (43, 5, 10)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (44, 5, 11)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (45, 5, 12)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (46, 6, 2)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (47, 6, 3)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (48, 6, 4)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (49, 6, 5)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (50, 6, 6)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (51, 6, 7)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (52, 6, 8)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (53, 6, 9)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (54, 6, 10)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (55, 6, 11)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (56, 6, 12)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (57, 2, 2)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (58, 2, 3)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (59, 2, 4)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (60, 2, 5)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (61, 2, 6)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (62, 2, 7)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (63, 2, 8)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (64, 2, 9)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (65, 2, 10)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (66, 2, 11)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (67, 2, 12)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (68, 2, 13)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (69, 2, 14)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (70, 2, 15)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (71, 2, 16)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (72, 2, 17)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (73, 2, 18)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (74, 2, 19)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (75, 2, 20)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (76, 2, 21)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (77, 2, 22)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (78, 2, 23)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (79, 2, 24)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (80, 2, 25)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (81, 2, 26)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (82, 2, 27)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (83, 2, 28)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (84, 2, 29)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (85, 2, 30)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (86, 7, 2)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (87, 7, 3)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (88, 7, 4)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (89, 7, 5)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (90, 7, 6)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (91, 7, 7)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (92, 7, 8)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (93, 7, 9)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (94, 7, 10)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (95, 7, 11)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (96, 7, 12)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (97, 8, 2)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (98, 8, 3)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (99, 8, 4)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (100, 8, 5)
GO
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (101, 8, 6)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (102, 8, 7)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (103, 8, 8)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (104, 8, 9)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (105, 8, 10)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (106, 8, 11)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (107, 8, 12)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (108, 2, 31)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (109, 2, 32)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (110, 2, 33)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (111, 2, 34)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (112, 2, 35)
SET IDENTITY_INSERT [dbo].[UserUseCases] OFF
/****** Object:  Index [IX_BookAuthor_AuthorId]    Script Date: 1.7.2020. 14:41:31 ******/
CREATE NONCLUSTERED INDEX [IX_BookAuthor_AuthorId] ON [dbo].[BookAuthor]
(
	[AuthorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_BookAuthor_BookId]    Script Date: 1.7.2020. 14:41:31 ******/
CREATE NONCLUSTERED INDEX [IX_BookAuthor_BookId] ON [dbo].[BookAuthor]
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Books_GenreId]    Script Date: 1.7.2020. 14:41:31 ******/
CREATE NONCLUSTERED INDEX [IX_Books_GenreId] ON [dbo].[Books]
(
	[GenreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Books_PublisherId]    Script Date: 1.7.2020. 14:41:31 ******/
CREATE NONCLUSTERED INDEX [IX_Books_PublisherId] ON [dbo].[Books]
(
	[PublisherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Books_Title]    Script Date: 1.7.2020. 14:41:31 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Books_Title] ON [dbo].[Books]
(
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Genres_Name]    Script Date: 1.7.2020. 14:41:31 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Genres_Name] ON [dbo].[Genres]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderLine_BookId]    Script Date: 1.7.2020. 14:41:31 ******/
CREATE NONCLUSTERED INDEX [IX_OrderLine_BookId] ON [dbo].[OrderLine]
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderLine_OrderId]    Script Date: 1.7.2020. 14:41:31 ******/
CREATE NONCLUSTERED INDEX [IX_OrderLine_OrderId] ON [dbo].[OrderLine]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Orders_UserId]    Script Date: 1.7.2020. 14:41:31 ******/
CREATE NONCLUSTERED INDEX [IX_Orders_UserId] ON [dbo].[Orders]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Roles_Name]    Script Date: 1.7.2020. 14:41:31 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Roles_Name] ON [dbo].[Roles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [AK_Users_Username]    Script Date: 1.7.2020. 14:41:31 ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [AK_Users_Username] UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_Email]    Script Date: 1.7.2020. 14:41:31 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_Email] ON [dbo].[Users]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Users_RoleId]    Script Date: 1.7.2020. 14:41:31 ******/
CREATE NONCLUSTERED INDEX [IX_Users_RoleId] ON [dbo].[Users]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_Username]    Script Date: 1.7.2020. 14:41:31 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_Username] ON [dbo].[Users]
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserUseCases_UserId]    Script Date: 1.7.2020. 14:41:31 ******/
CREATE NONCLUSTERED INDEX [IX_UserUseCases_UserId] ON [dbo].[UserUseCases]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Books] ADD  DEFAULT ((0)) FOR [PublisherId]
GO
ALTER TABLE [dbo].[Books] ADD  DEFAULT ((0)) FOR [GenreId]
GO
ALTER TABLE [dbo].[Books] ADD  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[BookAuthor]  WITH CHECK ADD  CONSTRAINT [FK_BookAuthor_Authors_AuthorId] FOREIGN KEY([AuthorId])
REFERENCES [dbo].[Authors] ([Id])
GO
ALTER TABLE [dbo].[BookAuthor] CHECK CONSTRAINT [FK_BookAuthor_Authors_AuthorId]
GO
ALTER TABLE [dbo].[BookAuthor]  WITH CHECK ADD  CONSTRAINT [FK_BookAuthor_Books_BookId] FOREIGN KEY([BookId])
REFERENCES [dbo].[Books] ([Id])
GO
ALTER TABLE [dbo].[BookAuthor] CHECK CONSTRAINT [FK_BookAuthor_Books_BookId]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Genres_GenreId] FOREIGN KEY([GenreId])
REFERENCES [dbo].[Genres] ([Id])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Genres_GenreId]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Publishers_PublisherId] FOREIGN KEY([PublisherId])
REFERENCES [dbo].[Publishers] ([Id])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Publishers_PublisherId]
GO
ALTER TABLE [dbo].[OrderLine]  WITH CHECK ADD  CONSTRAINT [FK_OrderLine_Books_BookId] FOREIGN KEY([BookId])
REFERENCES [dbo].[Books] ([Id])
GO
ALTER TABLE [dbo].[OrderLine] CHECK CONSTRAINT [FK_OrderLine_Books_BookId]
GO
ALTER TABLE [dbo].[OrderLine]  WITH CHECK ADD  CONSTRAINT [FK_OrderLine_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderLine] CHECK CONSTRAINT [FK_OrderLine_Orders_OrderId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users_UserId]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles_RoleId]
GO
ALTER TABLE [dbo].[UserUseCases]  WITH CHECK ADD  CONSTRAINT [FK_UserUseCases_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserUseCases] CHECK CONSTRAINT [FK_UserUseCases_Users_UserId]
GO
USE [master]
GO
ALTER DATABASE [bookstore] SET  READ_WRITE 
GO
