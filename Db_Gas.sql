USE [master]
GO
/****** Object:  Database [Db_GasStation]    Script Date: 9/17/2024 3:23:46 AM ******/
CREATE DATABASE [Db_GasStation]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Db_GasStation', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Db_GasStation.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Db_GasStation_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Db_GasStation_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Db_GasStation] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Db_GasStation].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Db_GasStation] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Db_GasStation] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Db_GasStation] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Db_GasStation] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Db_GasStation] SET ARITHABORT OFF 
GO
ALTER DATABASE [Db_GasStation] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Db_GasStation] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Db_GasStation] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Db_GasStation] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Db_GasStation] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Db_GasStation] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Db_GasStation] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Db_GasStation] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Db_GasStation] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Db_GasStation] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Db_GasStation] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Db_GasStation] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Db_GasStation] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Db_GasStation] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Db_GasStation] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Db_GasStation] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Db_GasStation] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Db_GasStation] SET RECOVERY FULL 
GO
ALTER DATABASE [Db_GasStation] SET  MULTI_USER 
GO
ALTER DATABASE [Db_GasStation] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Db_GasStation] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Db_GasStation] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Db_GasStation] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Db_GasStation] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Db_GasStation] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Db_GasStation', N'ON'
GO
ALTER DATABASE [Db_GasStation] SET QUERY_STORE = ON
GO
ALTER DATABASE [Db_GasStation] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Db_GasStation]
GO
/****** Object:  Table [dbo].[TblCashReg]    Script Date: 9/17/2024 3:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblCashReg](
	[CashRegister] [decimal](18, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblGas]    Script Date: 9/17/2024 3:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblGas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[gasType] [varchar](20) NULL,
	[buyPrice] [decimal](18, 2) NULL,
	[salePrice] [decimal](18, 2) NULL,
	[stock] [decimal](18, 2) NULL,
 CONSTRAINT [PK_TblGas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblOperation]    Script Date: 9/17/2024 3:23:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblOperation](
	[operationId] [int] IDENTITY(1,1) NOT NULL,
	[carPlate] [varchar](20) NULL,
	[type] [varchar](20) NULL,
	[liter] [decimal](18, 2) NULL,
	[bill] [decimal](18, 2) NULL,
 CONSTRAINT [PK_TblOperation] PRIMARY KEY CLUSTERED 
(
	[operationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [Db_GasStation] SET  READ_WRITE 
GO
