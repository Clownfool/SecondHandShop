USE [master]
GO
/****** Object:  Database [platform_online]    Script Date: 11/10/2024 7:43:34 CH ******/
CREATE DATABASE [platform_online]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'platform_online', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\platform_online.mdf' , SIZE = 87616KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'platform_online_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\platform_online.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [platform_online] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [platform_online].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [platform_online] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [platform_online] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [platform_online] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [platform_online] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [platform_online] SET ARITHABORT OFF 
GO
ALTER DATABASE [platform_online] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [platform_online] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [platform_online] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [platform_online] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [platform_online] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [platform_online] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [platform_online] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [platform_online] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [platform_online] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [platform_online] SET  DISABLE_BROKER 
GO
ALTER DATABASE [platform_online] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [platform_online] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [platform_online] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [platform_online] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [platform_online] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [platform_online] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [platform_online] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [platform_online] SET RECOVERY FULL 
GO
ALTER DATABASE [platform_online] SET  MULTI_USER 
GO
ALTER DATABASE [platform_online] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [platform_online] SET DB_CHAINING OFF 
GO
ALTER DATABASE [platform_online] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [platform_online] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [platform_online] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [platform_online] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'platform_online', N'ON'
GO
ALTER DATABASE [platform_online] SET QUERY_STORE = OFF
GO
USE [platform_online]
GO
/****** Object:  Table [dbo].[cart_item]    Script Date: 11/10/2024 7:43:35 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart_item](
	[cart_item_id] [int] IDENTITY(1,1) NOT NULL,
	[quantity] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[cart_id] [int] NOT NULL,
	[price] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[cart_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 11/10/2024 7:43:35 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[category](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[chatroom]    Script Date: 11/10/2024 7:43:35 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chatroom](
	[roomId] [int] IDENTITY(1,1) NOT NULL,
	[user1Id] [int] NULL,
	[user2Id] [int] NULL,
 CONSTRAINT [PK__chatroom__6C3BF5BE347B69A9] PRIMARY KEY CLUSTERED 
(
	[roomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[discount]    Script Date: 11/10/2024 7:43:35 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[discount](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](255) NOT NULL,
	[discount_percent] [float] NOT NULL,
	[valid_from] [date] NOT NULL,
	[valid_to] [date] NOT NULL,
	[status] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[image]    Script Date: 11/10/2024 7:43:35 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[image](
	[image_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NULL,
	[img] [varbinary](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[image_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[message]    Script Date: 11/10/2024 7:43:35 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[message](
	[messageId] [int] IDENTITY(1,1) NOT NULL,
	[senderId] [int] NOT NULL,
	[senderName] [nvarchar](max) NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[timestamp] [datetime] NOT NULL,
	[roomId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[messageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_item]    Script Date: 11/10/2024 7:43:35 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_item](
	[order_item_id] [int] IDENTITY(1,1) NOT NULL,
	[quantity] [int] NOT NULL,
	[order_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[price] [money] NOT NULL,
 CONSTRAINT [PK__order_it__3764B6BCD0C0615C] PRIMARY KEY CLUSTERED 
(
	[order_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_table]    Script Date: 11/10/2024 7:43:35 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_table](
	[order_id] [int] NOT NULL,
	[ship_name] [nvarchar](max) NOT NULL,
	[ship_mail] [nvarchar](100) NOT NULL,
	[ship_phone] [nvarchar](max) NOT NULL,
	[ship_address] [nvarchar](max) NOT NULL,
	[order_date] [datetime] NULL,
	[ship_fee] [money] NULL,
	[discount_code] [nvarchar](255) NULL,
	[total_amount] [money] NULL,
	[payment_method] [nvarchar](10) NULL,
	[status] [nvarchar](20) NULL,
	[user_id] [int] NULL,
	[seller_id] [int] NOT NULL,
	[shipper_id] [int] NULL,
 CONSTRAINT [PK__order_ta__46596229397A014F] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 11/10/2024 7:43:35 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[price] [money] NOT NULL,
	[quantity] [int] NOT NULL,
	[description] [nvarchar](max) NULL,
	[quantity_sold] [int] NULL,
	[category_id] [int] NULL,
	[user_id] [int] NULL,
	[status] [nvarchar](20) NULL,
 CONSTRAINT [PK__product__47027DF51F9C3277] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[review]    Script Date: 11/10/2024 7:43:35 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[review](
	[review_id] [int] IDENTITY(1,1) NOT NULL,
	[rating] [float] NOT NULL,
	[comment] [nvarchar](max) NULL,
	[ratingDate] [datetime] NULL,
	[user_id] [int] NULL,
	[product_id] [int] NULL,
 CONSTRAINT [PK__review__60883D903FAF9B46] PRIMARY KEY CLUSTERED 
(
	[review_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[shopping_cart]    Script Date: 11/10/2024 7:43:35 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shopping_cart](
	[cart_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[cart_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 11/10/2024 7:43:35 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](255) NULL,
	[name] [nvarchar](50) NULL,
	[email] [nvarchar](100) NOT NULL,
	[address] [nvarchar](255) NULL,
	[phone] [nvarchar](max) NULL,
	[role] [nvarchar](50) NULL,
 CONSTRAINT [PK__user__B9BE370FCAF8B675] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_user_Username] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[cart_item]  WITH CHECK ADD FOREIGN KEY([cart_id])
REFERENCES [dbo].[shopping_cart] ([cart_id])
GO
ALTER TABLE [dbo].[cart_item]  WITH CHECK ADD  CONSTRAINT [FK__cart_item__produ__398D8EEE] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[cart_item] CHECK CONSTRAINT [FK__cart_item__produ__398D8EEE]
GO
ALTER TABLE [dbo].[chatroom]  WITH CHECK ADD  CONSTRAINT [FK_Chatroom_User1] FOREIGN KEY([user1Id])
REFERENCES [dbo].[user] ([user_id])
GO
ALTER TABLE [dbo].[chatroom] CHECK CONSTRAINT [FK_Chatroom_User1]
GO
ALTER TABLE [dbo].[chatroom]  WITH CHECK ADD  CONSTRAINT [FK_Chatroom_User2] FOREIGN KEY([user2Id])
REFERENCES [dbo].[user] ([user_id])
GO
ALTER TABLE [dbo].[chatroom] CHECK CONSTRAINT [FK_Chatroom_User2]
GO
ALTER TABLE [dbo].[image]  WITH CHECK ADD  CONSTRAINT [FK__image__product_i__4E88ABD4] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[image] CHECK CONSTRAINT [FK__image__product_i__4E88ABD4]
GO
ALTER TABLE [dbo].[message]  WITH CHECK ADD  CONSTRAINT [FK__message__roomId__3D5E1FD2] FOREIGN KEY([roomId])
REFERENCES [dbo].[chatroom] ([roomId])
GO
ALTER TABLE [dbo].[message] CHECK CONSTRAINT [FK__message__roomId__3D5E1FD2]
GO
ALTER TABLE [dbo].[order_item]  WITH CHECK ADD  CONSTRAINT [FK__order_ite__order__403A8C7D] FOREIGN KEY([order_id])
REFERENCES [dbo].[order_table] ([order_id])
GO
ALTER TABLE [dbo].[order_item] CHECK CONSTRAINT [FK__order_ite__order__403A8C7D]
GO
ALTER TABLE [dbo].[order_item]  WITH CHECK ADD  CONSTRAINT [FK__order_ite__produ__412EB0B6] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[order_item] CHECK CONSTRAINT [FK__order_ite__produ__412EB0B6]
GO
ALTER TABLE [dbo].[order_table]  WITH CHECK ADD  CONSTRAINT [FK__order_tab__disco__2F10007B] FOREIGN KEY([discount_code])
REFERENCES [dbo].[discount] ([code])
GO
ALTER TABLE [dbo].[order_table] CHECK CONSTRAINT [FK__order_tab__disco__2F10007B]
GO
ALTER TABLE [dbo].[order_table]  WITH CHECK ADD  CONSTRAINT [FK__order_tab__shipp__01142BA1] FOREIGN KEY([seller_id])
REFERENCES [dbo].[user] ([user_id])
GO
ALTER TABLE [dbo].[order_table] CHECK CONSTRAINT [FK__order_tab__shipp__01142BA1]
GO
ALTER TABLE [dbo].[order_table]  WITH CHECK ADD  CONSTRAINT [FK__order_tab__shipp__02084FDA] FOREIGN KEY([shipper_id])
REFERENCES [dbo].[user] ([user_id])
GO
ALTER TABLE [dbo].[order_table] CHECK CONSTRAINT [FK__order_tab__shipp__02084FDA]
GO
ALTER TABLE [dbo].[order_table]  WITH CHECK ADD  CONSTRAINT [FK__order_tab__user___2E1BDC42] FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([user_id])
GO
ALTER TABLE [dbo].[order_table] CHECK CONSTRAINT [FK__order_tab__user___2E1BDC42]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK__product__categor__35BCFE0A] FOREIGN KEY([category_id])
REFERENCES [dbo].[category] ([category_id])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK__product__categor__35BCFE0A]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK__product__user_id__36B12243] FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([user_id])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK__product__user_id__36B12243]
GO
ALTER TABLE [dbo].[review]  WITH CHECK ADD  CONSTRAINT [FK__review__product___44FF419A] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([product_id])
GO
ALTER TABLE [dbo].[review] CHECK CONSTRAINT [FK__review__product___44FF419A]
GO
ALTER TABLE [dbo].[review]  WITH CHECK ADD  CONSTRAINT [FK__review__user_id__440B1D61] FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([user_id])
GO
ALTER TABLE [dbo].[review] CHECK CONSTRAINT [FK__review__user_id__440B1D61]
GO
ALTER TABLE [dbo].[shopping_cart]  WITH CHECK ADD  CONSTRAINT [FK__shopping___user___29572725] FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([user_id])
GO
ALTER TABLE [dbo].[shopping_cart] CHECK CONSTRAINT [FK__shopping___user___29572725]
GO
USE [master]
GO
ALTER DATABASE [platform_online] SET  READ_WRITE 
GO
