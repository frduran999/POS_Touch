USE [master]
GO
/****** Object:  Database [delivery]    Script Date: 01-12-2019 3:33:32 ******/
CREATE DATABASE [delivery]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'pz_fl', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\delivery.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'pz_fl_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\delivery_log.ldf' , SIZE = 5184KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [delivery] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [delivery].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [delivery] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [delivery] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [delivery] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [delivery] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [delivery] SET ARITHABORT OFF 
GO
ALTER DATABASE [delivery] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [delivery] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [delivery] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [delivery] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [delivery] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [delivery] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [delivery] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [delivery] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [delivery] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [delivery] SET  DISABLE_BROKER 
GO
ALTER DATABASE [delivery] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [delivery] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [delivery] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [delivery] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [delivery] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [delivery] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [delivery] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [delivery] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [delivery] SET  MULTI_USER 
GO
ALTER DATABASE [delivery] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [delivery] SET DB_CHAINING OFF 
GO
ALTER DATABASE [delivery] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [delivery] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [delivery] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'delivery', N'ON'
GO
ALTER DATABASE [delivery] SET QUERY_STORE = OFF
GO
USE [delivery]
GO
/****** Object:  User [delivery]    Script Date: 01-12-2019 3:33:33 ******/
CREATE USER [delivery] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[cabecera_doc]    Script Date: 01-12-2019 3:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cabecera_doc](
	[id_doc] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[forma_pago] [char](20) NULL,
	[fecha_emision] [datetime] NOT NULL,
	[total] [numeric](18, 0) NULL,
	[efectivo] [numeric](18, 0) NULL,
	[IdUsuario] [int] NULL,
	[IdCaja] [int] NULL,
	[Eliminado] [int] NOT NULL,
 CONSTRAINT [PK_cabecera_doc] PRIMARY KEY CLUSTERED 
(
	[id_doc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Caja]    Script Date: 01-12-2019 3:33:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Caja](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Accion] [varchar](50) NULL,
	[Id_Usuario] [int] NULL,
	[Monto] [int] NULL,
	[Fecha] [datetime] NULL,
	[Glosa] [varchar](100) NULL,
 CONSTRAINT [PK_Caja] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Compra]    Script Date: 01-12-2019 3:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Compra](
	[IdCompra] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime] NULL,
	[Folio] [int] NULL,
	[IdProducto] [int] NULL,
	[Cantidad] [int] NULL,
	[IdUsuario] [int] NULL,
 CONSTRAINT [PK_Compra] PRIMARY KEY CLUSTERED 
(
	[IdCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalle]    Script Date: 01-12-2019 3:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle](
	[id_detalle] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[id_doc_cab] [numeric](18, 0) NULL,
	[descripcion] [char](80) NULL,
	[precio] [numeric](18, 0) NULL,
	[total] [numeric](18, 0) NULL,
	[cantidad] [int] NULL,
	[codigo] [char](30) NULL,
 CONSTRAINT [PK_detalle] PRIMARY KEY CLUSTERED 
(
	[id_detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FamiliaFoto]    Script Date: 01-12-2019 3:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FamiliaFoto](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FamiliaId] [int] NOT NULL,
	[Foto] [varbinary](max) NOT NULL,
	[FotoNombre] [nvarchar](50) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FamiliaProducto]    Script Date: 01-12-2019 3:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FamiliaProducto](
	[CodigoFamilia] [int] IDENTITY(1,1) NOT NULL,
	[Familia] [nvarchar](50) NOT NULL,
	[Impresora] [varchar](50) NULL,
	[Estado] [int] NOT NULL,
 CONSTRAINT [PK_FamiliaProducto] PRIMARY KEY CLUSTERED 
(
	[CodigoFamilia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FolioBoleta]    Script Date: 01-12-2019 3:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FolioBoleta](
	[FolioBoleta] [int] IDENTITY(1,1) NOT NULL,
	[NroTicket] [int] NULL,
	[IdUsuario] [int] NULL,
 CONSTRAINT [PK_FolioBoleta] PRIMARY KEY CLUSTERED 
(
	[FolioBoleta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[forma_pago]    Script Date: 01-12-2019 3:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[forma_pago](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[formapago] [char](80) NULL,
 CONSTRAINT [PK_forma_pago] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Impresoras]    Script Date: 01-12-2019 3:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Impresoras](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ImpresoraUno] [nvarchar](50) NOT NULL,
	[ImpresoraDos] [nvarchar](50) NOT NULL,
	[ImpresoraTres] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Impresoras] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LogInterno]    Script Date: 01-12-2019 3:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogInterno](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NroTicket] [int] NULL,
	[Fecha] [datetime] NULL,
	[Accion] [nvarchar](100) NULL,
	[IdUsuario] [int] NULL,
 CONSTRAINT [PK_LogInterno] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Oferta]    Script Date: 01-12-2019 3:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Oferta](
	[CodigoOferta] [nvarchar](20) NOT NULL,
	[NombreOferta] [nvarchar](50) NOT NULL,
	[PrecioOferta] [bigint] NOT NULL,
	[idOferta] [int] IDENTITY(1,1) NOT NULL,
	[Activo] [int] NOT NULL,
 CONSTRAINT [PK_Oferta_1] PRIMARY KEY CLUSTERED 
(
	[idOferta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OfertaDetalle]    Script Date: 01-12-2019 3:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OfertaDetalle](
	[IdDetalleOferta] [int] IDENTITY(1,1) NOT NULL,
	[IdOferta] [int] NOT NULL,
	[Descripcion_Producto] [nvarchar](80) NOT NULL,
	[Precio] [numeric](18, 0) NOT NULL,
	[Codigo_interno] [nchar](30) NOT NULL,
	[Codigo] [nvarchar](30) NOT NULL,
	[CodigoFamilia] [nvarchar](20) NOT NULL,
	[Familia] [nvarchar](50) NOT NULL,
	[idproducto] [int] NOT NULL,
	[Linea] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
 CONSTRAINT [PK_OfertaDetalle] PRIMARY KEY CLUSTERED 
(
	[IdDetalleOferta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[parametros]    Script Date: 01-12-2019 3:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[parametros](
	[nombre_param] [char](40) NOT NULL,
	[valor_param] [varchar](1000) NOT NULL,
 CONSTRAINT [PK_parametros] PRIMARY KEY CLUSTERED 
(
	[nombre_param] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Perfil]    Script Date: 01-12-2019 3:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Perfil](
	[Id_Perfil] [int] IDENTITY(1,1) NOT NULL,
	[Perfil] [varchar](50) NULL,
 CONSTRAINT [PK_Perfil] PRIMARY KEY CLUSTERED 
(
	[Id_Perfil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productos]    Script Date: 01-12-2019 3:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productos](
	[id_producto] [int] IDENTITY(1,1) NOT NULL,
	[descripcion_producto] [nchar](80) NOT NULL,
	[precio] [numeric](18, 0) NOT NULL,
	[codigo_interno] [nchar](30) NOT NULL,
	[codigo] [char](30) NOT NULL,
	[CodigoFamilia] [nvarchar](20) NOT NULL,
	[Estado] [int] NOT NULL,
 CONSTRAINT [PK_productos] PRIMARY KEY CLUSTERED 
(
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RetiroCaja]    Script Date: 01-12-2019 3:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RetiroCaja](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[Monto] [int] NOT NULL,
	[Glosa] [varchar](max) NOT NULL,
	[IdCaja] [int] NULL,
 CONSTRAINT [PK_RetiroCaja] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stock]    Script Date: 01-12-2019 3:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdProducto] [int] NULL,
	[Entradas] [int] NULL,
	[FechaEntrada] [datetime] NULL,
	[Salidas] [int] NULL,
	[FechaSalidas] [datetime] NULL,
	[Saldo] [int] NULL,
	[StockCritico] [int] NULL,
	[UnidadesStock] [int] NULL,
 CONSTRAINT [PK_Stock] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_doc]    Script Date: 01-12-2019 3:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_doc](
	[id_doc] [int] NOT NULL,
	[documento] [char](40) NULL,
 CONSTRAINT [PK_tipo_doc] PRIMARY KEY CLUSTERED 
(
	[id_doc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 01-12-2019 3:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[usuario] [nchar](10) NULL,
	[clave] [nchar](10) NULL,
	[supervisor] [bit] NULL,
	[perfil_Id] [int] NULL,
 CONSTRAINT [PK_usuarios] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cabecera_doc] ON 

INSERT [dbo].[cabecera_doc] ([id_doc], [forma_pago], [fecha_emision], [total], [efectivo], [IdUsuario], [IdCaja], [Eliminado]) VALUES (CAST(1 AS Numeric(18, 0)), N'Tarjeta             ', CAST(N'2019-11-27T00:00:00.000' AS DateTime), CAST(2000 AS Numeric(18, 0)), CAST(2000 AS Numeric(18, 0)), 1, 1, 0)
INSERT [dbo].[cabecera_doc] ([id_doc], [forma_pago], [fecha_emision], [total], [efectivo], [IdUsuario], [IdCaja], [Eliminado]) VALUES (CAST(2 AS Numeric(18, 0)), N'Tarjeta             ', CAST(N'2019-11-27T00:00:00.000' AS DateTime), CAST(7000 AS Numeric(18, 0)), CAST(7000 AS Numeric(18, 0)), 1, 1, 0)
INSERT [dbo].[cabecera_doc] ([id_doc], [forma_pago], [fecha_emision], [total], [efectivo], [IdUsuario], [IdCaja], [Eliminado]) VALUES (CAST(3 AS Numeric(18, 0)), N'Tarjeta             ', CAST(N'2019-11-27T00:00:00.000' AS DateTime), CAST(6000 AS Numeric(18, 0)), CAST(6000 AS Numeric(18, 0)), 1, 1, 0)
INSERT [dbo].[cabecera_doc] ([id_doc], [forma_pago], [fecha_emision], [total], [efectivo], [IdUsuario], [IdCaja], [Eliminado]) VALUES (CAST(4 AS Numeric(18, 0)), N'Tarjeta             ', CAST(N'2019-11-27T00:00:00.000' AS DateTime), CAST(10000 AS Numeric(18, 0)), CAST(10000 AS Numeric(18, 0)), 1, 1, 0)
INSERT [dbo].[cabecera_doc] ([id_doc], [forma_pago], [fecha_emision], [total], [efectivo], [IdUsuario], [IdCaja], [Eliminado]) VALUES (CAST(5 AS Numeric(18, 0)), N'Tarjeta             ', CAST(N'2019-11-27T00:00:00.000' AS DateTime), CAST(5000 AS Numeric(18, 0)), CAST(5000 AS Numeric(18, 0)), 1, 1, 0)
INSERT [dbo].[cabecera_doc] ([id_doc], [forma_pago], [fecha_emision], [total], [efectivo], [IdUsuario], [IdCaja], [Eliminado]) VALUES (CAST(6 AS Numeric(18, 0)), N'Tarjeta             ', CAST(N'2019-11-27T00:00:00.000' AS DateTime), CAST(3500 AS Numeric(18, 0)), CAST(3500 AS Numeric(18, 0)), 1, 1, 0)
INSERT [dbo].[cabecera_doc] ([id_doc], [forma_pago], [fecha_emision], [total], [efectivo], [IdUsuario], [IdCaja], [Eliminado]) VALUES (CAST(7 AS Numeric(18, 0)), N'Tarjeta             ', CAST(N'2019-11-27T00:00:00.000' AS DateTime), CAST(1000 AS Numeric(18, 0)), CAST(1000 AS Numeric(18, 0)), 1, 1, 0)
INSERT [dbo].[cabecera_doc] ([id_doc], [forma_pago], [fecha_emision], [total], [efectivo], [IdUsuario], [IdCaja], [Eliminado]) VALUES (CAST(8 AS Numeric(18, 0)), N'Tarjeta             ', CAST(N'2019-11-27T00:00:00.000' AS DateTime), CAST(1000 AS Numeric(18, 0)), CAST(1000 AS Numeric(18, 0)), 1, 1, 0)
INSERT [dbo].[cabecera_doc] ([id_doc], [forma_pago], [fecha_emision], [total], [efectivo], [IdUsuario], [IdCaja], [Eliminado]) VALUES (CAST(9 AS Numeric(18, 0)), N'Tarjeta             ', CAST(N'2019-11-27T00:00:00.000' AS DateTime), CAST(17500 AS Numeric(18, 0)), CAST(17500 AS Numeric(18, 0)), 1, 1, 0)
INSERT [dbo].[cabecera_doc] ([id_doc], [forma_pago], [fecha_emision], [total], [efectivo], [IdUsuario], [IdCaja], [Eliminado]) VALUES (CAST(10 AS Numeric(18, 0)), N'Tarjeta             ', CAST(N'2019-11-27T00:00:00.000' AS DateTime), CAST(17500 AS Numeric(18, 0)), CAST(17500 AS Numeric(18, 0)), 1, 1, 0)
INSERT [dbo].[cabecera_doc] ([id_doc], [forma_pago], [fecha_emision], [total], [efectivo], [IdUsuario], [IdCaja], [Eliminado]) VALUES (CAST(11 AS Numeric(18, 0)), N'Tarjeta             ', CAST(N'2019-11-27T00:00:00.000' AS DateTime), CAST(10000 AS Numeric(18, 0)), CAST(10000 AS Numeric(18, 0)), 1, 1, 0)
INSERT [dbo].[cabecera_doc] ([id_doc], [forma_pago], [fecha_emision], [total], [efectivo], [IdUsuario], [IdCaja], [Eliminado]) VALUES (CAST(12 AS Numeric(18, 0)), N'Tarjeta             ', CAST(N'2019-11-27T00:00:00.000' AS DateTime), CAST(5000 AS Numeric(18, 0)), CAST(5000 AS Numeric(18, 0)), 1, 1, 0)
INSERT [dbo].[cabecera_doc] ([id_doc], [forma_pago], [fecha_emision], [total], [efectivo], [IdUsuario], [IdCaja], [Eliminado]) VALUES (CAST(13 AS Numeric(18, 0)), N'Tarjeta             ', CAST(N'2019-11-28T00:00:00.000' AS DateTime), CAST(10500 AS Numeric(18, 0)), CAST(10500 AS Numeric(18, 0)), 1, 1, 0)
INSERT [dbo].[cabecera_doc] ([id_doc], [forma_pago], [fecha_emision], [total], [efectivo], [IdUsuario], [IdCaja], [Eliminado]) VALUES (CAST(14 AS Numeric(18, 0)), N'Tarjeta             ', CAST(N'2019-11-28T00:00:00.000' AS DateTime), CAST(4500 AS Numeric(18, 0)), CAST(4500 AS Numeric(18, 0)), 1, 1, 0)
INSERT [dbo].[cabecera_doc] ([id_doc], [forma_pago], [fecha_emision], [total], [efectivo], [IdUsuario], [IdCaja], [Eliminado]) VALUES (CAST(15 AS Numeric(18, 0)), N'Tarjeta             ', CAST(N'2019-11-28T00:00:00.000' AS DateTime), CAST(4500 AS Numeric(18, 0)), CAST(4500 AS Numeric(18, 0)), 1, 1, 0)
INSERT [dbo].[cabecera_doc] ([id_doc], [forma_pago], [fecha_emision], [total], [efectivo], [IdUsuario], [IdCaja], [Eliminado]) VALUES (CAST(16 AS Numeric(18, 0)), N'Tarjeta             ', CAST(N'2019-11-28T00:00:00.000' AS DateTime), CAST(9000 AS Numeric(18, 0)), CAST(9000 AS Numeric(18, 0)), 1, 1, 0)
INSERT [dbo].[cabecera_doc] ([id_doc], [forma_pago], [fecha_emision], [total], [efectivo], [IdUsuario], [IdCaja], [Eliminado]) VALUES (CAST(17 AS Numeric(18, 0)), N'Tarjeta             ', CAST(N'2019-11-28T00:00:00.000' AS DateTime), CAST(4000 AS Numeric(18, 0)), CAST(4000 AS Numeric(18, 0)), 1, 1, 0)
INSERT [dbo].[cabecera_doc] ([id_doc], [forma_pago], [fecha_emision], [total], [efectivo], [IdUsuario], [IdCaja], [Eliminado]) VALUES (CAST(18 AS Numeric(18, 0)), N'Tarjeta             ', CAST(N'2019-11-28T00:00:00.000' AS DateTime), CAST(10000 AS Numeric(18, 0)), CAST(10000 AS Numeric(18, 0)), 1, 1, 0)
INSERT [dbo].[cabecera_doc] ([id_doc], [forma_pago], [fecha_emision], [total], [efectivo], [IdUsuario], [IdCaja], [Eliminado]) VALUES (CAST(19 AS Numeric(18, 0)), N'Tarjeta             ', CAST(N'2019-11-28T00:00:00.000' AS DateTime), CAST(5000 AS Numeric(18, 0)), CAST(5000 AS Numeric(18, 0)), 1, 1, 0)
INSERT [dbo].[cabecera_doc] ([id_doc], [forma_pago], [fecha_emision], [total], [efectivo], [IdUsuario], [IdCaja], [Eliminado]) VALUES (CAST(20 AS Numeric(18, 0)), N'Tarjeta             ', CAST(N'2019-11-28T00:00:00.000' AS DateTime), CAST(5000 AS Numeric(18, 0)), CAST(5000 AS Numeric(18, 0)), 1, 1, 0)
INSERT [dbo].[cabecera_doc] ([id_doc], [forma_pago], [fecha_emision], [total], [efectivo], [IdUsuario], [IdCaja], [Eliminado]) VALUES (CAST(21 AS Numeric(18, 0)), N'Tarjeta             ', CAST(N'2019-11-28T00:00:00.000' AS DateTime), CAST(5000 AS Numeric(18, 0)), CAST(5000 AS Numeric(18, 0)), 1, 1, 0)
INSERT [dbo].[cabecera_doc] ([id_doc], [forma_pago], [fecha_emision], [total], [efectivo], [IdUsuario], [IdCaja], [Eliminado]) VALUES (CAST(22 AS Numeric(18, 0)), N'Tarjeta             ', CAST(N'2019-11-28T00:00:00.000' AS DateTime), CAST(5000 AS Numeric(18, 0)), CAST(5000 AS Numeric(18, 0)), 1, 1, 0)
INSERT [dbo].[cabecera_doc] ([id_doc], [forma_pago], [fecha_emision], [total], [efectivo], [IdUsuario], [IdCaja], [Eliminado]) VALUES (CAST(23 AS Numeric(18, 0)), N'Tarjeta             ', CAST(N'2019-11-28T00:00:00.000' AS DateTime), CAST(2000 AS Numeric(18, 0)), CAST(2000 AS Numeric(18, 0)), 1, 1, 1)
INSERT [dbo].[cabecera_doc] ([id_doc], [forma_pago], [fecha_emision], [total], [efectivo], [IdUsuario], [IdCaja], [Eliminado]) VALUES (CAST(24 AS Numeric(18, 0)), N'Tarjeta             ', CAST(N'2019-11-30T00:00:00.000' AS DateTime), CAST(15000 AS Numeric(18, 0)), CAST(15000 AS Numeric(18, 0)), 2, 2, 0)
INSERT [dbo].[cabecera_doc] ([id_doc], [forma_pago], [fecha_emision], [total], [efectivo], [IdUsuario], [IdCaja], [Eliminado]) VALUES (CAST(25 AS Numeric(18, 0)), N'Tarjeta             ', CAST(N'2019-12-01T00:00:00.000' AS DateTime), CAST(10000 AS Numeric(18, 0)), CAST(10000 AS Numeric(18, 0)), 1, 3, 0)
INSERT [dbo].[cabecera_doc] ([id_doc], [forma_pago], [fecha_emision], [total], [efectivo], [IdUsuario], [IdCaja], [Eliminado]) VALUES (CAST(26 AS Numeric(18, 0)), N'Tarjeta             ', CAST(N'2019-12-01T00:00:00.000' AS DateTime), CAST(5000 AS Numeric(18, 0)), CAST(5000 AS Numeric(18, 0)), 1, 3, 0)
INSERT [dbo].[cabecera_doc] ([id_doc], [forma_pago], [fecha_emision], [total], [efectivo], [IdUsuario], [IdCaja], [Eliminado]) VALUES (CAST(27 AS Numeric(18, 0)), N'Tarjeta             ', CAST(N'2019-12-01T00:00:00.000' AS DateTime), CAST(5000 AS Numeric(18, 0)), CAST(5000 AS Numeric(18, 0)), 1, 3, 0)
SET IDENTITY_INSERT [dbo].[cabecera_doc] OFF
SET IDENTITY_INSERT [dbo].[Caja] ON 

INSERT [dbo].[Caja] ([Id], [Accion], [Id_Usuario], [Monto], [Fecha], [Glosa]) VALUES (1, N'Cerrada', 1, 50000, CAST(N'2019-11-27T00:37:18.227' AS DateTime), N'prueba')
INSERT [dbo].[Caja] ([Id], [Accion], [Id_Usuario], [Monto], [Fecha], [Glosa]) VALUES (2, N'Apertura', 2, 500000, CAST(N'2019-11-30T13:23:56.597' AS DateTime), N'vbvbv')
INSERT [dbo].[Caja] ([Id], [Accion], [Id_Usuario], [Monto], [Fecha], [Glosa]) VALUES (3, N'Apertura', 1, 50000, CAST(N'2019-12-01T00:42:26.210' AS DateTime), N'demo')
SET IDENTITY_INSERT [dbo].[Caja] OFF
SET IDENTITY_INSERT [dbo].[Compra] ON 

INSERT [dbo].[Compra] ([IdCompra], [Fecha], [Folio], [IdProducto], [Cantidad], [IdUsuario]) VALUES (1, CAST(N'2019-11-27T00:00:00.000' AS DateTime), 22, 3, 22, 1)
INSERT [dbo].[Compra] ([IdCompra], [Fecha], [Folio], [IdProducto], [Cantidad], [IdUsuario]) VALUES (2, CAST(N'2019-11-27T00:00:00.000' AS DateTime), 4, 3, 6, 1)
INSERT [dbo].[Compra] ([IdCompra], [Fecha], [Folio], [IdProducto], [Cantidad], [IdUsuario]) VALUES (3, CAST(N'2019-11-27T00:00:00.000' AS DateTime), 33, 2, 100, 1)
INSERT [dbo].[Compra] ([IdCompra], [Fecha], [Folio], [IdProducto], [Cantidad], [IdUsuario]) VALUES (4, CAST(N'2019-11-28T00:00:00.000' AS DateTime), 3, 3, 10, 1)
INSERT [dbo].[Compra] ([IdCompra], [Fecha], [Folio], [IdProducto], [Cantidad], [IdUsuario]) VALUES (5, CAST(N'2019-11-28T00:00:00.000' AS DateTime), 3, 4, 14, 1)
INSERT [dbo].[Compra] ([IdCompra], [Fecha], [Folio], [IdProducto], [Cantidad], [IdUsuario]) VALUES (6, CAST(N'2019-12-01T00:00:00.000' AS DateTime), 1, 1, 100, 1)
SET IDENTITY_INSERT [dbo].[Compra] OFF
SET IDENTITY_INSERT [dbo].[detalle] ON 

INSERT [dbo].[detalle] ([id_detalle], [id_doc_cab], [descripcion], [precio], [total], [cantidad], [codigo]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'COMPLETO AS
                                                                   ', CAST(2000 AS Numeric(18, 0)), CAST(2000 AS Numeric(18, 0)), 1, N'2                             ')
INSERT [dbo].[detalle] ([id_detalle], [id_doc_cab], [descripcion], [precio], [total], [cantidad], [codigo]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'PRODUCTOFAMILIA
                                                               ', CAST(5000 AS Numeric(18, 0)), CAST(5000 AS Numeric(18, 0)), 1, N'1                             ')
INSERT [dbo].[detalle] ([id_detalle], [id_doc_cab], [descripcion], [precio], [total], [cantidad], [codigo]) VALUES (CAST(3 AS Numeric(18, 0)), CAST(2 AS Numeric(18, 0)), N'COMPLETO AS
                                                                   ', CAST(2000 AS Numeric(18, 0)), CAST(2000 AS Numeric(18, 0)), 1, N'2                             ')
INSERT [dbo].[detalle] ([id_detalle], [id_doc_cab], [descripcion], [precio], [total], [cantidad], [codigo]) VALUES (CAST(4 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), N'COMPLETO AS
                                                                   ', CAST(2000 AS Numeric(18, 0)), CAST(6000 AS Numeric(18, 0)), 3, N'2                             ')
INSERT [dbo].[detalle] ([id_detalle], [id_doc_cab], [descripcion], [precio], [total], [cantidad], [codigo]) VALUES (CAST(5 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)), N'PRODUCTOFAMILIA
                                                               ', CAST(5000 AS Numeric(18, 0)), CAST(10000 AS Numeric(18, 0)), 2, N'1                             ')
INSERT [dbo].[detalle] ([id_detalle], [id_doc_cab], [descripcion], [precio], [total], [cantidad], [codigo]) VALUES (CAST(6 AS Numeric(18, 0)), CAST(5 AS Numeric(18, 0)), N'PRODUCTOFAMILIA
                                                               ', CAST(5000 AS Numeric(18, 0)), CAST(5000 AS Numeric(18, 0)), 1, N'1                             ')
INSERT [dbo].[detalle] ([id_detalle], [id_doc_cab], [descripcion], [precio], [total], [cantidad], [codigo]) VALUES (CAST(7 AS Numeric(18, 0)), CAST(6 AS Numeric(18, 0)), N'CHURASSQUIO
                                                                   ', CAST(3500 AS Numeric(18, 0)), CAST(3500 AS Numeric(18, 0)), 1, N'3                             ')
INSERT [dbo].[detalle] ([id_detalle], [id_doc_cab], [descripcion], [precio], [total], [cantidad], [codigo]) VALUES (CAST(8 AS Numeric(18, 0)), CAST(7 AS Numeric(18, 0)), N'CHURRASCACA
                                                                   ', CAST(1000 AS Numeric(18, 0)), CAST(1000 AS Numeric(18, 0)), 1, N'4                             ')
INSERT [dbo].[detalle] ([id_detalle], [id_doc_cab], [descripcion], [precio], [total], [cantidad], [codigo]) VALUES (CAST(9 AS Numeric(18, 0)), CAST(8 AS Numeric(18, 0)), N'CHURRASCACA
                                                                   ', CAST(1000 AS Numeric(18, 0)), CAST(1000 AS Numeric(18, 0)), 1, N'4                             ')
INSERT [dbo].[detalle] ([id_detalle], [id_doc_cab], [descripcion], [precio], [total], [cantidad], [codigo]) VALUES (CAST(10 AS Numeric(18, 0)), CAST(9 AS Numeric(18, 0)), N'CHURASSQUIO
                                                                   ', CAST(3500 AS Numeric(18, 0)), CAST(17500 AS Numeric(18, 0)), 5, N'3                             ')
INSERT [dbo].[detalle] ([id_detalle], [id_doc_cab], [descripcion], [precio], [total], [cantidad], [codigo]) VALUES (CAST(11 AS Numeric(18, 0)), CAST(10 AS Numeric(18, 0)), N'CHURASSQUIO
                                                                   ', CAST(3500 AS Numeric(18, 0)), CAST(17500 AS Numeric(18, 0)), 5, N'3                             ')
INSERT [dbo].[detalle] ([id_detalle], [id_doc_cab], [descripcion], [precio], [total], [cantidad], [codigo]) VALUES (CAST(12 AS Numeric(18, 0)), CAST(11 AS Numeric(18, 0)), N'COMPLETO AS
                                                                   ', CAST(2000 AS Numeric(18, 0)), CAST(10000 AS Numeric(18, 0)), 5, N'2                             ')
INSERT [dbo].[detalle] ([id_detalle], [id_doc_cab], [descripcion], [precio], [total], [cantidad], [codigo]) VALUES (CAST(13 AS Numeric(18, 0)), CAST(12 AS Numeric(18, 0)), N'PRODUCTOFAMILIA
                                                               ', CAST(5000 AS Numeric(18, 0)), CAST(5000 AS Numeric(18, 0)), 1, N'1                             ')
INSERT [dbo].[detalle] ([id_detalle], [id_doc_cab], [descripcion], [precio], [total], [cantidad], [codigo]) VALUES (CAST(14 AS Numeric(18, 0)), CAST(13 AS Numeric(18, 0)), N'COMPLETO AS
                                                                   ', CAST(2000 AS Numeric(18, 0)), CAST(2000 AS Numeric(18, 0)), 1, N'2                             ')
INSERT [dbo].[detalle] ([id_detalle], [id_doc_cab], [descripcion], [precio], [total], [cantidad], [codigo]) VALUES (CAST(15 AS Numeric(18, 0)), CAST(13 AS Numeric(18, 0)), N'PRODUCTOFAMILIA
                                                               ', CAST(5000 AS Numeric(18, 0)), CAST(5000 AS Numeric(18, 0)), 1, N'1                             ')
INSERT [dbo].[detalle] ([id_detalle], [id_doc_cab], [descripcion], [precio], [total], [cantidad], [codigo]) VALUES (CAST(16 AS Numeric(18, 0)), CAST(13 AS Numeric(18, 0)), N'CHURASSQUIO
                                                                   ', CAST(3500 AS Numeric(18, 0)), CAST(3500 AS Numeric(18, 0)), 1, N'3                             ')
INSERT [dbo].[detalle] ([id_detalle], [id_doc_cab], [descripcion], [precio], [total], [cantidad], [codigo]) VALUES (CAST(17 AS Numeric(18, 0)), CAST(14 AS Numeric(18, 0)), N'CHURASSQUIO
                                                                   ', CAST(3500 AS Numeric(18, 0)), CAST(3500 AS Numeric(18, 0)), 1, N'3                             ')
INSERT [dbo].[detalle] ([id_detalle], [id_doc_cab], [descripcion], [precio], [total], [cantidad], [codigo]) VALUES (CAST(18 AS Numeric(18, 0)), CAST(14 AS Numeric(18, 0)), N'CHURRASCACA
                                                                   ', CAST(1000 AS Numeric(18, 0)), CAST(1000 AS Numeric(18, 0)), 1, N'4                             ')
INSERT [dbo].[detalle] ([id_detalle], [id_doc_cab], [descripcion], [precio], [total], [cantidad], [codigo]) VALUES (CAST(19 AS Numeric(18, 0)), CAST(15 AS Numeric(18, 0)), N'CHURRASCACA
                                                                   ', CAST(1000 AS Numeric(18, 0)), CAST(1000 AS Numeric(18, 0)), 1, N'4                             ')
INSERT [dbo].[detalle] ([id_detalle], [id_doc_cab], [descripcion], [precio], [total], [cantidad], [codigo]) VALUES (CAST(20 AS Numeric(18, 0)), CAST(15 AS Numeric(18, 0)), N'CHURASSQUIO
                                                                   ', CAST(3500 AS Numeric(18, 0)), CAST(3500 AS Numeric(18, 0)), 1, N'3                             ')
INSERT [dbo].[detalle] ([id_detalle], [id_doc_cab], [descripcion], [precio], [total], [cantidad], [codigo]) VALUES (CAST(21 AS Numeric(18, 0)), CAST(3 AS Numeric(18, 0)), N'PRODUCTOFAMILIA
                                                               ', CAST(5000 AS Numeric(18, 0)), CAST(5000 AS Numeric(18, 0)), 1, N'1                             ')
INSERT [dbo].[detalle] ([id_detalle], [id_doc_cab], [descripcion], [precio], [total], [cantidad], [codigo]) VALUES (CAST(22 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)), N'PRODUCTOFAMILIA
                                                               ', CAST(5000 AS Numeric(18, 0)), CAST(5000 AS Numeric(18, 0)), 1, N'1                             ')
INSERT [dbo].[detalle] ([id_detalle], [id_doc_cab], [descripcion], [precio], [total], [cantidad], [codigo]) VALUES (CAST(23 AS Numeric(18, 0)), CAST(5 AS Numeric(18, 0)), N'PRODUCTOFAMILIA
                                                               ', CAST(5000 AS Numeric(18, 0)), CAST(5000 AS Numeric(18, 0)), 1, N'1                             ')
INSERT [dbo].[detalle] ([id_detalle], [id_doc_cab], [descripcion], [precio], [total], [cantidad], [codigo]) VALUES (CAST(24 AS Numeric(18, 0)), CAST(22 AS Numeric(18, 0)), N'PRODUCTOFAMILIA
                                                               ', CAST(5000 AS Numeric(18, 0)), CAST(5000 AS Numeric(18, 0)), 1, N'1                             ')
INSERT [dbo].[detalle] ([id_detalle], [id_doc_cab], [descripcion], [precio], [total], [cantidad], [codigo]) VALUES (CAST(25 AS Numeric(18, 0)), CAST(23 AS Numeric(18, 0)), N'COMPLETO AS
                                                                   ', CAST(2000 AS Numeric(18, 0)), CAST(2000 AS Numeric(18, 0)), 1, N'2                             ')
INSERT [dbo].[detalle] ([id_detalle], [id_doc_cab], [descripcion], [precio], [total], [cantidad], [codigo]) VALUES (CAST(26 AS Numeric(18, 0)), CAST(24 AS Numeric(18, 0)), N'PRODUCTOFAMILIA
                                                               ', CAST(5000 AS Numeric(18, 0)), CAST(15000 AS Numeric(18, 0)), 3, N'1                             ')
SET IDENTITY_INSERT [dbo].[detalle] OFF
SET IDENTITY_INSERT [dbo].[FamiliaFoto] ON 

INSERT [dbo].[FamiliaFoto] ([Id], [FamiliaId], [Foto], [FotoNombre]) VALUES (2, 1, 0xFFD8FFE000104A46494600010200006400640000FFDB0043000D090A0B0A080D0B0A0B0E0E0D0F13201513121213271C1E17202E2931302E292D2C333A4A3E333646372C2D405741464C4E525352323E5A615A50604A51524FFFDB0043010E0E0E131113261515264F352D354F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4F4FFFC00011080192011C03011100021101031101FFC4001F0000010501010101010100000000000000000102030405060708090A0BFFC400B5100002010303020403050504040000017D01020300041105122131410613516107227114328191A1082342B1C11552D1F02433627282090A161718191A25262728292A3435363738393A434445464748494A535455565758595A636465666768696A737475767778797A838485868788898A92939495969798999AA2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F0100030101010101010101010000000000000102030405060708090A0BFFC400B51100020102040403040705040400010277000102031104052131061241510761711322328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728292A35363738393A434445464748494A535455565758595A636465666768696A737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00EBE99453BB23148930A6C16A9668221A9B15726F328B0EE559EE702AAC4B6674D759AAB193643BB3D6ACC9B26438A064BE762A0D10D37BB7BD4D8BB903EA40F7A5CA26C8BED5935491372E5BCF9AD1215CBA93E29923259E981977326E34C0AFBF140C63366A408AA4072D218ECD0021340166CEEBC97A00EAB4CD554639A407516B7E8EA39A00B826CD032390E452032AF610CB5162D339BBD2F6C73DAA794D54CA0DA9FBD2E52B9C92D6FF007BF5ABB19B91D058B6FC55995CDC823A62B96BC806800FB28F4A00E71B51005170336E6FB752B9450926CD324679D4582E324B9C0A2C0D99971725CD3B13722539357624B4869923CB5219048E6A068A3336682CAF4C4C9E33408BD13FBD501684871CD0211A4C8A40577A4515D8D0319400DA0075201D400D34005003965953FD5B50234EC75C96360243401D469DAE24800DD480DA8EE15FBD218E6E4503332FECC4C84530B9C2EB1652DB4A597A5017285A5CED7A0573B0D26F3A73408EB2CA7C8140CD58DC1A064B401E5CD3F1480A725CD03B951EEB9AA13633ED2699031DD9BBD022220D500F45A045A5A00566A422AC8F48B29B9A43194012A1A0936744D2EEB579BCBB50005FBCE7A0A5728D8BAF0A6A76ABF298A71FEC76AAE62944CC6B2BA1D606A5CC6AA895E4B7B81FF2C5E81FB12AB4131FF962FF009521FB1633ECD73FF3EF2FE5407B19079337FCF17FCA98BD8C83638EB13FE545C3D9483A7507F2A2E47B21BF8D066274A6217AD2018C28108934901CA1340CEA343D6F7E1243CD033AC826122F5A00959734018DAAD8ACD19E05211C15E5935ADC100714C45DD3EE9A2205228EB34DD47A0CD0074B6971BA802FF99F2D033C69EEA988AE6626826E3719AA25B2758A9887F974C61B2980F5148405B14010492D48155DE916424D2189400FCF14127AB783ECFECBA1DB6C5FF5A37B9A563436F296C8CF3B805A848398C7FDD5FBB18E060DEBDA933A215460B5579365BCA5FD71D299BFB518D0CFBCA42D1EF1D79E682D54454962BF8F05A36FC291BFB588A90DEC9D6196983AD11EBA65F373B401EE68339D789A56DA140E3377B25CF6C7141C73A866F893C2304D6A67D2A058A74FE05E0350731E772655CAB290CBC106980034123A810C6140C48C98A40EBDA819D7E87AA89100279A00EA229370A00244DC2908C0D574F5719C531191F6241DAAAC04B10F28F14580DDD3AE88039A819BDF68FF0047CD051E3E1335466C9962A622C47162A844B400C2681919341219A432377A06577348080F5A431845218629816B4ED3EE753B916F6A84F62DD96819EA4BA4DD5B69715BFDA70214C7FBD4D30B1990DB5E5E4A228C968D4F57AD1D88E568E96D6DDA38042D38DFDF6D73C8D6E4CCF0D9A664E33ED40CAF1483CE918DAF9498C973DE829229A235D5CBCB15F8080F4F4A934B893DC4D04CD08DD2AA0CB31A4098A979F6ABD4FB3E33B323D28B8388FBE33497D0441CC442EE2CB4738245AB4BE59311487F79CFE38AB3368E47E2069512C6353B64F9836D9315441C3A9A092653408282865004F6B31B79832D023B7D2EF3CC885006BABE690114D1EF5AB119135B7CC6A8929C91114C05B6976B567628D8FB4FFA3549470C915599B2758EA8438F140113500444D031828240D21909A43226A4026290C6628197F49D1AEF56B9F26D93E5FE27ECB48B3D1FC39A6DBE9BBA2817E54EAFDD8D068E04FAE5C676C41BE5EE29366D4E9952D1AEA3937C1183C6EE4F0052B935922E1D6AD04024B64F324EE07F0FD4D3E531249F5388DC8B7962FDCB28264FEED01629CB1C76C0DBB6A5D4EEF9CF6A0D5152E239A2B290346406C7CC9CF4A92645896FA78F4E8106D9377B672948712686D2D6DE3FB75A5C8B656EBB866A844B2CE3ED91DC1CBDBBC60798A38CE68B0105D054B5120E0C729208FAD22EC73BE32D4FFE25BF63072F3B827D85688C24712B4105814087D050CA005A046F6877247CB401D4DBCD480B7B85588AB301BAAC4549A114C932A7528F43450EF3CFD9FAD6651911AD32092802190D022166A008B9340C5028010D201B48646477A062EDA00B5A6E9B26A578B6F1F03AB9FEE8A407A15B45069BA488F4F43B1F853DCFBD41B44896DEF8B6D4465FC691D6A50274D30C64CD76DE6003EEF5A052AB1122B199ECE6B878FE761F2A55184E570B581FFB3D63F2BC8B71F348CDD4D0668AD636C67C5AC85E349897E7F885448B96E58B38F171E64709971F2ED3E95099A3D82E779D5BCAB573127F11157CC4A229AE2D676292452B88B817083B53B88592192F60FB45A48B342830A98C1A06DD8D8B54FB369681C7DD5EDCE29D8CEF7396BB7FB3B4F109B7C71658E4F273CD41BF4385BA9E4B9B869676CBB56A8E593205A6496568112628286E28012811734D9365C5007556D2F4A4068A482AC024C55201DB062995633EEA152298199B7F79B68119EBD2A0CC47E940159A8023C5002ECA062E2801A6900C38A431AD48627BF61401DD783348912D1AEA618F3C7E948A3A4B8BCD3AC62F2E6962870385A40511E23D393E58FCF93DC0CD3B05C89FC4C83FD5DAE7EB458444DE2E2BD6D933FEF50086378B2DE65F2AE6CDF6370681DC736ADA3EA1226D79AD9E3FBAD8C5161A659B48E48ADD8E9D7697287F84F07353C8573151B7C118867FF5F7071B7D0544A26D16589966D3ADDC02804DC28F7FFF00554A15CC98EF45979D6D6A5E459D3EF74DA69F314A3CC69E9DA8B79115921DCB1C64CEE7F86AE322650B18DADDB1648EF3C9C03012EFEDC60D362E7384EDCD68617145211663A0926A0A108A0088D021F03E261401D25B49C0A405F49B1401319F8AA4CA268A5DC29DCA23B8E94948466EDFDFD55C46329E291908DF3702801E96A7BD003FECD4011347B6802BC9401033D03222F520377D051B1E1DB15BCB9FB45D9D9676FF00339FEF7B0A433AE7D4EFB52516FA4DB9821E9BC8C628198F7F6296174239E637136376474A0925B18D1E0B8BAB91B6DA11C0F56A6050B58E7BC90456B19776FC87D6819B36567A5C79B1BBD92DD727CDDBF283F5A00CE9AC92CD9E39591C8EE878A009F50FB3DA68DA795C0927F99BD6803391A2CEE49590F5C8A00E963BABC16EA6E55353B375CF98BD47D690D326852C353853ECB2FC9121DB0B70734AC68A654BD6325B4103C66299233BC91C0AC6703784AC5658A29EE24694F936EB16EC67FD6528209BB93DCDD47AA58436822FF472823926FA8E82B531B1C06A9672E9D7D25ACDDBEEB63EF0AB464D1594D508B319A9249B34CA0268111B1A04354E1A803A0B393318A432E06E28011DC8150522C5ACD594AA1A22D3FCC2A3DB015361F368F6C239A0F5DC6059B7E4D005E5A450A48A4052BB6C0A6067492D0054924A449186E68034B46D365D52EB646BF20EB41477969A4E9D6D0C7E74A1DA23E61DA7E44C734865482EEE5ACEE25B6DC5EF65F2A155EDEFFA531916A1223436960B896FE2F9372FF2A091DAC14B6FB2E9E4379507CEFF00ED9A064D0EAF6F74A6CE7B71648DF7668BFAD032A4FA5CD68253A84FB215FF005457FE5AD022AFF64EA0E80A5B3306F4340177C5D6BFF1308F10B6C484631D280295A68B6E74A5D4AE6E9A3857FD6A7E34017B4FD6E1BB67D2A1856D6DA45C427B8348663B192099E3937C5221C6E14058DAB0D4CCF64F67A80F35186C2FDF141D50A5735174BB7D4352B7B8132FD9608B68847AD2B13383889A8DBC6B1C62DB08B6EE498EB26386A72BE2A32DD6850DD49100F6D2EC663D4D5C09A9139115A1CE4C869124D9A650BBE811197A006E6803734E7CC3480D15E9400BD45652290FB7EB5C550D11A49D2B96E30D837F5A2E338657AF78E52DDBC98A065F59290C6BCA00CE68032AEAE379A00A4D2500419A0924851E595628C6E773802803D334DD185858A58A4C04920DF707F89BD850515F53BED3ECE24D3A0B1CB4FF00EB907551E9F5A0771357BA8F47B0B6B1D3CE3CC4E64CF2A3D28119BA26A30E9F2CA5ADF78C7EEC9EC68020B9B8B8BB98DC5ECE09FE4295CA4566BA4E53ED2BCFBD2B859924D713DDC6126BF12A2F405FA530B091BCB1CCAD04E095E9CE6802CCFE20D68DD175B8287FB87EEFE540875A6B117DB1A59913F7A364C80637502162D02DA376BE3767FB2E2F9936FDF3ED40CA9AFEB8DA94F0490C2F12C2BB769E49A010CD26F8BC8C84526CF570BA9AA2468DFCEB77DAFED527A12C3DCD18E74D4A4170D94BB8C7001C07341C15683A5B191E26F325F0DC9E405C655AE013C839A68E199C48AB39C901A621FBA9086EEA004CD030CD006BE9272B4981BB1AD43024F2AB19329118043572C8D116E3948158143BCDE6A6C238815EF9CC481B140C7F9EC0520237919FBD0040D48085A8019408EA7C051C4BA83DF5CEC58625EAF40D1B926B1A769FA8CB3ACD2DF4F2E7F79FDC1E94147331C92BCBE71FBDF7B79A07620B8BA487966695BAD2B97C8519350BB9408E24C163F2FA9A9B8729D7E9FE11096226D4E57799C67693F76B36CE8844E7F55D24473398970292668E063B5B3AE7AD5A661CA37C8BACF1BC7B835572394B70DEDFDB27CC9E6AFA35317293A5CC57EB8C6C6F4A09E5112EAEED09F224768FB834C968BB6F796B7BC37C8F4022E5ADB082E09183BAA267AD8290FF0030C529C67159267BBCB74580E7FD742718E6AEE4382D985F34771A55FEE611974DCE7B935499E1E2B0F66712BD0559E5C90FCD3205A006D001400B401AFA47DEA4C674D6AB902B165177C9AC24515658886AE493288FA545CA199F9A988E4ABDD39870A000D003680236A43217A91909F5AA11D2DBC2134F883B6C4032DEF48B465DCEB16F19C5AC7B8FF78D206821FED0D4172A0E0FA566E6744625B8B49BFE9B2B3E635E53A6F0EE8905949F6EBDC3CE3EE29FE1AAE71721BF2DF452FCB9150D9AC6273D7B1ABBB022B3B9AD8A7FD9C261865AAB99B8918D36584FCBD29DC5CA38E9B3CDD451CE2E4285E689C67690453E725D332E46960F92E0315F5AD93309C03CB8AE7988E36F7AB302EE99752A4FE54E3231C3D66CF4B05B97E63C9AC19F4D0D85825D87DBBD110944B52A2C96F27A32D6C79D8989C6326C90A7F74E2B547CE56414CC05A0031400B8A00298CD4D18FEF0D4B03ACB1AC24523591456122C8268FE6AE399455922AC6E511795CD1719C5D7D19C63A8012810C6A0067D691444E38E39A91896C81EED108A0112EA37924B24818E1076A0B2AE9365FDA1A9436A3A31E6A24347ACDA6976F67104541C0AC0ED439D513B002A0B473F7375751DEC88C84C7FC0D416675D6A9323EF860F33D6AAC2B97AC7588B50B7C3C651FDE93452669DAA0641484D971517D2826E585857B5324AF731C7B7914C6731AB592B838A22C992391BA89ED64F90E315D08E49234F48BC8F073DFEF27A7D28676E127A9ACE0755E6B067D1D3A9A1160F5A9372CDACB93E5B5688E6AF139BBF84C37D2AB7AD7423E6315121C533845C5021D8A004A006D328D1D2789EA588EBECBA0AC24523563AC2458C9B8AE39945626B065077A919C1D7D31C62D00318D003734088DA91442C6A4659D3B0D7A9BC7BD31A33AE5FCEB97E3827F3A4337BC128135A12376159CCD699DF99CC8FED5CA76A2B993CC7C7551FAD5A18CB98DCA93B38AA19962CB664ECA455872595AE7739C1A046AC78C6147029089B391915048CFB49145CA488269E95CAB19B70720F34D058E6B5A40D81DEBA6271D5313618A40622722B468C212B1BD63A944500691476DAE6B2713D7A18BB1A8C071D406E9E959B47A94F108824531B039A474E922B6B604A915D639FBAD5BC247838EA664D6A78AC5A043850021140C4A00BBA67135224EB6C5F8158C8B46AA3D7348D0499AB8E4515C75AC0A171CD2B8AC7015F4C72099A006D0021A06329011B548CB764987CFB5034575B1F2DFEB4866B683B62D676AFF0C7CD67337A275134E63B3017EFCB5CC76942EB53FECD8C6D5CCADD2B440504D5F5176DE035508749AC5EC4DFBF46FCA91499661D6629789D3AF7A065D5972BBED9F2B522B12C179CE7A541361D7871F376A9291591B75228AF78DE4C0EE7B55C4999CB798F77316AE9470C90E92C5860E29F30B90A5245894A6334EE3B0E82596DA503CC70878A2C52AD289A5FDA72DB9C5C26F8FD454B81DF4B16CB378525D2CCB19CAE734A08AC44F991915B9E23DC282472D002D0310D005AD33FD7D023A8B53D2B368A4682C95CF28964734F835C92894304D5CEE2683BCEA8E519C357D21C4250025001400DC7148A2458449CA0E690CBD6F6DB3EF1C9A9292171826597385140CABA24F9D68B9E8C0D6750D699D94C9FBB864C7DDE95CC76A38FD5679A4BB592652115EB6467519E850B68EDB1D0C43CB39CD0CCAE6378A217D42F6DCE9E9BC6DF9F68A93488925BE9DF628AD2F11E293F8DCAD31B312F376992B4B672EF8B380298EE68D8DC7DB57A147F4ACD946A4D1936A33D6A0667C24A39148D075DA09A028DFC54D32648CBB7B28AD970A3AD6B731E52CC432C5C0CF943F3A42E533A7B2647F3DD482DD455264F21997CA3662B6898D424D2E4F357CA939FAD5B315226860F265920CB797274CD41BFB5E62B790FB8AF7AB39E62346E9F78532070A0685C503108A0458D37FE3E2811D144718A405832E2B37028A379761187358BA451125F03DEB2744AB8FF00B62FAD67EC0398E7EBD6301280131400B400E48F27E6A928D3F292D63030BB8F763505920B8444DD8DC7D698CC7D42E7771409B2BE96DB35047EC2A645C0EFB76FB14F406B999DD0247B7B192D8C7796FBC7A55A6292086EB4F4852DD62611A745A1B2BD90EFED2823FF0055BEA4AE41C6F7ED6862911CAB7AD3172907D86D41DD140AB4DB1D84683CB93CD3D6B3B80EBA9C6D02A4455DBDFD691A0D6E46290365199823735AA316CD0D1FC99AD7CC8F19CD3B09324BE87CF41B863142299C6DE05334DB4E71C574A3866476C3644597EF76A6CCD22DDD314F2665FBD8A456C588DE3BB5E0E1C530BDCA92C4C1F0DF9D32191EDC1EB4C43A80108A044D62089A811BF19E948073D171987AB678C503337CC75A2C03BED2F4728C96ACCC08A0065004918C9FA5202F69F6FBA7F39F3B17BD41A211A113DD34B392517B7A50595659BCC05338FE94C932E7EBF2FE740887CC643F29A18E2779E1BBB5BDB44493AE306B9A48EB8B370C6FB760192291B265592C89E5939A469CE22591EBB0D02B921464FE1A004CBFD4D4811488E7E790FC83B516028324B24B96E9486492481463D29010F9BC516136674D26F626B68983660C3A8DE584CE6DA5C6E3D2B5B1CFED0B6DAC6A374A448F807D29D825506BC7E55BE3F89A998DC68380887D6A82E5E960F3AD4FA83C521B32F2E92075E1D7BFAD023462D403717098F7A0AB9249046C3721C5302310FB8A0963BC9C7514C42C3C3F4A00D289F8A044A5E9019D7A37D00516868191793CD003EAC803400DA00B36F19919507D4D22D1A739F2AD4AAFB7159B34336EE6382BF9D0232F7973ED54490C9DE8115E819B3E1ABFFB1EA011CFEEE4A868D20CF4BB7BA4D818E0D6474A124BE8D9B8A834B09F6C8450306B988AD0172079E2C7CCD4AC172B49751B0F97A5055CA9717480504DCC89AF70DC532798AFE7B3F4AAB12D905C3EC84E3A9AA466CC548CCB280D5B239A469DBAA44BBB19F4A6036425A6519FC6900C9325E3DBDCD30345794703AD03295C402787ED11F05FA8F7A0968ACCE558A37CE3B5004B6D3B40E02F152335219209CED6F95FF9D30246013EEE698991B7CDCF7A0072498A007F9B400C63BA801A4668023F2F9A00AB566634D00039F957A9A4335ED61C1FFD08D4334436E09F3CC7ED486675CAFCB54229143B78ED48444C303AD302BF61914009D30C3AF6A00E86D35C616D873F30A8E5378D425FEDCE951CA5FB41875A391CD1C81ED451ACB93ED4720BDA0B26A5213EB45839C88DEDC39C22522B985C4E4E5C9E695804F2CD022C4517141641A86238BDE9A22464DB92212C7AE6B74729A18FDD9F6E94015D8E2523F0A006338F39B1FC22802DDB3E3258F55A405486E9D66C755F4A605B91219533F71BD690C884722AF2A251EA28193431A3F23A8A41634A200A8DEBF91A43B0BB5072A299361934081BE5E8698AC573C53402669809BEA4076698152ACC84ED8CE281972CEDF186FE26E952D9A235630154ED3F8D45CD087EFA33A75A6414AEE03F67271F5C5319966239F94D22482587D7B5302A0CE71401274E1BBD004668112A631F35228762A4A255E68196EDD73D6A4D4BD1FCBC01CD45CD0782DDEA4A10739A0459846066828CAD59B71F6ADA273CCCFF00EE05E95A1CE68C6E3CA26802A48766E90F414010440E7737DE6EB4016A33967F4069014A338B8E3A0EA6981A0C1DFF00796C79FE24F5A431915E344E430D8DDC5032D09924C30247D0548CB314E074348A2D0F2E5FBA7E6A621B8DC8627E18743408A5267774E6A910329809D2900B4C08546E205510917A184670B1027BB9A92EC5E4E170B85F5348A430C8186D53C0EFEB48D0645218ED4C8473E94C89132345326EDDC7F18F4A08316F6DB6C8523621BB7BD0031B9B5494E377434C0A9346AF11940FBB401550E786FC2800DB91EE2824683C50522681B070D48A3416DB3D2A1B358A34AD6DFA64564E46EA25EFB2A9F6A9E62F948DE0607145C39483CB2AD4C562C74878A94239CD524FDEE335D313966C82DC640FF66ACC8B3E6EC5C5005591FCC75E7E51405C55277927AD004FBB6439C72C738A00A9F3C24375F5A00B0B3EC4F3233F87A5005CC5BDEA0DE76BFF007C50321FB1DC5A1DE3F7A9EA2A463564568CB1243FA0A40588261C6E908A0A34E37DFF00BB9BEFF6348639A1F338FE31405884C07D29DC3946188D02B0CF2E9858B10590870F3919F7A772522679D33B60E4FB54DCBB0D11391BE4E9E9DA818E63FE8A64E17D2992CC7D3EECC9AAF959CABF1CD3249E394A6A4121C15E8681125F1FDF0F4038A4067C9F2DB4898EF9A60456D28369244E783C03E94C45231BC6E430E56802C942E777722811517EF6281A27F2F9A432ED9DD32109274ACDA358B3A2B52A5722B168E98B2D6454D8D6E358E69937293C91A3FCCE2AEC67CC3269E32985714E28529981710B49704FF0FAD6C72C982ED890E2A882B124BD002C2BEA281127964B92785A009A4E760A43217397A00864460DF2D30258DF18EA0D03342DAF5A2E1970B48659F220BA3E645F249E9D8D49467CF19866C4C319EA2988B369395C44FCAFF01F4A43B9B10B875CAF5A82D17238C4839EB5373541259E68E60B117D8BE7E94730586F91183CE5BF1AA33B0FF3A35190117F1A0456373BF9DCA47A50220B8B913DACF12E15D474AB44332F4D83CAB7F39B1BDF807D2A8826B68D3ED4197B9E682C92EBF7818F72E4502285E90B07FBDC5324A7CB205E94012C8BBE157FE21C50023E4671FC3401547DFCD21A34C5BEF4C8EB52696191A6E720F0680B1A16923C071DAB368DA06B09C6CC9A5629B332E2E59DBA9C7A552464E451284B640FD6B4326C8249361F534589236919B8E82AAC045238E1473408B16F06079D3F4ECBEB40136DD9FBD9B81D9690C80B19A6E7A502240E37B67F0A0064C3AF14015D39E2818F52A8F8928027C8423BA7F2A065B40C3E780F22A4B2E4812FECB247EF0521181BC872AC4865AA20D6B4BA047CC4D0D1A266ED8DF88F11CFCA9E8E3FAD62D1BA66BA94751CF5E86A0A23FE3C5219CC5C5D6E6DA03735D291CBCE579BCD48F3E4215F4AAB0AE4043AED77B4920FF6B752B1372AD8DC31BD663FC7C1A7615CD0B86FF4858231C276A009ECD044C71CED1FAD0056B99364B8F4A00AD1B4335C1497A7F09A62229E030CA79CD003BEE427D3D6802BDC381F2AFE340100CE7340D1B168D9515933AD4495E1E7CC14222489562CA86EF4868599F6C4A3B9A6889B2A4FE8A6ACCC852DA590FCC580A4D95CA2CE90468163F99A820A2C463DEA891F650798FE649F756802FB0C1F31864FF08F4A06559E4E773727D2988621C02F4089157E5CF7A4325F2CC90E6828A98C61C70475A0439B0DC30EB400F5CE3F9E68196602623F4A632ED9122E186386A8608CCD5A022EB23F8BD2842641096CE33F4354346BD8DDF9722BAA06DDC3C67A566688D8B69047F35A3EF8FF00B84F2B52685BFB6267CDDDFE348667D9F87AEB8967962887F749C9AE8384B7730416D6E7CB1BA41FC46819CD6AE5BCA059999DFD68194ECD079D19C62802D31C48EFFC4E78A4516AD6E0C575E5E33E67AD002DCE1DD84B13647F10A02C52B8B44DE3CB3E593EBD280B0BF3B0DB30FBBDC5022ADE3E5F6A7DC4EBEF4C451ED8A044E89F2E298EE5DB56E42F4F4ACDA3D1C3D4D0D091F7A01FC6D502946EC999D2184963C28E6918BD0CCDF2DCCBBC038AA32DC9BCA957B85A772EC34C79FE2673E9484477404201E338AA20CC6FBD56666A431E1162FEF726900F99F11997DB8A00C8DC7BD302443BE5414302EB0E062A515145DB74C263B354DCEAF645228089011C8AD0C2488A1877C5EE2825962341801BF8852108DF35AE4F55E0D228D0D3FE6954FB50C11535F431CF19E948195EC145D5D846FE2E94128B167132CC6293FE59CB827D2A4D0D99B4A943F988FD7F5A966A911FEF338DADBEA4AB17AFBCFB5F99A5F3E1CF2C7822BACE021DE0F5E43743484616B207DB95074C50515E1C79A805218E978707DE9144DB0FDA0BF7EA2802486F0C9285FE2FE740C74A434A6290614D0056B993C8022C71EB408A13724A8A6222F2F145C92C5B8E40C1A2E0597B7048DC5863D293348BE52459B9DF27CA054D8E8F681BC5CFCF2B6C857A0F5A9B09BB8B26A5120D9025067CD629CB7D29271556279CAFF6A9F1F2BD326E45977E5989AA11341192C3D6811A91F2EF8E883148657BC7FF0046C67AD00678E0FAD31135A20F9CFB50C11A0BCF969E829170F88D0D985C918E2B13DE50F70CE9731F982ACF2EB445B493CA74DE32AD5673B42DDE23BB52BF74D06648E9FE8770474E0D23544D647C968DCFF10A4C48B1E20877D923FBE2B32D989A7616F026EE7F87EB56648D3B8F9F5267E848E4549A9D1E93389E011B7257A7FB5499AA343EC70EEF3B152519A46F428DDC5761E798709F2647B66E0678F634019D7CC5EFCEEEB8A9012D86675A4510DE1C0340CD0FBD651CD8E1860D2029DB2E2FA218EF401207DF34ED9E050343AED7CE45F5C50228AC6D34CBB3AD21587482443ED4C016EB14C44BF697DB9DF8A432ABB6F6CBF27DE8111E7E6F99B2290DB1F08B67FBECC0D05266947A5486D3ED3144C603C6EA450ADA2CD0CF0ABC3B4CBD39A0451BEB63693181F69907F74D512C6C23602DDC0E28116E3F9206C7714015EECF0AA7B5004118C29269887DA8C65B1C50346BE8B646EEF82B74EB506A9729D1DFD96FD3E39A35FDE27FACC7A54B3D2C356397BC4C4DF5A44E221A8D9A3FDC2FB55984E3744572FF00301DF15671AD0B36B2836AEADCEE150C117A18166D232832F09E7E95258E8644BAB492CE627A7CA7D6916623DABC4FB939C739AA20D28DBED576275192B0FCD8F5A96597ACDF63C52E786FD0D41A9D3FDA1BEC98C7CDFA6281991F2ED24D761E6985ABB279A2E13A1E0D00661632CFBD8F24549458C08A15901FBC691457BE4FDEE3B1A06685A4FE4CA6DF198CA700F7A4055DBB2F418CEE46FF00C76806535E11F271B8D0492194940D9E734145BD37679B29C7514865066620FCDD0D32591EF8C3E248B34C48B463492DF7DB7F0F55348656FE1EBF9D021B8EFB030A6033F739C3061401324842EC8EEA5087F8334580B4B76F27EE9A669597BD1604559DCEEE3EF773486D8B07C8993DE8112B4831ED40C8DDC48F95E6801042CE7E73B529813201F78F4E8281A3ACF0CC7B7EEAE646A936DCEB2C2CD3EC52249CB4B90C681C5F2B3CF75880DB5E7964728D599E849F310489BC05FEF1A086529B05B9E36D6879F515892DF2A9D29905FD3A77B676DBD3D3D452016F20F2B1736C7F76DC8FF66A4A2BF981AE127E91BF0E3F9D2193587FC4BF5778243FBB953AD4B2C9EF2D8ADBB24593B6A4B2EFF6B0FEC5DD93E763CBA06556B8F3219107A5759C2612C864B728DDE8115CBE1C64F6A9196EEA4C6916EDFDECD050B2812E9D0DCAF58C60D00136248FED11FCDB876A45096CE4B61BF8A802BDC71311DC504318A78E7D6982248AE7C9B839E920A92C817ABFA35320B1E5896D4BAFFAC5EB4C082373136F14C45B5019338EB401424468643B4E295803CD3DD47D6801BBF777A00BB6D0ECB5DDEB40158E065CD21816E168015177B63B500595F940C50049E5EFE64F91050057B9BA887C883EEF734168ED7C21A8BDA88EDEF63004BCC72639A475469F3A3B7B41FE8E01ED4CC1E8CE0FC716C7EDACCBD76EEACE67A3475460DBB990C0DDCD22B9465F4637171F8D5238EBC486090C7F7F943547293720875A404DE739B6DD1E0AF7534015C1D92946E8FD3EB52CA1604FB4BCC727CE8BEE522CE8EC6E96F2DE3B8E3246D61EF50CD4B3E4C39C794B9F5A928E2AD6F4ABAEEAEB38075DA794C597EE3F3408A6DCBE68026949974C847646C5050FB39CA379719C3AF407A3D022C4F7514276345C77C522C87CB8CFCDE69F6C5002C91ACDCACBCF7CD04320986C5F2979F534CA8905DB6EB91E58E8BB6A4A64A801629E94CCC9D33136EFCE99246537E698C96C8E411DE8023BE8CFDFA622A628018C2A466ACBF2DA20F6A4328B27A9E280231926802D22141EFEB4C0720D9CB1E0727D6802ADCCCF3B02785EC2800B684DCDC43128C96900A068F55BCD2D24D18205C3C0A361A4CEEA13B6858F0BEA1E7D96D95F2EA7BD24562297530BC5328B9D45C2F3B5706B399DD84A3EE9CB59BF95334520E41C8A44F2FBC4D77F2BFB353473E2514186C71DD2B53CD633CC31CBC74A2C04825104B9FF00962DD4500364F9650BBB214FCA69128BB001B0CE7FE5B7F10EC6933645FB12B6F6F0B83F249C37B1AC99B1AF9ACCA384BA8BC93BD7943D0D769E796A322E2C1D7A95191401457E6140CB56A530F03746A4053991E13F37E06801D14A7CBDAFF32B7AF6A064DE5E14346772D02199CE2810E890B5CC70A8CB3370282A025DA7917338DB82AD8C7A522A655898E1BD4D3211A30309A1F7E8682474632FB4D30191FEEEE6802DDC2068CFA6290CCA098193D2800C6580ED40C9A79777CB9E05202BB63D73401340831E61FC28192C396B8FA7E94C086E0E495FCE8115CFBD006CF83EDBED7AF2A74D8371A0227A0EB97C6D2C7ECDC79F28C7150D9EAE128F3BB9CD445A1C18DC83EA0F5ACEE7B3ECEEAC359B26A0DE9D3B233EF6D7CCF9D0E1C534CE6AB448267F3AD4061F3AF06AD1E4D789454E46D6FCEB43CD6325CA9C55122E729B5852018726239FBC9401B16A0490EC1D18668291AABE4DC581F936E39C7BD62CE844BE6FEEBDF6D41673321575DE9CA3755F4AEB3CF2A407ECD7214FDC7E9400C6F9652AB400C572B2065EA290C9A67380EA4156EC6818D5F2B1CC7B7E94085F3003FBBA0018822811A9E1887ED3E28B18FB2B6E34CA443E2201BC43A9EDE9E71A4291879E78A011A317EEB6CBFC12714C92CB0E438ED4011CD804498A00B3E6662CF6A4328C83037B7F174F6A43215CA8DDDA8021C93DE980F8577605005BB8FDD003D2818858C36E063E79393408AB4084C5033A5F02CD1DA4D7D7D37F0A00A3D6A59D587A5CE5F9A796EEE1A798E4B76F4AC99F4787A7ECD0D34AC74C46D4B18C3C8A4534569D78DD5713CDC5D2D0CA9E3C3FF5AD8F9E9EE41E6078B81C8AA33162E4AEEE8452013B7F3A00D2D3C9FB237B0A0458B1B8FDE6DEA241C8A991BC4DAD916DDDE60FB9D3BD646C71059ECAE1B8E2BA8E016474913E5EA3B50045BB760F7A40235201049B78ED40C9A3E07C878F43400ECE7D28010F6A6069F86EE25B4D5BED1080594639A5267451A5CC45A93BCFA85E4EE00324849A511548F298CDD6A8C0D2D3C0B8B5783BF6A04CB166E0C7F31F9E3387140878489D5F713EC05228AA7722EDE94021F723F7512E3B5228A7336781FC340B621A64935A8F9C639EF421A659BDE4AF4F9B9142191DE29053183F2E2813657F6A042114C66A6843FD673C7A565247B783E53794645458F5F99314F5A0B1B5250DA91905C0DC8463B534635D7BA62DCBB08D5BB2F0E2B747CC575A95A4C32EF8FA0FBD5473135A818140876DE6441487134B4F4C59316F5AA248ED884BF4A991BD33ACF2A0FB3F9F819C74AC4E9388BF4DD2027A35751E71413646E4350034E0631D29001A404740C963E940120FAD003875A0669686065DBBE6A647AB82F846EA2363CBFED5389CB8AF88C6C649AA38C9F4D93CBB9140997EF90C172B3AFDC9387A04569A3E415908FA1A450C876A49BD9B245008BEB1F9B0039E9487736F4E3677961B4E9D6CF736FF00EB770E5D7D4529174BDF900B6D24F1269312AB7561D4567CE7A73C1FBA526D02E52FA3D32003ECD2FCFF006BFF0062B53CC74752D5FE896DA8AB0D307977100F9013FEB40EBF8D4459ACA8E8516D26DD2CA337F7AB1395C8007DDF635B2392463CD018F3895255F514D8E25CD174C5BE99E5B9252CADC66571D4FB0A86CD610E63BCF0669FA6FD826FB3C27679BFF2D796A46CF9A99AD79E1CB59C1318F2DFDA9D8D69E31C4E5EFF004F9EC24DB30E0FF10AC99ECD0C5A914C8A93B7984C5415CC31972B8A689A9B181718495D5C7C87835AA3E6715B951375BDCED3CABFEB4CE12DA8113F1D2A864F1C790EEBFC469168D2F2F65A04AA32665DD15B7BA8B664BD291748E8FCC93FB3B3B4E6B13B4E6EF46FB5057AC6735D479C67DD207412AD481029F905210E6A0A194013A7DDA005A6029E14D007A2F81B4AB7B9F0E7FA44609763CF7A4CDA9D4E5394F16DB8B1D664B546C8550690AAD4E63082706A8C48E33B2506803A151F69B3C77ED40146D9465A0947EF17A5003A4B40AF951F7A8027B26C6636A00D5D0D106B11FF000BF207B834A45D1F88B4EBFBD750093BCF02B8BA9F48A7EE8E59E64B536AAC7CA3DBB8A7733F6517A8C1BE30B260A7746A7729A8CF42B6BF6267BDB2961E6E2F9794F71DFF005AE88B3C6AAB97424BCF0ED94D671DAE9CC7ED56E479CE7FE5A03FE1FD2A94C85877B925C08A0B74B1B5FF00530F57FEFB7AD6155DD9E9E1F0DCAAE747E0807EC12E54AFEF7BD6F1D8E2C4CAECEB314CE1654BCB48EEA22922E451635A73E5383D52C1F4FB9D87943F74D64D1EFE171372A541E80CA4396C65DCD94B702795632D1C7F7C8ED5A23C0C644C649769F2E5E54F7F4AD0F26E5CBB6CC436F561C522D1A5671E22813D7AD228B13F980F1568CA4666A3E5A5F5B8CFEF3397A522A99D467FE25F9C56076F439CDBE64653D462BACF3CC953F298DBAD4815C7423DE90871E9414454013AF4A0078A600C3E438A00F62F0943E46876C9FEC6682CF3EF1E0FF8AB67FF00717FAD220C464FDDD3114BF8A8037349932B8A0076A71988ADE47D57AD004CBB24552B93BBA50490CF1F96E24A0B46869DB7FB52CA4EDBC526694FE23561FF0090A83D3131FEB5CC7AEDFBA5865B3D4EEEE0A3792D6F2117499FD456BEC8E25886B422BFB84BBD3ACE758C469C855FCEB3944E9C337B915D5D259DDE9F73232F9715BE241FC5838E9F956D1472579DE447756E6DAE0C5BFDC30F4AE799EB61ED388C8D620935D5CA936D6C3E61EA6AA3A9189ABC9A1D7684E3CCB966C2967E95B23C7945BD4DE041154636B08D45C2C666AF6097D6AD1C839EC6933A6855E491C048AD1C8C920F9D4E0D62CFA6A33E68883A549B902CD25BCB37979F9863EB4D1E462A254F115ADABC2B7F691792E0EC963FEB5B9E34E9D8CAB5977A1471FEAF9148CCDAD364F36239E196848726596758C35CCFFEAD3A0FEF1ABB195CC1BCFDECC2E7FE5A4A735322E99D5798FF00D918FE2C5607598909AEB384C7BB1E5DD3FD6A4088F39A4007A50321A00B02801D4021F1A79B3C31FF0079C0A011ED9A4A7956712FA28141A33CE3C76BFF0015649FF5C87F5A0CD98327FAAA0829E298CBB69204618CB7B0A066A3EF7888FB2FCA7DE824A7A4CE764B6EDC14E82802E4EC1C75CD0323B773E51E70C872B499AD27EF1BDA7397B9B662727775AE7EA7AEFE133EE422EA9AAE1C893CD6E9DC576C763C26FDF2EEFDFA1E983D8FFE846B96A6E7AD84F84B53D9C5FDA4751B84CC7671A2C63FBEF42663ECF9AA15D44D7D738E3CC7E589E82B1B5CF514952184C96970564407B3A1E8E2AA3EE93CBEDC5B99FCFBE67B7F33CBFF00673C5547508C231D1966DB54BCB5FB939C0ECD5B952C35299D1697AF25E1F2A61B26F4F5A2E79B5B0DC9B1AE4F6A19CBCBD4E43C5361E4CE2E947CAFC3566D1ECE0711D0E7F9CD627B2D8D847FC4C0CAED88611B9FDCD3B9E6575733B569BFE258E9DE493F956913CAAE6242FE5B715AD8F3EE6D69E7647E99E5A98CA7AA6A06E4E17FD5A74C500589D63F36D077C7359B34A674BF27D831B86EC74ACEC74731851FAD751C4656A831704D4815139045201D9E28191F7A009A801C3A5005DD1FCA1AC5B999B6C6ADC9A0D29C4F64D3A58A48018A5571EA0D05CE279D78FA444F15BEE3FF002C57FAD06073324C0F19268248541933E94C0B164DB65C62819BF11C8A0931AF6316BA9093B4940CBE91A8E38A064719DB738F5A105F959BBA16328D25C41108DFFE5A3E29721D5F58D08A57B79353D43CAD9299A62DC7715D16D0F2E72FDE164A916DA621C640FF00D9CD71CF73DBC37F0CB12CD2C5AD5D4725BC9369D3604B81F70FA8AA513967579264375E4227F665BF9B3897FD7CD18E48F41570A6655F12D8D09B87D8A772B2C5C5BBC9C061FDD3535289AE171DCBA1D1784ED8ADACCB2ED27CCF5CD0A9F29AD5AADEA5DD4F42B7BA52635D927AAD30A38971390BFD3EEB4F6CC898DA72241507AB1AB0A88EB342D446A167BB3FBC4E1AA933CBAF0E426D5ED7ED7A7C91639C71F5A18B0D3E4679FE30707B75AC19F4F0A9CC8A531FDFBF385C649ED4D2387135394C2BBBB3320FEEAF4F7AD523C4A952E450426423154735CB534F91F6688FCA3EF35302949C1C0A00D4DBF6BBD89A06F9107CD4985CD5C7CDF7AA6C3E629B91126056A494351E42352028275A403FB52022FE2A009850049E940C9ECD7339F6A891E860A274B613CF6E41B79190D65CD63DA961A2D147C4572751D604D22E1FCA00D6F195CF031346316655C01B718AB38C86DFEF11480931B27A046D5B9E281106B11F9B6B91D579A0086D26F36D91FA9EF414857F92505B8A04CD3B431239F3E3DEAEBC55A32A8269D6F179520036BB36335D76D0E19CFDE35F6EFB783FE7A5A3047C7A67AFEB5C3523A9EBE1EBFBA4A3FB59357BE974B89651E66D6590F156919D590FB9D42FAD61D9ACD88B78D8F135B0E95499CB2D4CCBC87CC1E7C77EB7113F4E95B231B34CD2F0CEA91E960DBCE3891B3BC573CCF629517389DBC72ACD1EE53915999CD7B32399164055C023D0D05C5D8AB6B616F6AEEF6E9B4BF5A45CAA7316B1C53335A1E7BA9C5E4EA9709FED56123E8F093E689CAEB32B83E5AB7DF35513CEC5EE6695F995315A9E4EE6F691A47DB226DD21402A59A4699337848EDDD697A0FB3D4F315EC8CABAD0751B69879D17C87F8C1ABE6337134ADD05BA08A3E71DE9904FDBA52030FCC323735604F3279B687DA803296900F1D290117F15004AB4012D03896F4D1CB1A891EC6051BD0FA7E82A230B9EBBA9148A37E3FD3FA63E5ADB92C7CF62E69B332E4FCE6A8E1218787CD202DF0483408BB0938A092693E7888A00CCD31FC8B99606FE2E94148B179BDC7117FC0A9087DA9222121958B21F5E95A222A1BD0DB07DEE8495EC4D75A6799556A68BD9DC68EF1DDE55E21C3A6DFBC2B9A675D3D8861BCB65BD92E5EE5D6DEE242768E36FA55C513391B9047BA1608EB7B6B276ACDA1A91CB6ADE15B605A5D36768909C321FE13548D22EF228C11BC204523EF31F19AE59BD4FACC141729BDA36B5258308E4CB41FF00A0D09918BC25F53B28E559A30E84107A115773C6946DA0A39A05B12502B9C1F880A9D5A4DBE9CD6723DDC2690386D53E6BC5F4A2279D8A95E45783ABCB8CE3A0AB3CF35B4AD57CA40B52CDA33352DB500E5CB36D0C6B3B1AF3956FB53FB449E589328B5A45184D91A30AB322C798B8A4061221AA02CA70A77500675C47E5BD301A2A4088FDEA009050049DA8B0D33434F1F262AD51378E2790E86C50C98485199FD8574FB35139A78DA92D8A3AC45241AAB47326C9368C8AC652262E52F88C4BBFBF5916C62F5A045B8FA5032D47401303DA8032EF7305DA4EA3A1A00D466327DDC60734088146D7913FBD4099B36EEF2E9A8997FC2BA9338A5136B4A17896EAD0DFDB91FF003CE535122E05CBC921316352B2D80FFCB58F9149314D5CA71DABDB665B297728E415AD6E616B11BDD3DD5D02631B8FDE4F5A2DA0A12D4D6BEF0CDB5C26FB7FDCBE3B571CA27D161717CA8E66F2CA6B197CB993E87D6B23DAA788550B7A3EAEF60FB24E603DBD29DCC71384E7D8EAA1D5ACE500F9EBF89AAE63CB7869221D435CB5B68B870C7B01473154B0B238A9E433C924ADD5CE6B367BD4E9F2C0E4B54E2EFF000AB89E0627E22F68F086B725856871161B4C47DDBC63E9408C0691E1774DD9DA69587708E6DA68B05CB3F6A34089FCE1E57DEF9A802C88F8E95603651B636140146E3E7B70E2901581E6A4061FBD4C078A009A35691D2241976380288A03AED3740B7B65F3358BD5817FBA3AD7419B8DCD64F13699A7C6B069501456E93483AD6776C4E3D8C0D7EEDAFB535966C6FF00280C8EF4871BF5302E3935058D5E28193C740176319140127434015B518B7C3400ED2E4F3EC406E0C6769A0026289202A738E3EB412755E197FB469935AF0258CEF88E39A6A644A913C7E4A5D81790A65BF8B1D6B54CE571B17AE3FD06E3ED0AE4DBB7DF5EA07E1458772D4296471756CCB1F99D1D4FC87F0A96CBE5B94EE208A7D42218F2AE23906715428D3D4EA9781581DD1894B56B24BDB428C3E87D29491D342A72C8F3E910C4EF1B7DE4383581F4B427CC88F03D291B384582803B505724623FB134D19547A1CA6ADFF1F40E3B56C8F9BC56E6BE8A576104F6CD59C05CBC94C7096EC680394913E66340888F0680154D2192798718A00D957CD580C979434015A3036E3D6A40A1B76B9068010FDEA40385032CDABBA5C078CE0AF7AB844CAA3344096E9C2E4BCB390833EF5D32564444EB355F08EB3358431ADF24E90A8C42C31FAD71DCE839293CC59DD258DA231F050F6A60CA522E5A810A91E6801FB4A1E68197A03F25049267340C26C792450066E952797A8B45DA4A00B174AE8D145B3F8B871DC7BD006F68339835BB765F423159542E26D6BA62F260BD8816495F071DA9D1998D788FB39BED20C2467CB1F98AEE382FA8CD1BCB82F2F34BCFFA3CA37A0FEED66CE82D5ADACAFA858C8CD9780ED27FBC9DAA59A523AB150748D7E9520B7381F11C3E4EAACF8F95C66B291F458196865F6AC8F550EE94C62E46D34D18D6D8E5354C7DA87D2B647CBE277342D415D861C093A73D2ACE21F7B2111F94EAD1B7E629819F22051CD202849D6900CA007E78A00D75E7A558132FCFC50038C02A40C9BEE2ECD0056348078A065CB41C135D348C2A1ABA6C4B25F4224DDE5C41A46DBD78E7FA54626A58AA48EF74ABFBD7D37ED515BBE3F86290F51EC6BCD550EBE5394F15DEDB6A1A8C7756C31F26251DC1F4AEB898C91CD487E6AA1166D1322802778C1EB40C55C2AD04899A062374A00C69C986EFCD5EAA6803A0C9921CC7F74F34016B4D9D2CEFE09E5FBB1F26A5FC26948D79F5288E8FF67B63B897EBE8335C94FE23A2A53D0963B506E2378666120E085EE2BD48C8F12546CC4D3881E23747043243F37E74A46AA26EE92774BF37F0B1C7D2A19D1491BF599A08DD2828E43C62986B77FAD6523D8CBA4738BD2B33DE1698C649FEA9B9C714239F10FDD394BA3BEF2B647CAE21FBC6C59AB6E19E95673116A92EF223CF7A6067DD4B480A58E73480075A003BD006A47BD0E0D5016FEE481BB500590F919A4073D747376F4808FBD031C2981A56E9B615FD6BAE073543A8F0B4712A4F713BC7FBCFDDEC3FE7DEBCDC5C8EAA08EA22BDB0B3686CF704247CB1815E79D32389F1B422DBC43215E93207AEFA2CE6673E89BEBA0834601B0500398FE1400D634008280173C50064DF8F9E819A3A5399AD00DDF778A00B5B418893D2949685D3DCD092E52D6CA30B10847511F535C96D4F47A176D6EE7BDC3E65258F48D76575C25A1E5D686A5C86D6EAD3C41732CC4627B7C0F6A22EECCDC4ABA85CCB1F931C32ED20738A2AB3D5C050E72D69DE21BAB575176FE645DEB34CEBAF8348ECE19E29E012C6D90DDEB44792E3CACE6FC5E336D137A1A891EA65FF0011CBD647D020A4172B6A527976A79FBD571479B8CA96472F6FF3DC835B1F33295D9A227317DD34C918B1BDCCB9DEABF5A0097FB02EE43913C247B1A009A3D025C7CD32E680248FC30E73E7C807A14A0453FEC2BEFB4797C6DFF9E9DB140178C2A6A86364188F9ED4015A3BA5443480C876DF331A901B40C923FBC2AE249B4060015DAA3A1C5396A6E784D07DB6E76AAE4A8FBDD2BC8C6C4F470FB1D9C56D0B4EB3F94A64518071D2BCDB9D32386F1FA4875C865DE1A368C6CC57A340E66635BA0005741059CE28018698861EB4000A005A00CEBE140C768B20133467A35006C4F2A6CD89C52B0235E2BD9E78221A76988BB47CF3CE78AE7713A9542C592CD737F109B55B62D9CF9708EB8EDD295CCA45830A69B7A634BC79370CBABF254D5D07A99CCA36F6175A9DE48D6C9F26EC6E6E82B6A87761AB7B23A3B3F0A431AE6E5BCD6F4ED52A2693C6B909A523E9BA9CBA737FAB7F9E23546139730BE2BFF90586FF006EA6474E07E3390CD627D221C3F4AA32A8EC73BAC5EF9D2F96BD16B548F9FC5E2398A16A183E54678A679ACB2609E56E405FAD324BF6BA56792E5CFB5006D69F6C20707CB3401A535AA91BD3BD0044ADE59D8F4C91370DFB68038C8EF083D6828B6937988E7DA8031B3914863052016802CD8A7997082B5A68CE66C1AEFD8E496E5DD2F519F4C999A2844D1B8E549C570D7A5CE7652AB62D5C78835AD42F534DB5416C66FEE72715E7FB1E43A79EE57F1CA0B3D46CED91B222878ABA6418105CE2419E95B9069E438A6491350047400E1400668029DEFDDA0651B57F2EE90FBD006FBEDDC3D7BD203661B9D17FE1149E3BE7F36EBA6C63C839ED4728AE6269684EA3650EF703E4DE63FBD55280265A824027CB12F34CCCEECFFDD038FE5531562AC7A0F840674389FBB927F5AA6337AA46636A719FED6B39C7AECA0DE0F4333C63262DE08BD4D6723BF2F5EF1CB0AC8FA0D8A1ABDE8822F294FCE6B689E3E36B9CD8DD249F28DCC7D2B43C16CDAB6B3BAC0DD85F6A449AF6DA527DE9493ED4C92F2C50467E58F06980E79F6D02086FF3C5003BCF82E729BB0F400CC36EFBBF37AD033CF54D2196ED65C23F3DA802B1E94863280168037FC39A64D7B0DE5CC5FF002C074C7DEAD69B267127D84F44727FDDAEDE739552B96ADB4FBD90FC96ADFF0002E3F9D672A88A851675FA2693069E7ED0E44970C3EF93F77DABCCAEEE7A2A071DF109F778862FFAE2294224C8E5FDEB632356CE4DD10A648F90D00462801D400B40156EFEED03330F0D9CF4A00E8A290344A7D4502226D12F2F2413DBF94CAE7FBD8A2E3B1AF61A45FD8FDA3519D30040514A10483EB41273E926E9247CF6C5268DA27B0786E230687649FF004C81FD298D9A9DA81191AC5DA453DA8623993FC6A6E7452A5CC725AF6A3F6EBFF93EE47D0D65267B983C3F2997713A5B425D8F6E05112F115B951CD37FA53F9F3CBB23CF5EF5B1F3956A73B36B4BFB0FDCB561BFFDAEF4CC798D98C449FEF550B98579B69A4415E4BA1EB480AB24FEF400F85B9CD0056D6331EDB888E0F7A0637FB6A5FB16CFF969FDEA0673740C922FE3A008CD201B4085A18CF48F865FF209BCFF007FFA0A225B375BF8BFE3DFFEDDFAD6A551302E3FE3E53FE3FF00EFFF00CBD7DCAC8E83A493FE3CBFE5C3EE543323CC7C49FF002138FEFF00FABFE2FE9551099914CE73434FE9408B2698110EB400F5A0406802BDCFDDA00CA6EA69146E597FC78A5024452FFC7CAD051BDA67FC7A5DFF00C7EFFAA3FEE50239A8BEE37FBEBFCE91A23DBF4FFF008F1B7FFAE4BFCAA62059FE03562385F18FFC7DC5F7BA564CF6707B18517DC1591EE7D93335EFBABD6B789E1630C497EEC356788C645FF1F11FD7F87AD080ECBB45F7BEEF7EB56403FF00C0A90CA327DEEF48046ED4016A0FBD400BA97FC839E811CED033FFD9, N'FAMILIA')
INSERT [dbo].[FamiliaFoto] ([Id], [FamiliaId], [Foto], [FotoNombre]) VALUES (3, 2, 0xFFD8FFE000104A46494600010101006000600000FFDB0043000402030303020403030304040404050906050505050B080806090D0B0D0D0D0B0C0C0E1014110E0F130F0C0C1218121315161717170E11191B19161A14161716FFDB0043010404040505050A06060A160F0C0F1616161616161616161616161616161616161616161616161616161616161616161616161616161616161616161616161616FFC200110801BC031603012200021101031101FFC4001C0000010501010100000000000000000000040002030506010708FFC4001B01000203010101000000000000000000000203000104050607FFDA000C03010002100310000001D2CE01FC1E97219E1C8D9E68A591E50C569CB3413C3E8328EB9DE36A8F9D0B95A0D8A4848C264CD6E98DC341A0DBE65ACC3EE5668B4DD9CA96B2DE88D7CE2504A87ACB9D9A1ED4B0B6A4B4122684BD0D39AA83496309D5F4E365D7BA3919A8CD6E61515FD4D98EA2084525C63644B73E07B6ED25C12E846896BCF61BD4B0DA71811F60662B4B6CBE895AB47A8CFDF733D0143F07AE53D8D6B79E27246D99F73497ADD3A01890FBFC5A4149176734D10A124BE8A6856DCEE873DA22993CDDFE78D7AAD6667555792A5BCA51BD936586A630424535B296EA96AF7BB6C5ED03589E75E8BE744A0124CC9E917585D9783F50644E8F3E82A58A510989188D79881CA17D0E619CC5C4D4DCEDFD060D37F157C11D3368636378B236FAAEBF227E7F7E78B861BA39D5A0CD01292E22AEAEA938EE72A13C8A687AECFD857D34F9699C06E30EAB8519D5161027D7C525329CBEB17A34320F60B713D295B038CE864179321A8E29FB257D1E98425F95C7754EDC035A571041B5DB603D379FDBADA7DCE7DBCBCE883564C97F679CD1AB41F79457ADD1A008D07D0F06947960D388D1670E5E9479E15DE7EFE8341778BA0BFA0BADAE9F2FA4932B4F6F532F6C39229B3122923567651DDD0D5FA56B72FA74EB1FCE7D07CE5C981751A2C34140BC677BD15D9BBDC2FB49A2914C989089D398B1A48FBC816BEC731CDD37CE78BCED7E7F766E18F4139B6566F2942AD66DE7CD18E9D94E8C7E58A4B907892BA724AA24948A783B0ADABE2ED1105B6E96D268CDA18C7983196BD472AEE45BD320B15699EE03B6A73DF2F6E4109915C0E32620B1E3921A9244E5728B03EA99F6A3049E8F1DC7AC78FF00A3E7DBE8C2CB0B72F95E6FD269D5339AF8AED5AB970CB2DC8943342EBF133F1C8C7E224330495A408E01774F7D437C4CC551DDD24ADAE833F7B5595AA3C4B3DB03674CC664609211CD1D0DE5255FA86A282FD1AEB3CFBD07CF9E91D24693F8E6F94ECD8E872A4646FA24F93BDC9A2C26108259A3C837692304EACCCFA5D13A870ED1F993B6768C885DAEE96115A968E6778BB2738E6C9DE2573A976A249D2353B90F89282939B25A6B30DAE0D01D15ABA8EADF0971061946606BD4EA6AB52BDB2972BAAA3E360307095F4526A03C5C63360DC95AD5DF364AEA221B8A00977794B8AF6A4AF4EF2EF50CAFD23B92730E06CE9363BE56913EC6BEC7B18A4ABB5A9F41C2A24DE6DE71819612EF4D5169471B15DD4DA43C652DBD5C9B4B9A9B69318C7F25EE28EFE86D98E1891ED03D45AD5097AE5E525D67D353E7FBDF3CD59DA9224741D2E47C8778B2A96C44F51A1CD5E626E9CBCCDFE73B2729BBD904A4D22176286B0CD73F74DE7BB6CD6AD1414C70FD1E408BA4DE61548E9512EB24726F64EA6A91D3432D99101F00B44450D067165849729F5B2032C6EA96EA8C20BA78B696CCA1836FA868E93442D7463D592BB5C7F696D06EE02ACD8F61CBAA4BBA5BDA9DA3D0C6ABC3577A3847591B4B17E84734996F4989A19CB0B1BAE9F8FD7719EE8DD17334CB6F4D71D6C92D3DBD1FB4E15271ADDDCD2C29A0ABD3D0DDD08B49B0ADB017E2AB4D020EEED2B6C20E3FB04D26EA82EF3F67951E782D0101600033D72D6AACD3A29BCFFD0305A73B5391A36F96DC55786F51832ECC611B9D26334EA668C8AD996769353F7B78CD285AF60C98FB7A1C1BC8CD8B485AAA00BBA7E872A3BBA830D35640EDB073129124A573A948F731F667A8645698E27AB0E88440484441612A0B8A1B106E89D6A2A7A40DF4376BD7656F5A88507236D210DCA458EB730EC7BD675AE56F9A1A0D0D1DAD4B28E09C0C6CF9F7E0CCA057380D59B5BADF3AD56BC1B6A2B2AB6E66DC57C7CEDD7B04B0789ED4B754377B734B43A0CFFBCF3F491C916CE6CF1BE39345417D42B71F6819E8EA79B84606ECBBD3069E2310602749B2CF68B2D72807961BCE2806568BFD86CE8AE8594F85DA6358A91713B2EBC48A2F0BEEAB8793859E4BB1AF28AD0FAFB02B367908DF84144D59550E32CB758F66146D6D7E77F966777B8BE8E1AF9C799D960616190A495D2494A492969CDECB2268DEA7F07246B8D49125FD95B56DB98368AD56D652979FA44C50C10CA5479D93679616FA5573357501448D15C3D799539CF4CC7C91DD40A4A912836D9DD1ADA3E2F7A3695F9A376B168C3D288EE9E4B29340063D566E92B7C3FA32EF71FA8D68B2A0D067FDD79BA38DDCDDCD91B2B2568F3FA1CEAB55E93C58FAFE702921BF0FA139A8D18AB1A7B4A9B1CAEAB29728619616670EBAC4006FA5E9337A5A2CE653519762A25D479BD0AAED81F09F49CD27B5B9EFAE06B6608566216557728F2F4398CA49F2E167315673F6DF5764699662E7E51BA5808AFE30F19804B095249152494B49294BBC75596E0E65B6584C1E08ABBC213E32C1161D6B57629E86D273EE73EE039782D9529277640A62E38430E60F52A0D9442236307B04A656D2CBBF656EA6ECC36329AA414F5A63156CF5AC0BFB5F3CDF68E20D69A8990BC2D7FA4B39DD3F33D4697AF5839AD8E6BB9C7C9CD1D96DE7380BEAA197997D6E557AF4BD74597ABE7211433F06FDAE631383B7AAD08CD3E47698DBAA08A489F984AFB00547E97A3CFDE5166F33A0CF354D5D448D7C46E73C57BA85A2A662D5697CEB62D9732444D91D1C706C4410B2455D157E92870F4A861BCCFC3C3086C1BB9AC82488F2AE7790124AE2495D2E77B71108C5EB823B3101A2452C4797BC774AAEEBED6002668A9758BDB75A7C8EA73EDB14A426C4D25AC83465474624360C0BAA0AE8216D4C1663259599AD66568EFB7BE67BE60179EC9E7DB9F7C650580D21F3D6570DD6660C7F3FDA3A29BA38D1A7A3A8B93320C145A0A3D0BC55C54DDEFC1351DE51D0EA329AACC2B668E0302CBD0F37674A7E4F4117519C30F34F47F32F5400BDF37F4BF34B3CD452C7AF9E08C4C20CF49B9A8B2979AA0BAA26A5C92A1D4E6EB60F2BDE29D14A6822F2B6E4A68F4194BFB3B306C45D5545615FA21B02836F94C7D1C2C5A7A7CFAFCF07359B33D1B1EC6626BB8AD73C13C12D24AC7B3C4553E6261993D265A57DD86CCB0D63D3E657985B98AB3025B116144C3640D9AF2966CFB35E4D4DA11CED735830B1EDA2E35EC060C3182D30508C080801FB732F3CDDB3981E78EDC4373315FB20977822EFC4AA28FA239D8FD2F65E69E97AF8C975332F1AFE5543477D41A03197F456FD0C0FAB2E25968F2DB7C9A75E840BFA94EBF293ABED1B9BD4B2DAAC65879DFADF917AE41BCF32F49F3022A0E356BE788DEB85BE8B60115531F5C780D4B525064E7ADCFE67B9E45A0DED89C18F9D1843C3397425568AA9ABA0D667B4D719497FC4ECA008CCFE1D9E373E8A8D8FCA41774CEC9124999539AA53B889AB88B84B5EE2E02874F54D81D1515A8D74AAAA22B236D35C44835D69957DC894E3C294EB1D261F5A25749BDD09899236136396312805342A6855C7D30BA0D2E7B536921B355311DA3CE0227795753255CCF80321D2499BB7B57A37AA7957AB69E2A6BD8CC6B9D6CB8F2BAAC66A5D016177A1CD94DA5B406EE72F7797CDAB779CB5CE51F9E5CD2DF315E9186DB79FD8E27D6BC97D5E5DD798FA1F991556F3ADD5801960969DE93386554C8025846A72E2B9F42752F3DDB009EF4EA5EF1F75DE7549C1891E554DFD05F58F1DC52C294B0F3E8F3EF18F41CA27A14B5D794C6B19B23DB9604F8ED6E342944CD24E9D1DA107D4D223AC34E31D33E8EC727B18CAC3DEEB5834DA8A6A096CEAADD24FADB1681D66BB3BA52ABA6B99A10D4EE5CE71DC971047054CAFA2BDAD1736D408ED76FE6B1B4D7268EBF6507CDB51A4750E5B0FBCCFDAE82E1A4107A07ACF947ACE9E4A8DEC6634D736AD98DD96375273AE8EC3A1CBA8B41CF8DD2E635397CFA3579BD465AAFCFB4B99D6357B7F3EF40F3F9317EB7E55EB746EF32F4BF33B0063923D186BA61E59A3D14C00C20C80640B42F51A97F45A5DE1769AE5D938F6C971A9CD95C1C81E55468337A593893A4E473C40EF0980DA7CDD20733B5CB09D4913D7BB1B229233CDDEB7B21DE99E516EBE97A65A0F2E6F41DB7E151589CEFA966E9B0D9D5D852E210E62C61220B54DC10D80D5705C0168C035339A132F58F9499D642E0260D2C11CD8C582E7B4343744E83B3D844A4614805202B95E1B0081663B0DB46A7D47CF3D0B5721CCEF199137BCAB8B15B2F3FD79EAAEE8EFBA3CBAFB008D1768335A7CCE6D1B0C6ECB0B261B638ED9B436BE7DE93E732647D7BC9FD2EEE6F33DFF009EC58B13E176602680A8FDF910BED7901DF190A5D573E8B4BBE7FB9CEC71C84491BEE75BDE49C1891A551E9F2DA9B04E6BE8D32460B7C5283618EC7D1667EDA887513437349A703637B0F1A494A74B0C94DDDFA1F8DEAF17A7DE4C29A0FA4ADBA068C6B6A6D28535C54608AF2D10150444321C468AEB87F4591E92BB0BCC1D1A86ADCD6A85C1C912A57574D6772D99C7D8C71CEDB808B642DDD203A10E2C096725B9F5FB4CF5FE8E2F79DE315CE39B543F9EFA179E6CCB597F9DBEE97243B8A2D629E7E635D9ACBBF4FE7FBEC218E1B7181F45356CFCD3D33CC28F37E8381F4A34D6E17D17CEEC448A58DD9EB0C0ACA9FBA73A225E3D8F63052E2B9F46A4BCE776218EA892E52EDC49293839034AA0D56534E4B7C8DE8B3BCEF0663FC6FDF3C3F1F4A9698B10764404D06AE6379DE12573AA0F5EC7532D34594B9C3E8765BBF1EB7C9D3DDD240551E7FD0EB6E2C5AD915E589B2B06A26B9946D8A5689886F1308C9079494F8258A0B52573829704821DD20A9DD7F18A8F8E572118B125C41CC095326AEE353E93ACF2BF54D1C5EF79D6646B5CDA9079DEFF00CEF7E2A6B8AC3BA5C81F7DE7BBFCFA8FCE5FE6F2F475B82DE79F1079FF00A7F99FA6395ADF2CF51F2DB6537AEF927B05229FCCBD37CC608D13A27E7ACB8A4BB8FDE8C40ED5646296125717149F4924BCE77F94F6F5525AC91492752E4B504F01D6635594D492E77C722CDCC7B215378DFB7F8CE6DD8406E7340D858EE3F0739DE5D24949DEF3B2C93EB6C11D43EF2A2F399E8EF6E29EDF332CC910B664E2EF4C1B14B14B8E296297C4B8B673BCE55CBD8F8573F20E4021E2BA54CC1E36114815259495AE9562AB9E41302D0CAD0682647403C6FC9A4F6AF1CF65D3C2EAEA663E71CD3AAFF38F47F37DD8587047747934BBFF003DDF235919DD067F1EDD7F9CFA1F9A18E4FD13CF7D21C9D3F977A779846D77AC793FAC45D6798FA7798DC1619A07E7A7D1E6F475A3761960BB26561B0E124146A13FA17BCEF9CF431D71F5F25848C924EF3BC910C48A6BCBEBF21AD60CEE6B81CE63A20B0BC535BE488D7575AE6D0B3AB8D575BDE5524949DEF1492DC53D9A7A17B714F6FCDF45A536633318734B19A1EF878744B1AFA363258EAE264910124DE81759C8E5A5147573346E493A165844B992CB68A4090868B8155C908E36849C28C368CD3DA09EFDBF9315CF7BA393D5CE5AFBC4DB103CE3D23CDF761616215D0E4D66EF25B94E812A2C03C7B343E67E97E6E4393F4CF35F4E785D7977A779546F3D43CD3D22D753E75BCC0DC1A09626A69B5197D5D3F6201958EC95AD85A4A214284BE884979DF42C02C2BE43DEDEC8EE7792D0A586D5E675990D5B1653F9D53F819A381E0BC53D87C9D5A73C31438D338EE129ABBCB1492A892EDC74F04CBD371AFC3EA39FE8BD34DC66972BCE8E5E928661B1158EF776AE264904B635DC59357180CE45D601322918271F5DD918FEB6CA4740C1930CD16C9A2F4664609241A32C3C63B5F33D23D6FCB7D437711FD671897739D83CE3A3200FCDBD2FCE37E384A1CBDDC88F778EDEE3E86443BC9B3EA23CEFD07CCF4E6A2F4AF37D8391A5F2FDE60E9A5FA4F9E7A34ACCE03D0F0572BA324735D26A32FAD176A69EC2B5D92A79D50526A87F48779DF3DDE657D857C961DEABAEF3AA57042C570E575993D71A89735C97AE26098FE23EEFE741A3E7D9C9629A18A58D6B67657DAC6E488A989FD12ED80D6ABE85E696BAFF009FDF9BA63B3983391031179CCC105576D6F64642F886F912852DEC6A05B1D1C6C029942A14DD83B23A3E40372C43C50E70F83327066C1A15D6307D18DF66153EDE2DA7D3BF207B53F97EC2DA6C8037D1E2F01AB0BFA519F3AEB34A3D370482EBF1A79EB25D7CFBCDE792ECB37466B7F3DB34E9D1796ED3CFB4E57EB727B23CCFC2EDB100DB9F45F38F44ABCFE0B7583A21879C6608DADCB6AD6E36B2DAADD8EA177976C4E545F4725CF3FDCE007032ECDD1BC8573BC95C10B0DC395D962F64CCE4F39C4B9FC59AA66961F2CB68DC5613E81C121DE47DDA40A764DBA68EAF372DE728EA5D6722F6045D81E8D555AFABEA36EDC9C46C242DAE692A218B86AAB8C7880DB16D14AABB183AD0260D242B6B5BDE4B493E5B53D5DB202009211BA2131C328D8B631F0BD103AFB3BD0E15788C5A7928A1E485A8AB1A0CBB081C7E1A8AF42F35DE6CC1A56099CED71758FF003B844BD1347E336E27B13B2BA4349992D3658C4DD9E376E54162F718E8326F70DB385518CD5E4D6C8469C6B2A8D76435EA7692AADAA5F8AA79D456939097D09DAAEF1F74B8BB3CE1CF442E98FA133A1F6986574A0333D16828236E6DD03E61E783B365E684D72B735AD59DB2DB527467AAE83C3B5E1ABD0E29ED91B737168E35EBCDB343081D2B6D5896832132AD8119376439C39174D80882C86825190DE864314C8CA1DC11D1AED5A52768A37BDD630A985BA657914D66855C644C7C6D532DAA3D8B7F18EF20F45C4F4FCEE3DEFAF872B46E049E26C40DE4643EE0D6B54C604B02E48BBC437D5C454FBAA27987AD55E0AF76F3F5BBBC2EDF6611723A0CC5ACDD863F61779FCA6AB2A0C8C23818EACD6E4B5AB66969AE695F9AA924413A480BDAB8964CE05068A8434EB481A7BB7B6BF254ADA0B846556A73228777DA5BC6CD98CA3D12CFD3CAAB3AECCD6F1ECA89EC550CF4DF277D33E985E43EC23A878AC625ECAC86D214BAB51AC5346E4D181B648DC353C32368C110D111A224DEA9DDEB9C151BDCAE778F574DE3A0A8EAC92AE4681CE363656BCE4634E13516DEB9E29B9EA7146F3AB4A5D9CA0E3B068804BBC09C20638EBD0EA365E3EDC82C692372490925C52BA972AD39AAA9D2C33681D5FAAF8F95B70EFB2DA1A2D7CDB6D5E7B40C5D065F4F995B600CE02DB59ADCA6A96DD351DD51BB302B889732EA13BF77953306BF5D27CF36A69D953E60A8B96014207D93E8DB6FB87053832189F499D95B5D7DE9C0FCC63EBBB2C1175F945144BBC08BBC523F6F867D97D4BCF15F6A9AE184B8D5A446171A9810870497451F605E8226AE9D7730C435660B4A62DD13FBC1B4D776A2EA43190CA195894D635F77049248F542D2A292B853A272FB71533EAC9AFC75BDDE9C1E4907A279FB7245CE3222696036C35F81D2E60A9BD496C492ABE24A5752E55F5715D77798AFA31A17BE37ED1CD08F9AB55365F565F50B4C8CDAF993E70918EBAE22FE33306DD57D158E774799801A4A54E9213CD7A058D7F2FA520825A10C55A5102FA67DBB01B52ADA612A66D957D5771B68254F65C27A9F81D17A8623D4BC4247507D13E3CBBC9F2CEB84DA9EC19D5C524BE93E652597D48DC96BEB5431CF0ADE2067099750021C0AB4C2F89AB33CB04D83D8C98C6C68CA840E2E3F82C6A5DA38C23872AAD1ECE1BA01E534C0764D14810A58AD08DAB8C558DBD2D99AAEF2F784E9478D47ACCA3797C73545B9A94892522495C4929173AA46B94B63B8F77A2BE6E5E71DC3437CBBD57AE3F08B7BBCBF6B8AF8FAFDF9E4BAA4B3C15635CE7019D95D46569C326BA8E74F4077C0123F37A724503A9C47252D503E96C8C0D4355564855DA6A991F4EF26FA3EA7999380F7793CD8AC07B84AF34DDF947ADC9E4D0EA00A6E0D848EABE248675714965EF9F3AEB6D9EE3C4DAD710860D9750415A0B9F4D5446C2A6A30322E1B288448A2979563C44C42C1DB2452FB0B9944C8658AE451BE12A644E8EA0A29703047749D219CE80C8049114E6B83CBBD53CFF4F373BCEF1DCF4B8A5752ED44922B492B89252BBB5C6FD06C1D80163E734344650417DFF7654176DF3A3E1F7ABA3C4F1C7E8733D9C269D5A512A7284B0C8C9B29ACC9ADE13DAE8452E212B71E49B8FDF1233EBE1090F4758CEC8ECA5D399A83615557DF7935DEDB6B63E61213A6BEF1FA9A03F6DE2353D1717EB5E1307D0325EB94A174FE4FB0B459F9DB5CDAB492A9D7C7DBBF62DD7CE5EF71B6313FA9DD00E74497D643630A995F19D083A19A3410C4349452C5DE4B887222BB1BBDE01C50CE3D14304C395C7C7B648622A3B83C8E26E9E64649AFB2351AB98CDB62DD8F1CD7B74F279C772C38E6BAA24915F12575DEF1F735FF0040E3B60CCA0F8EFB278C2BB6B8D7E2F717BE9FE1FEBDBFC9DA712D5E2E2C1FA133A18BC60AD0E57B396D2E3136B73538FD565F0904E5DA2254CA1DE43987713D16A5E01773AE954B91B434A335F4D94342C70B5E715FA7FCF7E995B7367E37A4D28CBFF20977152A05C6FB588626E3CBF5F54CB6BEC255E5E97E9EF9A41A2F1ED19CEA52775D917C2FA6FB88DB0E850CBC56A1A13625B4184F856F0986B164122A3A644FEB6AF913E2128E37B21C709114B161322A21913D9046188E064BE4B074A9EC4F13D41662F69846E4CAF3BCD3C94D772C38EE3E49A0F49F3BBB878EE4AEEAB31EEA6ADB48F4DC0EF2AF55A15753C7648D72BE8CFD76427DF8BDB5A21FB7E7CC52ABE7C3E79E8D1EC0F9E5DE8BE57D97EBAC3136133E953166C84A6A9010BD26FB8DE8BC2CAF6CC65CC7673D66A40B0971A9C78CD3D9F9BE7EA5A7BA784FD292FC1BD6BC57DC2CBC23DF3C6BD28678AFB879CECE561F5B06422AC6EB4D82A1F42F14F4CF31857A467C607023FABE4C6F20B6AE0AC449B9924C9FBC79BDB533D25A7F475D6C56E85B490E8980CCE3348DA2CCB35480F2516D9B45888F74A8B04CDFF21F9F33D13B0BCCD9EA4C83E60BD4392FCCFBE9CE29E5EBD42583E52FF527C0F2E5EABD1AF24F3EFA6836E4F94F9F55AD3CCF94FBF55A95F2A3BEAB74BF9C2ABEB5CEC9F322FAC1D27CD1F499E19E7E64F5E13C03659903BBC6A8BDF1BCAF53E0ABDF1FA19E6DE8CE9F67948148AF8B0B264601F98FA931BB7E6277D2C547FCE96BEECFBCBE2EBD956FE77FFFC4003310000104010107020504030101010100000100020304051106101221313233132214152023410724303425354244164043FFDA0008010100010502AFD9A228A6AFC354682910DC7794EDFF008C94FF000D5A5D614F278E94B2C27570333B8A4DD54F0CB2F391A9835345A7E2EB69F31BD64811B1CF90D5AF4E386475C3248E35F1C431934C1EAD589267C21AE7F0B61C6423EF318CE0B8C67A557B19DA75F51E50DE3B99AACF54134710771C9ED0DD48AE470D51A0A63EE42894FDCE014A143D42A5D5BDB63A4FD5BD7F0FEEA1DB7FA563ACC47B329DCEEB81DD965177D0F0DFF1CFDE8AC8F76CE785AACF8EEF902AAEF6B4A28A0BF0D4C4149D0229DD192EB6B5453C05D00998E52587BD66E773E4CCF10B0D91810B2E06C0D2A6F88E84F5089E55A4E195D3451A11C96E571AF8D6B1F24B6646838AB1242F6DCB0653E9E84C078E9BB49F26CE2C734398C8C9751959C552970BEAB51DDA6F3CD746B86ACC856F42DD81ABDAF2C2D7FBE9B816D19048A0ED71D117AE20B8C27B947D563D7E2C74990EAA554D643B6979DDD327DC3AE0022B2DDD0796A786FF008A7EF455F3EFD9E1F65AACF8EEF91509354DDC5041353568A44373BAB5DE9655771B2E2C5EAE8B22F64509258FCECFC372ECC65453029A43E97D4D3A399A684EB2C538828C80BDF1C62AB63B2E9A08DC789B0C62D8F74F45BEA4D257687CE3D474A35329F49FAFDBA4D0D4D1CB8570A3B88413872946AB2B1091AFEE93B5AB1CFE1971649B6C6FB660430BB54F97853EC736C9AA8376397FCD8E92A6F5FC38FBABABDD94BCCEE994EE67760FA3965FBEBF96AF28B23E29BBD3F92B9CE5D9FE506BA2B3E3B87EEAAB6385F5660F8D143735357E255F80791D35CEC0E753C6DB65A8AE49658FBD7E78DB34BC352C5C0E6D2BADB157292036652AAB38DD3B638C48753F583A26F58E3744D71F4DD2BCBDD1BB49AAC6C13D87F146D90B463E5E09ED358DB134DC5244D0E92269964D3EEC0DFBA07B7445A8B568B4DDA27354B1EAB2B07A73CDCC06F26F5C73FF0073459C69F5B885EA2582F0731E5EAABB5502FC6357E2CF49537AEBC9DDD074BDD94BCCEE994EE675C2F6BBB32DDF5BCB5FC792F1CDE4FCC9D2C1FBD801F615C3A4360FDE287238D9882D935439B86E6A62D53D39529F8DBC28E80CBC752FCB6DB76849658C75DB16441EB37D3F899635248E73C9D547216A95FC5FC5079249F4DCCEFF0048FA635AD4EC3985E4AAC3438AB1C2246399156D5D06399A5895576A685A22110880B44E5AEE701A5FACC963B50BA291BA876BA1A126B26CF4DEA21AAC88E266598EF5A461D6A3485519AB5B1055181BBACF49BB98BF0DE733392C893E96379BDFD329E467761BB24EDCB1F754F2D6F164CFB24F27E65E92F3B781F07E2F7865F22728242D7549D567EA9ABF0D4CE813D1EB649A975AE0593824E5A1659AF01B14E69E6E39B233F1B4945C89DDAFF1FE535556EAEA7EF9EECC5F6546DE25093C761E0C52700A10B0082B0D070EAA0080DE4228A7EE082942C9D4F5A27B747B1BAB31BE6AFEC11C9AC133F56DD838DE69F386A68ABC7A26B144DDD63A4FDCCEA7A33CED591F1633ABFB729E46F761FC7276658FBE88FBB0787267949E43D65E839DEC30FB1F8BBE197BD04DEB5CE8A8CA0189E0EE053135587F2E3E16DB92B06C56AC5590646299976CC9F1B7831F17A8D2EC9C6D67FF008F1EF0C9A38D8683236BAB905A4051C85ACA6FF87511711407128621C30306806E2D521017AED4E9E34FB11A33B1094209CED1091A4EAD0ECB540E3A3992573A3E9F3AD0BBD9AEA085A2D1041448AB7D1EA347A37CC3A644FDBC6052F6647BC2C27824F1E4BC947CACF1653B1FDC54BD95FF00B787FEB7E2FF0086528A7B9A134841E028670D34ECA8A60EDD1F46953FB9972B0962F84AEC95D4E9D86D9C3C919B73BC4D52F3656DAE112D8739C7F8F45A23BCB480874F50418B7B8FA4E80CB16A5AEADE9EB39D5F58BB830F17DBAD126B0272D54D28F4DD24AE56E4B2096649C64C7DE222A769AAAC530310D4649DE9C53DA7357C7CC864E4E17CDC4E89C09C210E858345C28AD378510E4472B89EA347A0F30EDC9158D1ED97B723DED586F0C9E3C97928F919E2CAF63FB8A94FB2AFBAEE27957FC648FD894F35393AFAE411394C90AA4F3A55939B666E91BB9351088D15CE38906F10F8DB10BF2F1D3B6CD7F737B80B9FFC613570722169BA6F1A099297A05F1CBEBB78258E394CB04919D0EB57A6259EC89BA277427DB62D06BAC99A47546400BE091CF99D239CF17235F1365CEA5C3229A02E16FD69239F1F2861A76096E3DAD644CA6C7C1F032AAB5646B4C99381D1E5A174AC3C437B7AC7D9FF00374F27A6227934FDEFF8BEB1BD9376E4BBA3EB89EC93C792F250F233C594ED777B94FD98FF00EFE3BC5F8C9F865EAAE41EC96321C141A954C1D210ED2263CBA20748823D1BA3949182333086B1CE93D31EBCAFC9D582366BC2A6735DBA188B8BF9398C2E60FADA99CDAF680434277593A20838EACB2E28C6D96A30BEBC81FEA97D5E386B0224C5F8C72134C02FBEF41F1464165F965631B76C3870C4E1C5207912B4FA9599ECB90172923F59A6ABA6ACF0E60C6D76EB1411BEB44DE092839B251B2CE06CD1C52B1AFB14A4AC44913F92298A1E6D774BA54898538F28C7DD3DB90E4B1DDB63932F1D5CC2B11E294FDABCF2E9687941FB79577293ABBA4DD943FBB8FF001FE325E17F54F8C3864AB007D0D142D0151D1560146D6A0426BD091A9AF6C7675D46462F521AB3F01C942D945A303EBDE8DD1B900A3D23A279A8E4E18BA7F045D1E894DE72D91A4A8270FDBC0EE09291F5AC43E9CA1D5DB1B6912DB22BB2714C7DBE3F6CDC25D3CF65AAC7AAD75493E16C4B65909B5783C3E76452D19F89ADE6E8480D8DC38B880B0E97D08897576B640ABD9615A871C33D9F03608762E33C4A5617B207708907393AC6ABF47AB89E989DD23F29EDC974C58F65B6FDBBBDED589F04DE2B5E5A1E6FF8CAA93ABFA4BD943FB943B3F194F005A21A6975A0A7808E8ABCBC26AD90446FE41CB529A4EAF6FAEA5B6E807CD18164AD559E337EC471DC9ED4C9D037D1087573BF6C3A7F004C28A728CF0CB31E297731C0D0046B4DE6391B134199C7D315DCF7E32021AD1C2B8CA703AB75D726ED2DDB99D34F9C63FD39639389AC719EB33DF599CA21A1FF00AD5A66C870BB312D68DD1D8ACD8A3E22C7D797EE61E461755B10C50B7405DCDB34DA5899CD648E3C985563C9EAEA726A776D7F20ECC874C4F65DECBBE46F5C5FF5AD78AD79319E63D32A53D1E96BB283BF718B93ED85943EDFFAD509869624E523B9F54C61269C643EB8E4C6A646B8000C68089E5B43253AF5A960A6B0D8F1CC0B214E70B2304EC52140F33D34F77F0B504E477B51D53550A934EE8AB49F0B8FA51867B785CC1AF015231D22B33E3ABC777361EA9BEC3A17FBC727C73571EABAAB1CF640D8D556F2E01AC9ED347575DAC4CF9DFF00AB31091B6F13FB9B353D35423B31D8F86BB6A3641A46C673C97137682BC3C0A43CD8F1AD529CAEA7A623D953CC3C790EB8D07D2B9E2BBE467763BFAD73C764FBF19E52B2BD5CBF16BC7447DFC5F40B2C51435D38085283A4839C6140CE70B144ED145CD33A69CB879DC3A431B24B9936BDCF6D832F1CC4CB1E6A111CA58CE06F23AA9C70BBF86343ABFA1450508D53473AD082318D646200E01A1CE334D4E274972111D9BD70473BACBCC78F7BD53C7C31291AD31CD18F4F0F2B0BA78DE63919708A75A40D670B5BAF3934D2E581057D9EA860A69CA7E6248812EEEC3B35BF1F139E35E292132642577391FCF8FDD44EA5DDB79485421399ECA7FD8FFF009DEEEA3E2B9E2BBE58FC98FF0005FF000CDDF8A3EF3D329DCF4559F1D1F3633B565FB8AFC160D2DB794814415566A5A345FF00558A6279203E511B2C4AD92B9022831F3FA0F7D80AC4BAACB5AF55D6A4E375A6B030F216CF123FC3169C27923CC39A46FA7D5A79B1FA9AF66562A42D3E2AF55EE9DF52391CF81A13606B53631A36201009DD341A4D5581EDB2F21AE6B47AC119427C814B2EAA1819C714BCA33C49C148A5E6659A061C649C36348E397D764D62485D107C6F727D79356D7978E8C6F08B0965E1CE50A90E252B7EDD21AD9D3EDDC76B2D3E51DCF0DDF2C7E4A1FD7C8728A7F26287DC239653C8F5F8B3E3A3E6C676ACB3B9EE0FE567422C7740A880885C3CE2E4E6295FA32D7B83E496AA8DCC7476E26B4C962C693C934B1379B4E9A484EA9EEE2FE11CD0E4495EA33D3B32F1B7AB56286AE1CDFDAB1F1F13E83808A0E87A3802B8106AE1442784E479277341C9CE1A4EFD03EC154C990D3AFAA6401A99A012BD4AF4F7739F84A735816031B46E415EBC15C11CD700D785BA31A007AC83558E98D67DA980F4B1FCEE69EDBA34B15FB6EF8AEF963F250F064BC53F760A12F4622065B93DFBACF8E879B19D9AACA751BA37F2B120D2676A622A958D0C6EE2098A27AB2F3C3AF127F096C94F8267CF66A29269ECA95B1C31CC755FF5274FE10835363288D11FA304DE2781ECD389F459C1571AEE382B73605A05C21688AD13827353D8A46A704E0A60A73A4985D098DA5AD9E78D8A7CD568C8CDD62BD76CAC99E5A38C3C33BB6667F42C868088E7A6EE11B9CB223DB67B319E0B3E3C4FF70AC8FF0062B78EEF86DF92BB78ECD3AFC30E4D9A4167B766983E56F68E0CEF299DBAD78F1DE5A1D87A653BC6E9981AAD1E6F298E50C9EFA3382D67341A80564F20538153B6C387C14BC576E7AACB714BE9319AA91BA193F8981300511D14CDF71FA366FF00BF2378D5584BA5706D6743F6E4A6EE2604D5A22168B45A22D4F09ED4E6A78528565BACB869386CC92B5ADCE48F7C904465763EAD66B6CD98A2658B664753ED72D7816326F5A969A7D0539647B67548695ECF8F13FDB3D721FD8AA3ED643C567C982F7653903B42EE18AC1E5B31FEA5DDB9EF339156BC78CF2D2F1B8F2C99F78415BB2D5625E227AA6F5A4747D49540FD57FD5D6EABF30EAA469D2E4BA36D4B5C09EBCD1E3E00AD0D11DFAA85BAFD013026A685F963358A71F70F5039361D06087C3DB8881909D903DB71EF73613AB2ABF84427904114770453FAB93D49D243A0A75F8DD6319202F9ADB439B24CA2ABA231682CC6487B0855642140F4D77BB63A4FB1F49591EDB1DD53C360FDBC10E3978564C7EF6067B726DD219F9C9B3BFECFF3B42EF64EB66FFD649AFA599D7D67753D2CF8F13E5A5DA7B721E5DD2B9DC4D3CD68A0AF23C4152722B569C2AAC7B57556880C87DD2D7893980ACBD7D5FF006E8C53636DC9561D38B22DFA58E03E86A8F9A6AD74006AFAEF6C75246B9EF8E2E14F8F85D1737D299D14823F524821D63C6BA29607465B2405F1BEAC80861DC51DEE4E4E4F4F2AC1F7506FB343C3E982A488230B53E0E5344D52560E1F02F4D0E893656E9B16FF00DEFD2E5933A09942ED22B6EE5B2235680B22CE2CBC6167795793C9B3A3FC8ADA1E931D56CEF2C6CAFD22CBBF8A5775567B711E5A7D8EE4DBC7EEEE349EE3F032B54559FAE2B1BEA495B1D0C6D6C2C03D1D17A6BD35702A6CFDC44D52B016DD894AEF5E6CB5A7320BAD6476A78F8E19070B8FD6C55FBA76A6AAC068DD5F370061B0DD048CE265569F8BB2C6C70D33E9DF7C7E9DC93D976493844EDF4E4AB2FBA03A8FC7E0EF7272727A98F23EE7D36E8C2397456246314F91604FC9C8A7B8F7AF8990216A451CA1EB5E7B17FED3E829CB2CFE72F735FECB8FF6EC9FB50234710FCEB74D33EEFB3277ECF7F7DCB689FC9CB067F63391E864BCCEEAACAC4F969F649D2F7977458911B9F50B51AECD2BC4C6B50EE4421C95A66AAA37F72D1A2FC96872C831D0DCCBD0B3716D0630C55BD76082E45190EFA9ACD468028004E28AFF00CF079666F0A9EA89228E3E355220C96E300A959DA3269A413C8DF888277B9AAE0FBB1BC364C7BF886E3BCA704F4F565E74AE389D5D379ACA5D8ABC53DA74A64610BFEDA0FAB2C4F0B888513CEB138E9B13FECC74DE53FA65BBDDDC15A3A8D9A3C89F6447FCCF11D33A4FA47BB6787EF4F31B43DE4AC37F46D9D20BA7EF3B7592B15E5A47DB2F4B9E54168868E130D0C5D887D13F655FEDA282C8C665863E0755DBB78314C7DC3A3FAFD01554F8F4742C4E09C145CCD50D1671ED13DC9AA18A4ABC21B2C5FB49E1E2A0C1A81F76200D77463557800F7801F8AF1FE4F5DE539489FD2C0E7598A32A4B11C10DD9CD8B15C8759B30D06B6C4123532A88C5BF4DD058670C91F58BB3623FD9B7A6F28F4CBF71EAACF4D9947B62FF0070DE99CF17E76686B64ADA0F28587FE8DEF0DCF2BB75958AF252E92F4B9E5410DCE1CC0FAA5E94FF00BBBC29873DAF983F24FAA1B0B9A0365EE4184B9DCB70519D0E35B1DA12D77412C70452476232C27A889EE6D49E4824872D0D955031F07197D3B2385ED6359243C6D8DAE74B522D442F8F88BA3FB98E1A45F8FA5CA452F47B39C6345725F463B771F6248A19DC2A62A474B4EAD7844B1B1F0DD904F15C83EC65A93C4E31D6DA98C0B62FFDB7D051E997EF79F769CA71ECD9A1F69FD953FDBB3A6D0F8D6CAF91DD33FE663759718CD2B643C36FCA775A58BF253ED9FC767C9FC72F4A67F7DBC2916D518E4CDE41AD72920E1A93841A57A9C2F90EAE4375590C72549A1C857898D63E4A75ECC7530D035EFA509596C486931B43A83E30E958D64EF1EAC2E8D8F6F0F135ACD1322D50E9E9EA2AB7857E3E97747A7045AB459A771B31B8C8E23E984022138A790D333DBC4663C4677B94CCFB7B0E01BA0FD053FA651E1CF7F91BD2F766CE7F564ECA3FED58B691C3856C9F37E848DA0F3C7CA6A674AF903F66DF95DBAD2C5F929F6D8F1CE7EE6E1FC33F6D7FF668A1B9CB6A18DFFE8EE12E2F3AC565BA3DACFB6F4FFA1AB1B69D5EC403D7818F7C2A09B8873D26687C73C513D46C1098670DB3A10F8DBF6A20EF58378840085634F599DD123D10DC77129C11080E739D1B599F117D9A8DEE4E5276CFD79EB0B7DE46B1EC570FA9F415378AD77BFB9BD9911F6B6679D59BA627DD936721B49D16C70E6D5B47FD868D5F5DFEDC83FED58EF28AB2B15DF4FA5CEC97C887F01DD37480FF0094DC3710B6EA27459D7028F2563997FB6894EFA0261E7B3D77D19348EC4718E04D98B45C9DE5464F14DAB44D109E8571FB7E001387EE9ADD1DA7BDED1AB02615C5CBE82513BB85483456FDB1E275F881A6F7290723D268F998B988F425BC2CD9060F87FA0A9FC7739487B9BDB7FC5B3234A923560C7F92FC6D39E143AEC60D63FC6D17F623E53507714793F14BD4A2AC2C577D3E977B25F221BC9E513B560DDAEFB1C9B5B9E4F70DFB6AE659C95F770B6376B5DCED4B8EB49DD7E90A9F4C758920356713B1D0922685480355A78F46834FA1A000AE1F7387B8A2BA2691A7135B0B5DC4015AA2512B5DC14FD2F6AF6D08C319183AEE213827B53D89D1AD108F8DBB3D1FA5481D7E82A7F1DEF213F71A7DB7CFD9C1B386948B06DFDF2DAC1EE71D16C60FF1EEE4B68BFB30739F1F1FD9CAB3ECCDDCE5F8B0B123DD5072BDDB277FD0FE948EB1FD36151FF68770DFB4D0018DB2CF5236B84750734E7F087733F48559DA1AEF58CB3E9C91DC89D1CF618AD3C383FD42EAFCABAD1688EF29CA4E22D87931A77393B792549AE8D602A309BBCA7276E996AA27FBF676D6A474DE54DE3C877B9DEF8A4F65D278315FD094FB767CFEE340B6A9396C7FFAC776E789F8AA80FC5566691663C33F7BB759EFC3F757E977B64EFF00A0F6634FBFE99FA33DB7DBB86FCF0D68649A21121E6E768A4E7F50DD11E703D31C758247855C92BD20E35E06AD344DEDDE7E8E108756EE28EF2884D6A684D477BD393CFBA62B89712C549A4E3E82AD9D22BA7DFC1AA6B7D96FB715FEBE63ECD9F3F796D41E67A6C7FF00AD776677FB54FF00B503BECE63C363BDDBAC77E1BBA0E977B65EFDC77D3FED8FA64ED77F619D9F91BF33AFC0E6031F0CACD64B1A357E7EA0A3519D144EE75955E9128B71411451FA46ED56AB55AAD56A8B9712E24D7AE35C68B93DDCA5727B93DC8B939CA9F36C6348FE8BFE1B5E5897E2D2C77F4AE78B677AFF00C6D2147B764C7EDA4ECCB7F6AB7F66B78331E19FC89EA6EFC37587B6E76CC3DDCD69F4551A591F4CBC9AEE7663EC1D77E4230FA764B7E4591FB7625712BF3F5B146AB379C415551A888DE139147F8389712D5712E309CEE5AAD534AE25C635748149204F3AA91DCDEE4F780B896CA42FB17072FA0ABFE1B27EEC2B5E5696379D1B5CE2D9F1A277266D11F70EDD98E555DDB97FECD6FECD6FEBE63C563C853D4BDF86EB1F8ECF4737DDC2116EF7AAFE643E8B1D3FF641D8379578B7D1DA5BF0C36AED875898FF000B5561AA8468AA8D5D0C7A20C29BA841C50720E5AEF3B8FD0E2B544AE25C6B8D716A82D1745238A74A4275A29F6495EB9465D43E44E7B75C452B1929307421C7C0DE9F4643C36BCB123D1AC32CF49BC105CE50E087B66ECDA1EFFC6CDFF4E73C2CCA9D67A435B15CFDBCD49EC9CEAF727F493BF0DD187ED5947AFD0F55FCBF4D8EDFFD50F63771ED71E5B4F21967CED7F49E9DFC2DEB59FA3A3773C713EB46C0B8570AD37B7A69B9DB9DF43B71289DECEA104E52291393D397114E2562AAFC55EA1521AB0B741F4957BC370FDD839A7F2589F75D1D32AEE18B05A3A193B76847BCF66CE69F2EBBE2C8F9F1238AC43D99B1ED93AB93BA49E4C3F6B7C76DC9CEE7C4B88EF72AFE5FA67ECFFD30763771E968E8DCBE4EB5357CFAB3C83447F8426154DFF731DCE78C2D168B4442D104114EFA0A29DB9DBC0DC16A894F4F4F4E4E4EEBA2D8685BEB69C823F41577C377CB5BA48B0A3F7A02DA4E54B657FA5276ED077342C2B9ADA36DE0B721E6C279E11F6B37DAFEE7757F493C988E8DF1DC289FA4A8BCBF4CFDBFFA20EC1D56AA6671ACFD13E95D8781AE47F89AA1075A7C6A9CCF63A2B4C2810E6E85C3874046F29DB8AD5128944A28FD1AA251722E4F7A7393DC9CE44A93996B0976C964ABD7B3AEAEFAACF8AF796BA956CEB7FCAF073CDC7EA8A90FA314E746661DAD98C73C66BC364E8CBDE4D9FF00ECC7D335DB32727F493C98B6E919ECB6BF3F47E62F37D363B0FF00621EC1D57E02920648CCF53F49BF86460B64669BF4FA42823E314EB374AB080BD25E902B8E68556CBC7C61ED783BB5453B73CAD512895C4B5FA3545C8B91722E4F727393DCB893939E15479A95EA5BFF002546512D41CD6AB51A7AB1AE36AF518AFD96322B3271491B86AF705B3CFD327EA0D7276182DB5ED2B26E0D8AFBC3A789633B7207ED59E726CF7F623E99BE92A72915587D49ABC7C2CFF9B6BF2BFEB71EB179BE9B1D87FB11767E778E6B6E2A39952CB3969C22576BBA3D3D49B838CAD168B44DE94E4118A1C2F10043A68B45240D9118248557BE350EE24ED4228A714771289DFAAD56A8A7A251722E4F727144EED743039B13EECEE9DFC5EDD87CD814DD7ABC7164F3A1CDB193917CCE4D5998B3AE36E3DC25B05E9EED534F371552474761B39E1CA487D5C7DA263CA4FAC12F37C4B1C3ED5FF14BDF8421B2C2E063CD1F6CA79B949C963AC32392B481E8AB68EEEA7712A1F36ED37D8ECFFD31761EA8F44ED78A68A39E2C96344191BCC7C527E745A688AD1342E1D50628E35E972AAE746EA37A3726383B701C910A78D92358C96111DBD571B483CC3822B544A3F515274727B917273914E09E745170C62DD874CFD79281EE6965993D174CE2E9245C6B89608FEDDE51210D57351EA5C1C4B6F97118C77D8B8ED6394FBAB7334F94790F1483DD8FF2577691665FAA7F57298FB23F2E34F33D2DA3B99DDB8B755048C758FA6C767FE98BB0F55AF2CB6768D1036DEBF141B618B913EDE12FC999C663A73F278D1C4A76334471CE5F00E0BE0C85F0EE42BB9475DC108B93210A5AE1C28D992B1AD307B4A28A2BF0F6B5C8C7240A1B7EA1E24F451FA06F7A95DC9EE4F289DC539DA37118C9266E79DADCDDA268E61C784EA9CB5DDB3EE3C16ADD7AE6D66814EC9CEBE636133233B0D7CF5A6A664A39C62DDC55ED764BDD4FAD41F6F203ECC83DD447DC8FB32FD64EA54BD1BE5C6F53D2DEF6AE35C415BB4D8998EB87E3E19F541EB8D072E2565DCA7EEC5CEE731E794D76BD687693692CCD249239CEE23B9AE734D3C95985F8DC8D3B2D3105F0EC4EAED460627568D1ACC5F0ED5C0B8100B857A40AAC380EBAEE727229C4EE9D9CA17B822FD56BBB45A20169BE4D54BD243BCA71D06CD5217F2161B0C7532F4F597E0C27D58C37D26AE001108A76F8AE3A086691D21D7E90E21637213D6315D86D41277D53A3EAF6644FB6554BCACECCAF57F7AB2A3EFC6A3DB6D7E542B8D71AC9EAE5419AD881BA20B45D16A54E54E9B720A4CC9ED3CEF6DA9AC4CE7021AF773DE135DC27159E9EB2C55DAB7C398170231A3123115E9A2C41A9AD5C2B45172DEE4FEAEDC506AD770DDA2016888E4E2A69394D22277BD5788D9B58EA71E3285BB5A36EDAD4DAB25A9D69E471941E75322E2D486928C67472D51FADA48514A5A6A5D2E34F473A13ECC93D17F2A5CE567665149DEAD28BBB1A8F6DBEBF950F5DD7FC38B1FB96AD796A11213AD570A59A3D261EA0B1418F7CD8FAA558C7BC2B54AD069D01FA75504F2C4FD9FCF46F4381CCE109CDE65A8B5162E15A2D378DCF5227EFD168B443785AA7BFDB23B4523D3D0411531E5B39308F3B9099AD7E4E67EB7CCE643AA2B896BBAB0D64C55189F1ED2495E21FC23735612F08E581EC962C9B740DEFC78FB8D594EB277153F4677E311E973AEE87A92375CD0C18DF6D86EBA2BF699585EB734CFF008A0D5F13314FB2F08D9702D9A590CE723A652CCAD582A11649D92A53D2B3A2D3E8D534E8B66F3B2559E292299B2338138688B53872E145AB4DE1C9A754E0A41CDE370EA87D52271561EB5DE3A38A79E7547DC8E6F5E0C9B2ED677C5C89E58E2638F4D11DD474F5A9CADAB8EBD319ACFF001C6388CD8AB70418CCBCF514F61B6AB35A78F1AC3C5F9C91E72773829CF260F7E3911EDB9D7744BE76D08668397C7F1331D65A6792FB6364D913C0667CA5CCB89AC93535A472F432CD2EF9BC4D7DDAC99F2E94E66D58B3234CB058391A198C553AD0DB8A68A48A5FAB65B34FA32C2E64ACFF00A21108B5109C13915AA63B440A7F570446E1F53949D252A63CF4402E147A4888500E75DC389BE94F1E57072B1D62395879E8777A6ED20F3671EF8F0EEEBFC7B198B36EDBE38CC7B53857C32D19DF09AD2B2C1A1A004E8725C3ABDBEE0DD51A7C6BE5FC2AA47A39DD96FAFE145D0B8A6BCEB8EAF62651B4508DCF7CF2B593F0BCD6520C215C1B3EBD2C0950D0A6E4DA998066B5988DD95B542CC5B314DF6F23B675F1F161E8D59ADD87C7631F673124176070FA815B2B9C96A596C8C90144229C1393D38A2B8B9B1CB89382E145AB4DFA6F7F491C54A4F13DBA9E1402D13C2902E1E4DE498ED0C12155667ACED39250F1A3895AA648E6A8276FAD9FB715969EBFC51C65CED9AA6CA7870A48D8F66D4E124AF2E3E6F4E4AEF3C124D27A72BDCF5F9AE39C0D0A71AB62E4E7F65CEFDD174A956595989AB8F8AA58B4589BEBBCCD5EF905DB3D1975CD9F639D96C2AF9AE0D1BFB3B2A6D5D9FB0BE416B88FCFB1E2FDB7DC9F6369FC263F6F6FB66B5FA774BD2ABB6B7BE33247156BE5CEFAC2D8ECC984A3B9C9E9E9E8A2530A61F769CB8510B4447D2FE92273539AB8570A2116A91A8A281E71955DCA27059BC7FAC9C343B87F27E362718EB990D037737DC8B1AF6ED460CC6EC47A80176A8AFCC5D6B3F9BDDC99DEFECB9E4DD174B22A0AB3BA4731B20F524A3979638F1B8A62D764E02723B34D4ECC6CFB13727B3522745B2561A30584B0AD607235D5EB194819B3D55D6B2799B51E3B178F85F93CD66AC371783C5406EE4F33257C7ECFECE634E52FE52035EF2D397D0C716BF6532A2FD771DCE4E4F52278DCDEAC4C28AD1109C3E97229C110B4DC515223BBF31F48534A07967E9FA721FE689A5CFD97A4DA98CE15CF4FCB00D08E28F3D8F15DFC5CF733BA1ED7155BBE7E96BBCF50A14E3EABA7F97D37476F31619F20BF609C3612A26CFB2F0AF8FD962837652C0763B66E64765F1F2897666E4689CF6364CB64ECDF3FA755432A7EA4D90EB1FA794F467EA25EF56D6C0D0E05B7574CF90D88A62B52CCFF0090DA3CEE266C623F550B2FAB670F7997E9FF00C94E4F4F09E13821D5A531377109C1688A3BDDB9C8A28A2A4457E7F2D1CA14D414AD6CB05F8BD2B3FC9A15B1347E2F27CB82E58653AAEC9DA7D8C5E56CB7201C3427453B5AF6E6F1EE89DCD33AB3AB3A155473B1DB67BCF55128E2B56A374D86A064BB9DBC63C267AC266CA061F90E057C830451D93A13097642C354FB3D9A80366CCD5757DACB5E8B47C4DAA31C54B19939E4C965B1B1458CC25B73EF65CF0E2F038D89D91CC6D25B6E370BB0AC8A4CBEDB5E75BBD235CD1F4B792D96C9BA95C8CB5CCD3445108852045A8B5009A744D72D771DC51456BAA28A28A29DB9E885A2D39C63931A9A822B6823E1B3FC9182E7EC863452A239ADAEB9C52C9A3A23AAC059F5E9270D43C31CCCDE37D32C29AE4C720AAF5B3D2D779EA147DBF2AC8DC636E60F14E76D1E5667BE6DA59D3F119E997FF33945FF00CC6593B0F9EAA9D67394CC1B53968153DB085CB69ECE1A7A3B038FF8CBDB7D916C18FF00D3EA1F137FF506FF00A35FF4FA80B167F50F23AC9B0D8DE1ABB617FE2B2189AEFA1B33B3350E472BFA8F15380E88FD20F3D8CC9FAD0EA9DB884F6A2C45A88450298EE7AEF28A7A6F528A72714E28EE705A6E6B753135346E053BB769BAFF0018EBB2343E27223A64AC7C2D37CBEABFFE9DDDB3167E1AE03AA1B9EC6C8DCD638C2014D2A27855558E6CB3DE7A851747E2F2F75416F66B1EC3B555626C9B6175C9FB4D9729DB4199696ED3661A60DB1C83055DB0AD223776732267D98A169B92AFF0D77626BB2AE236E6DB6DE6B646BB69E1769EC3AF66B67AA8A388BB27C6E7AE4A317B3B8F89D7B25B42F8E9ECB6C455F82C6E6A4764B68F6B70828D63F551B0EAF6715722B74B43AE8B44E09C139A8845BBC3903B8A29DB8A29C9C8A3B8A2169CD8D4C09BBCF6ED375FE36824EC752F84C6ABD18B14656FA7204E4096BB0D605AA5BBF0E0266E6F19C075E11EAF3C75DE07BE50E8ECF79EA1571ED18FC965A31B3F808D7C06CBC25B7F66AB939EC1B5B0ED2635ED396D9D9D0A9B2B694FB278F9859D8EB8C5237278E38E8E4B97EE3998DC2518DF90CD6D15818EC26CB5692F6736BAE331F87D90AA6D65F6FAF0D3F4FE81759FD42BFC7664BDF0FB27B0B4FE232FFA937099ADE2EDD7ABCB5FA02D96C83EADA0EE48F44E0884422170A216886EFC14E47714510885A2D168B45C29A13421BCF6ED375FAA489F1B5BD7701AAD95C73AFDF63408DBDC16D6D3F42F6EE8B656DFA736E1B9ED6BDBB458E3C05C5712C65CF668D28C4C0846D4C00296867EF3EBECBE5E4745B1B65AA3D95A319F94ECFD6526CE632CB5DB1F683A5D97CC313E9E56ABABE772B4DD9CCEC793C7FE9C530F9FF52AE114FF004EA9711FD47BA66B9FA7353D0A9B7378DAC96C641F0985C8B9D733300662B073B9F7721B6103A9D4D868C43863C37F6C768840CC44FA3A53D7784090B63F20CB559DD77689C110885A22170A2169B8A28EF2885A2D168B45C2B44D0821BE4EDDA43F73E92B1021C9ECFC8D2C79DC3AEC263DD5AA70AD34416D055F8BC73FEDB905048629F1B2FC453D37688722434ADA4C3B7D2F735CD9784636E96CAE90141E9875076C729C6EDA6CBBC3B2399B0E871B9AB2A4D97CA16D88AF5092B667251A8F69F2F0BA0DB1D47C7ECEE49B9982286EEC2D535F03B6361D6F3BB3B13696CF5C73AF66ACF063765EAB5D7B259ED31DB39B1B57E2B33FA8B6836BEC2D375ACB6DC49F1596C8CCCC76CD63EE4952E6773D6F290548AB43B2B2C52319F8DE163AD49566C2596DEA6793D39108845AB8516AD0A2D2B984515A22170A3C91D11DFA6A83570AD1725C93745C97245EDE1CE3B8E7D168B45A15A1402C7C376BD6B0E9269781CB81CB0549F6F22C67A3038FA71C5B498E749F34AA5A3210B96D1B228AE6A17100B8D6C7DA2671CCEE28A7FB96D862751EE0E1C5AD6B723545638944F6E9F29A119A38FA8DA7249F0F6B2D98BAD9B637236EE3FF0052794DB095A09F1FB710C5167AED68E3A1D58EFEE633960EBFBF6876CBED6CDEC4C2C9339FA8A4B30DB050B1F98FD4B2453FD3768F4B6BE473F2DB11131988B5EFDADDBDF6E3B1B5A3B09D5A36BD91074394AD1FFF003A71D0AF95574DC4D627E4D553709534F91D4D71D4194AC3D848F4D7A01CBE158BE0A228D1857C0C2BE0215F010AF97572862EAAF94D35F28A4BE51497CA292389A4861E815F26A0BE4F8F5F27C7AF93E3D7CA282F94505F28A0BE51435F94D05F28C7A188C7AF9463D7CA31EBE55478BE478D2BE478C5F23C62F91E350C2E374F92E313B098CE28E8D5F80871945371945ADF975254EA5689CA78193546E231DE97CA68448D0AAE70C75372F95D04315417CA71E851AB03F41C3B8AD39D81A0AE01755A151D01A5542F83ACBE12B2754AFAFF00FFC400281100020201040202020203010000000000000102110304102131122013412232051415304251FFDA0008010301013F018889131F66322223B65E89F63F4421891441114242D98D5F066C438D1A4953212FC4D5BDB1F664FD4CE3EC4219456F3EC88BA27D6C88D12243ECC645118F274791967C13F5444A450C81116F62ECC9C996262E190CB5035396C8C887665FD0CD27BDEF7B513EC88BA2451E5C90912243EC81031A325244F28F25963F4458B78111165EF466895C91FD4CB8ED90C047151A87C19B6B23DECF65B4FB222E896F12C68FB206311A8997EA91456D027D11898E2450F7B2CB26C6C8C951C0866A3A338FB222F44227D903E896DE2C498931C781F0C84918D92E119E56CAF54288D51F6466872B31C6C863687C0DA2CF23C8F22C912747C8EC5A84432A96DA8E8D40FB2221626D1E2D6F64E48817C133C91E03E047D193B1331326FF001322E47BBDA24498F6C7D98A3B4868A1ADD6D9113B43C8D1A6C9647946A1706A7B1F6221D905F893EC62D9902CC9B7C544B110C64A14645C8A26344BA320DFAC5919127B51871118D6FE2780E0780E0C512A8942CCB8E8C97668FB30F46A7A352DD8FB22625C905F899BB28ADA4436C8CB38A27441A32BE0C9D9046344CC9EC8437B44C124594245147C67C42C23C34389E264C3C19F0181F81FDBE0C99FC919F92B922B931A21FA19BBDD92EC5D164F6FECAA326A7923A844B3DA1CD10998A4893466F5A662C364B0344A3C9424CC4436B13DA22A1124381E0C941D19B1704D7237C16C9F47D9F66242E8C9DED1EC9AE097644648A1C992B158A4C790C73314C4CCB1B1AF4C71B30A2515465C4C58D8A0422C8ECC4211C929523E53CECF2252E0C96D19D531BDB27437C94632D5137B47B32744BB20325EAC68870427447259768C8B7A304058E848963B1E23E31408C49216C85B4FA288F058D9266AFBDF23E06F920C831C8948B20CC8C9320C6C7B597BB2B6C7220F826496D03498D33E3E06A988956CA2225BA132C96CF6721F46AB97BE5E87D916458D9658B826EC7D91E86CB2FF00D18FB3192819234311A5CF4427689915C125C95BCFD6C6F6A287027D1A816D99F037C9010F7B24CFB1743F765884E8C2C6671ED8DB4696E4894391224B6FB1124380D0970515E9636CC9FA996F7D4745F2636451242EC684F9243ECFF91ED7EAF645F269D937C1395B1ED134794BF2123208FB1087143894514497A344D70678EFAA7C09F26323D121764BA1764CFB3FE46597EADED123D989D19663DD1A57C981936647BAD96CD14514780E1C8A347899E9233C87B6A47D98D916498864499F64FF00525EF2B1088F645F037EBA674CC12E09CD0DDEF5BD1E2789E2289E27812544B21A9CE4DD8FADB5487CB3126224447D116485D993F525EC891111122490FD315D9A6BA26B7B2C5B2F6B323334FC4CD3B7B4B6D5742ECC103C0C9C1197249F02D97664FD4651E3EB2E8831088BDA48F13C450669F172618A48912DD21228ADD0A23449996546A732672C863B1E132C5411A8CFF4292B30E543CC8C93B13A2ECBDA24FA1F7ECC974458989916465628791F091C2434F643178917C0D8F648A10BD1163664952B355AEBE09C998DA152479F26A9DA3FAB29B3FC7B168E489425165EDE542659032747DEFF00D947CE2CACF94C9958B2B4CC790872B6890998E6BEC8CA34297FE0A4791636216E8B1B2D96791291AFD4387039394ACB133CD9F2A25F90A35BCB1A92A32E9ABA249C4F242622064E87BF93B2239D1F29E4D8A2D98E0C875BA62C8CC79484C5214CB18991E85B597BD964D9AEC6E6D12C7E3BC9F060F273762F57C99F05F464C7E3B220647C0F7FEA2258FC458DC88E908E9D23E14471A5ED164320A6791062DA3214CBDECB2CB2464464C564B150D0D108D7B4A543C86A31F92B26EB82332390790BBDE592D9E3628A17A59E429FA26464459022C47D8A4799165965EDD12650E24F0D9961E2FF00D19589486CD47ECC4F814C52B22F78C051D97ABE842F48B20C8322C8BDD08B17A3450D146A31FDFBCBA34F8FE49D1FE2BF0B35B81E3334381ADA022CB12DA84B6ADA8AD9316F6639BB21214852132F6BD96D5BD0F6D47435EACCB3E0FE231C24F91634A147F31A58F691923F44B12278C58A42E3B2EFD2BFD0C4FD22E88488C85214B8148B16CBD64C6CB350F81FAE47449D9FC66A1C321A7CBF2411FC8E15389ADC7E32646299F1AB3E2E09E9AC96271653F4A288FA5124410BD206396C9F0291E4299E62C87C87CC7CC7CC3C96798E6667F8FB67463C6A5D9830C63234BA9F08513D5B35EFCE4C70A2313146CF046A208F03FFC40026110002020202030002030101010000000000010211031012210420313241051322301451FFDA0008010201013F019931187F231FE0799F4FDE910308BD642F590FD1106332FC3210D5D1E3F6CC5F08FC18C8ED8B6C87CD499262307E463FC0F37F222AD95D918B31C198A15A5ECF6C93D51456A2C4C9FC278FB218078C944F193E4635D087BB2F55A65F62D7F55A32E3AD61FC8C6FFC1E42B2BB22AD98F111C68512BDDED8FD9089127D919AA1CC72B3C78231FC10F75A42D485F45AFD138D9915185FFA31FE2654576420638FFC9ED8CA16AB6909197A32E59221E57FF4FF00D3D9E1F91661767E8A2BD56A5F0FD91F9AE48746646275330F7132C1A1FD3111F9EF65EA8AD362D594701C4E2448AB2586D13F06CF2BC3940BA3F8E9FF00A3C75D6DB2FD16A5F0AEC8144ACB649366383E460E9193B278E8C3F44FD98C5B931BD22CBEC8BDB47ECC62A1411FC8618B899E3523F8DFCCF1BF1432868BEC5B5A9144349EA88C7B31C7A1A32CCC6DF221DE914514318B56498E5AB2C7F4833AD49EB19117C3CCAE07929B9B3F8D8BE678DF11459225F487CD58BE8D0F515A422882ECC6BA266531AEC82EB4BD18C5A6487F7D28B3FB0FEC14EC89CA88E416432A72547FE2B7660F1541984BE86CB25F4C7F371FA31EA3F35FD74289C48C7B21F09A6644408FB3658B4C631148A43DD084E8731488C98B786C5F06498DF641F458D916EF5216EBB124711448AE8944C90174C87B37A4C5243631917B7AA2848687112643E91DE13F4486CAEC5B8FDD311FAD71EC5138890864A364E1D90F8216AC6CB2CB132C7225322CBD3DAD3DAFA477805F0922488A28A288AEF7C45AA16D17AC90B2A842D4865EAB56398D90117E8BD63F4451461112242422B4BEE97FCE4484C42289228ADB63D405EAB4B71FA477810974486216A84B4B491C7D90C97C26448ADB26E8E65927E91645965965EACB2F51FA477805F098DF62DD8BEED0BDD0C97C268811DB332391C8BDB13148E4722CB23F7D11123BF1915D131FD10915A5F7697BA1A1A1FC2641097A6432EA1E8C459659C8E473164390A645D8969180FD190910DCBE18C647E887ED128632485EB356668B288A2B6F5672391C8E4722D9020BB21142431180FD1326407D0868874320C4CB5ED018C63D2F4667D475450F4FD18BB1220882208BD2301FA27265B6CC6871B3E697D2663FF841121E9AD597AB24E8CCC484B6D8C6CBF4FA46245591890809939D1FDA617C8C589A383258C58BB230A19450BE9320FB16AC7E901A1A28712512CB1C8731E425D890D69B1B1BF5A28488231631446871EC50E8F19533FBA290FCA42F211CD322514514488FD223D3C7D8A08E0381088E367F5925437DE9A44914C68713895B97D1EA8ADA288A3041323149699C6CE047A25265B2C8CDA663C8466B5FAD488FD10F4E28E27038E931CD224EC6B748714380E0389435A97D1EFAD50A2510478D436BF5A6409A543F4B31C9909906345122298B7CFB14C73391D129225DE98FD5A2486318D0D143471122B70212A2190E458BA272BF6809D18E641B90E2D1457A71D58CB63F4A3895BA271E892D328712868A389C4A2889F452A23904CE4597E9C488C84A8F0D2665C48975AA1EACB2CBF6A2487E92F84D0C7BA1A2BD56B91199197A2D21174295899E3F91C4865E64B15938D6A8AF6A2B764BD58D1288E050CB7B7E96CEC48A31FB2D647D0B3BB3137223D18B3B8B30E7523241325077B5AA1E97AB450D7A34343450E250D6A8A284509090CC7EC848C98FA250FF00460951629B30E66998F3A922728D1C932C5F356722CE4722CE4597A7EB228A389C470389C4E270389C4E271389054FDA2CBE89BFF2497FA31A13E8B3998F33893F26462CADB165E8FFC400411000010302020705050605040105000000010002110321123104102022304151133261718123334042910514345052A124627282B143537392356383C1D1E1FFDA0008010100063F02F842E985534927DA3EE02C4EBE2CD768CA60AED8B7BE72D8944EB8CD079B3039557010EAA50632EE720DD21F89E7E40857AAD0DA54ACD588BB33771E89FA5D6F76C1B8D3F32ED9F7E8C431E5C9A16F58744E911ED45902DB042A9FD5F54F9117C4131EA505647599E8A576ADCC2C02C516BB30A1A25766E59CB7E106A3B67584DD451E3BDBB2E74E4A69E529949EBC392CAEA0B6C9AF9CF8008CF2429B06F4CB9431B3084371E9447D139CEBB9CB47D180C32EDF4DD0E9772966EEAB034C319C93593729D7C936554317ED0387D136A722BFBEC8BCFCA137C36CEAC279A0E1CCA2E9D529B84E4B173F813B3E9C1086A28F1C071F7820285010B4CEA7381E79263A77217680CD94EABA0CE436E578CACF35D9E8918DF995DEC4EE69B55F77F20AA1A9DEF9474584F5471E4DCD1A9C81584F3050C22E17666DECD0A00AA748722BB3FF0070A2DE9C10B2B845AB2414648B49D53AB3D638211D9F4E084351478D75DB53F794779A9B261F1758695BC506E94CDF9CC2DE3BCE120A6872C07922C9D42786210233722E1DE5889BA0E5DAB84B6253AA737951D50272542B47B37744EADF2E4162EAA4FCA551FEA4FE14AC7CB588549EBCD4423B436C23B3E9B036479A6EB3AF3E0D93E736F24315E51C77B593B09C2D264238775C39AECB49F694CB6CAEFF00673BAA1453742C64DD5D6E957E1045B3A820F3CCA87779FF00E14D3102235781586AEF51A79CAAED73B745D8A85EE665381C9323F52F3E110B096F92C2543AEA4214DB63C960277D8A751D6D592B0DB08A93C5010D451E2F6E3B86C8739BAF244C4764A03715347B41ECC20D077465F016D78BF4A6B08B669CEF9596D78426D0A62C7BD09AD79930A9E1394AC5D50E2C8CC283C915E3C932B51F7A33F140F3D46CB25970823C01B410D451E212F742C352AB4CA228D66BA9FE928E1185D1CD30125AC767E29C58662C4F45ED39943065F063164734FD258EDF6582792ECD110AC8C66B154BB8E49C5E7BD7083506F4DAB6AEFAEF6C44EAC6C0A0858D533FAB5471423C01B0758D451D51C1F14049B2C4EA78E3A95EEC37C8A73F43ACE03A141B5AD0BB1C36A82F1CD611C95CFC0CEB646645D00D19A754061CC171CD597B4528940F82BEC18E4B9615ECD854103EAB79C07F72F78CFF00B2DF2DF43AB115672CD4382921669A27C941E28436A11D436A0200EA28F12CA48DD766B0D07C2EC9E242DC86551FCAA09C3879B4AC4DF821AC31D92C53964BB7AAC8C56B2DD86A9E5D55D478A1E5AE4A860928978ECC2C6E25CC68B946A638638FB35858E53881F3506934FECBDAB3B3F547B2AA415D8D43758C150295D62D2348C3FCA1370D196F32E28C31A3FB50341C00F252CC151BD0C214F4869A2FFD96269C4D59F086DFA7046D64AFC1B2DFBAC740E13D137B404CF445AEC00B726A3622A7ECB0BC2B0D5E0A113D38A06B05617530E0852A06FCC1585F4E4F8AB823FC2ED297D136DCD34952A39AB981D113865CD4D97403C93A8538ECE88103AF9ADECBFC23829E2526DAC54639C08E4130968C5CD39AD6EF03BABB1AAD323985A49AC038D36C89589ED05C501C908B1164D7C679A8A8C07C535D40E2A47BC1CBB51FDCBC3970421B05053E08EA1B43CF59E279A752F0D4446F7CA868959B152732B1C169EA39AEC9C1C1FD5CB79D3A82A879CA94475E2044786B6958BA2383749E6BB2AED9FE65D021FE176CD6C60CD0D619A3345F9B97B520BC8BC214DFF2A7D771F789DBD6465CEF4520FD4EA85050686F3437B79D927BDF89E6A11985A4FF00EA5342FE0B751A6F743F1279E8E9D4E1CFA2A71DD7B77BCD61E20451417A23C01E7ACF030ECE36C07858748A263F5353BDAD8E40B577C078E6B030970197352F611FDAB1559951A88E30289D6E61CC15741C176D8775E25019DD02D64614FC56972B28D404CDD7DE309B5A176A1B12A9B1C096C725BAD3128620A06C31BCE55362C09D6587A1404D944C9555959D20B7A2C4D3BA548370A9516E78C59609BF10228A0823C0F543673D91B504023A15EE29E377740175F78D26694E4D4032B608E456ED76CF447B5596A8F819E9AB25BAD309B49F543615DB89DD56E812BBCAC80DDA60735BFA50A8E1C81419A351C27AA7F6E646614C2A4E75E442DE02232531089D8262C0273F0C86BAC54ABA73A2CA5B9F447D9913922D2D6B2C9AC7779AAAB7A307F950CCF10828D5AC715527567C108228A0823B0763D50F803527BABEF15BDD52B8519FE9844F632141A5BEBB1A8EF171E89CEE9DDF1D4E5E9F007CB56F2DCBA9A749AC3E6A6B57C2B0D4D2A7C162D1F46048B4B8A9655C13FA44C2CDF5279A976ECA92D51851B2768AF37F9578B5453202FE21F88AB6B70A066A3976953BEF37D89E8B126B7198C053BFACA71FD470215FADD4F5450DA1AC79A1A8A08228EB3B1EA86CE5B71AFB4E9C93A7E64DA7F23B329C2A3E1BF295841B2DD31E2BB371924EFBBAA00086B724D0334426F970BBDAACAFADDE4A564A29957AB7EA8F68E73CB7C5073A9010ACADFBA823E8ADFBABEA875D76D4ECE40461EBE2B7AEBB8B28D565DA4DD59AB2D72B7CC21558F6B9B9669DED5906F9A1A3E8C0D418AEF8C934609DD4374D9774A1BA565B47506A1A8A0823AB359A3B1EA871C5E1385667B3764F581A71B4FCCB153DE0392368011C0FBA739FCD00A78A14426B7F4EB7F928F15879A92BFA94857E24F02CBDA3254532E00A6D47973E336CAC34290A621725C977577565B13A9C35350451D4DD44AC7A8EC7AA1C29DAEC9C2415345C59D113A43241465869D33F37544526C5AEE51D38D3B557FA50205E6E84E7CD1A80C954FC2DC68475085BCF845B32B9A96299D5741A4EE3B92247A700A08A7EA086A29AD084845395374662EB2463646CDB670ED0C28D8782C7A4D52E8E49B429D3015493E3C783B5072213853E4501513204B715D3A320E9F80859ADD71859ADFDE2A18DD62134B7CD527CE620F00A08A7EA1E68228A0101A9CA8F96A3C2CF641DBC9617597674A5F54F24F351F7232DB71E8381217571D8067345E04D95BF5A15661D4DD29BA453EE9CD4D3C961179E33895DA522B0BA9CC2BB6381559FCD3C16EA79413078AF4451D82A9FF4A28EC7AED132AE75E20ACD592BEB8D61BD4A24688E7D53F342ABA7D59CBBAA54EC9F11C084FF00D73647AF35BC810A1A37917B877AD65BAD88174E6C4F34289043D8660A9682D71EA375454184FF009F81C86BE4AC5AB36FD56F6AAACEB4E470423E4ABF9A0A93079EB2A76298FE5451E1185DC957642DE16560B086ACB63D7578F24D7D5F96E9ACA6D01A05D1A2C8EC9CD82BD9E4A4A8E15B5622B0CE6516EA6F884CFE6B14E3FCF0135950EE5618530B0EFB2C7C919B5E53F47AB7A33BA798501F8DB162797C0C9392DDD59ACD66AFA8FF00C5C18D557C4EA6F80D6763D53114763D76A665580576DD586A9D82546B38AF29AF6D995042A74F477C511DE72A7518D22F79580F782C54CDF8ADF3408F541E0D8841BD29928B8F36D931E6F37288AAD98BB7C10D2C64F01A7D135EDEF4263E310E729B51AEDC3F011F32B9CD673E4A0CAC2466B257D52BFF006F86FD5E9ACA9D442F54CF2451D8F5F8411783926D30D803BCD518B0E1E4A5482AFB51B3856F2C07BA8D3F95636B6DD910A9BFAD82C073C50136D914434581C900DFD392DE1B8EC906CD82678B01E317128BCF766CA9CC35A4E65436A76CE3FA51C14CE13915DA561DD560ADACFF00C5C37EC9D657AA679228FC23B6642762C99B8A5DE61123A23AB0F558760D37183C95F258466A21582C61B92C5CD35BA48C24085D90F9AC168D4A2E2A395F2150A2CE4EC95668CA4426C8BB39AC2B11E362E68B6FE8B0F62534BC6ECDC4A7FB208B03624A7D2C2378AECC754CEC584EEAC4FA56F35E28FF00C238010453CEA3B0ED4E4DF34D451F842368531CF78A635DBA70A73BC3583E089D80E6F24D063180B142EEC1589C0156A6042ED9A502F6A6165F0A18726DD3E47F3043AB5611E1EABA298B22D438ADA6D3728170C4E560B9AE6878295DE2AD5161ED4944B427F51446DD8A08229E7C753B61D1A9C9B3D534738451F832BD368C7E841C792ECD47444ED8783695DB3085BDAF0B960E8A1A832A64F551A32165E283116F34EA5D1340F5E3007929E090AABA3FD3C3B4EF2450417A223C7556D8A9A8A6F8143C9144ED1478876D950181518AFA9C562E043C92CE8B130CEAB85BB65758A6C85460DE6F357EF1CF56353D562953C52654C28E04A9F1554817C5B45143CD05E48EAAFE7AA35547F8EA3AA639228F10A9DBF4DA6434EE0CD6139F245C8F8A03810841B2F1D83E49A06442B6A9DAC44A9EBC1808227830A47CC768A2821A878EAD23FAB60BBA9D4750451E214E1B5E88CF4DA258D82023D516F352A26DC1CD5CAB11AAC560890533CB8387920383970F3B2345C7C5BB451D67C953F25E8AB9EAED657AEA299E250F2451E2393C1EBB4503B5547F2A6C7CCAF92B70F35DE57D50428F8FA1527E7BA8DA3ADDE4A9F92F455BFAB595EBA8AA7E6879228F15DB450F34366AC182D6AA38477664AC1D147E5DEAB08FF7210F2DA3ACAA68F92A9FD5B2514DF34D451E2B8ED8F3DAAAC7F36ABB7DA36B40F2944F87E539EDB606EB0E32B0F4DA3B0CF047C954FEAD4754A3E48A6F9A6A28F15DB7EBB45A4C37292B068E5AE6858CFE5396CDFBBD506520707EB5829993F36D9D78506A3E49DE7A8F9EB3E48A6A01153C576D143CF685365773FF00929A98B9E3421F9053A0FC9C64C744D6516E16AB0DB3ACCEAF4448EBA8F9EA6BB9A28AF253C776D143CF69C6868C3B4CB1A7BDCE25D33C50821F903AB3F31BAD51C865C03ACEAC4BCCEA3E682684E08FC0BB68A1E686CBDDC8845C3253C5112AF2AE56EA851F156429B6EE726E815A313466A7E9B651D6FD4D62C2046A3B0514351D8050E03B68AF54367B275F9AAEDE86CA15F3E165AB256594296EF01C960AACECD4B5D23E28DAEBEF8EEF7CA153AEEEF1A97298E6DC61CF5CC85DF0BBC17782EF2275BC9C8EA68C5AEC764A1A8EBC94705DB450F34367C42FBE52BC7782ED698DC7DB6062CB9ADC1B57533B376AC549FE8B0566C1562B2F86EAB1D76D8F253F2B720BC42EC2BBB2C9768FA9887408B69D823ED4A9151C80C66162C44ABEC4ACD07ABF2D4760A2503B128C8CD5B82EDA2879A1B320CA753A825AEE49FA1D4F75DE618458EC865AE76E559CB0BF74AB6C4ADE17EAB75D2145410AC655BE0EEBB4A9BBD16F6432D70D30A3195776C595F54EB9E88F04051AC8D4364EB94F68DA2879A1AF3850F7E27782BE88F1EAB7F1B7D50AAFD20628BA2EA15896F25EF166B3DBB85928020AECDE27C50DABAC545D23A2C0441F8232BEF3507B30A1A218387ED0CA8A4C5DF85EF0AB395E08471D8AE5AC6B3A86D0E03939D39ACF64A90616171F52B31E88BB49A801E89D4B4379633A845D51C5CEEBAE438A1BD8DBFA4A1DA6E3FA2CA42EE85DD5DD5DC0BBAB2592CB5E5AADB789967755BC67E071D66E2A0DCC75468E8E303393427153C1C34CFAAC4E749DACD4079C3CC2EF43BA2210108708700ED9D58AA5FC160D1E8E01D562AB51E567B52330A1FBCDF158A9987743B5971A7E01BA38F9CC2EC9A25DCF51C940D77D792C8EA8E0C837515134B504782364EB3B19A9255DF3E4B751BE1F153534B51F7932BD9D4C4B11A56EA0F003A9BC88428E9763D7AAC4CB85656FC8293DD962BAC41D63923860A32B3D9080C375D850B3859CAFC40DA87750753EEF553C11B59ACD1454C1D56692E41CFAA196B34735B9801F357AEE1E4BDFD7FA29FBEFD57B3D36913D2543F46A5507814D60A6EA119B4A7D37570CA8729468D76C11C014EB389A79215E8996157E7F903633946893BC32535098EA15C02A5C2FE0A6761B3D554D21DC8593EA1CDC67898466576D8374A0CCD9D10A8D39F257D51B436AC57791DF45601628FB4FA2B517BFCCC2B8A2C1E2F056F69945BE3842DCFB5293BFB428A75283FD42DFD0A8D4F201469BA03A89EAD08BF46FB42AD378F95D2832A61791938734D78963C23474D866934C59FD53E8B5D1599DDFE6469384386D8A554CD377EC8550EC408523F20CE0AECB48DE6AC7A2B7153586A3608D894D03AAA14C9EFCCF145670DC695D89A60B427691A3B3D99CD6EBADCC2F15214CACF624F0335F306A0EC41A4F375D63632A54F1980A4D4D1A98F1175157ED323FA4957D36BBBD4ABE935BEAB734CAACF55347ED570F55FC2E9FDA37FA906E91A132B06F512B7743750AC3A2616B25ACCE576A68B4551DD80B068F4F11E6A6A30B1ED726E98D706D6F98701946B381A3CE5075320B5F947E43C977BD11AB4C0F1591D86BAA372E8A90A59347103466553A6C1778C4EF3D582A5DA51AFA333709C82872DC72CEEAE787DB3ECC1978AED348A389C724408A0CE4D19A0ED174274FFB8F0BF8BFB46952A7FA5857B4755AA54D3D09CEF35FF8C1F457FB3543B422DF45B9A53A8CF52B1683A75373791C6B1D47E360588B4027A20F7B6F51374661B373474D708F34E14C0861BAFBE8A6702BEDCA6E875CCE23BA7F23EBE08D7A2DBF4F80942AB86E3140C86AF0506E11D27446C8E6113CB68EDD1A2D64329898E72A71328511D732A740D12AD427FD4702429D234DA5459D24058B4BFB43B4EA312B5373CFF5156D1143341042DED063D54DE99F328F61A6E0E8BF83D25D547F295F76D2B1DFA854C31B21A6E8D5044810D09A089C6E928B596B404D61F9CCB91A36B3602EC8D9B9955289F90C6D870370BB1ACF02AB325FE7F23ED582C78E1A3994D1939C167750DF55745163B228D6D1FBA7929E7C4C1A2EF9037AAF258B49AC74AADFA064B0683A2F6340E5E0BF8CD3C37AC958ABE998E3312BDD9A8BF0AE0B1E334A392DCD2A3D54E8FF0068B4F9AF61583BC8A13DB343503A4112C5DBBA9F78D8AA3A334D9B24A7E9645E6C99A233BAD474BA82657DDD8771857DE2A361C4622AA60F9DF09A6A64ECB6D95A99BB4A15DB9FCCA797E4469BD399C6970DD628168C93AB3B345ECAD87120DAF525994A91F32CE560392ED293642BF0ED1A068C391B625EC69FDE748EB9AFE1A8BA930E5017B5AC479AC7A669F4C06DDDBCA4FDA54BFECBFF00254BFECB168DA7B1C07472F635F17AA2E0D7C782FF005447823434B635E2398566FBD7D931B9606C94FCC97BE1A8075B0B6E8C6F768EB2E85AD5BDCDD2536930C3FBAAA3AA8974485D94DA99431348B6DB58E3ECDD6216E9DD23F22958BAF1607358DC379E100868F4EE0668458840F309A09DE6EB87AED19970FB6FB4F4B1429E7865468F44E9357A95FC2E87D9B796EA901E3C9AA2A8790735DC3F55667EEB0B58FBDF74A8776A3D0A8A867C1C14699A130A15343A7155DCA576D51D028DE2335D8B2CEA96F246BBFBB4F24343A79BB328E93532A7921A2D3CBE6474C766EBF9234C654D3FED06B09AB50479297C9BCB8AA6CA00071124703EEB54EF37232AEADF90B38A1CE1BAC41BF2FF008552A9E592350E6E33AA516B8C8A8235DD60704EA94C4EC9D9FBC7DA55BB2A7991310B0369FDE5E332E5EC341678597B3A21BE88367F65DF70F42AF53F650F0C77A28D2F44613D6161A94C532B16855DA9D40DF0F4531BCEBA7B5993535C441CD3B09918A026903E5929F370E7A916DD85873932576119885F7878BD4FF09D06417C054ABD3E62FB6DAAC3921501BF3FC89BC48083EA0DE7A8F04FA6E09CCFD275E26E6135DF3345F5C8581C11AB405BA2BEA87A25BCF67B6FB434AFBBD3E9D57B6FB45CE3E616235CBBC1436887273DBA1B4BFE540D5D01AA2A68CD12B76A06CF42A743D3BF758A89C71D143CD464268EF39CEB945E6D85B014819BA4A9EAD80A96EDB14946931D0E75976AE6EE84DD05AEEEF791D29E39593743A66CCCD52A84DDCDC30BEF2E6CB1A99A2D3368C932BD5A6435F71B6293AF4DC500DE6267F216ED82E6D8E4766064CCD329F2684ED42B33B8FCD46A95D91F9B66E11AF45B966028E6AFC9163BD16533AB2D45F81E07495BC23FB97B6AED1EABDB6921617E900CA2744D300F344D2ACC7A25B4A47815DCAC3EA80ED1D1D084CA65985E333D53EBB86592A5A2CF7B35F78299A2B3BB4F34ED2EA66FC9100EE846BBC7784A7F3C4F80A5D62D622EF9AABA02D1281EEB5A3EAB11F9AE803718955FBC34606086A7398DDC9DAB2FBB543BECE7F90B76A13F46C23B5A1BC3C51638410761D58E751473D6E60EF05D9BAE473D6DA8392654EBB241164EAFA2883CC2C2F107C56EA8A86655B5EE06069F05008F46AC38AA2B97858DDBD0B0547398792F6755C54768081982A34AD101F1515A9766E469E8EE2E6F240BB9DD168F96CB11DD3815EF89D08B866DA6833F5B947806AC47BACBA1A28EA8567654D51D1644032881189AD8099A63402E94293D80301929F56AC1AB54EE842A16C076D768C84DA8CA8098DE0AF7FF00E38DFF00EACFF7D5CB5E7C2CFF00656D592C964B2575F7DA188422F70389CBBAEFA2EE3BE8A953C070E2BA6D3664D4EA954C37AA34DC5D22C0AC4CA8D77905BC6015EC4CB5DE0BBDFB2EF2EF7EC8D024E11923D768E954049F982EE9FA2983F450E063C973FA2CFF0064FC3A3B6C135C288994E6D3A74EC3A2706B9A23A04E6D6AA484C8E89E6AD30E4EA74D81A3C131ED994094108FF6D0C579AC51C16DC54B189B12835A6C54B8641319CA5567F355438E46C85468DE2B7BF5A681CD3B1CDBA27005C892E76EE575A30BAEF54FAAEFD5FAAEFD5FAAEFD5FF00B29C75BFEC1463ADFF0061FF00D26BA857AC24FEA4C7768F92BDE3D5DEF5DE72B97FD566FF00AACDFF0055DE7FD566FF00AABE2FAAF9BEABB87EABB85770AF76BDDAF74BDCAF7017B80BDC05EE02F7017B80BDC05F870BF0E17E1C2FC385EE02F701127470BF0E17E1C2FC385F856AFC2B17E158AA51EC8608C97B86AB68ED5F876AAAE65268205B51A6F92D298DFBB314B3470135A688C910EA0D30BF0CC5F8662FC33162A548354ED1913646A9A2DC45EBDCB57B96FD17B96AF7617FFFC40028100002020104010402030101000000000000011121311041516171208191A1B1D130C1E1F0F1FFDA0008010100013F2184441605175317E8CF3A776B836D2D126E2538E606B17993390E9764DA079164E5C0684988863821B89B13AF61AB19511BC968DFE20712659E299269E19BEC978504AB343D2293BE84240857233B4A5D841E0A5A89F8437529CF00F0A2A02CE4E37B12029629782988658D2CA0736AA7E858E4262BB37434A8A14E184890B4A80F04B9DC63546CA1A9D20898930F952E09C5270A5C90E9337098E50883017C8F453DC7910B106C2EA550619B410A58DAE8AB12107C40FA42DBF03CB38F66328A65D372602C8D030D4AC097D9A57D38E8530F4265A5D02FE8741B4D16AD850A82688EC924A8050D369B1E83EA1260E4362098D813C40DCC8B57696630CA237725639880EC67779D6C31D5EC03CAF32799437E8AA47363DAF02E4592AC320392D0BAA6D4218C121E303E111D901E583EE540EA6060D70C42287A1B8F9141AB89B04D6A04A613043233CE4B5894C0E1B28C0C93A0448CE0421E9AD8D86D1866F49604971D8909782E4BF61AE3DCB39005B7E0FC9A2B512E653931D6CF0D6A4224BA27126DA76EAE25149BF444A92A9D09A59ACEC8B96C2DD5B33B7C052D75F92DE6F1082B6122A1691EC3F4D5088C62C9B06C923250A8924DCD844232981E5ADC4C9A9C9919988EEF43CD9CE9BC9403DF18D8E5F0504137915765085F3892FDD213CCC6C952917B8D6CE9979A2F612852672299F638CD695EC447B8C7EE47DC6C84209164A4F64B02542A0597C8161E56324B22EBA1980CF52D1452DC780F679429846AA1FC90CBA1B0D303B4D0CDE8262BF91A104D0D6C65331426A9E46B09282428687A1E5C9B1A07CA89045C05BC44CA1237111091ACC45A76E8C0DDA566E21EB2B565C0C6FCA64214DB7212DB6301C9FBA02986D2A620D5816990474254DC43941E307EA8D0237525B2369D0FA1EF39645F61A93ED2C31E6C565DAC1CF4EB84444A826F2AE18D04F37B08AEBEB0A1086ADA634DC125E10E717257F4EAE841745C2164A9158563603D2F6346F164A4E1CA66E37D69D45486291F29B31CDA3D16D183DB1C207AF93EB6BBCC67329507D063D167327A51019204DE63236226A664E49E856062E26332511420CF2E8425C4C899C11D02CA9197E4B398C83A6F01F3E444571A1D19BBDC4EB83E90C2C37CB248D8C1CF2CDB1B7A3CFA6F4839B61E96A5478267764D96E851024FA6161810C57622970326E865A1F68C6912C775644C293B26C477C929036D6723A48E8F59C21A0A273391A8B4C75910BD8C6AF60827508342E3E462953F1C90380DEC81EE030E98DA89035B0CE7460B06433190CA429DA1610107A2C64328F6F264157C4A69136A622E21E5871AA923419D0154C2B376886B4AC97A1861C368B1880E59243954254D5C1D244193244EEE4B9015A6479A995D68CCBB070C1364891FF0C86EE46B27F24B2C8711098F74C31FC1379A6C912C815C90546DC360F622483BDB0B6F30E4A71A1086946A5343C8C5993A702E881DB804B13625628A4D4D465203C0C9886849FA4537EA5751815244357A59358C5A8B3990C9E74BF18DAAC242691EC3071DF591921F5340893423120484561532B4187227D9A122065891BD91762491E5C94BA26A176459ACA2339577C2A2755AA15CD6D86FD0FF00910B2261A2B15229F8F25C6A2FDC6A66F6246C21538A1A8CCA5FBF106F1218A708249C909222244BCA2163C438843D890CB845ECCD6216E1289D8C36F72C09C5A2048DD97A6BBE81A8B663A1EC3DB32D1C07D62147266630CC289F4326B05AF83333298687F2EB2F1E32CF22CC4EAD24A991F64B03621C39640AB13AD04A62A7241889B24B712EE692421D22765BD8B1A15AE997149CF4D1293A8104BF31136396B91AAE8C17E9B2CB16A9D94135406C31648B317DB93B1375BA6A39115ACB7F8120A02A34AF3566593181A9937035B2948B13C8420821A678250D1BE4472ACD9BB2E427047C6451AB90E32791651C03215706D22245D9145D3664D6798EBE45CA25B91B4E108B03F3145155F810420591D48C531CE485A66F321CB864744AB59B5BC971224CC683379124B1F821312E2D3220B064911E60498BB8F98127A1380918791ED15C907154DE8AE8A475B24231C8F8860155B91F76B65F4925CB5FB8E2CCA55402CA16F58FE0C8C8790B862A10AA910F0992D29831993CA3C324541ECE64EC94C27A018B99814240D01CA62125997087BC140F3E6123750E88E09E4F8A64917B0A120E876962273F03236D4BC94A21B8AA836F088E05CA511FDC112DFC0C772164FE869CA1B84619B4F70211E9A709DBD87C25D86251CA464D8D5D1746E0F91F5A534F03E749AC35CC066190CFE4C461F067331833289F3095D1945BF9209A683839133846DA6090AB3245CA1DA3BAC95724E0968E36E36F9C452C58C0619C3113157790DD704A28B463A70CB113D3616BDA24CF4A74BD259221A18F4151DC6B22C5791DC8E2445DC0B44C0D535E928C1C92D92882097388AF3040B426A5B0A86D2299883205214EC436D6D1CCC8DEE409326E218810A4A91BDE45F325194BFA90AA586881EFAC9882358A39A872852858C1659C619FC0EEA157964BA81BB2E04B71B7D9098C57296BA217B51FB91DDBF32CA2431B7B0BA3037870349F20CD2BC97698F946C0C830E9D248E1A3C43B4703B8F6498C7CED8726C2CB844C18663263102A1CA14346B87B83509D0AEDE45644207385A484912210A29836829141BE83D8F3212D2E46CEB9386458585BC4BCF27C210E4884A892B2857B7B93B0FBD4B1F04D9F3203D84C3CAD1FA164430BB2012272CEA4D1BC4AE4B1C846B7392392C316A1D3A443D53D99591D89D47BCCA311E45F2C2369F05ACB9E84F286BA891080A78B4FF48B4A449488E5D162A529E725E06BDC1D298801913C613B225543ED266D0AC162895B49223E455B3024534B7832718DC4A13C2464ADD2311768D8BA0E0321C5CA1AD435E9E0C7C9732D2C463F1A13845A4D4501CB3793189D46F4DD98FC0C3C159BF22B08081D2106D422278441D8854927A9531377626B52911A80A7036B4F0493462B04593024A628BEAE4D585B32588643123CEC649B4C0C8DCF76642FD686BD0795A10C8F0DE91B222CAEA1A965830E059CA2E1113D55D65D8F72C9B22CFDA8204603DC4FB09CE976D8B966C2DAD0AAB2A509EC3505DE0A341882F364AF8B207A10D780C818915B40B110B718F04CC9B7D9BB66A2C48A1168975492E46D580DB964D4C2104EBC055CB1927B61313F4E18DC43922E5A4750C7C8F43D8C6E6DA458F45EC48F00F019FC9806FA1731860F723EC245723E4BAB61D3E87A9626C854EC6DE02040E829086CDD813EAC92979D8431890996AB831BA12DCC844815A16721939C03B66C3B421CC42348CDC181B507ABF4489931AB43987A26419926B8B153C8827682309D164EBE9D4258035342E89A74709B1731E51C7689E413CF8263C51C4E58F2C09ADA055A4C4F229CD1046D81D16558B755A06156ACC2629CD4C6053887748AC6C1671A1CF0B9E0CD6DA7B85B1197191CE0E08E8B96EBE8413E9D051723E216994490B690D4CCD980D630B269DE2E44AA3334D641F58682437F2632703138D8CC640A5E4E5F65497664C70CE8331AC2A9022240F2311165EC64C44DC4406F2189151A2BE0291A2934899C5B192CD81A667099AEB1A09C0A72441BFE02CE987A807B7895909D285220A47D0F39BDDFE4B47FB242E780458F0F0D929EC848DC480F32D84491488649E47CA435C940D24562050036E3445E67C9EEA21324700910385C9AC60436B62E439D211818224B25B918692A8649339AEE49A6C91F62A7FE5D6403CBE9447668A5F2880F024379371541232205B091A83EB097F02FC9A46F88606F90A037D47D060FD1A3B2D2DC2D0889A1684CC8A2340931607C224704C8F97630427E47CB25045C3723920F653C8C671B25B8700408A59252C7A123A49E05B32DD1147FC28F644F8133642F0BE55A4F1D9221EA89911B4371D0492F257553583790E03A590A304FD8F1B25639869588E07AE14F391422368432D253D8856E16C5944191763C1622DCC5053E511D59791A7FDC4299D13920E5C8BA60EC7F010AB282A80BD85B4E298C05A90989F26749C144973B90D1A324CF58A52EC5C9F009BFC076C381AA961A26B71C99173BC10DBC1F00F0A15A55116244E86B781BE4D27D11C4F0DBCB29A1F0435030DEAF28A75E0931265B160532CC1561ED7928086B46AA1ED12923AC2A7233B6F0E079453972250BCAD0586F31270C494DE03AA391B9B02733E480BA1E7F816503307293B427C1163E222104FB1A225EDA410941DEE021B8C28C4BB791B686B487A1C5E85021149DC74DC0C10994A243BD02D49D4093A4D94AC76D1ED378CD0348EAD46B1952BEE6C89E541E085C7C07721F039F5F82A02E9A33B2ADA524C440CA8F3A627C43037CC60F3A0CE2431C8FB8E915D1367A28082A8CC9E4CD9B0F7724043590B1284C5700A991A1CB103D0D8A21D9DE2C890805AF2C74A70461549288405F907A3130E308DBF8165888981152B44A687A81B9CB36204AAFC4C465B072AD10F719502122E2CBC0B6616751D038894313AC68A2E8B48463CE0F6041083E47242D1708E44E0C778285C1CF02E7B270833B11763148A01658DD06EE84596FA1A1F00A8C0B822F00B9F7152847736E67EC4D43B327ED99BC0C1CD4C8E4817210D43DA4DC2A9B0CB4845A21E070B2B3C95888A9723D8CD88591B06273B74A14F225547F225D87A21D12D249620206D5A4BAB3742B4878D90C3B02A226B2FD0D487A3F5468EE8B28991CB1C8AE4DF482191498A7581E444342A5AC7491D13D872478221E37D092B50E830A62849768468BBD8998B2227B9796261C90D2A9E4AD576107CA08A29891E55C891D84DF21354111A6EA1E0721040D508250B6335F4C7C101F0050264B2F821055122912F60BF14CFAA6066129E45A140BA3E4C0595150B84F5F8450B0D08124CAF42323993D87BA90E12561B1B18A17A6D7A2D8E904176EFA134149338137B414C5190BA206518C9B88630BB4F03BD2D70582E2B1D14114CB952660D84E486C9CADC5299C8F825F42E39F4296135532856E462F5C938B22448E6E470CC1EFAA4DC8968A0C97B3334BD0D189984B31A02065D107ECE07510F2CB143A1ED61FDD08151BA8C47D38E47B23E9B30A0B51ADE0CC3D204C98D750CBA8F913F4242541C4CE481941B49D9030A79305C8C59172B8114CAA524BAA3092687BB1528610DD39C0F496D634C63114BC402F41704642B88527909E56F19E12829CC8656135057684CB7EE382EF8244A9B4C4FA8CE9CB2A23A14CD861EA7F71C5B66DB78089912D09421452048C84DF5AA16D1226612916C6553924E01BC1508970F2CFCD9090DC19E5A7C16B783C13F9849A4A7D0CB13298EBE4575C4B8771DD12FE59240746250453E9220CED1F746C436A49A76C4D16EC69CCA444E8872D3781F113EC2FD46924BA31961723B130FDEE9A0C8AA08D8F81A608764742C83342207A8C05495BE02A6DB49101001CA967244513BC34EFA2D604B12A2D20BC927B2320B41A825F249D62C810E21360EF1C1F2847BE1B2EC28B96C7D0A95C17ADD318A73247C041B71B78224446B27D15E3460623D111480F7CD2294BC091F34C4830960CC31809E3C9C9092D6428B037B88BEC569106FA9A0B286986934BB4343A9FD8B231E3CBF91905E5D0D3E431E8999096988FC1A0993469B30631387B8D624C9BE8606710BC09AC5EC264B426D17B0F7241B868DF1E61A1D23E052A8A18B2D13E9B40F142D7EE4EC4802488D8F62459EE4C58ADD647AC898A9909882427B8D8C0EC54D0361C84B5A4D4C8889DA189BB38BC8B5EDFF147788DD89B289376D84895C7108136844F26E788E0206886D37811E096E11BC0F8302062948B66228CBB1C99169444232E99B1E3014DDBF0138F76B194E8868DD1781B3013A0D159FA562C47479D5949261A643B4C726761CFCA8624F0354FB09EE34E24F98F6C1B28D3B42C4B60A07441CD9A268AB4945194CE346028299C12778281188812FD0EA43A6DE833895791608E37A45B758250D8AC4BDA273DC35E8C18F9E5A0B4A35056F6263D660E026A52BC1922CC3F711E6FFB05A9193C08915D48FC0B8E778179ADA48BCE522D9D4D1244491ADF43D89F41284B144DE4CAA486A74EBCA630229D053C0BB1A3DC0C09AC2522B6476A715F4234950F724B2D0A06F81F9D579D323309714468E3E462F02FD44B993C0CA65F4344F91C13016E0C4FA463D0DF71A83DC6B8D8D5A124B0890C02F43337A663D8C4D43798DC624A5A72DD8F8C87A0A1B308B2BAC2495895318B3A7C208CB916A2F88CAA6585F0E8695927A11199108D711E553216452A6D0766CF11FB342938FE20781B925854AC348E4A08A9EE63A2CDB8B12A52A16DDED1088B427A3D881698190824B0DA149C07D2CF6C041A11918E20926C158AF88A27B2A054281AAEA0DD985A702E12C26F73035076526C7B05F9C6A1F9371E75661EDA55E04475EC7B80C7E0B8A5A87888DE74994F84B42BD95E802F1A3F39806B0D71EB7C1162425643F466109E76D6B623165322463E7AA370F2173470840B546E863617428126ACE8D021995B49BFA12132C7BA27906EFA6C105029182AE7A21070F2444489A1AA933D7976456E8F6083814C544497E43E49B84D8E47EE0CB7B0D60DBDCB1C0989422063D0CC90E02A2A046E45EF8A5893812E9108822F7495E45B536DCB49273D0CC605CBD86325FB63A02EB230B726BDC91782479D6D0EF643B5C30A5C417721639C8492CAD8BBF82CA841D4936349B40D8C21224DD0EF1C9E8984032D036A0C05FB88CBC349746CC997A16AF3E85968C8D8C8DB387FCA32F0A923A3413FB28427D9A18B47B196B7111564B03A5B1E9D7CC9FA4D3A5B64CDC4206A2259D245E04A840437AAC41078EF11E1BB30A2A86098D7A350D944133D5F2D0651A59158F8510469784C49615A6D080C1C222168CBC337D3737D14039FD93E80A4B011B61655D0BE109A171A024681677DA5480AFA4E6607E5D0727D2CC5A50D24C593623B32D2C502AEB542A34147192F1654E88A1B64273162A7E5305D17D168C292CE064D8F229BEE81BD071520E5D83395C8B822112089A0B6BDF6E448E08E2DD4193586C9D2CF277921722A6381A42344C91B202C24B2203113DF608CF54EE469968620D0B0C89D8806643AFE517C8AD40CA47E23479D5F4F4849B863743D863196768C4DF11A8131723E83C8051EE4072A9E50E48118351DE949B1F613EE60320B6D4B1A45D24970D501E975F464E8DF4318CDC116CC92EC4952A12B5C15C5103BE59475D8DD0F55A6170BA73E2202A18491BB2374C93C152116C14BA8893C1996A1894962E68094AE0599D146BA46A18C293FA2E0709B117E8F25D8BB030A93E49CDC4625AC0C79D5F5CFB445E43E2093CB4692BD899BC27E06EE3B2242D3E0FF00B4E4DA1896223F110502C681E46451F2511AFE07BE8D8B4FA2741B117AB2E9A768536180DC0A66F4B1A94254306DC0AE82C6083C5F01E9C4D8791F231EA8CC6A6C6D04A7049234391C78918330F78A02B5F0D408BA1861DB7919BD161382CEE780CD3BA4A34131AB4292C51646DC3282358C609A5035435A12B4CADC64B03BE4A93D862370F03CC38D207A237F03E21990C692C692DE2486BB90C264ACA64B1B8B1E609B72E0E10F974393F238BDAC28CA1684FF0030C48D818FC8D07219C6C6CC2D127C03CA57A72BA1972434B1E343CE888D9B41389663249AC226928696463F491120C95658A09A10E5463248891F303A1364730D0D0D6863C8D1270520389F637A2B44EF02852116B6B56163B46D24F6643CAA1D5F6820A971B8CD87A264989D0FB1CB4530A0B0F8B939244117B23AACD87521A61E478D201CFEC0C377639C1A390CB63C8F573E0FBE646DE9D9C1CA67DBA18C547480E446C7EE0D8E226A41B90F3EAC86B2748C671D0C91B34C04AF4366FA3D1220E9A1041980899EC51E82885A5C761710C7688AF6BA7CA223C27A1E75C25901FEC3FC43858CDD8D9EC493038DF01F7F4CFA9AC0F46731E93CB0E4FA14EF4863713E07EC523135AB2E76510595E857610F031DEC274411299528B6318E6A440B6C541E7D2B46B164A45CA0E0324D12909F63C180D7ACD68DD68B49820404A447A92E2C68E3B8B79A140C89C1A208489937C9F035CB4E6252191248F6974249FC9E9673E60BA1A0C5F6C7F005B07B30793B26F20F0566E5A151FDE91F50B284682836479731746F7435D1334E9700BD008CBD0C13A6871D36D16D26740E51566391BE94CAB1FA969994168A2890992244D00EDCA0721BB1A1346B2492745681C47A0B01916245A1ACE49076A81F30F91B3B498C10209A571D8B18AD988D2CFB7A1E4CA205470C01BC721BCC103B9D606D14C887BE8F721EC6204130186963F289F62041A87B923C0B47BD32425E8CA12B83EB3C488662FC599223C88C5FCFEE34E0697FC543E05B4881B9928920761240D60A696A8690833019969143630DB1E8636589BD53D0C6E1322F6CC0681C038E88FEDC40276EAA856FC9B44D92E3497A3166200AACAAB48244519EC07D68605892152E4B232AB234F94C88585E08B86546628FC9A58C6291C242885A2E05F985E8DFD111BFD07224ACF01EE21E0BF403F5B0D9436065D2E8FA82A8EA3D2BD0C34603DC647A03C6A8D04A0630D27C997A1B9B0DA6517C8578909B1968F4C8CDA0FC863A1D42381C08E4DEA59258EF20866C86F9459D072FA681FEE3E92C249AD7283EF7A77D33F404D28844EAA5A54B71F80298928E5ABF4EE6E2EE388D2625809126F2C48A09244DEE5EB1C8F9E2A3D8F6D386941FA0437A13A9EC2E3358BD1569BB4C94A1183E10AD520F663E81FA4F03167C423540F5EE3512F0C173FF002B22E1BE08B3326A924F79812E0636F23264BF08819A84E020A1A47600EE87A1E47B0F22D1FE1AC5A2371030689F84DC696FB1E298FB1DBFF0557BA9F236FDE2E8D15E48133C223D083E8668716558B60359943946E48703B4F90ED93B2299F8D2D6FB0F5181143D1F78D3914B71B13A250FB88E44F22DEE77173B2FC92AC8ED6338155B05915236F9F71123093E81DA28853610BBC646B9A2F2277ECD31CC10684BA280AD15E5910E508A67210A527640B9CAA1C5C8F6E41047620A724D8527E34194CF41253487BA251919017812AE8790C790B1ABF70831AEC303114157B091E064E4E201AAA3475314A8B39ECF2575C6FCE8190C299067B496852D28AAAC1546E32A8924020F13C44B2A4F91848917676DB36F3432030FA0F637AD493E91685A5169E433950DCEE3AD2DC4188B70C36A3876626D6324996AA336415C129832F93B1672F1A641F6616B91DDE8247912AE754A91295E48179345C3825CC1A4F23B3679205F03FDC606909805E256D1146DC68788DD82508258F0253AE0DB07B089C9FDF110790D468A4FD033253C8AD4ACF632250657240BDC48A8B595329D88DC92D3B0C4D89DB0A19B7265E8A65638C9811DB238227A0BC91C9A7B155409761CAA4CDF651105B093395843917912D969D096351D85466F186C911046A5E35ACA89B28158A67B1A08D395C882D38887C2264C0CB742BC46EC657212B32C08D0CA86EF488048E098E4B04474C5564D24129B2D0CA510389032A8FF00364EE3350E473423380B05A8701A390D26A0D7A60486723C2D108F80E0AD0989923D1C1B0383892D184391D1556CC23047CC05494C9DF70A74682BD87570D94B4E188C33063803D80F6025EC70479831341FA485938083BE10F746463A5D7F51C52079E642D5718A430DA5EA8410516A2B749E84BD90AB3EDC649C66824B55A02502E19CE84C6154C2181CBD922420763EE9BA48D8FF00B09433E47A806734A4BB96535031CDE4FB4512B79D02A8F00E186267D3404390F3A25893415DBC0B38D0DA16E4D11253C87C124D34872B61696656A1CD6242DAFC23C9CC02591ACEEE63E426E44948D763D9B27C02420F1B099881EECC70634ED5E80D9221AB669283D0A92B214356786D8595896603B1D92B237D9260784CA19DEC558A18B930D176869E9464749B45B6F71AEB425EF102E2B90602F327A08AC771452E4981D286688AE948DB827A136B025819D92E744D8DB7B92619913D5773CA2FC728643662D14A5942B0B811DB2490C2348DA1A1E15550AAC67A3CC6C4966E84CB925D9273C0B62EC7AA19E19225E8A51173D8E2D9AD8356D0BD8CF25E5E915C84492365F2E07229664711EDEE687DE501D1239D853D89B4CC22D8E92BC09461A1124F631749AC9A2706E0B610D8825A2ED10488990643DCA25169813E92BF1926B1B92460525502D4684B257B10383BC42CD26251932CFEA1224C3F80C40A4DA282CF73BE1240A23C89FDC50311968B30D3CF5F30F48F4490B9E47122B59E2092A1DB638895C1BCDDC8C84925EC2761FC9446274C737F463239D640B02527BC8FD385A1E836950C42FF00004541B496C3629A3E056019AE30A3A204AF4EDA32664499D0B4108A2041C09A04B64A3C886266535D8C361D643D493520C63495A53B0CDB867CE8BE9E48E06C270964415847243732113E97A3123B8AD8AFD32F81A97885C0729EE6426915F50F1ACB17D697216E1C25301A019095C8B0CC4C5949EE7B06C85BB541AC06CDB9B291FC084471473182DC7881E6137F81B74BEEC9185B48508C445B54C9536CECC624D4EB278123BE56C3872C9DC1C282A1CCBD882546675B3D0380C91085E2306060D69C09047A260911B65D523765B1682D12B8A9E9BA490AC8D87B7CEE1603883B29FDB8D69634912086C44636108E0FD21824B227D6F45A47642140A17AB6C8F64829F11179EE4DA89C925A65F7693B86449338E0AD30CBE82A44A1E9BD234A14D6052B23AC9DC591DB584963A361CBD06E5F2E68847E6C0BF78F66B1C6187602CFF84A2B079D9F632A42930FB64CE8C2282D8B55B173248427739ED12BB363F426277C21981E85216C2428A6C9D2AF4215A193317A25128B32D61287E92D4E687A542DD0B0332E20462CA4671898B81D661DD936A04932D0D4B3C018A438114C9B7C8CFF00C9BCBBC8CBD08D8B2A328B62CF7336151B70840328C60494D1F1C7BD22248B5C090FE07133A9B5128C130953721E762243AFFA68FF00B120A6486E2B9D7DC9DDB92830F29FF91FEA1FA257B836FD1E068DBD0E31ABFE64DF6949FEC4F72060899029DA23F1E183C48223260D3F7C107210B2149F3E94310C90DC412D162C0709A09A94B63B03412D0A938D27A0A91E83D28904F2DA0CC085E3D0DE46CCB20D8512B14E84A6D0FD830A17C89EA2329E848614E7C90D693F51A83AD0CCD18FE07A213ACB6207C04AB5E451F781851161A1A31BD3B02A31ABB199ADA5687120ED89146630C7B3A2B1F621F1F4301584891C7F238536A8B2E46DD24C607BF159FC0D49572F667B1827FB1B88542BB7EC5B6FC3FD8A3D94D5F65538C281A61DE4B0FF0010B68517102E2454B7D1332C22385DA0BCAA84B71F556C4B75F1C0FD0B478FF943E02586C654F22D0D6841322D31F5990583158C4447A45247A6905A1A0B84D4635A56AE991864B9518C4F66311D948FF85E8904D22C636B1D0B456CD6C1A637534D1BFDC56C3334EC724995A521530043D23F1FA762A40E8ADBC91BAB9F810DAEED99F9A26E56C7D2124B7D8FF6243C8A418DF1E596215BB631C8F22A42CA6CF7373FD91090F14FE07E642B1FDC3FC2565341DB8DAB1E1B0BD849AA10F9A1A5B7F96389C17B8C7B833B9108436FB345E810C809929A2338E1792788CA2E0CC4129894F4A32307A284348F54346C3D3114B302F81F41E35B266F1E44B4CF8D29B2E876636C673FCCA726A8140568395297022C136B0E0A4BC96C5432479448C2DC3036863B9098840D0C76892DE4A7B7D08CD9150C3331ECE80B923EC49954584BB0E7D03C09C3945A037FACFF00C315FBC38B066F3F4513FBC8BEAB0987ED292E2015B698AD466CAC6A8CEC37228959DE6082E75780EAE5CE392C2E053B21AE7ECF9C0F966D7B11C0ED3C92C050DBDFD4CA509B8DC81A48A3CC6FCADCC0437192B5CA58B46A1A48A26D1610C091E8704080EB4BA832D2D080C8141C7702CA99C1D50F5924A17AF274295BE98D222364567E0A48A41E20999546184661241850323CC890BE828F668206D84C71C9E35C42D329AEF727B97D95E2936E8490C17F2DC8DCA1DCD090B218511E0A3D862461C191E51E0198298731DA9FCC375E19B303D55D088ADAA62512A01B2982375A79F303464D0F51AC2495796D0F7773FC828D3621CA8139916B9C8F90384922D4CDCBD4D273BA2584FF0070243439498DB233F45F769C640D25344971A14529A9C3D1D87685BD0CBD069610B44D470D47DFF896444B9BC0C7026221B112DB80BD91C4942C519A45CA0A87A79123348C67B210B395A748D2205BF8F4A14CA7F8449C7819951CD6C882D982988ACFCA42EE64DD8E27674141706905C83FC13F5DC4C5E05E89998E5A1291EB4C053DC8C981862DD48768269506396CDF0112E17825B362D646D1A52C9F1B1612084AF21CC974269E596884311E45F4A3CB891FC43614848F449123E0535459AB314EB609E43D19C8BD1A809611A246FD1521B4257A04D4264831166E9A51312202EC2503432345EBE027CA64E47A0A94984489B480EE440C6E67D0BB9B0EA2013B11B11C0C387C8739123CB226AA0B7C64854A1CA63716582D90DA462E5FB75EA1D0F93CA9057EE88CC5594246908B682DE427D30DF33B909B4BE5CB40370A13283BF08A10D188949B3238D121071B27D1C79497648E1BFE495663FCC46D1D92C8A15F222D24BEF817632396624D68761C980B78B16B8176C25C7B38FA50CFC9BA916AA91E424C91D875F549D061CE84C4D186852346267A731081352B0804D54A13F42F5314723A2B152A196DC70A4C9AAB69C15AC51035E94ECDCA388E13D01A5087919DE8136E2DEDC0DD518A98A65802410A84271333142570BE435A6E52051815B9A298BC7FD22944C204CCF8429ED68FF4496FC0A2E02768164D503A21B53D871DB46FDE19AA0882C3F715227C9270DED026AC5A212549D8BC099B7D9754929C9148C3EA2648B202D71017D861506D4F249EB2288B2F246C43466172350FD2699069A7842241350079C9906A7D3D50D36E4917CE8451A223D0BA566BBD3565AA210469355EA498D09C6509301E932059C94881F029F90FC07D0AC55C89C3F2C8D89CA9304933AA1AE34A2858152181485217BE7632E94763829696376A540DEA3EE1E444B386295281E0EF1488B467BB370B1ED0262DF528511237B6717214058136B4558BB8B05D5C310CF48912B06CA812D759451ACCDA212D5D606A112B4E4831F8289C9CAB2250177840DC4DB3BE414E2C83AB20AB6AA22E2492C826B981856D2EF81A5A7457B0824626E8460214A26C47A0E25B02C41DF3C929462473BA891AF41ED1E9DF4645A1D180FA1A1C19E83B6B3F45D234411A72AB47E8925F31B1429B37A440F596D258B2EA53F4513A4D8BA1CC7C6CA626E86048DB464538EE463780E0E1E485820C590BD66CA8C8C50D98323729229A4B1130A14086779DC6968C9A8F22262F2C97B837C86F2926594872C67714D4FBB18965BDB27D70A0EC6A2739414C27ACCACFC1BB888AD16F996829A10232F26C6B97E3A477842103FD2F38C97FED15AD9F90CBD3ABF8425471CA1891944216D96E49500373D8FE82EC1BC77D51B629550A676BD0F0A9A911BCE21B9CF8D89249C95281F22CA843381F3FE8EFF98DBFE6397FE8FF00E19336F71BE226DEDF24BFE636E3EC6BE8304383F71B806EC6DF2897C05C88EC47922BB93C86F90DC89E44C32564283F7D1C23DFF04F97C12E5F0763E0EF7C1C26FC2200CA875B0E6ACAE0EDBC31FF00BA19DAC4D02700522AD0525340D938654838B0C7F5DCA28AB13287787FE411FF00D0CBC5F99279DA60823B10A12A3250B2210938A1E84317CD3C05AE6E63EF338FF2217B0645DCF4094195125005C0532C3C2297DDDC6FDA165763D1110C475991B6E4E5326D6DBD84DB219FD0DC7932871BE0567E4418E152CBA8750B33BCA062255E492A28C448136CC8B623E009948A51F144885A172C795ED608628E5374C752FC5FD1FF0081FD1087F07F42FF0005FA189A4FF8D88952279043EB65348FC0D3C4DDAFD13FF75FA1557E3B5FA1FF00BABF425E7E13F47F8A7E8717F53F4293FA1FA1FF0098FD09CB3FB3F431FF005FD0DF6C167F70FF00D6173BE4E5FE4512E7EE397F6F4000460B4CC5DE34D7A0C502A63C2D925B4B9D2DE97FFA24527F511D0AAD90852CD81489217C13FF0024945AD9225D3E468F90524A4E50EDAB234EFA22CD731FA130947FE71FE30A3FA895A7A1E26C820420C22823AE58B1C4D01D0C2BE010E4A55F09FA0CFFDA000C03010002000300000010433405BEA997B25E7271ED125EA7178FB8B97851DA48A33C078D48D6DB20C29FB4DC459C53C9CA19C6FA07EB28FD138CC36A0C590600E430D32D9EA2CEEB31F89CCC3690D493599367434D971D8D6EDFBB95BF20B7C001573DC642B088BDCE4A080E91851182831F3370DBD283FC689313563B9DD7C2709363671804404F3BC84659FE12F7DA19C25F2E1BDDE50DF608838D3A36888289C21FDD4C2F579C8628EA2768D6F1DCD6DC8FE91C4CC823A1C69499072737656527DDCCE3CDFA39B9B17C836945C8205C7E4ED9AEEAE2A3AE823B012026FCE09CF28B7B98235C5B99CC3CA7E8ADAFCADD8B6A32840D134139587A7CC2467EC5F4EC919D81B84EA645B2FD69E4EAAB6F1D7D43085F877C5A941001828812422DBC570695394B240E45F7754CCD578BBAFA42A8D64381D8ACC76D5238C5DBC30D0A9B5CE818A46E32CEAE2776D44E00D710835299E2B4A5B91DFE5B09EB32F9A856C04D8642C5D440B53156B73CAA8576392FE5AA18C23DC913BC0F8A484C082AB0020BFD65F6818AC2276DFE3381052309DA7117578417A5D01B73C4C323AAA92F11811FAA74C8FF00B50A87BBD063D0DD2F1AA4A964F204D22A6C6A56247C666A6D612B1858BD0CB7555AF3F2388285E04213EDA57FAF1A95CBC8A1E1FE3974C5B823947CE262CF1B4CAF1B8CA54D020B48063C9BDF0E2E413A937C99203FA785BB5F4C0FD0A1422755780E2B72098D172CE9544582CBB2F71E81AB99C7952E2E4C24F9FF00AC9636DAD049C2F047FDB04171172248ECDD8689ED7BC9DC0B1C304F3C754828CD4F38D81BEB53D16A492382F205A9FF005649CE754D7B590F3AB1AD155240A28A14BA7D95FF002915F219B906F5501A2FF1D69E49377C60B373F6AE30537958D3076E55230F0CE14C07DB82BDE7CFB80B9D4239B929B13F2830711E7C7744B239D1B32F7B8FAFD33F103CAF3DD3A01045E38EAAE3C538597B21E0F5DEBA928B7595F1244E500C885F50AB5F4E983B8B1FD8870E28CCB21F863AD22E620F7E60B26944FC7857FE82F359A7E130AC2316F887CC63300CAAC6BAEA9121C51DDBDED6FE0DAB2904534498018130AD2B546103AA1061BF4CE0772B7CA3EDC0D5B196B40B94D5979DABA2DFE73207A3160402AEC9B2E0CAEBCD0D127B0CDE048389E0CC122E61150087B59D3CA2EDB1543E69B24632E72877D4539A99C3A100D185191A6A1BC2E8000C4A207E7D56FD6DDB67989011185787555CB221C8B85D8F4B52080000425E0DB0A2552D59F282CEE241CF0864BD19F1C6E1598F604193D0799C3EC52102890F1300016E59A85D755288C8CC00A38F663D53944E573EA1431CF7E4D07D52EF9E7D48224FD246B0B1283C62412CF6F9BBBCF74617F9C6B5222380D368963FA90E78561A0211537E88E1123425013C6CBCF4D1F401F364D88B518687B4AB7411C94AD657996DDFA1345208D6673AD6810C94840C2EA4A5E318FBF21032FFC4001E11010101010101010101010100000000000100112131104151206171FFDA0008010301013F103865E6F178F879F8EDBC59F2F4FF002F379DF9149BD7EFF2647C7A961A9775C4B912DD6FFDFA3FBF876DE2F1757B83391EFCBDFD5C9E38DCA7C6F1018391646C4D120237D5D3B2EFF8F163321EC872F5908991E4605A5B9E4118FC9B589DEC89ECADA44C2745EB708FE2D59E74B4C1AC14F97BF8F66599DCFC765A6FC061E41CB07B243B64725577EC0DF9C890456E5B876517DBF9829C2F33D7B7F37E7B79DB0C3908F11512426F9F1219B00C26FB7BE497A9B4D97A8F22F88BF145B1EC92741963EC841C872C05C12D7F8F6D2F3F00E9783E68B3ED99F0ADB9F24CC306D906C98D99F92D2F4BDB2747C7B3FC7AF8CC26CFCFB1B7631F3330FC06C13EB7309C1FE34B29227C6A750A1385A82F42C8F893F964B0B608DC56FD105EB910EB784C6E116F0B7A48D9EB96902518CF3D8E3043B21BBEC971B20F7E06BB0D5E49F5F0C12E65BE2DFE4FF866E0BCE7D753B8FC3A7CF793913F01A4B2466BFE44BD8A3754317C3DC341F114F8F89BDCF9F2B4D996326D91F6410C15B32D978D9596D977E27B225A1D90D82DAA3312D6459DD8C9AD6F3E07B4397AE60F2C91906071BE4F1648526256D0EC34662430090CBDCB971B0396A75042302B3E1A4585E2F2FC6EFCEFC2C3E63B7F511360A87C75F934E4049FF9817C83AB36693B62358976000238CE99DFC2C12F0F9F7E78F93CF8BDB24BDCAFA841D832D99EC4BECC091B07749F6FDBB2BB09C948C04C6273E5BA1817E2D7FB6CFD9DB7594940677C66DF82206D49CE2605A7226E4222626724906EAC3F901C447126767C7ACF8CD8306C8FEC03D9BFB2AFB3F3B6E7641A4C7E4FBF13BB7F0596093393B69D091E9387901F23E4992DF26FECF65C807C735EB03C7C6B1A39174B408BD582017621965858B7DB4F9A229E3E7D7DC9F6E8B9DD18C1103BF4698DC8D4EE4A0E5D324120F96EFF0094A24F0C562F77B27C8ECCD819F6823F03C3E16FE61D2CD18F605F81DB8B75B8C72DF98F85DBFEC87CF8349B4F88E975D972428407B251DF9594DB67CB083D89B62E6BF388F64A72E8B4F8EC8392E9940E99F37F5D9FCFD7C6FAB133D873E601FE6DEFC3E074CB9582F73CEDA42E8475B7D7D53C8F6F13EDFB1E47B79913E1AF9FDAE116B7E09B5F3FF579FBFF0096832D067FC3E7F8F4865AD8096C32641B19D90DEED7240CB076CA306118475B7C7E40DD85F2C9949BE1A930DF8390ADD6F4FECD3DB30D8F678E34E4DC63C222EB0C41C919CEFC070493D87E3972723CF9FD9C40F223D5B04AFC9E22C781B3B60587B6432C6D9119C889643216C9CF82F0B17F2C7207F0B5B76443F341B2F827A3331337B2A827B7C3D9982CFEC91F8DB6D853914BAFC75D5A06D49ABF7025CD0210672D132F2FCBD1FE1A3CB7B1CCB797FE27757F04156D0896F16BF3C5F2B897BCF5BCDEAF11D8389DBDFF003D4F82DF2F04198467DB1D9F9B006C58B17B0AE4C0A42D18EC19D84DA85B6A4DED880914136134DB5F3EDFA4210996C3B692E5CF900F662720DE0FC63BFEDF4DE2F57467C4E1FE1836C363833E193236DEEDE4FE0EBF07E1812EBDB23235BCBA22FD6EBE446790C5A7C25CD9F8797C1A7E00CB09325CBF4B4D9F260EC7B38C7922D2F253E5A8D89C0618FCCD8748A0A402012C2E9C83D80B1F245ACC21224A35B4E7C013B3BB1B3B37C7B64914658C7E49CC86BB1D03758B01B63E2EB7894C97EEE3E7CD92DD93D201B122C3E35ACF6D0B8EFCF8BF63E70D80F88549A3D95D6526CA0915A192BBF97EA47EDA37C96D9FB31CE3465FF778CC7DF8FF006B69EDA37639F6C5ED88D913AD806C3248D9F2545EB21D9CCEC34BB83663EDE6012C967C2EF2E9EDCE4AC9823B2C866E71D82F58DF1F6C40E2CB2DB09071318CFE848B2BDDE1F3AEDAC26967A75F915B9B3C64E7488450C62499E48313F67CEB6A6EFCCBCD82F9276627B1196922C5BBF0C4F371988245E4096130DB59E0B8215B66148FE8B5E8B6748332632060C4C2136D8135B42139890BE97E659272020C08B3EE0C416DFB1BB39690E58F204B36EFC3048CBDB1AE59CB5ECCBC93564E4CDDF61F33E6C1346D211D72EC1121D9838DD930234EC4CE59FE5C973C817AC00B077207B0EF7EA896E048A4AE50DECE9306030AD891B3C58EC2CDCE13A8DE581EC98464A3FE1972578467520CC62F2F271594EB2C2317E37EC21B1FF5B19CB5FECF97E7CFC2E397FDCFDEF7725D972527ABF3DCB3E569B3B97ED9BF337633BD2CC63CF87D678984A3C09F92A92BAB1DBB7BB96F59F2767F0B5BC907B383E40B0B123360EEFC50CFC11208C163E4F686DEA1484F2D6685ABF01926C82CDFB01705C8F9FB2CF65E460EFA8E63996460A2A393170BAF201B2630B6C2C0FDB3BD819607C3BE5963260DA0648302DE3A6D9F346DBBEDC3B17F62076053B63FB23FB692121212E5C8870F98360DC8F87CCED8DD9527E4641E428DB80365164032973D059142C367C33B6D9CFA09F8F467A97476C0B83E6592C604E969140DF2CFF2C999CBCB8FCB8FCBFF0037FE6FE6B3FC8F3C815F33FC691990DA4B8895F90B3336CCE339FB37A6DA10A5AFEDFFC4001F1101010100030101010101010000000000010011102131415120716130FFDA0008010201013F10F7B7A8DE7CF3EE0779BD753D38C98E1AB261CBEDD0EF89C3ECF19596B769EEF37D8C98230C04FC5DAF57A9B1BD5EB87CBCF227D876493EB22E9E90E2CE50487A2FB0E00A185ACE764D924EDEF092467B81922C6C8120DA24066BE224DCB0942C48B2DE6F17AE5B9E5AB51DB032FB752ED8BA99637A645D408E33C1C315689B9FB771D42F901639DE5B5B1E7089F00E58E4CEE5FA99A48480ED6DF70302CDB0090C05B0EEF1D598D9BC321DF0CB417D2EE5DD999B75BBABA449BB6B65AE23678CF05D7F3F2CEFF11BC46192693DE4C2D6665CEE2EB2D5C9027608C382EA327038EFF9D6DDF1109326932D772C8975108AC291621E38EECB1B24724101F3852F5289708598D8581C86F96AEBC947B3C738C7E56570B5D253C6DC9B749930B43B8130B1E58FF485DA465A96BABA62236D8C7C664B6FB5B1FD740BCDE662C2D463D9E4F49BF9DBB26CF024F314033FDF2509689781C0F24EC2C3B9A5A6F3EACEE1A7118F1AF4C03263F884983B32B03D4D1B6A5DBDB1C9E2F33EA671349B96DAC8FD49B87B0E3D84FD80BD76405853B99E98058C3C10CE97D52309C4C49246BDB856CF44049B60CDFE3C72D0CBD36FAB281F5BAFBFC7882B7BC9BD5E3F9BB3B19BA753C576362BB2D0CE204A62D084C309E25ED9CC13FDF02E93D8CB0812325D8F65E782D8F2DEBAB591B3266C4C81BB01F97479C041EA4319157212C5DEAC59C6D683B9ABDF0692D5FA48B03A91884DFEC9BED91DDBBEC3A23B0616C87B58BAB536F911353CBB7CE0A123BB2C8F2502F785D8CFB23EC4F93D3A8BB064F85B7BE11B1A6C6063D80F96B1297CB4CBD11B12479DDA745B0B5B18F5B18B85D3D8EE63F977D4F0B241DE29278C39C776B2710E48D64C70F1B09F6D0635BB07F06F79CB23CE2F56CDE8E0D8E358E7E2384DE030CE0B83AB3EC974F675DC205A9631C992EA1BB1D5D67B36B6A049C59292B6B679C1EF8658DB7B6441C47B9E85E2F65E0BC436CA1C1CF39977692FE5B771EDF3F9F3CF6B0DF6674CF7BA5DECB976DED78F17839EE7978E3BBC383F26D11BD579BD5EEF1771BEEC138F53696383DBE7204EE591F526EFEC479185B01274E468B33EF52ACF0A36BD589EDD71F50EBC0E0176262F4CFC9B625A9AC649D6573AB58412D1613A1D4163D58590776F00B073BB39C29C075659789BE168E9BFDC26EA6D67565EC45B215BB492668FD8EFCB4BB37B91B6E977969902EF83BB75589318FC5FEC1AC52679FD919884C70E0739111DBCB92BB272DE3E4678F0C466C0713165D46FCBE64E8EA6B13387A220323DDF11E42EC3392BB7FE10D2E87762F12B1094C3F860900B7307768B7B95BBDDECE79B56AE90CCDC850DD4B3BCDE22F50E6380C62B992FA869B3241413C81580658B48FE5E48DE3F9B78F3CD4DFA9C1B7463EF1CEB9586CC99CB977964705DBCCFA2780701BBC9F0E593BBC2F13D5FE172DB238B41276459F36D48FABB4666C98C5A12367ED85D043932C3C94DF38D7647A59719FE589B6503EA1323C881843B9D597D46BA669813AB6168070C14B7D930E1D23DB34B3386C10AF1D0C8C270C7EEC6CA6764F0B0BD8F5E5D778380BDC77E3F95A1B005D2E4CF68C991F90110492D9BAE0EBBB13D2F51EAF6E1E2CBF0593B2C7E5D1E585D6CBD797926317BECC27F975773CDBD4AB5F237EF1E9C95F2D7D8E8E03BD42CB7BDC2158482751BFE50FECB729E9BFED0C6DC6DAA3B20B77C987BC49A8C3ABBB54BDE8B47CB0481E481DDEA31A59976FF00672FD263D489C0F753BB0E3D22D8C18F76FEA7B7A84B37B7883600ED9076BE4188BDC2123E73ACA2D05898C4922750B62A5BBCBA7B3E7089D5DDFF004B2B9C4DE48579762F1C9E5F2EF902DD8BDDA49C743874C6518F0B3E5EAC3DC19612424FD580387DE3AE3AA42AFDAE80BD4BDCE038F9C0975813ECEAD06DFF00692F0CF929E0A21C2D9D757EA909EEF7762F56DCB14D11DA3E2F57567B71410205BF16F8EEF76C77D5FABAE47B2C10C2B28D22BCC9C4F380C2D64FC9EB6FE4B7AE1E7B8A81FC48ECE98E5EE2CDEBF8BC08CDE3EF15CBD5836FCB6B2EEF5789858F32098058B6D397776389B927563B0706BDB320365A9A848B6659C772DA160D9CDA380D7DB08F7D40EC5901E42BD99F6480CF63863CE0118119A2067633766ADD8C77D42631DA40E9E489C6B338FD400DB3ADB497726B6596871C9B2EAEA0F9CCBD64F7386165DAFF001C06BC3B22FB3F8598F38F632EA3AF52A633AECBD59E1A6C04EEEF6F5003637AEE59EF0CB3AE2ACE067E72EB877B725ACF9CADEAC33B6425882CD9B16209620C8B1B627F594EAF8EDE65650EF7F8BC6965DE2EA757FFC4002810010002020103040203010101000000000100112131415161718191A1B110C1D1E1F020F130FFDA0008010100013F1026F4D198098CC255327A9325F8989CC3D20F7AE6BE90EDEEB193EA870BFEDC7999C926BD35367FDC42A16B642D29D6B1182D904ABA9B21A1E9101EB4FF003012202D6ADC1EE4295CA0D6456BAE2E57748A1CD2BCFA4770100BA129F48D89B28347D7C4AE404E50803A6CFC1072D0C6B8B54C48BD2AA058BA377881AA06D2ADA1B8B76DD8416BDEA293028B4E121D0955B31DD8BD6023D3A2ED8B78ABAE6346D0D403259ABC31F5CEEC40BBC944AF3BF0A7814D737E9290D502E0DB4A76C4B07CF042A8D9371860397171DB010525A48CBB2235AACADFA32FAE95B783421EE92C6155F04001EB0D674AFBA010DC900F24568C6581BAD06EBA427CCB83ACCB3CDC4CFB579992C0053DE194A4A84BD7F52844DB2DCB214D19D30539EEB37D22BA2E6441F2E01641E465E9E02AF2EABDB899EA0041E06328DE032CAB40D4B5E6F31033EE8B929AFB9694440F98F17EB0AA3583EA6EF10ADEB15FAF3EC3F5118F68C2702CCFBC54D6E90DB781944CA9D7AC031641705C2B6DCA627AC66A2F17E604B04A3A40AA06FF00B40A06E06F63110B9AA23163AB3F69B3C44A7D4FB9827B1F04FD33E23F53E53040198C0C4A6FCC761ECCDBD49FAA20D257CEBB434CEF317CE61CBB5CE71651A61BC57B90096E94AE832FCCBBD1D77333ED2C5B5BE92AA76E481C72C16D751C972F998F79A172D1D6BB400BC207065C5414506B268CD4B0A0D81EBC4C25230E8F699457C5AF859769CB05188F8F980B77931F85F3FA5C1DB6DC35CC3C12F062AF1FB8DBEB49348A7ADFC4D52AE440E73312F42AA75BBB41CF24B624A22CDED0FA2A3AC642ED0B767387AC1A94016D28A3C611C5B2EA2A11C531751193731B2DBEBE26C6AACBD060916015EE76822A31CA10BE3313FA9A2F09528D6AA01E004AF69A6F0FD8C41C9B4D15DFFA966F6143DA5A25F84FB9BAD973BAEF0A30F99889C09A8E9150E77F3171DD02330085BC4BB2AA58789C5BADEA33023CAF1596335D345E92AF01713A35FA952EF0CA8F7E2A61D71B9437160B32DC6DA47D63C79CCD17723CAEF1DAF8F301515CFEF21CFD257D2F0657FA899DE8254A9E0A3A3BCA0BA62731CBFB984F79697A8FB99BCF94C5C6219DDF0128EDA7DCD1EECFDA6EFF0074980E887CCB9DEA7D115B9F01FA9F7BEE56A25A506D9631A8A46DEBF8B226D341D730636BC54D471530B65732BAC429C8950E71894EEBEF42D28F34337B036BEF5CFAC0252AEF15A8221A5C3A25E252D01A8E75C8F486ACB4722B96E600C15342B48BDCC9EB0E9AD00E9C2FD20FD421B6EEA22B3A384724D836F112FB711C1645471D21D9F816586BA41C8EB3057B302A96C2C420462E6A9BA88CCC374D660741AE58D23D2B71607EB17DC78ED335750B4BAC5F5DFC40DC6407061CF49937B836154ABCE6626228E1167A66A506441AF01550926185D5160FBC3B2D7099C83132EA6DBA307E65AF250E0BC3AE93697DCD5844F760967109C6A92B95A87605D9D5E58A24395639B88BFC6622F1718F796B8C050A4F88B3A6941295F0CBC77E4D9D28C6F1C417B1B65BDAA1F35E7311D02C9D772BC20AD2B28AA1EC261FDC4B7CAA50D4CA968D56E5B452ED65414FAC7B5ACE212F04BC55C769DA0B168BBCDC23C2F72D438CC34AE2C5E60B0F7CC02DDA0161C082A0D85441F767B4DFE7F71F7E32CC4EF97F7055B196D6838F243BD7031E20D15C91693C4B9B747D433B66849D176B361D5998DF782B5D61F7395D529F421616884EB281DC5CFAC50AB23153040AB85055D66EBA45057B4C3F26E69F04383C4D7D66D0F6F1D26EF0EA5D2742637BC522706F3AE91494AC5AC0A05799605455E4059EF7292D3914ECD77A810805670A7FF618AF9C5754B2DF523375BBB85FDCB146F6E6A045D097E998942E0711F3C22D7CC5CE9CDD4D1F26BC4D267B46EBFE1B665EC71F7120531A8950259C1992B928C41E6820CA6D6145F59AFAA8D02E0F562D0A048EAD8FC40B58416E1E8D9217B6A123A8A06ECE4F3518398CEAAD06FD49ADA00E4225D6A578B199C600EBD58BBA8F15DD83462C3335D901BD6BA4CFA3D08D1706E556C42C6A169AF7258C956CE36CC4E6FEE8E254CCE2DF55799D43C69034A1E5004109958F8B997F43E08D8664A48189C29859719D6EE3B2D7DA0A0F6304FE29AFF9D25D432BCFE1BE54C1F13DB1B957C2878F8789B7CFEE7F9789F29FDCF8DFB8ED3B0F92771AFD3327E4FA9F023F8A7C59D2F3D262FE6717625C4E70FB97356A91AD6098E79B96DEA32FDDDCC1D9EB12CBA470C58F5D199E2E215ACD12AB3819C7C47567A6E3D7F71515E1A3C4AF4B6179B8D50EAEAA6736455CB1B4741DA5D40806CD8B75C18E63BD882983A59A620D184A156A0F3647F6E16F35758FEE0EEBC1F270E49CE98872B102C2D00D5D5510C8CC9175BE6271555022931B47706C56DF1032CA9C033A9386E00AB6A634EBC4CA2BFE2F43F0EC25511BD541D30E295CB1BE22855D6E95731BEA2DD00766634B181C4775DA086990ED843129FC6B628E5A7973A8914C22AC88095C28EEE9ED51B15AA008A294B6ED1A9456B2B719044EB57507B50005A1825FB6E0736E730EE32C750CC02591577605B7C21D2835A817FA4118E5CCB349E3100BAC678855176C68585B996966C60EB497BF517A432D05CAB998472B28AAFF006600DACD67A4456103A61517DE155B09746255FB4A4A8B4BA225AA76347496A976D04A8291B85908DE1A95A6A8B5E582003697960C505778D48BA802A8D007CC2271C99842819085B3991952C71F1152A6108585C9E65AE7CC4A171613DE0A23ABF72D5E6915B4F1FA638BAD9F515EAC0AEF432F88B95C0CDCB9732AB566DE22E1D212830A29D5B9765D0945EB04A2C48AECE06A294645CFBC48B5654B0F3282294B983CE75D650EDB788306388AB72DE2E259E656B3CC4AC3B96BCE15C778301F304394D972B575DB7143046281D0D69ED07237629714B76518B5B378AB94B8C082AA9C972DB8D4ACABBD7983D08274777F11577F4631B5BC758876FBCA5B98AAD9972FAB298831DFC40CEBFE8C0D862B63B430CC016B3CB069741722D4BEC1B4141499F9999971756747A45362896875E60D896374B102EE5BD28DE63C212866C2CBF5A88BD2F6EDA537E846B21619D0C64EF8F51EF34788C0BC8DCAF2A5F53B411D71D22666A7387AC05C53D4203355574666EE2A07FCC55FC65055FA45664ABE586445D75954C1AE36D1135E322B8B951946C2F318CA5ABF256F319CB43AA069F7943560B9CDA5BF30117A339DF132236BC43456FABF8994229EAC4157E8064945836710860F8887F48F3D77B60B6DDBC71881F71326F6987958E8E8A8CDE38EBDA7CF7EE7C0A99D5CA83378B732E84380B115E3F4CB283AAC7A4651E9D2532AB057B44B08D519B8983AB3D919CC4CEF17FB989AA1B7482CA3A9ED3F4CC32D528EFA76E7DE5433B960B7ABCF59D86519D22810EB986811E91A5A33D208CB473CCBABC9884AD8A18B5E28962E2D6AD16694F1DE3E9564B598A519E2BB137DC825A9D296A1020BCDB00A1B0B63CEBD2D6A57AD1AD44CF7418D9A163285168677E0DCA254D27BFE3DE05CC7FD1837324F314D14959C516E66308C555A323D408FF920B73715CD75B968E4B4F4BDC4556C2AAF58CC5AD744385C6E2EF46ACDA5F699ED142E9AAED1BA5510BDC955B20239D404A2C5188AF27AC680756A26DC7AC716025DAEA5A82186D172D9063CADACD17E2EE0F71B3865897C300BAFAAC5A02D4AB2F9852B641CE35B06CA7F7506F04F494E452A1D2E06F62837AB8803382ABD22F3197316B47B114F1166C94BAA950E33A9842A7FA85821FA9114F49F54C7CF112127DC461E1FEE10B8B17D63B1EEEFD63D3E654AFA2A7D999ABCE49D01C4F6B6A1AEC03EA6EF766C7722CA3D7A483D53EA27C2585EAFA8467FF2E3C91794C84AB227F4E61AF5A096FA57B089E1F8C4785C9E9140E5B976DC5F587965BF966A5FBF3A14E8546DA814BC7469F9850BD2AC4E8B6554602946F416E34975515DC11E6F9964DC6B802AF466B304F1E214616A20670A0DE351141A724BFC3A95DDF857E40B7150E8BD88A6F995DA5373B4AB505DA261568197BA441E3553776C5F5C47EA7901D93DD605E96C05835CB76F8964F2722F3ACDE9EC45ECF10032E23A61621321C7C4425C862B852CAF495DCD5679AC4B0F2DBA96E38E2521A751F613AC5FA88C24C305F12FA916A9D4DD9C1D1DC602CD1220BDB1F7135D784C73D71B99EB336C07DA55CA1CD37F113948DAB71E91FE70AA0FA63D6644AE6FBC049BA40FB42A800E97738C250D5DFB9E61A95ADA0ABF11B15510A75F11E861A08A43ACADC5143BB0B4D4EEF322F223D1261D441B0F6802ED7695C736712EBD4E195453C50B7E5035F2403D1070759619A8C317DE10D2B24791D995D8E2DFB947472E259060753E03343B23FA2985FD17ED1A33747119F33FB887BB096FBE23EE01534A04D78222D06EEC35ED110EB84194FDC7D91015CC6C5E19BAF7D60A65EF729A9751695C39ED1CE30EB2C19E3130B997AF3ED064AF509B63ABCB41A76ACF2C70DBF2A55E335D209B7B581B25FE97550D5BA57CC04A642DD30B87BC772AAE51DF7F5945EDCB65F32BB92AFF00A8D1AFDC307F53FF001FFBB3070C071BAB99A56A53C7A4AA9CDE615A9FCEBF12B7C9FB875A8D5B432CA440B6C679C71102D6C3875790B382275672551DF319204C84CDEB9B9D5B7CC060EA6BD2355EFF0049538D12DA9E08B6883259D26EEE80E7B6A5685DAB5AACEB31E992A104941D70F99746854D6DADE877531DC6101BD5C3FBE813EA328791ABB7F8961230066FB6F4F0E60D7660997AB2D2C345D5A9CDDCC5851932F433015E19004B6CA8B16E14C9AC2E60AC839E756D9F4A964C0B1191A6B0449B86C86BBC4B52702D5B6AD8446692806762A1128D83AF398C1702C1BA3F1691779A688A8F2CF61E93E54CBED329BE3A4BB2733AF867C3737799E8C3305DDFB9F3BF89F193E0B3E020A9FC14FADCCF98FE5CCD764AD7B9FA8EF0DF4FF89FE4758658E92D1565D542B82284AD1E6F170115BBBA8135C2689BF116083152AC98094724AD8AC85A40D770DDF5EF0A82CDB491DDE6DBD04C81DF3033B433173B7D204F503745E735755CC653F45B338AA21CA6551495E6A1BAE8446581AB0F79A8F682FEE14ED58BEA4D36D17A4BEF2FA996CF24B5CC5F694BED02FD527495B6D0B7312CDEBB82C270C85E0B04551D2F5B585F0580A22BE86CAC694EFCC28795F654C85D14444014A5697C53308605143038E6543EA102EF9A80859913A3383182BD21C5949B892BAA836F68279AD713D3B40EC20D8EEF2B2A27A901529BF5C4372D3406FB9498E9069FD0B0278E8E9158FADB38E55799BEFD2C17D858A365B6D6B71E8DC85AE52174629413DCE627740F980CAF78C1938E85B6CADF5954542CA2C65F31E76A4E5A6DC76880BD41C5CE42F1AF999739D6050BFF0010F9B008560307CC512A1A3ABAABB267D22838581B02C4CEE257A54D9871A7313AA1413037404B3628CB9B811E2C9DE515E1B880692A7C4B8A8220B5AB9C21BE910470907BA44110E5C9DC2D46C5B5093E0653736A0F300065A9606E9835C461760EE567C2983CCCBC0FA8E598A2FDA572510DCB14EB7EF314F52668ECCABB4450B8A1F608B1C42EF029ED3D160BC344BFCB76649CA1E70778E26B4DEA542AD3B6A109C7694CA1D1520DAEC99C530C246CAAEB0653CAE77EB01B0A1579C7A733A1AA6F98162A346A8E78E9152254B02DC178E7885CEC2B6D61A1E919204C306B2BEB1E946E01325BD22A29529B1D679A25C48024760A8DE1B5C02CD85B7AB6E2AC1CB59E671AFCBFDB9CFAF59F411537D1A8DBF0633DA62BD094B32FDE152A181AC1EC46EA6235C86273BC6FE65A7E2855639C5C51612860EAF6E217A145A5A59C7789C063702C9557B97E3DFB8357CCAEF466154BD221C339D5FA4425E821128DAC76B7A42AAA0AB39EE26AE6228C084CE0AC47BF695EB786BC933E760E857DCCF7C69A0A15B8D00020A1B3ADEE093FEECF82C5C97700C65377A95C46DE7894C7CB06C4AC446D56005AD8A36B05266B58896BA4BC4801379D5F818221CC01C5AD1F4C0C14383912242E0856F8FE20D6952BCD81AF3B897CB600E683128CD8872A58D87822A7363A02863C1714F3425EF9DC5CD46F44B81D5F78ACF863AF03336FE9051DF3161E4B80A3C54F9FFC4CA26FBA67C2E48783C30D077654FA66CD703EA566F48ADEFF00CB9F34FA9D67018F497355C1FA9B7CC5854DCFC33958C27BFB7C13B9340EBCF6852B063BE915A0D188F4B35852E3371769910BC11958026214B2732BEDF313075EB00C6AEB1ECB9D3ABEB379A6D0E7A37B31A6570F1585DF467DE63E442B573794E951B3AD3D75D1D910388C2B6F2DACBA72C3618BB08C69029759EE4E65685B7886141425010179696979062A07A4117DE67F5331BFF87F5081729D2F81942E75377C5CC8981CC739C387C4A3A4137B5304A2305D3340E9E972B91814AC639A8396C6B81D847A1E8634981A3D18F2B38A582A297A63106A415214AA89AC88370D1575086EEC236FC20AFCC2AC17343EA3068DBF0375EC4AF7E055916EA9393DA2D1310957ADEB8204A0AD9B051ACE3BC5166429C95AF12FEC246CE352BC81C06372E0B5BDB03DEE2CBE0888451BC530B6E62EB2885DC2AFAA20ECA527794678739660588484390E331AE4A243BB2DF0281A4BEF0CFA205A5C2AE2D905D68E3988EB059BBC710BB0418C34A1BF5995F4130D36BEF7128721B58C5D0C380D2097BA95F90D4B85E63311A78804DCBD6753CCB37E1CB1A579C297D65EC761859B472DF32E2986BEA3D1754D11FC9F70BBF984AA2D372A0631A22C9FE65995D9F300AD15C2BB11F1AE1033C4B05BE6E58EF39E6515630EA669D0D2EE592DA0A57B11942D9DD8A257270B8D418782C6888ABC6E0105A64B82B8648A447CC78DC5CB286AE76246C885396A3B7748F05CDC3428ED70F82AADC4B5DCA522F33867005CB817AB3035BF1052C9569EC19AE23D602AD91A5C1CB995EE842ECFB92AC78B7E7A622594D91EB128D62EB536D391A85C1D5F49B34E2F12BBFC4AEFF136FF00828CAA3BD85E258C775A851B4C555FDC473D307896ECDE1837DE3AF41613949418D8B0D6E1F7EF815FCCAB4D32CB4DA98B398E568A88D161CE7344313530C9E6087A8D077D71E6218A17610E9B53EB5B5462DB746D3D324A6FD98191C5E25DDF372C958CEA190D7068E35DA17D30C9C00AF9084719D00C2E0DADBC330861915DC587554B1BAE214171444B74756601E6C15BCF30E71A85803F926554DB2D2A7550A9AAB154AD63ACBFC28019786A532F109B598C30DCBD31D7BB1C9CC9BD8C31EDF011D549F8813C23C0AAD7BC6090A8BD8B4FB41B5A0DE7A408A1B0A820264B88BF19236D8A9A9CB2CC73E21F3D8D4748CA5DF68432E9150C8FB4B55941ED515F503115F74F5B940DCDEA0A1360C4B338C6E2208D65F333535153C947D44F6BF51A98F6F3D22717461ECCD25B4D92FE2008F0C779559CD9A84B4DDB11D5988E9D8E20AA52B39265CB5AEA9B8F67734460738E2A55DCDF3C4A979B87DA948B5074DDB07586627640D5D5FF00106208519D939F4811868D056A56E30454A61D1D732DBBB40255B57E900B79ADD8E2F46125E93212AA514EB8AD7588A156B14820582ABC47A8AB37DECFEFFF0086C9FCC17EC9B89BBC3349CA7E9299AD1F2D44EE75A8DF78AED8D5B4C85A7B35D615AD3362AED00D3291CDAC1E15D4466D30F6F667305D96C2B174349E26224FEC00EA18B6AC8AC76D15ED11B983B839ABCCB20EB29FD4ACCEA946E21F5D142A65AEAEE156CBF68385B67F3398B9E2A590C7AC2449B155FEDC7860D62E3D3A2591673A60655BDA856B53147FB317BD00E037FCCDCF32D4E98E236BB7E7372CC46D9B1B1DEE06C9468DF10FD744D1FE3715A157F8187EA312F236BB7F59630817E3ADF1283050F882DD5B61624C9E61E9C58FBA6D353EF6275ED22392B29A94876625BC43E85AF598781F52EFF6E653E7CEFB67DCABC79DC71292EE9CE66E7C67D7F70AAF1305F1F85BBC4FA0CDAEE7EA194375F8707D7181F3325466B5E318885A99B95CF47444E067A7316E1C65A84B64CCB8A3921D61997E86AB99556B616CD382524A2606C5F53D650889AB9A037D3D632CB26BBC517B956BC929E4DAC7C5F520E69E2F3035A04DAA0A205B47BC05291334736986E57DD0489D2F306CDA27C9708AABF3A5017EB05A74FF00B312F5E65F291B101ABDCEE4B272D7240677B49A7153275BD455E23A3C48E740B01DB37287BB2B0235DDCC68B60C935F32D28303651674B8FF00B403B5DD64ABD102C2ABBD4C93A50140C63E22B9AB6065E3A451A514A90F32CEC0D28D460B1DC15280EA62F880649AC0A829CFBC2DA37AA8CD6053AEDE38E228A14B16A0853E05B3EF29231DC41E034519CC5B18236231C15A8590CA3600C14DFB4A16FCB2C6B51A8C6AB6798994D168789C68EA4BDC18653A166376F1533E6E04BD572E6AD71B822E0922E2F4A442AEC8C1A65434B6BC5F58171B36DF379E916A65572C8AB8CA66D1DF18E90835DE5365BAB51AFE0C9138963273155BCE8C460D2577D6EFF89737433ED2E2CC72F94997EEC67D206A8370F2FC6543D417E9298DEA380343C1D6636152F1C42745D04F4FEA569ED9991962EECDDE18AF9693DCCFD413C5335633501DEAC155EF026B24F184608D5947A4C576665AF1BF82530DCDBD07DA1A67BCA7C57184703860EB7E8DB475883CC5F0C9CDFB42A2A4654E68EE7EE011F646D1BE08C1CDD8A38182B65B1B81B80A37B7797FD733F61B5F1983AEA6AD8C5750FB460F6C569FFE0E237F8834BC193A4B3B132D4A11141399400C7386A77FA97E58173A71AF3031550B7BDC081608BD198C16D09A7043456E455D18EAADF114B556DEB2A3F7000943B04C3A949C7317443719B698B5A106C22DA7434454F66E587477D21C9D5AAB94B736F2CBF2F59966AEB8E907A08F005EFF00336D44A534D0CAA10B94B3025EF70D6AEFEE5A1C445CC0D26883E90A26434E8AD45A1B25CD9CCD3E8E5FB8A4DC736095CA5AC2652FC19EDCC4D7063A4AF0F57500BEB6435F151633E37D3B427F6827A5C68BE060F603F2C3DBC7EA2819D212D2EEFB9F1505FA5F51ECE485AD987798E5E97CC5CA349CFB4A53BB2728E7AD6CDDE1983FA4A13B9F53D8E3B4EE09F7A1041358D3CC1DCD63ACB1A53D2512354F11BFBD1B86CE29AEB29E2F12B72A3889A5ABAC4601D304727A1807444E18B2523EAC72F8D1C8978CFA4DF9D1917D008C0FFC84E29B28AED32BD822A814EF19ED378A89A0F2DB312F2DE6E354351B0AE4CCE5E23BFF00A7CC7A3DE1F75D7AC69A4D1110C8B61D220CEAE92354B0352928732DFD47FA93D66DFE20664AA734BC6A1926E8E8288F704EA64C454D4A117CAAC74B4605771995323A112C9176ED016089D588D5ADCC336CDC2571CF31E2DEA15F110638688952DA5F74D324A5716E25693BA3AC28B8682433B35DAE051CF03FB414B8D15DBE65A05A593A070874872CAB6CBEF655B782C7F5111903ACAE3E5831DB0362E49D6251628EF99E0CC34964517C7BD41A967150DDABADF685A786329DAB3B4A0B5597D2562D367B4635C001ECDFF1379C5A2BBF09EE4B52F207E2345BCDAE58EF57EE3E53630F044C168567B47C2BAB18D79CC76DC7885E0E5A3F631542AB0FA411145FF12D9B873620E9E1CC2ED8878A317F119414E0CC37115F26563C47751966195D1C6608A57DE01953AEE126E805E613DB25DDF48540451F317B4440735A895AD3D18EA8B57A95CB5E54E663A3550473FD4CC60B6298D9B48067E62000E3355F50148D44C65AD912D66945EE4C31C92EC93422E25AEFF50BD567A7FC8D4E9735E3E27038AE7AC0400D0E6BA91BA2ABA010884CDE9809594D98616D5BD70E26969340B652C42E2B405596E48A3E8E96AC68A3AC299304D0A2DAD67ACBB368218D1A3DD83A95A870DADCD6F6752587A405CC8C2B79815B212961F329BAD425620D38E60D95CCB9A183262D5B4BB02EA5CF5C0A7170F2E6AA8E31300A2D0BAA880B2AD70B96E3A0B40E4E731BD0D8A78F48F8AC1A1E222175357320362EBF72F136876C235F101E3200D82D1E8F98080E09E88FA66566019F881784F859453D0C331337FC4563BBB6FD20A6E319F7999EE24B6FE8A3CB032706FDA3454E04971F74BF594570EDE26A7816578838ED98A8AFBD12BBD24B6F33987C3026DAA7D264E75AC7A459AB9B7BCBE2E92CF0EFB423371FA223DAE7C41730FAC61B5EF0C7714035B6E9D4679E5CDC17D38CC0ADBB399AB3C9E90DD6B0E6E1DA3D36CA731BAF3182F0B1B16E8B234072F79A1BBE932B899B19197AEF638AB866825C85B03A85B4C856C38C5F4B88532AFDC7B0ED4DCCBDA3BFC12A386E75300FF8B18D43DE549CF58628D81B3D254E40E3B47AD6D8174AACC0C01743C42AC36DE08914E3056E394D391C79815A146CAA25FADC46E3419CED7B6E1449C0F5057B46FDA557342DC45C488B347177F32A3BA37DDCE183BEF1158F4753F7861DADB86F9F521C3E90E5F78897151272F30DB3CB0DAAC983BC18EF20A71289D7A00F596F7B945BAE62512E89C4245D7B54AEABD5BE9354772CF094DDD4043674186BC0A77856B848377937F868992766E55665663BFD7497C1594C3C6B2DE05970058AA31E90EEED15F89599AB8F958BE57A76894193C75CCC3AE683D235D2BC3A4B9F7666072874EE4DCFF7109BBC10F576FDB0D578D07A32A0670F13824BDB352F9CC778713E032EF4994376D7B407CCA8AFB4D4C471CC318990F130BA9F3E4C473989B348136B581B62730A69597122CE527B45BA2E971295942351C55C4399646B3042F250495BCE8E90A92EDC3CB131613BAB597CE05181A1BCD45CCA1050531F317536919646F921FD302515C4630233F680B2F8732B61B43B2C1713F02DFB808D956C21A2672BCC52C8D87BC4A18AEB8836D62AC8E5EB14922561C67F51195AE9C8C5155962E130C41A2050D079996897320A6EDE8665BF8E969ABBB3AEE296520A845B69D3253C9151F4502A00176DB75D20D6750A0EA879BF045A698427713B21965FB9837B4406239899CE3307D62033E8FE6667BA6D8E91D0BDE18AF59CCF6CB848A01DD7596A706DB7D60F6BB54873DE2DD8348245BE3882200E60D09483DBCBA5E51916538218D59517BB2E3113154746A20C6CCF319E705F7CDFE688EA63A12EF17C40CF9A75C4BEE1C8AF78F4B805C2ABE4ABF132B3A97101AE166D4C6A2536AF7AA107EE08110117D43881CBCA27C4C6CE557CCCA45237F108FAD73E91BF15176EBA8BF59C97479A97B98A75297A5B9F481CB76DCE3E582BE6DC4B9DB51D259E52B7C073D61383999DD4C26500EC6A0D5ED6BFA8D2FEA8A71E6A395C2748F587586B923826DC3488624037595D22AAAD5C798A37B0A712E0B8CBDE5F3FEE65B0ACFD0BD1ED0F271507045C3471C60799999A2855D3752BCDB6E4C6D630068686351D2E50E63F6FC6C7E2AE69B997E27AB54389E07D62A5712CF49D0F1A7D23CA0F5F51CDD12FDD1DBC854E2D956E1473E6A616ACC0D062DF465C9A765D2B3ED30EAD8E1A52FB452260BD571A6B4B877DD4728AA3BE6E3D7EBAD584778B4F59637B35AD0C6737589985F17A9983CCCEDDB117E135F59EA7B43D5F13FCF79BFC04DDE27A0CE62B2E321F72B49E25381C18B867241752530F106F51A2CCF6994CBA70D47299B62F52D6A5E5A6A08C79B2E2C175D976CBA5882EDDBA8F5D8AB960FF0046999EF32F1297E3FDF994165977ACF030874B384494ADEC2C8576A903D73FCA59735FA825CD06FC216C54BC5C7F09E42B53E39FA8E8BF1F533397D25DDABEE51FB7DA5479A61DBAB146A7FAA7DA99A7412F0BD27B2C0D9CCFF2E395C78D9782E9F685DF7CB68FCFBE5C2E13797D2216158D10229D86A66F7F580ED73F1312835D6677776D512A6C73CBCEE0E4357799A08AB02C2AEAB05D0F212BF192B4021FB83910DEB41682754367246159E8EAC528F58FDB033AE8B2DD66E0FD4B561305BFE168D7DAF32EFBA6C3894A65D4066E589834388FBC05E310675B767A4618D0095E6069554327886D288AE442CE25F95681910132AF6B981457CAA6A0818003658CBE6EA1F5181E09A32A96F033403D96AE3948451B4041DD90AD6EC3E2AA0A715B44838ED0C9B4B65BC3A946A2C01F49583D3D262F66212DBDE653B43471E92D212DB7ACA957170E7DAE14C2A912ABBDC44D00E5CACC05401C546B731401DC78555A5D53ABE7E21F4A9C2EADDEE1E635762D8F88E1DE81ED07352CB74F58E6A78A18338DD19E21055744175745E5525070B5FB95D99BFF001FAFF305F82378EBFC475EF25B2D844B552A19B81D1D9614DB859BED0295500ED923F2F22455534BF52C4F541C4B63071C45EE1AC788883844C3C07DC132BA7D1025DE397B472EEDD3B99B7D496DB8E9185EB197737463E8E7131A6666BCC22DB942DD7AC3CBE1796E57297A6218B6077010D389CCC788EA1E23D7A400D72C190F8D6673EAFE181E1B839AB0EE9527AF685AD460C87F751518A5A1A31A399857A8C2723BF5992360B3AC18EAB3739A57E50770C4A863B731A8E764C1718CA43C7A6B13471983AD29DF31B280B0F584A08003AACC28E16E0C1D7A40FC72BEB97B438C05A6B868502451A7A03FA97691B0F0B125125288BB2A2D7A44A2C80EAF788C78924D2FF77EF3022DABF4D4653D91CE6286662FA10AABD19EF9156E36CC7F880278EDB807DA66F9997E184A2F86581C743500152CE65BD7DAEA5E2D2FE23A566A5D9C46AF1181F2B1A3AC3828CAC3EC495D2B08C8EBB623768329CB6E9063194019BCFC426A0AA4D2D7398A9F1ED1393FBD15879B6F1F8DFF008FF1EF0DDFD1847999779C0D57EA753A3A2533F417EACF4FCBD2037E2D5EE42D5C931F7D72F6F766A43A9F4988747E9F81B15E9F784D6E1BF04A2DE8FD447CD34F88EAE667ACA3CCC073F24FDBCE9FBE2627303796E755A65C60BDD621BD838BC9185183A1A97878F9FCE8C024965B009D601A3A730E77BE27997D2332AC39E48CC2DB4A95DEA372516BDE3BE2F2C42ABB1723C7A0C3F8C0C9D65DD2B38F150B186C6543B133CE73359F79A45683544CB5B878851ADA8D2B67D417CF02391E6E05512C5BDCDEFB86DAB9A95F8429930A46DEEE22AB0CC696C62C8A50E2D2B8BCC1DEA5785D9AC91A6E5A5D0DFEB897995AD0343DAE59C988B55FFB129AD31305B2F7D230139A800094BB77CCBE10A0AA1BD7BC5F92C2A1918F54550780BA0E817A805F0EE72338B9BD910AD25FAC08371CEFAD4DFE8CB5FD65A83A312C07AFAC232A3A1183A603D2B6C09D0509B7821ACC814A0FC7CC1CF4AC07914F1DA0F22AC0717DA0212D6E4291C74D71096D615D03ED1D63477A00D2752217208BECEF1F31F0C61B0F9315D2E0DA681B56988A980A068A2D50DD3590749C3E66CF2CBF334F48EBC6FE0501CECFB8940EB38ED0989B15350C006B9AEEC45815FD202F66842FA5907C88353A710D7CDCC02C82834BC666DF3777311E301ED2B460459C39231C680E071A263574666DCDB35F99BBC131F98DABD92E27AFC10843A2FACB2DCB7B9CFD667ACAE9995D4836E8C12EEA35B0FF00AFF053D1FC7F1316743ED28A2BA1E731157D25753DE05F10AEB1D60A284054F48F4E42056400BE19404A24D80038DD9D63EDD0086DBB8F61BB1BA960960DC0AFD7875A63D1F7B3B45A97DA32E311E7316A80C1D83A854815866CBDF5D4ABB07005D6B994FD5C69306AE4B37CC03288005F7C44032669103924AE13AF58248D40D2673EF2B1A19D0CAAF68B45A281B4E1F5AF88BD98149CB04FD5CF57F08465C513C42A5AB8E0F882F0EDE0F6963F2E1D2282169293C12836D620FC8FACDA7810D1E650F7815A1D332E32B3C1331486B80B71A96A839E2575C44159BC1719BB0C9784BB6FC467B2802A59C23D605F9A90BF68D606A697977F71CFBD41CF89AE877578C48CD432D0D577986D54980805389419F797FD79E0188DCAB1DDBD188EBCF59B6769B3E202E802AA68816555B0990EE6FCCB5DAA8DD1292984ABC27AD2C23B0B859BC4359ABDB2ABD5AAE66201B6ABC4B5DCD2E1613A286DF5828EAB82B714E6AC0AEB895B9041ADB735AD8B5D0423F31AEB1617CBCC475E21E8B9F315AAF88AE8EB2802FC7A12BB851CC0739B66494E9F86BBB033FDFE3FDF9FF8B9E9EB3E24C41DDF64E3E9FBFCA31393FDF30E40BD0AACD91745F13203089EF97760081423DE3D0E29995BACE3E3F0DA1871100F17980C1554ECBE9058C060E9A38834AEA6BA44ACC5EA5BAAF6F118069111E9A898F5D6866A1CA11CBD264B62A60C519F58DEAA57EA1C07BC626A9CD114365EBC39857363316DA4B65F1A982FAB21C801312629DAFF0006B9F039E65F73DE62799DF9CE3B970BDE62F5E6019418E19CA5DD08904A2D6B5D0B278CC33C1C4FA4F897E1E7E5830173A97AF52F3E9170351F687786E0745A8D08AAE5EF1DFAC769F6AA9ABE2BEE2F257D33DD98ADBC7D91999F67DC58EA1EB345967E585E96A5829CFDB12A3C3F5367AB374EE7DCE99CFDCE93999F99FB966558BF245C66908C132BAE3AD8C5D2AF71DFD4CC789B7CCD7DA35BD09D5352E87BFAC7978200F53A4C43ED99511BC659B3FDC43E9F88D651AF31D0D5153045AFEFFD4369E3F712EA2EE3A7F52E6EEE9B4EB18C0ACE71169CEA3CA2C001C5F78BA48C2688835EAAEF493658E879FE2301E92807A46A2A8B1302E062B8B09675859E142A017B83F7AA16BA3925F0988A637154532665A4DDA6EF518251DAB8CC60112D1CE20AB281B101F9A94A842C6F4FEE152AB796B99A5C41076022A0C411E92BAC59759604BBEFCEE6F5C6A3AC6A9962F72DA8639D32A773FDCC24CB094BB68877510CDD67130673C300BB662D03692ACB8B868E2AE5FF007994F1730C57AC46FC446C96DEA2ED2CBB99372749825F5A95596CE951D56881D2D5FB83C453D40912E5B9317CCE9E652D3177D22730E3EFFDC74F76B007EA79A82EDF94CFAAD12585E41EAAC6CBCC6AFD62BB2507A9333E4AE9788D4B7669E9008178333F80007917F12B474DB8875776BDE250B658111CCB06FA40D17A96D3CF29D3D31F1143D1A96AF73317B899175AB980DE5264EF728EAC01799A3C7E2C871B3DA3F5F619AFFBA41ADFA4F07CC56DC7FA9E4F6981D093DE1BB39DCADBB4C06627A4416A586525FB2E01CA979AEB0DE0D4B8AE588AF1391ED077902577CCCBFC35E1C4BF484554D496AD7E17F0192A3B2D55C6751EB072B82E27B82C0DC0E988653BC64A3CEE5EAAAB333BD5AF1C04B6014A5ED035022965F9F9886BAC0AC6236F8C414B660A5EBF72D74A189A92136F9C479EC2CEE4B687E0AAD7CCB9DF7D46CEE38FF50F946506EE65CD0E423DC8F2C73328686E25DABCC7A1F3316A5C556B52DE2059538857C312B43BF585B1967B330C56F3DF03F640AB1C26879FCBB41EFBEA65E64A8DF07D6E16CF74BC6F6FFD868A0A5BE2BFB97EBCBE99FE856539FF00F1829EEFEE5C16A9FA86754E7AFF008CA234C5FB907D65F995B0E4FB86AA0BCA032D7513C921CD9D67C59B7CA7C4B9BB254C9AFE257D9B40AFBE3315F129FF00C9A9E237FE215AF4ABED882E3C453DC8008BDB1D7E394A63616BBCEA9B0F7407DDA9BBEEFC1B69FA97234D895570AA54ECAF98001555977514714D6FB46A8AB567D66C896870BDE2ABC9D452DF86E3CC4D6E171539C6E0C4655C912CF92EAB8835018EEC46F43C663C05E3A4B31DDD0D0B4CA1742ABA040D9185730F38BF2C01B0C9A8157207339F386365A3367D66F3A350A1D4F095B1081E2256EF1B8F79D46A71989B8AB3BA22AA711AF6553D229BBBACA9313A9A206870EF100AD64260B38C102CE48FFAE02DF111B3D117F080DB6B8C60817DC74F58967A1555D9303CF3141650DBD6380F3295A72666263A336F48C702DF500768DBEB0216D8958EF12F3E8B261BAC15A6A62BBC9DDA212E2DEAD734C7E80176A63A0BCA67DDDD4CF5610699D47E6329B91024B1234AB1008E80EA5C33E3161E082A938625778B5CC15DA3927522F606E51B3ABF51883057E89749DD434FDA3112F3345F49EBF3074AEF5138ECA865F57CFF00C5E597445D5084B42B4BEBA8F666977C35FF00B056FC67314CDBC4309C7786DB50019D71EF0CF1A944CD193C8E1EF0955D0BA59BA466C20359F79414BBAFC17F3D51D2798BE14355C66B137D65B75298B808DF025124BCD9B81425C0B4BE611D6C55E20BB62DB57B84E9B9DB840F898C45EFF15AEA00CB97565AA6870F694BB9D9FBC34D9B9B7F1EB0D732BB33A68945DCDEA11C95E60DB0F2C29B3DE52DA77AA9C86770A500A77FDC618520504AAC37B8EEAD881DBAC46A9EF9E398567BA682D80FAB000A5060EECBDCDCDEE3F4975D712D7A75196356267AE66FF6DBA9A2B6F082CA4434C6ECB6C077A881386A53E09B0066E5ECCC9594D49CE18D8CB1D6620D9D4F69665E8DED836C52D4B9AB602C4D2EE15A0B6688A44C19AF9202A2362939C10361A8CC6F289B3528C95E61AB23E185D0E5FBA97A78FD4F07110E07499AAEBD653AFBC161F837E67E199275561EB3EEFE657CA3AFC3CF894F763AF2B0ABFF00711B3E13022C40AE259948B612AE5D5D685F25CF99738865492E01A79E67A8B1D23BB17BCC5CC4C40FC014F4C4A02F1AB8592F3C748972EA52FE314B3EDE91D6FD60E199FD082B0F4E937F4831EF38F998E51D6FE21DEF8F48CEBC40830BAFCCE13CCF399364ACCA30EB663108796156FD6E268DC1747A3015BF980533CEAE0DEFE60837F306D9BCF586BCAE20FB3AC3E5F32F11E607AB52F9AACEF682D7A5B08FC18468429986547CD4CF6E20CFD7EA7C8623D4598AEF1B6471D2587753E2727B47C1038B6A7D19EAC2FBEE7B7CC0DB4BEE5BEED3F71B1747F7010E8F98DDDCB332FF000EB3E17F53E1CCC7BCABC4A5B8D131F34D1EE7D4556E84D9F89450EF64AE8631B0C6DF6344EE4AA9E557B31BB56554C01B8169D7F0336A8C1A645C543B21EAF6314B1AAACCC37528DA678BAB6AC8B3CD35954AB5E93209E0C122EBA5044E936835B58C8CD8D54742F5CCCDA18B94F4972E5BD26908608B57865ECEA5607A5C094CCB4406763528179F301303D62AC933AA6220155C1326CE9199F58D7F515E9EB341DC6E9EFA961E75D25E13BE22B762DE91332B7DA2CBBC4ACCB15796EFA437053304E98C26654AED07064C0E6E6006C6A3C87CE2AB9DD58CEF2AE19619D1D66D7660A6E1C6BD60654C952FA74B173103D4C6232C8E201C3CD1D61AFC3CCE5E23A67BFD42C97B6BD622DEA9F70A8ED2E742D03DA0D17392FC1183550CCFAC59A550DF999F70C79940387F70326EA882B6018ACF4976E7497DE315797DCD9EC982F53F44058650DFA4266AD5D4C10B2E2A99763ACB89C2A66CE2E10EE6EA03B47571BB8EF9823AD4D3F1B1E1FA9F359AFB7EBF13A99654A19DA5A3D9F7397B7F33EE88CFF6A60377DEB751AAC3DC995A6AEA655835352D70F51BEF29D4B4742A06A89BFC3A99ED33DA67B4D2724FEB9E6A4B9FD4A477263C7B510158E7B4407257352DF32CBD98B9899F9942F19C4D6F4997CCA8BFB8DE7F728A4CDDCF7FE3656A6CD4F0CAE98F795F27BC7C372CFC67FAA85B7D2668051D660BC389FD660A1AF375372770B05693ACBD0882C6585CB2B0BF62A0392DC5A637CCCEF440CD2555F678855CD6CF25FE7ACDDE20B2F3F4C5E4DB1D03A3FB995ABAC4039749406F316050977E9299FE3331BEB5C799A7C13E42FDE392EB701DB82E779E999EB97DCA07409477949F8207A4C92001CF89E436EB88B3D0131F57EE52DEBFC2543AFF0052A57D25FE09CB5EF158D4D3F0800E8FD32CDBD581F3FC4A326FF15120BE41A957253F719AE3355F31DE7A67EE559B6509DB32743176EABBC2FE9A25D2F3611E92E9B16CB295BC1CBB81A2D66287622798ADE7F1EB3D67AC1F1073B8A83DE66786B2C306ACB094FEA2A8890C941583A86B4B2E5AE23C431B5A47B545C48C17C301CBB87826119D9D2A68F594D62FD6200F35D230F6BA890F9877AC79E2A2ADB2CD7797AF61F98FFC41BF7602B98BF484F754E1F921B05B8CE63E9D25C9663BCCA1B885B8231469F5B6BA426E6150530D829C9C40AD155543772FAC021EB3A7B4417CCB5E912DF0CF637E9895776C19B0CD63CC39DDD759AF18AE3C4612355AF79BB83D999862991F33303D3F8863676FB9B694143BC5268D17C7F32C9A8EBDA2B174BEE19B8E095CC6E5428E3A4B9D767CC236F6DF926353572A49D2668D422A77FE26003C43414E20538EF99E3F794201349474857E0FA619EF43C416FAFF00BEA0D97F87FDF31FA4587CC3A9C7EE6BD6BF9981D419825171D81D1CD4AFE98BBD573729FF0017A417365A9D659DFF00BD0BB8F727C2E3882F895F86262626262586A5531074E25B6E8665007394C14E07C4C6EE5EA677683D3DC84675DEA73EFD21AF7E9F87978FC548369DA650D1363CC7879CC71A9E614BF73C20727C4DEBFC4516BDE3DBFA62BE0DC6DB5ABF106F24D47CF334F46288EF0F67E266FED6F146CF52E3406836EAEE538710D7F68FEFDE6FE675E9D664BC4F86FD33E4BC779ABCBEE3D6A7BE7D543DF18788E2D1BFF13936097DAE68FF007484E2DBCEE00030A0F8608D0E8E949FC472728B13CC9F19968BD3F50699E2B5353A626EF59F3768F5ED37F67FB9573C0FD44ABC8633B95DABC7B46BF6998F8861AA86BD25BD180AF63F530A3193001F6FA86E3A8B0CFE07E327C09B0ED996F4805604EB52FC0BB1AB887E0860BE9AEB52DDEA3AB6148BD99BB60725C79A732ADD47734972E5CB87DA543814C5CC768EC871412B2590E8EDD271D20391060C54558959B60C40E60068403754BCBE902D80C710008A2B6987B46FBA5B5A88A10B10299960543A88946E3AD44D68D445C0D9F72A32B506D94CF5993F6CB4E7B43ADEF71DA61FC4D798B1E6E151D10B6316B123F6C29B44B7760D4B8B21953495B96FFE4B7ABEB3F99604665376390CD25BF12891B78983653C3D6050025750748E8D42C9832FC4A3C007274773D20CAB021471B817EF516DA52A171B89D930F78C1054D5E0F4EB1F97B0B7B2A56072DB01BC1A14246AF84C87884D2F6F10AE8366887D38DD4A93C0447A339D119C3205B254502CB0789BBE39F33A4E6A51A85A56A69F8FBDF53E430FE3E89B7E469EB12CADDCBFA6985BD20555D129FF00C47DBCC420B80896F7947CB4A8E52C32F334387A9B1527A42BAB8B38CFFAE6291C8ACC0CC28BC6216DE63D91282C691B8D8C481925D0E5412D38837C02A88780AC5F681144336544F74BA0997AC59B681D8367B43CF4684DFD1070C2D0F1E3DA129F7F312A87B200D5DB5A08CA77189446B6D799728E3CC6BFEE0577F302BD738BF18293E938CB7BD42DE779F6845F7749CB7ED0E4E70F9CCB2B83E3332DD75A9A07E25391CB8AE586B38BD66163826B9BE4C44CC547E4A61ED87E259BDF0692DDBBA304C3FCA1DB45C4B6E1B56A2226A2A4F58E881B538F4B8A6173D16FCC1CC76B3305776122EBF7D37C45A05951802DD1D21CAFEB0B3802376E224937653BB10F1BC2BCC369D13478A82D20E45C4C512A2F7E61D5BBB238F1A3E8956E96D7896D0BB5BCF780D361F52AD3D3F50BC7FEA85B9EA442E6BD226F7571C08B6D5C4374C0A84AD2912C9B3E3F714B4CFC4D86EAB135C7983E2FD4F959AFB7D1036FCB1578D97447E9FF0013D5D27FB9956338AFB194F5857A488BE05F4CC4D7AE05099043056C8AB96EC9A970DACBC549A1C9CC7CDCDA2B884B2B7CC7D22C625C1F21814B6C58B0F116406546952CAC47A6388617963A4B19CD320C59D2816C449272F90D503DD81AFF004685EAF31E8B33089052DACABA98FCFC4A0B8BD65E65537E79965F8A9FE6215FFC97ED2FDA5E2DCC8F76E6F967C970AE6E2CBC17C4C28E1002E9788F75170199A5A2A16863702FB01E01A28F10D22209B29FEE1EA4180E9C472F944BE8C2AA46933D7389648157473ED05D66F4D33F331D685B41739819F94AE3DE5BAC976A5C657168940FB1CD731E95439E6559BAEEF5A966ED80CF11F179CF3E2680CABF58151D44BE763F131CEFBF69EF4C73B280DCACED15ED31B67FAA51EF6CE7293B8A618CCCD9AB2B72D18AD171E8E69D45CEF5285E60EAF373D7341A1B4B22ED6898AAEB320700D1EB98CE3FDC4A255FC47FC1352EFD23AF49664DDCC4EE6BDDC5CD55D22E613932E081B90C1E150050D2E1D36C70E8BC40A208F52EC2B3DA16F7B661208C551CDFA4B5FA82DAD8F3899A4EB0CE001EAC2BC8BABE934D19D542D6803961609F516CCF3A4942D7A54DAA6B41CC7ED2975ABF5B9402B4136A756EABC42E88861C4B0058EB142AB18252B21E206C54B1314FEE22BFB00046A13632A9AF5B626566D37FA2794E727DA079A54D3E2117FACCF5BB953AF98CBC73D62DFF0073A1F715D3E6599E7F12C73F1135AF595BD3CB39CCC8763ACADC1F31968F98D65429B6FA4C7F08268FFAE37F52078C626D6C8EA0C6EEB9DC2C31456C7E2A1E68CBB6E5B828544D3E6534C9B2B7E8B51E35309AB993007ADDC5294B7CCCC155759BD6628447C98346E1C56D991157C43708BE9D23A18626168B811EF2BD95405CB59F89705B5CBBDF496373765D95FED47350C3CDD711435CBAC4B39AC984B9710715710D36F3AC464DF2F12AD6AE64E23F8B419B8BCA6B37E2593776DEA741CF5892503CD4A910C9D90183165032D6AD1D666638993AE6552BB4AF734315AFC2BECC6B35617309ED5D7C4D47A7CB324F1F88EE197D59C9CADFB61FFAED30BC12B0148B9AAE20E68C8B79C7C54CB71CF0F871D772D5F84A2BA2E88A90EA1601718A37C113DD0D5BACEF1D61DA94C28C2683434E732CAC20D08E5947F8CCABB6B13C17B4628697D22433D9588395949C4773C3D497EB7AC625953984AA38CCCD9AC2715ADC4D11A9C7798472A83E50DFAD9AFF00BA4B5963D6D1319E5287589CC2AA8EA18D22D8D284C1CF4C4CC4BD8B2BD66FEDF71CF0C0CEBDE60F58761EF3C0FC6A19DD955F99CA997A748EEDC40BACBDA75B2D0C5C181149FE901B49C3026352D736F6CC3FA9664E73128988C2EC567BB3ADC292FF00160C06BA5B6E0FA4B1434910A5E84913B98D163DA679E92871C79B502888A46E541660B2AD823902D9D95799528B375570DE2D8276EC1F442F53F529C5CB0C54E652BB1F51AD9BD57C4C9BE93EE8FD89ABCB2E478CCC7F04C178FDCCE0D6999B8751385F9FC4EBA35A3CD45FE60977BD6D88C54DEADF58A3697164F5826C5F7851F237161759E08DC82D955AEA4764855B498ED88AD150A4CBD1872D148FB3056A00161C9CFDC6EB56DF736B17B6F9350667738BB888B2C4467DE1B38452D17DBFD98BB3A014AB37B6E3E92CD62CA795892FA500EE04B2BBE92B431DA2BF70CDBEDD5FD466CC4F05C405531DA08B48E2D018E91B10D7046B59CD9C420C504A1C11E98A5291B3FB89F942E06B1D21D734E674CEA3B9B6BD18EB9D14B0727AC1C77C1BF68C568DC6BCBEE4B593700FF4979CA0D74986ABDA71A281DF86A52EDF6A6383D74CBAE9AF58E2B6ED01CA3DA005FD459B82ED812037ACAACBD54711F31B40A2A8CEFF005001B5AB6B76B1B790B150F80BED889989E6803A54118A210E51C7302AA45ABAF8806ED2F75310C4C1E23D5E2B7FA4B08B7AC1386BA4DA5BCC11CFCC23DA194C40B767F0957660585AA7982C1010198E94CD6BBCA01AA42FBE2587D590BD4402D5ADBD62257162D4F8E7D464B6CEFE91FF000427710FACBEF1D705DA964FAF35BDA2CCCEA25A5AE0D7383885669EB3BFEE8C34A5296094CE6A1D234AE6A6CD47582986FBC0F59833CEC88B965829A82103FA8E08D623783A4B0676159158AC6231D5AD3D17DAEBDA629BB7BCFACB00BA2D455CB7F9FC39AA86D621ED905A6053D76B00E2AF3288B0D9A54E01DBE2565B405A9A23C72CD0861F0C51A0D6F11D628AC50432E1F423162F7B48A3F8CEA331D202B5AE520364BD0315CCCB76C300EA4D90B31D2AE91A5D5D7B4BA862E08D859DE26A555B6A3573139227494BD1ED045E3A407421F0BD20AD263343016BE507B56DC2310E5B25D35DA342DC54DEB752BFEE105AAAB7C44690E41CF2C766B2C1C37087D56ED25D18B7625958EA2A6FD7C4B65A745971767BC60A2DAE2588EF8206960DB698A46AF226A0DD15E21031FF006A5D7D481DF38A50F8963B7029C3150A9454F10804B0306F51EA05D551C662B179E112BAE9332E687E26FF00F74980BEF31F69997B3156733AA7D711EC96B3F3035B63E4E086C3DE625A52F133F5CBEA623C4B88A6918A9635D05C79A8A5C06F4EBAE655F9260A562D035A53EE0C5C01577E719F68F3A9CA7FA8F77D1FC71926F02857AD469B382D8F345DE22868D84AD30E6235F860B0B92CA30CB73B852925F8FA14C27AFF00EC40CD05560E12B995FB26612DAC438E6566CF68F9C5E5CD6A305D73D23BC73D25671B9E3136D9F1282CBD9F73D5A9CA2354E4D76851DFC43A937D22AB67BCC0E37B8E1A3DA2B5826EE3D22EBFA882F883CB4C05BF18A60E570C04D37BDC0BD75D44E065C7DD8729415E4BF1FC4A22E50C0597006B9B2F10391442CC19EFE25F1C9C3F899C6CA6EDCCB3CFB5C11CB158BA7AC5EF045C8003861857B09FEED083D0A40837C76F98ED5A2F2DDC54DCCA0FE59DD3129885D7AC771395DEE532683A6B0B96F7458D94EB125F89672B3BEC38CCA5FD63A87509B3BFF53542F5EB052BCD133F54C478855CF10ADE3572EEB8EFD61E497AF53F7122825E265627458F84D0097D622EEA5B070CA5752A085E4B413EE14B49842AEF16DC4854C16EBB44B1E25040F2B0F871155CF6160EC625E51D3229796619C73849E6899383356FB5D5BDA1E94DAA3B5540DED8D2DEA95579DC2784AC17C034B6EB5CCC5830B60E11EFB8C58235D2F30470A0BDC70199750767D4CBF84A44B022267B8942EFB5619DF6D43CA72A8517A830041790E03AB8C15B0D04B07CF4D4A74E7DE62D1A8AEABBCB993AC65DC48F3E63458BD8964584398B364321ABA96E28C380F485DD17CB35937AA88AD7BC1A6BBCB29C31D6BDE23637825429FE23316CAF682AC6D3C4476B292D829BCFA4C92159A8B3857B421235C5C4E220AB005DEE19C923BB676FB4B7E11569C5A9F10B6AE5979F996F2531D8D661684958A3504F165B4FD401823A9F73A051759562A4655AB42BC3B89D931BE5629ACB9DE65E5FC545839FC0B95E663C42AE3065180CE617696B9344BC9535DD15C31B2B88B7B609DDB5D79C4122EAE16515875BDC2C08D0CBC62128EF5EB005F2AE0DCD1F19C401D22191371185EFA4BEF1A8BA9D0B0DBF10362C52681B82C5579BBD4E2FAEEC0745D28BDC781E23673282C1B4B9DC723D05BE5E331BBC2CF6F1C041D80E043E52FD257BB6A9FBEE1CE7D057DF52FCF6051BED4999A5DD8EB3B52993D4A2AF968478E4265F8353145458498E86634B4103867B7CCDB0E0450502986EE64B5F38016F3E02BCC606F01ED886B1CDEA0333332A849B5E448407562CB35CF961EAB116845AC78974D42C6CD4BED4DABE25C8A373B24E1B736C141DDC4C3B40CF3966DEEBF73AF732D3B265F49B6656B3D6A5EBFDDA671E58DD970DFF00BBCEFEBCC6EB31D03DE755C4AF2F1D675F300D6E5DA445F12D8A252FF5D6136ADB3A82223D194C31E45B8846C2B90B54DEEE15C7A818BD182C980886AB13377E166DDE5006E1D50EC1CC74E5313D62B34245D012FAC200365A8F5DC35FF0EFF06BDBFE6F3B590C29DE0CBB044360D6A5F75096AF42265C145E32E8C79942C319DB2828457B5400A02669857465C953111B3A4B98EFB419A2AA0300EB6904DAA5D274352995E3F998056BF2EAF8316D2BDA0CD5BC217B8A88AA7762CF6F581223049F4B13B625F6ABA91F3435DA0F53E0D8E817E08762720C5F340254A95E99AC2F3861232CE9861A749714BF101150C91BD77066E6985A5FB8731EB5AA9934D362F11FE199233E02B88E546116326BCD371B1E808CD1BEBB61763B606019759E642EACAA6A9A219243142D65A0EAB9B65837454EBEB12A1E6666636F25F68005E9B3B7388FB04AC2754F42646C25A1EBE84EB1758C6BDA005F7D4B4FC18B8399427783115548C55886C71103788976AAA16CCD902B506A91F462060E3ACB5E9F788F97880DF3CC47A418FEA69F308A86F98D086C3CCCF09802B47594E471D6578A9617532B1CCB4597DA611B0BCB29A99B3290457A4E113A29E5389D89B2B2282C3A4712569B366E266BAE0ACCADB1AE8CB288381641938E4697CF58A279432585FD44509CB17BFF009495FF000DB31BD08039E3F92258D06C2335D0ED126DE464BF7027A48CD5FA4B5B1DC6B96EBBCE2540708F37159DC0B79E261BB0B388C195DA268AB7DE24D1D9CC200594439AAA5950222B2E6FCCBAC7B95105C6A0262375BFF57E1DA6BA4AB282073BB860E76C3976A6A566680562AB223567475994CB81EB09CA95DEA56555E2AE80DAFD66BCDD169CB84E60C5C121A38D299587E3E9D1932B4D4F54394F680017576CDBF5502E9AC4BBF2B7626B79095C0320015F4879AF619A5D63D65AADA1696929F62672962014B1E4ED186280C5E403E522D533018AABBABB8B011C8572E93687895DA6256E7AC226DBD62DC45AB4DD4A601F44F5800EF4B1ECEA1F198BF50840BF585142F6C47BF48C223CEBDA2A6E2ECE200B1DA00388436BACC7AE2582A7F8C40FEA63A3EF1F1F30DFAA5C2D6D87757C41BD7C4BC63E2080A413880AC10578E61966AA002CA9D5698A08B1719E2A233145B3B3C4516D975282D730824504EE6252FF00532943241C5B2A60D2E0ED12BFF86912294181A8D7D033AF6F494C4102701C4A1C68ACB7C441B870DE711AE4D0545E2E59066D4AB6DA9537361C11A7DB5046D4D226A133CD2EBCC3FF007515618CCC7DDE3A4D5EEE112D62EECF3014D6D335EBE91AC5FAFE15522C274850558DA6A8C9F30D8C0B51670808BDA540ECBCA614AA033A6A0C3DE7A41508DFCCABF2AA6E6E9AA51B8E1491F6A4A3674CAFEF717A139529E85E670CECD1EFC4A12834103DB2128E94A600F0B749CC6A1035D9306C49B235B45CFF00113A85A62AF4C7CAB4A620A1CD21328FE72A2AE7B7685F931156B7EC830B7A55A1B65F563A500678415AF12DB69D45D085F8631FA512B0507D894D5EE589131B273A87FB12FB3158F7DC25424112BA3098388A120279B84457306A9BD0C74C1E26787499BD6652BACB0EB8E2271D262873AAB8854798465BC6580E6E616056B88F9C4E9912C8F510062612CE9F3333473D61BB205A8F5312C6BB817AFB43C8E7A4D711B9CF11BB9C666FE52FC989C79E26017A57D4A36805234F53EA625548A3B328EEE5D305DBC4CEEE78FC5BAFFE8FD28505DBE21E729214B60D38EF304FCA1CCB5E5FA26114A00E41735D0976749C9017008A07317AEC0A079C6B7CC0B469D295E92F5BBCB692AE8CD44A799745A6F0F489ABD2E4EB32604D2F8975AC7412D7BCF99618389C1ED50D0568E7D20353A46AE841738C4D8FF9699E063550B0851F7055F5B751C66CA0D735BA99E2D2AEB6E06036B2650FDDA5AA86AD38F88B83D3759EEF148B6EF8FE877261385AB679B0CCD75680DBD8CC6CA859499CE2FA758B3E3C294ACE5BD441850030CD32AAC10B0AC07DA1DB817862DB1F128842B3D8C37EECBEE87187355C02CA17CAED12662F34150AAF0E2332B7885C522FEA20D2F4FAB4ADFA131886EB6EB1BB99998304B3B42401258226204C34072030A1BB6E639725035E9342E6CC4B1AEF064778E9975B956CE23175B87D6F101C5711EA9D6252FACAE6C0B574945587E17CD759615B91A82BC478B652E1776F3504A37994D2F988ADC164FAC42AA5958B4C6D87CE4C48AC972DB622355938B9EDEC3A94B74B56FF00B9872AFC742FF17E3DA52525C69FF40AD1CEA6401DD1E72A3572649844541C81564E68D5CADABC7FB98D5D72868171CF686F9392A7A730738094308D33B87170D992F0960BB97A8B29C2F3A88B05B91798848B16AD1B9423C189BA993AE60D9BB7EE7D736CC49523A752C6A0E67945C96FB313AC1918345C21D78894AE30E0F4ED715BBAE87AEB1073E80D06CC9DE5DEF7D07C45EFBF18BE22BB60AACB35AE910BD210CFB11D9336159D7750C84977AAB9CC399D9DAD8DE2AD8D62500D163D664BBD1A29339F785FD2C2E856C7198A81D440350DBE6A2ECC0CCD16B1DB10C8E32E86D8F5183C959F4C9CFAC2960E1CA217BE48BF9CDA9470F548575E0B498AFA9762B96C73BFC577F899999FCC30EB447C1D145D01F481B5466E97A40A9DB78F12E27CCC6E1CCC095C4DB43A973BBC4BEE8674EC60225993739827A2510F4DC3B8B4D758D555CCE7D43318C67137FF0075FC2EAFCFF13663A17BF482F30A8F4665639CCDBB83E30E9BB8EE8E08D66F1B8A2569B20DB1825CEA7DB3196AE3BFC3199986FD4FFB6963641DD10065DCA88D226683FB96DD152ADEB17734C169B0023FA95B02503B205943079736C2EC689BA0A2C8DDBEB0C80C5F894FF702272B7BA16673FB880DCC75004075D61DF25DEE3E6CDFEF3DC5FB9B7C439CE8EE4D5E596DE425933424758A9786A2EA750A12A2220D3EC358687AC4C00E81578E0C4714BAA6A39446520A0942D43C4D537A3598C73C9382F4BC4AEB0D745EFE928C52851639BB87E8C0464E78637F834171B7147587D2B20B4896EB66A035774A82B5ECC059A04DCB9797A511988AC7548D70E21407970786C53CC10811935E88E39229517C02B8C319E666DDD8A03462231405692CA219C5415649C50596377CF31CF200583095DF719269E8E20811B6E9254A3ACC5CF94531A508F449D3959850053C618CEE2D65EDC42A6D6E840A52665AAF994769055DADB02DCBB94282E9812370BAF88E2E40CC7C7580CA7BC7D8DA6A0BF15A964EA4CD7CCAA1D35510BC73D22D55731DD25027565BDA5B0852D73B676D94191CCCA8A944A4E6107EA50A8697577030721BEB83F00BFC2A6DFF000B997F8BD054B88EF5A08B1CF3100A004C52A274B82B7765892ED955CB4B6EA1D502E8767AC74076513871053180AAF6361CEAA364B504751CCA0CEFA32D580705EA099362D6F889D604EA2E5D4CBA1CE82523E22918897E22C2867986B6E97C4086DF6788EE3D258F53144F48DFE598283B24E836EDA63575E29506E90D31F9888894F11D36141B1ECC1D3AD85BCAD62E5F7AAF487C5CC248D87FB7EE5912AF260F577082652CDFEFBCB31653417ED2A33B09CBC1588080CCCC5B8EFC91EE4130CE8E7D98B55D807B20330DE85A183A385981E30CFA3D205403436D6DD758C0764954019DE200509A742F10AE97E7507FB22080435BAAEDCA444382DDA2047E258D348B4EAF7DE5C75C462C17C1CDCB19F0CF49E93D27A4DA2705AAECBE7B6632E5543D06E57151D314B63CE2646F4CEA8EBA404F5CC02F0C1DD70CC9AE399CB1CC1ABE51BACA576626ED4FF1EF3F665E7330BDCE53EC968E5E520BFF003BCC1CC0D41AF582F1C43061CB3170CA4B5BDFC4EBDEE266B338FEA66421FB7E89A477F87C4DBFE1DC3734213AAE0036B88030818A5C78EF0B8F90FCDF1F11BBA0C32A0D40BC242B654C1F3F820D41C9B7552C3E272317FC41BB6B6F497DA6B39A772A14D526EB3CC6EB959E6F7D08960ED3DD364BF697AC1F94E15EBEB1B815C99C3017F5072BF8834377AD9011FD4701145D6CB405D4BFB85D157DBF8954B5C3A98702798D03E841BAD6A080AA80A10C566E106C1156FB5DB52A1554AA25C70C92D827ADACA7D22CBB975A2FA41DB7450B9F24C4F540DABBB511F678B528A3E8B39AB63BA282BD612145C3A0CBC5C29589B16A3E113291317459B874E54052992BC92F85CA981A237ADC6D1E5046C08AF758DA0DD93854BF13044A639DE625F197180367BC76B50C60B599E7533FE946E90301BB87AEA9784597701341B46726667AC2E24BCE1327596B8E0362D5C58B901B1B06A14960EAF3016018312B673000A0DE71B8E2D18B99DC71173644B821D68EB0060A80EAD2E2D6EF06CDB9EF136EF18E389518EB377FDCCBDFACBBF9975F966763E22935731E3137E3E239B8BCC2CC730ACC730C324AB446EEA1D0468ADE61BCEAFD47C477F8CCCC47185332AEE7AA786012602DD6E0171B2BAC3FD04E1EDF4C048180AC084259D3AAEDD210A50A09E95986F389962F79F68A696E89C93A4576FBC10743C90EAF361D5E31EF087404B88EB3502ED5C894ED72407361DBBC748374C34977BC0F32B36B2A9AF32D75008D5461FBA59C2943E91AAB068EA596762AE89A27BD06463A5CBD8EE07E0D566AFB42674E509F32B0A56A4F9B956EE6C251EF1CC1D20BCEE85B96E30CE0DBD05B95686D10B3DD881E85B5F144246C16A0C78A21149869B4725BB94B23A3ACBA5960D68862CBAA7CC066341904367921BCC28BD2F352822504A4827D4A0BAF6010CDF84E7BCB23300B0235FA65D184A94D0A7BDB394E6C62E9529AB208591616F37C45B8D82A2A5D74A6EE1CAEB1200C57BE9A94E078E2C2EC8919CC1606293B0886840AB2DDC2A9458541D16582B7D3C4B55D3E7F1E9F11660470A129CD9E23D9A69962F0677A943073035010BC68A44E91B36E38B80BBE605E9D749D22E3A4278986815F11BFAA1A2F0BAB85DC73D2664EF51B69707F12EF0FB46743ED370EFA4A721F597165C5558A4AF4810CE21BDFF980AD33B4F488558FB401BCF305EA65CCFA4A8E9335CEE5C6E8FD452E2FC1A9D18A991BAB102F39327400DAD8B88F670034E3A8CB2B0741A956D3BBD4284B2DA31D61F4A9A158CB8F78D90B68B712C6E0D15317030097D2F730C5047146229660AB4A2CB74B962B684A43550C39302B64DBB15567261894C8B8770E46B7703A29280EBAC4072E4C21558A0E6855A0DC688EB401E8DEA254B5D26AF507E8615D315CB6486CF12AB899801EEC6B5D9A6C6F14CD0FD0CD57CC213EB0A7B5CA0BAF6DCFAC52D4A8ADA26796121C582D1D1185298D29A05ABDCADD76589A6B2906267042F87630E3DD4C323F6849F8ACD86710826D4795FEE218105966D181B81345672C5DB83615B14BF687CC685A6D2B7378600CD0BBF983D4AC471A56229BD486B1786FD61E317836161AF5864D64AA140AB7B541EE3A0545B3333A79DA64592842BB92AE3CDD82B14A073C4CEA09D50887C97129DABDBCAA21420E51DC4C6C89DE0D7247758B4511A3B0D80F5E22182C4CD19C5DE23EBE8AA956C9474F632901BBF1F72D3FB91EB7ABAA44AE78E8672D7D07F302B2FB611BFF00889B3A6AC2C4B063ACD4B452CE743F70A1A0C9D1FCCE9DECFE6014D7434FE65DFD10352371633395E6B3F9899C7780752DFEE8FF00612D0BE9302FF713CCF291AAD3419A63550FDE1FFBCC36F5CE677E768EF71EB1AF6768A75DE21D1732917D3DFF00E251A5F547A7FAA5F39664CE5BC0570C516FF1111675B820BFDC46E164EEF56BDE26A2C39A1F50B3FD1ED051EC27814BBB3BCD0A4739280D76A8777FAB5557FEC7F39B04DDB55D7BCA5562C4FA2FAC750EA84EDBC4BCA59A317E900FE67F10CA16776DFD46B696B27F44AAF5B29050DD6236BE51E4974CEE6F1FC92E86FE21E168C4C8105C2ADE5EF88BC3177661F15280F4D57F143D58143430EBB3C383E23198FD7F8A00000C1759955BACD201905AD75D6E1D2C695561EF1B20683C75B82DD4DB53E50CDFA9ED2329C2C14F1E92DA69683FA89C44A6E5808BDABB41026915C30C054B8F25C3754528A99762BA2312006F66200C817D1B22F302BB8BA892C857AA273AE1E094129D5984DCC42FA66543286ADE20039A0158EE329E49A05FD4F7E30D74A97F814406EFAD4BE33EE0C67488C8B87E399DB8A0A30E9A40EEACA1B5C0616196E15E08CF296436D57F88F8E126A0B921EA9C09CA22DBD68087A941B035E98CD5AB951FC43CB7A7F89FD6BFC4BADAF93FC4FF0033FA94D6B1BFE929F0DFF9A983B5D6367EE9FF00B515141EB2EFEC9FFB90E2B3B39FCE86B4684683AD0B985FD217565943F89FF867F10C603C07F133F73A1FC4766B5AB830CFE60BFEF47308F8428C625BEAFA4AB02DDDBF0BACAC838688B0AE779C52A917AED374AAB0BCB07414C3090244D66FEA75A162A99FF6236EE4CE81E51BDA462C19E480ADB117B615ED8676E20BA7AC3D0D6C6CE659C606957D222AFB9A195F2200A5E24181788FFFD9, N'COMPLETO')
INSERT [dbo].[FamiliaFoto] ([Id], [FamiliaId], [Foto], [FotoNombre]) VALUES (5, 4, 0xFFD8FFE000104A46494600010102006000600000FFDB0043000B07080A08070B0A090A0C0C0B0D101B12100F0F10211819141B27232929272326252C313F352C2E3B2F2526364A373B41434647462A344D524C44523F454643FFDB0043010C0C0C100E1020121220432D262D4343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343434343FFC000110802B4040003012200021101031101FFC4001C0000020301010101000000000000000000010200030405060708FFC4004210000201030204030604050205040105000001020304112131051241511322610614327181912342A1F03352B1C1D115E124627292F10716438263345364B2C2FFC4001B01000301010101010000000000000000000001020304050607FFC400311101010002010402020201030206030000000102110304122131134105512232144261712333061591A1B1C15281F0FFDA000C03010002110311003F00FA3C8AA45D32A91CCDD4C915C916C8AE489D1AA6B50A4168290487B44828890C8AD10241C04381E883040E0380D028701C1000603809000603809064180E024C004C1024C00020704C005F69F11D28EC736D7E23A50F85178A32496C62AFBB36CB632575B8643163994C917D429919D6B15B41488142810380A41C0C812260620C060980E020001818800A4C0C4C002E0981898005C130360000A4C0C4C002906C0001483018191A1E87F110AC6A3F181576287C25932BB7F850F3D8D67A637D84371A5B0B1DC67B0C563B85A9460D171B9419D690024208D08120C21038201013012000C10240004C040013000900003012000C03012002E01818020562B1D8AC0C8C688031DC935D037D0D8C1037D0D8BC5192D28AFB1794D7D8BA88C840B210D0081200020480008120002108000812000C03012000C00240056018020503180C465600B02150788E8443C401E25D4CA625D4CA855AA1B04586C31ACF4CAAAAE5068ADB14117DAE004841181084034004020000B03000C563B1588CB329997CCA642A6AA45721E42324C8C28814390850481282048402409080108120042608100842046102008042102000810005D6DF11D187C28E75B7C47469FC28BC5190CB63257DD9AE5B196B6E190C59265322EA853232AD21065B002800A0802308121061024200421080108420042108010842000204000081000003180C40AC34BE34061A7F1A00EBDBFC28B67B155B7C28B67B1ACF4C6FB24772C7B15C772C7B0C564B8339A2E4CE675A440802010202001210801084200420080040420042008010840640210800080081802B030B6802328620605259106881BA86C61A6B26EA1B158A725C555F62D2AADB1751191EE423DC842C02420042108308421000108411A00200084210001084000C010300006103100604160153321E2221E201644B699544B698E156986C30B0D86359E995575B6282FABB1411573D2008411A108000202100D00C22B100036472C15B91369C87994C8BAA14C829AA915B1E42310286200A1C06081046421142302406420103901000845080120020421010604200804004820B2DFE23A54FE1473687C47469FC28BC5391A5B19AB1A9EC66AC19162C75372896E68AA999E5B99D6A50A17232628050501046048420C8480200121080108420CD0842004210820800900000200080080015861F12030C3E2420EB5B7C25B3D8A6DBE12F9EC6B3D32BED5C772DE8551DCB7A0CAB25C99CD3726622AE2108411890840084210610842004210801004200421000054721E42C84741F942417D28E5124D265D3C23157AB89E0BCB1D4DB1EFF002D11D44AAD45090ABA14DD55C459E3E5D74EED47771F1EF44A97118BD5A1A95652EA706F6E65E2349BDFB9AB87D7938F999D9C3C9DF5D9CDD2CC78BB9D6A9512466A772A55797251757188BD4E770FA93AB76DE5E327A1F14EDDBC699EF3ED7AEB6D6393653663B658A68D34E5A9837CA3495D6D8B16C575762EFA633DB23DC017B8085A108400842100210840004080021084000421046040800010200000610002B00CC5269990E8443A00B225D02989740A855A21B0C2C3618D233A4ABB19CD15763393553D0108411A00841042100011892619311BCB26D5480C0A3919442290F6950A2668A86798E92A915C87915B11805002820320808511B24004084802001080830242100084040062002004202001210801650F88E8D3F84E751F8CE8D3D8AC53919EC5155A2E9BC2661B8ABCACC7A8E59C78F753E3C7742A6198AE26A25CEAE51CEE2351A5A1E4E3D7CB969B7263DB8ECCEBAEE4F785DCE53AD2C6E2CABBC6E744EA7CB3E9329CB9EABB50AE9F52F8CB279EB5B9929E1B3B342AE52D4EBE3E4DBD0EA3A6EC9E1AC82C5E463679E842106108420040802010842640D020CAEE4C80421328994000846D03284100C3940600AC31F880C91F8803AD6DF097CFE133DAFC2689EC693D32BED547E22EE852BE22D5B01566B8D8CC6AB8D8CA4D5C4080223421083084204001084008008002108400018ACB00F49008BA2B0832784442CD958CF259DD45356588B3935EA66A1D1BA9F2C19C94F9AA19F59C9F1F0DAE6E39DDC9236527E5335ECF106698E9039DC46A622CF92E9E5CF2DBDEE1C77948E4567CD59FCCE85A2E581CF82E6ABF53A74D72D23E9BA5C7CBA3F219F6F1699AFAAE20C7E014B9A5CCD6E64E213CE9EA767D9FA38A69E0F5793C61A7CE704DE76BBF4D72C034A59911E9033D09E6671BAEFA7561B0B5760D3D815762BE9CFF006C72DC0196E0256842100210840084210021084000421002002000800900001848230004000AC03314540A1D08874235912E814C0BA0525A29EC3090D873488A4ABB198D353633326AA2008411A1080008C594B0493C228A93272BA3936B1CB2C8964AE9BC97476271F2ABE11E800B14A49AA19E668AA66A814D548AD8D362364800A1464380C1010642101323062008004202001080800420200304508031001002421001E8FC48E952F851CDA5F123A34BE14544E435BE1671AF6A62783B35BE0679DE293E5A9F5387F2337C35B74FFD97C1E6265BD873418F6B539A28B2B473167C96397AAEACF1DEE3812586D15B469BB8724F2512EE7AFC7977632BC9E3B787994B6E32C9D2B2AF94964E7545A0D6D51C647A1C39F87D54D73716DE8E954CA2F5AA39B6D57291BE9CB28EFC2EE3C5E6E3EDC8E4210B6081064800428040013961192ADCA8752EB87889E7B8A57943386679E5DB1D3C1C5F25D3AFEFD1EE4F7D5DCF2F0B99B5AB2CF789F730F99E87F851E93DF57707BEAEE79BF789F707BC4FB8BE71FE0C7A477CBB8AEF9773CDBB89F72A9DC54CEE1F38BD0C7AFA372A7B3354659479CE1756524B2CF4141F94E8C32EE8F3B9F8FB2E96302F888C0B72D83AB69F09A65B196D36354BE1348CB2F6A97C45AB6295F1172F840AB3DC6C66355C6CCCA4D5C0080806242100090040084210020084008023030085F4968510D59AA0B080E095C98F27845327A1AE118F2D61E215311660B759916F11A997816D23D4F23F35CBDBC5D93ED5D1E3BCF6D327881C6E255375FBEA75AE1E20702FE79A8CF27A2C3CBDFE971DE5B25AACD43A33D2063B186B934DC3C47E87D3F498B8FF002BC9F4E6DC3E7B951F53D5708A5CB491E5AD578B7BF53D9D843969A3AB9EFA8F33A69AC76BABCB96062B4A99AACD17D2E581CCE19539EBBFDF7392DF2E9D7F07A7A5F082A6C4A5F086A6C69F4E5FB639FC428D3F88512D084200421080108020040808202021002002000800800210840000090465628CC562A050F1110F100B625B0298174064BE1B0E24361CD22292A6C657B9AAA6C6496E4D5446C806C1924C49906499004AAF4325696A68AAD1438E598F256B841A53D11AA0F28CCA05B14D0F0BA2CA2C6C0C18903122F69D1EAB32D465F5E5839F7157082885AD5944C952F22BA9CFE237DC917A9C0ADC4E4E4F04ED731DBD67BF2EE346F9773C746FE658B884F02EED2FE37B057D1EE157ABB9E3BFD4641FF5290FB8BE37B1F7D8F722BD5DCF1AF89C80F8ACBF7FF82B69B83DA2BD8F70ABC5DCF14B8B4BF7FF0080FF00AC3EFF00BFB06CBB5ED55E47B8CAF23DCF11FEB2FBFEFEC4FF005BC75FDFD8363B1EE15DC7B855D47B9E17FD792EBFBFB117B40BF9BF7F60D8ED7BC57511E15948F070F682395E6FDFD8EEF0CE22ABA4D31ECAC7A44F214CA284F9A25D91A4C142A63001210800F4BE33A547E13994BE3474A8FC28A89A6ABF0B3CCF1D7CB2CFAFF93D355F84F33ED12F237FBEA7375937C7634E0F6CFC3EAE523A5BC4F3DC36B62783BF465CD13E32CEDCEE2F4329E36C17F4B2B2737A63A9DCB9873459C5AB1E4A8CEFE933DCEDAF27ACC357BA2A96C551F2C8B9A2A9AC6A7A5C57574F6BF19CDDF876D6FB4AB8691D4A15328E151961A674ADAAEC7A1C792BACE2FB8EA2794129A73CA2CC9D0F26CD1882E4390231004185373F09E678B3DFF7D8F4B74FCA799E2DD7F7D8C39BD3D0E8A7F260A65A8AA9EC5A8E37B256C0DE0D50A2DC724F7772DC7A47C923232B99A6A51E5C99A6B0C4ADCAEAF09E87A3B7F84F37C25EC7A3B77E53B387D3C5EB27F25C0EA462E7536713AB67B1AE5F098ECDE86C7F09A46597B53F98BA3F0947E62F8FC210AA8B8D9995EE6BAFB3323DC9AB8042100C48008042108C0210040080201B0082B0B17760175245EB62BA4B08B5E811449B33D69620CB64CC97B3E581BE3351C9CB979722E67CF58D96D1C451CF879EB64E9C16207CA7E5F97BF9E63FA777458EB0DB3DECF116702BCB9AABF99D7E233C459C68F9AAFD4D7A2C3C6DEF74B8EB1DBA1651C4722DECF10917515CB4BE861E233F2E3B9F4DD363A8F9DFC8F2777268DC0E9F3D772F53D9DBAC411E67D9DA3E54D9EA22B10279AEF23E39AC2460E2B53969B395C067CF5E5F4FE8CD5C72A629BFDF639DECC3CD57F4FEE736FF00937CA7F07B7A3F0867B0B47E1434F636FA717DB1CFE214B651CC89E1894A883CA382B724981C9B12122D365B182602CD2A217F8480E090129017A80DE12106621A7C3C0AE380F46A304C17610CA0984F219B04C335F8689E1A1E8B6C9860C3367868494301A366C32619A12591D41316831B4C4699D074915548A42B04AC8878926B0C9124D6C0BA05302F8150AAD86C38B018B88A4ABB18E4F53655D8C337A8AAB1064C8320C92A364129682B62C9E820AAACC14DE413591A8C4C32F6D67A5C96859140A68BA31D470518C46E443450F82E4676B9574F071AF2AE22CEBDE6CCF3F7F2D1954479EE2D573939107966EE272D59CFA5B915B60BE282DE08B63451B7753A116B66473790A93675E970A7359C1A68F06CF4265DDD22E5A705464FA11D193E87ADA1C122F789A17038FF0029D338D95E57877427D857467D8F72F8147F94AE7C0E2BA0FB0BE478795392E853383C6C7B3ADC170BE139D73C27953F287C67F23C9D4D0A64CED5E70F71CE872AB51706C8CB1ED54BB509F997CCF5FECD4FCB1FDF63C8755F33D3FB3D2C28EBFBD0528CA3DEDA4FC88D2A473ACEA7911A94CBDB1D34A6364CBE2E09E3FA8BBA1CC6D6BC8799189DC63A8B2BB4BA877C3ECAE9526B991D2A1F0A3CF5B5D29544B277AD2598A2B1CA54678D8BEA7C279CF68639A72FDF73D1CFE1383C7639A72FDF732EA7FA53E1F6F25693E4B86BD4F4B673CC51E679796BBF99DEE1F2F223E4FAAE2B8E5DD1E8CBB9A7466B28E3710A7CB2CA3B4B58986FE9E62C8E2CFB7395CBCF877E1638EF5D4492D0B31D057B1EB4BF6E7FC7737C7C9AA4A6F5C1AEDEA61A31FC322D84B077E1978DBE9B93199E2ECDBD4CA46A4F43976D5363A14A598A3AF1BB8F079B0EDC96E4391425B136439149900AAE9F94F33C55EACF4974FCA799E26F539F9BD3D1E867F264A65F463CD34B1A1453D8D56CF133963D6CBD37C60B9522FF00052A7B6E5749E5234B69C523679F9E576C55E8E20DFA1C6ACB127F33B97534A9CBE470EABCB7F333CDD5C3BD37F0A7B1E8ED9F951E67863D51E92D9F94E9E1F4F37AC9FC97B60C81B064D9C2EB596C8DAFE13058BD11BFF29A4F4CB2F6A1FC45F1D8A1FC45D0F8469AAABECCC6F766DAFB189EEC5578A108411A108899002021002002000006100006482CB036594508E344161126F40AD115CD978CF232BA84673389D5C459D293C459C1E295732E534CAF6E3B70E5E692CA3CD3C9D193C40C7611D3269AF2C40F87E4CFE5E7CB27B7C3876E32393C4E7B982D9735445DC427CD3C12C61E6C9EEF4987891EBFF4E1B5B9F969FD0E55EBE7AB18FA9D4ACF11FA1CA5F8B7A97AFF0073E8B8A76E2F92E6BDFCAF4BC0A8F2D189DA9BC40C3C321CB4A3F235D77889C795DDAEDD7A8F3BC7A7E56BF7D0A7D998E26FF7DC9C69F34B1FBE85BECF47965FBF5309FD9A67FD5EC28FC034C5A3F08D3D8E8FA715F6ABA85B4914CE5A8939BC03498EC6B4F08C552B7986ACE722A8D27296A1A75618493CAFA33CB37D2D8CD428E306B82C2063CB67D1F4C155492434E58461AF57B18F372764DA30C36D94E49972D8C16B3C9BA0F40E1CFBA6CB931D5192D0CD5A5CA8D4CA2B45345F24BAF0585F3E58FDE527AB2E85C45F532DCD2DF0665CD1CEE70CE6CF0BAAEB9C78E51D88D68B5B8CAAA3911AB245B4EAC9B349D54677834EAA9262CCAE8E71A9763275E197746166AB23A9CB2D468D740B8A795A1CDAD2940A746184CDD495CA2A9D78B392AB4D96D1E693CB61655DE098CDB5B9658D12B88F17A99D73DF6BE05D033C19A2984455D11C488E698A292AEC609EECDF57639D51F998B25621915B2362B64285B037A0AD8AD88D1EE3434132343732C9717C25A17427933265B4D8A1D6B8B0B9154425ED9E9CDBCD8F39C45E8CF497BB1E6789BDCBA23CBF1296ACC547735F117E6663A3B91936C1AE3B1D9E0F4D4D2CFEF638CB63B3C166963E7FE0CB2F4DABD35B5BC79169D0D34A8453D8A6DA6B917C8B954D47C7ED866D94A9C7B22F54E3D91929562F8D53B65F0E7AB7C28F6165462FA20AA8075064CD5ADE2FA1CEBAB48BCE8752A545830DC5443379CE2364B0F43CBF11B6E4E6D3F7A9EE2ED29459E638BD35897EFB9C7CF9EAB6C23C9D6F2CBEA77B804FE1FDF638578B151FCCEB7029E39458D696787BBB2A9E446A750E6D8C9B8235A6DF462CB3D1E3C7B5AEA154A721D5393E8C2E94BF95FD8C6E56B798E319E55658DCCD52B4BB9B27426FF2BFB19AADB4DED17F626DC8F507875693B98AF53DA70F79A6BE478CB0B79C6E22DA7BF63D970F58A6BE47574FBD393A8D364BE138BC6639A72FDF73B72F84E47165983FDF72F9FF00A565C5EDE3EB43155BF53A3612C2465AF1FC47F32EB57CAD1E2F371F7E0EEC6F976A93CA16BC39A2250917C9651E1EB5E3F4794702E61C950A59BF88D2DDA473DEC7A9C19F7E0F1F925E2E5D92A062F288F54241E1E0EFE1CBC69F53D2F27C9C52B550A9868EA5B54CA47162F124CE85A54D8EDE3C9C9D5F17DBA69E46C95539650E6EF32C304541025176F43CCF127A9E92EDF94F33C49EA73F3FA7A7D0CF2A29EC5F4F46B067A5B1A2072C7AD5B6955D305DE3A5130A7D88DB7D4BEE727C7BC8D755B9B28C154D328F733D6446576E9C64934D5C37747A3B67E5479AE1BF123D25AFC28EAE1F4F27ADFECBD802C5674381D5B07A23A1F94E6583F2A3A5F94D31F4C72F6A65F11753D8A25B97D3F8469AAEBECCC52F899B6BFC2CC52DD8AAF1008BCC14C462411CD2193C801010801004C900001858AC4037669A2B42882CB35D35841153D0CB6299BD4B26CAB766B8465CB75155C4B96079CBA9F3D7C7EF63B9C42A72C1EBFBD0F3F4BF12BE4E6FC872FC5C19561C78F77248EADA479698B772C459753F2C0C57F3C459F23D2E3DD93DFE2C77969C7B89735566BB1862393137CD53EA74AD972D3C9F51D2E1E63AFAECFB38745BB96212F918B8553F12F1CBD4BB884F107EA5FECF51CCB99AEBFE0F632FE383E5B8BF972EDEA2CE1CB4D12EA588B2DA51C4119AF6584CE1C9DD3DBCEF11F3D4367048E24BF7DCCD70B9AA1BF854313DBF7A994F6BCAF87A4A3F08D3D85A3F08D26B1B9D1F4E4BED9A51F3139130CDA4F2DA073C71A6BF216E2A6C1D14FA015049E432BAA74FE2925E8D95CB8853FC89C9FA6A1DD152E4D508E1064F08C4AEEB4DE90C2F5891D4AADF9A515F217742D5FB5D56527B199D3D75619C9FF3FEA66A92EF53ED231CB0997B698E5AF4D119C2975FD4B3DFA2B0A324CE4D6954C69B77912973C96916FE4878E3DBE8AF9F6EA4F88CA2FE1FD0A27C729C5E26B0F6E8649B69E1E599EAC28CB3CCB1EBA15BC8B51B9F19B694F9652517EAD0CAEE854598CA2FE4CE05DD9C2A79A33C69A61EA72E7E3DB4DF2CEA6174CB22E12AA65A7B3E6A6FAA468A118EE9A678BB7E2B5B693D57F367FC9BADB8BCE32D1BF937FEE44E292ED573B63D8D3A915BE9F32E52525BE879EA1C5B9A0B2935FAFF005344389463B3697FCC7463646371DBA950C556873B1E9DE42B25892D7D4B694A32787B97B5639DC58BDCFD0B2141C3A1D054D7624A9AEC0ABCD6F86071C016E5B5D60A63B99DF68DED740D14D99A068A610AB444712239A62CE92AEC736AFC4CE955F84E655F88592B12362B6162B22A81B15B2498926250F30D1914B64527CC6594546B8B2D83C19A132E8CB611B4C65A0F92A8B1F3A14962BDD8F2FC534C9EA6F366797E2BD4D6A63C9F11F899928BD4D5C45F9998E8BF311935C1BA3F09D1E173C497CFFC1CC8BD0DFC35F9D7CFFC19E9B5F4F556B55F22F91A612CB31D92CC57C8DF4E9EA69863A73E557524CD111694342EE5C1B46553224DFA85BC0AF5193357A8D239B5EBBC9D1B98E8CE2DE68D9395B22A4D92B57D1EA7078BD55896ABF79365DDC72A7A9E7B89DD736567F7A9C996372AD665238F7B2CD47F33AFECD52756715FBE8712BBCB6CF43EC7493AD18BFDEC5C9AF0D2DF0FA070CB04E9AD0E9C38747B7E9FEC59C3211F0E3F23A718A349C7195E5B1CE8D8457E5FD06F725FCABEC741A490328AEC89F92B9CECA3FCBFA15CAC63FCABEC755C50928A0EC83E4AE4C6CD4269E3AF63AD6B1C45144B099A683D078CD272BB5F2D8E571359833AAFE139BC45660C9E6FEA38FDBCB5C47F11829E8CB6E579D95C4F3A63BC6C75EDBEDE7B1BA3AC4E5DBCB0CE9519651E0F5187672DFF0076B7CC67BCA7CD1671671E59B47A2AB1CA670EFA9F24F287D2E7DB976D7075BC7B9DD198AE5A3C9675C8B35947ABC7755DBF89E7DFF1A39CA2EB6A9868CF1D868BE5923B71BA7AFCD87762EDDBD4CA468473AD6A688DF07947563771E0F2E3DB91D045094CD9EEFE16798E24FCC7A6BBF859E5F893F31CDCFE9E9F41ED5D234419969334C19CB2BD6CA2E43288B02C45C736596A9271D0C95D1B2A3D0C55D91935C255FC3BE23D1DABF29E6F877C47A1B69794EBE0F4F2FADFECD52D0AE52C02551632DFDCA2729C968B4EE6EF3DD6B1B9A51C2738FDD1D095ED082C4AA43FEE478F9D1AD18F2D09E672EB37B0AA95CD3A59AF5252A8BE1F3368B96C4592BD15D716A34A5CD9724B74B0DFF51E3ED058C69A6EAA4DAD9CA39FEA78A951E2571371E6A518BFCCE6D3C142E1BF8EFC4AD524E3AB69E506E976C7B8A3C7ED2EAABA31A894B7596B0FA77254BBA597E78AD7BA3C43A5569564E9412C6AA45D717159786A4E5B26DC73AB0DD3EDD3D554BCA7159E75F3C8D4AEA35209A9C7EE78DB8AF73383517E5CE986F28CAAF388D1AAA3E7E5EF0E6781793D47BAA95B9567997DC346ED3D1B3C5CF895D2FC3A93926B6797A975BF199AD27A63F32D89B6C698CC6FB7B457317D43E3AEE8F234F8E34D29732CF734478B3937864DE4B1D3C7D363C9FD6BD3C6AA6599387657EAAF53AF467CD12F1CBB9CFCDC378EEAAC62B0B156ACA62BA8AC9A5688AA8C7445B3D10E2AAAA8C44F4C926F22CDF2C0DF09A8E5E5CBCB93C5EB620F5FDE873F86C39A791F8C55CCB1FBE85DC329E239C1E07E7797584C3F6BE8B1DE7726E7A44E3F12A9A33AD59E2070AFE59960F37A2C3CBE83A5C7796D9E8479AA23A905CB48C3650CCB27466B103E9FA5C5CDF95E4F1A72F88372928ACEE7738050E5A716D743875733BB8A5DFF00B9EAB8453E5A51CF63B79AEA48F1FA69EEBA4962260BC8B9688DF2F84A9535CD967264E9974E5D2E1B29CB32FDFE874E85AD3A0B2F09FD05AF774A8797397FA18E75EB5C3F2E99F9E08F10ADB5D395D5382DDFD0AE57529FF0E2DFCD1922A9508E6E2A26FB653289F178B9F856B4D4A5D1A5FE07BB53A8E973C92CCF957FD5B1438D5A93F2CE118FFC8D99E36F5EAB53B9AF359FC919797EA6855234E292C24BAA0D1A7B9D34F352739BF5698E952A6BCB18AF56919EADDC20B76F531D7AF5AABF2E90E98CE4341D29DCC22BE2867B64A6571CDD57DCE5CA151FC3ABEF21634EAE5B94DA5F300DB5ABAC7F11FF00DDA14A9C21F893A8E4BB39651825249EB26FFA026FC48C3953E5D72BA8F436E9C1CEA4B9A4D72FF2E7736B71B7A5CF3C27D12EA576B6CA1153ABB47A02E66A789545A2DA2864ABC59556E718C5535D64B0CCD5573272A8D462B54968D9A953A95218C72C7AADB257EE8E73F3C9BECB3A210732ADCC5BE5E4697493453562A71CB49E568E3B9DBA9634393F131A7C8A158D193CC672515DB006F37716D34F9A2A4BB6115528D794B0A32CAF467AC8D9D3DB49AEEF0F065B9B46F2AD94232EEF400E6DBD49D1D6AA71F91D6A75A156946528A517D71A9CE859579D6E5A8DC975D7291A2A791AA71FE1A01B593954B6A8BC29B941ECF9B2756CEFE355A6DA523914E6A517092D3D3A15D684ED7128CBE5861E87B7B4B7AD1A90D1E4B65B1C0E177DE6DF47D0ED53AAA68B976CECD33DC9996E6AB9466EA464A8B6068A466834CD34820AD101C488E698B3A4ABB1CCADF11D3ABB1CCAE9F30AAB152C561791590A06CAE4C6932B932698362F36A093124C9AA8B63535DCBE9D5F36A60E6698D0A8D3EA4553B10A8996297639946BFCCD11AEB01B2D2CBDD99E5B8B6CCF5578B43CAF16EA6F59C791E23F1331527E636F11DD98697C4456B836C5E86BB0A9C95118E1B175096244CF6DB2F4F63C3AAA9417C8EAD292D0F216578E9E353B36FC4534B2CD3D396EF6F454DAC0F29AC1C687118A5B867C4A3DCBC6ECAC74A53590A9268E3BE251CEE5B0E211EE31A6DB8C729E7F894B9726EB8E20B1B9E7F895EA79D42F91E9CDE215B09EA702EA6E4D9BAF6BF33672EBCF726C90B1DDACD559D9F6566E3771C77FF070E723ADECDCB1770F9FF832D7974DF4FB170C9B7463F23A906F072383BCDBC7E475E9A368E7A8DBC0916F9B72F6960AA31C4864BA1B0B51162D859AD00986AE8CD36AF433D65A9A2D453D9DF4D4FE139FC417919D07B186F979193CBFD461EDE66E979D94A34DE2F3B3344E1C23AE9E9BC33A36F2D0E62D19B6DA4799D7F06FF946985FA6F96A8E6710A598B674E3AA28B9873459E56FB729927931EEC6C79E7D513743DC4792A32A4F53D7C32DC95E774B9FC3CDA2ED2198B3EE44F28EEC32DC7D7637BF195AED6A61A3A9467947128CB123A76D534474F1E4F2BACE2D5DB7A20A9E504DDE7335E7C2CF2FC49F98F4F78FCACF2DC4BE2397A8F4F57F1FEC947634C0CD435C1AE3139257A5C99C8B20CB13D0AE312EA749CB56B42E397BF1DED45479E8DFC8A7DDEAD6972C212D7AE0ECD28D2A314DD35293DB26EA159C12CC145B59C27935C783BBDD47275D30F18C60B0E172A54D4AA28AFA86F6FA3460E95BC39AB37D16C1E257B5758C22E4DE8A3D01C2AD6AC29B9D58F2D5975CEE766184C66A3C9E5E6CB92EF26BB5A1285BC2570D4EA758E7284AB56518E545E3A471A17C5C692E46F9AA75C895A4E70F0E12716FF32E85567186D233A35737571A3E8A49A3A55D46AD07552C25B25D4E75C58D350708535525DE5A64BE174B8759B95C61CFF2ACEC542B18676F5EAD75373953A69EAB3834354947928414A5F9B4DCE3712F682AD79AA16D1F12551E1E74DCDB6773EE76EA3BD792F33FE55F3F98FC069AF38D0B66A508F88F65D31832D9D09D79CE555A8C395C928BD0E65D714539D44EA396AD49CB4F9A1786716F1EBF8145B7083CC9F4D37420E8D3B2A94AB3A9E23F0EA6CA4F1ABD8BAAA9DAD34B0A4DFC4FD4C97DC42A5E5DD3A50A4BC382E54F3B6A6FACA546845D64BC382C6FBBE83D06395BD39CA5CF1CA8ECE48CF2B4A770D2A29C61DB1846D5563C412849F2457C4D19EF6BC684E8BA151F871E6F1163EC2D0DABA76B39B94AAD38E74299D2AB42A3E58E7B9D6A51A93954A52C79B1E1BCFDC7942566E9D3BAFCCDF2CB7C8AE3B39959E9CEE1978A9D57CEDC7D1E87ABE1D730AF4D384B3D0F31C6F8355BAC4EDA7CB25ABC63529B5F7EE194FCADBE9BF523B7B7D2F2E4B9CD57BA6C6A4B2CE170AE34AEA51A55572D4C24D777A1E82DD6752A7967234D35A02AB2C8AD0AAAE4B856A9DD955D4B9605F08B6F6335F426E2F08DE788E2CEDAF33792752E71FBD8EC59C3969AC182870FAB3B97292FDE0EE52B5946383E53F2987273751E2788EEE8A4C70DD62BB9622702E5F35467A4BBB4A938BC1CA7C22ACA7966FD270678FB8F6FA6E4C319BB55D8434C9A6BE907F2365B70D95388F5B874A7168FA0E9E4C67978DF90E4F933BA70ACE9BAB799C75FEE7AEB38A85259D3439969C3E3692E76F2DB3555AFEB8C2D839B396B2E1C758E9B27574E983977FC5249F8341E66FB18AF2FEAD5ABE05BBD7AB1ECADE16C9D493E6A9F9A4CE7DEDA2CA76AD79EE6B3C76C8B73C5A9D24D504B4DB3A182FAF94AA78715E23ECF6313A5294F351F8927B41ECBEA568AD6AF12ADD55F3CE4F9B64B53BD656F46C2927C8BC57D52D8C5656AAC29F8B59F3567B2EC597379E145B6F326B4416E8BDB456BA586E52E54BA2DD997C4A95E7FC90CE8975335083A93F12B49C9EE91A6A5C46824979AACB45E8BA08D77849613D65D17624E51A1172934E5D10909CE851739EB527FA2666E5F125CF37D4647A972DC3992D5F4E86672AB28BE67BEC8BE4D3962097FB0D18A72696AC619285A549AD57C91D5B2B0851C4EA79A5FD06A1852E58BF32DDF62D534D617FE4025CD75CABF44665562E599EACAEEEAF3CF4FA22975230972C759757D841BFC773D3384B728A977CADA8ACFA94372A8B960338460B2DE5E046494EB5C4B5C462BD47D211E573E5EAF0CA2B56E5EB86F6C19A31A95AAF2C229E7793781C15BA1774E39853CE3386F1BB2F8D394D67E14CAA85BD2B75CD379976EC0BABCD311D1012F94A14A2F0F57BB31D38E67AF9A3EA65752551B6FA9BA8254E972F61E82CAB6987983497532DC284DA493F4D0B2A5694E5E1C65A0275B9A4D28E42C09674A746B61EDDCECDBDD26E3AEB93935ABAA714A72F37516C6E6552BB8E3115A84F02F97A2A9253C2EE2782D64CF6973E2D58D2ECCEA28C5BC21EB69DE996951D3268A74DA2F5048290FB537208AD06210A91259ACA3155A2DCB437B17950AC395CD76CD83DD59D4E444E541A3EE726566D8BEE2D9D8E544E542ED3EE71FFD3C1FE9D93B3CA89CA83B20EE71970C5D865C31763B1844C07641DF5CA5C3525B13FD38EAE09817C7077D726F363CA717D99EB6F1794F25C6744F24D54790E23F1330D2F88DB7ED39332D08F9B72326B835538E83A5863524B03F2A33DD747808D5712C8DDCA3B313900E0FB0E655371C57FF00A8CD0AF88C9F52874A5DBF507833FE5FD4B96A6E317FBFCBB8CB894D7533FBBD5FE4FD511DA567F93F541DD4B516D4E2526B1930D7B973EA68F71B87B43F5424B865D3DA9FEABFC85CA8D62E5579B7931D5676E7C1AEE5B53FD57F92997B3F7B27F07EB1FF0024EE8D631C291D3F67DE2EE1F35FD8D1FF00B62F5FE4FD63FE4DFC27D9ABCA3711949699FF0097FC8E6CAD8FA570379B787C8EE524F072381DBCE9518465BE0EEC23846D8B9F2A4E5272BC97609845693B225A0B53E12CC0B2590A2561AE5968C6AB4B23D1A7CA4A97FE531DE2F2B3625A145C53E64D067370B1BE5E5EF9626CC68F4171C3F9DBFDFF007285C2976FDFDCE49C596DD1DF1C82EB79E19D45C2D76FDFDC78F0C8A7B7EFEE1C9C1739A139242527941A91CA36D2B45145AED9763C9E4FC66797A5FCD1E4F88D2C36D1CFD7B1ED6BF0F8CF7451FE930EDFBFB9D5C1D0678E3AB5C3C987767DD1E45E5AD1069D19CBA1EBA3C2A0BA7EFEE5D1E1D04B6FDFDCEBC3A5B8BD8E1EBA61876D8F1DE0548BCF29A6DB9D6343D57B8471B1158457435C786C2E5EB71E49AD38F4549AD8B9425D8EB46CD2E858AD51ACC5E7DCE6DE76EA84E51D11E7EFB86D79CB48FEA8FA13B54FA08ECA0FA19F270F7C74F4FD5FC4F014385D75BAFD51B21C36B636FD51ED159C574195AC7B19CE92469C9D7DCDE3A3C36B26B4FE859EEB2A6B337948F57568461093C670B63C5714E24EE2F674A96AA9E538F6C36BB0FE098B39D45C8F47F12EFF0016A3C679631C74CE874AACADEDE934BE2FCD2D4E4D8CA5294A4D62314F99F6EE64BBBB95EDC7814FCB422F0E5BE5FF00536C230CAEEBAB6378EBDCCB923CB6D4DE1CB3F13E9A1D1AD73CB19D594125F9564E2D5B7A8A8D2A54BF87149B7A7428BEBD7564B927A74D3A176E9326DAE37705375A6F09EEC3FEA4E6B34A38F5CEC796AF772B9BB518CB14A3FE0AF887169D25CB4E585D74F97A19B47A2ADC65DB5373AD3F933CAF16E2D5788D754E9C9A8674F53049CAF6A27713C47A2C6FF63A52BDA3654F1461F898F8B2F4FA15B4BA561E170CB6E7ABA4E4B438F75C4EB57AD5141BE479CAEFE8514AEEADECDE35A4BE2969FD095F8953B78BA76CB9A7B6ED7F54054DEEB3B95195E5474A8698825CDCDF6D76C9D0A552DB86DAE2DA0A317B259F33C6FF00A1C4A739D4A9E257A9E77B2C6CBE86A8CE9D39C70FC49BD96D87DCA0EEF0BB9AD417BCD79FC7AC61A6CFD4B78971BA2A09D597334B18C3FF00072358CD3B9A9CB2947458CFF4325D53B78A7E2CF9537A2C379094B4D56BC6A9AA989547FF004E3FD8ED70EA31E2B4273C72C258E55FBF91E5EC7823BDAAE505E1DBAF8A5BE7B699C9D6BDE230B1B3F0A12C518EF3C6FAF6C0F65A7A0E2D731B5B054684B15567124BD5312CB8AD1E2F2F77ADAC21F0C9E746F7D3E857C0DC2B4E37F711E58CB659CE3195D0E45BC2952E2F529C5613C677D341875EC6EAEAC78E3B6AFA5A61384F29E5BDF4477A33A735E3D3FE1E71F539542F2854E4A757CCB38C6A5B42A52E177B1B79E94ABB585AF500B2BD0A55DF8F4D625196FEA8DFC3B8BD4B49461771FC2784A59CF6E8915D0B59D1BA94A9CB34DAE74B1EA699D19CEA25529F3D1A91C3F363127D7EC4D836F456F5215E94674DE63259433A7938F6959F0E51A2A39A79D35D96C7669D58D48292D53591A2EC2349204E8292D51673A273A2B68D288DAC62F28B5524373A078888B8E355E492A29815BC7B1678889E22EE39243DE458D248155429C1CA5A24867511C5E2BC41549F850D97FB86594C6098DCA92F2E1CE4F97AEDE9EA72EEABCA535460F327BB1EBD5708E12D65EA25351B68F8B37E796CBB230DEFCD6FAD78594A9D3B4A6DBF89FC4FBB31DEDECEAB54A0B1F5D86B8ACF91D4975D8C96F4255BCF3F2D15D77C97134614A4BCB4B45D67FEC75B8759C682E692F37FE4AE972C5C5B8FC96762E9555194167BE3D07696955EDCAF19393DB64513F355E7975D8A2954F1EB3927A75669AEBC896D9F89FA1262ABF874A525A3D97CC16516EA73CDE659C944DE54525B3D0D5456229E36DC64B6EE529C925DB5122F31C2E9A30559370D167A899E5A59EEF6003192F17916AF1934529A8BC25F531DB615494B77B16D0949D69F36C98F61ADCB91724377BB19D5506DEC96C51194BC57D999EEA4EACB962BEA04AE75E52CCBAF42DB4B6E7797A47AFA8B18A83496AD9A653708617C4FAF60035AB2A7A4748A31CEBB9EB9CCB3A2EC67AD39549F245E73BB2EA504BCAB65BBEE00D46873BE79E9DD96B9E3F0E9BC22547E1D2E79691D97A9552CB4E6D72A6F4400F39A82C6E65A9512CB7AC86B99C96BF0C12CB7B9CF55257557969BC413DFB8E06FB7961B9C9E71B174AB38D1E77F985A568F199BFC38FEA5575F8B5129470A1B6BB8C92DA6FC1E69FE7FD304AF7CA8479697FDC64AD539F55F0986EAE3930A0B39E806D13B895C3F32CC7A3C9D6B15E1BE6FE65838DC3E8CE73F16ACB2974C1D09569469B6F76B0809D4B1BA5FEA0945EF85FA9E82177184D473978D4F2142718F2BEACD742E64EF23AE2292CFDC07B7AF8D54D261F151C8A574A5A476D8BA33E6D9EA1DC5DAE82AA9BD0B13C9CF849A7B9B696AB51CBB2B34B1B2A955486A9B1CBB99C94B70CAE8B19B747DE113C7471FC5977078B2EE477AFB5D8F78893DE11C6F165DC9E2CBB8778ED763DE113DE57738FE24BB83C47DC3BC76C767DE57707BD238DCEFB939DF71778EC8ECFBD2EE0776BB9C6E764737DC3BE8EC75EE2873A38D7BC1D57CE57EFEE7A469315C1334B112BC454F65294DE5C7F57FE47A7EC9D18BF87F57FE4F67E1C7B05423D85DB15DCF270F66A8AFCBFABFF25B1F67A92FCBFABFF27A7E544E541D90FE4AF371E01497E5FD5FF91D702A4BF2FEAFFC9E87089841DB0BBEB80B81D2FE4FD5FF0091D705A6BF2FEBFEE77342683D41DD5C55C1E9FF002FEBFEE3AE114FF94EBE5139906A177572970A87F28570B87F29D4E640E641A8375CEFF4B87F28570C87F29D0E744E741E06EB0AE1B0EC34787C13D8D9E22078883C0DD2D2A2A08BD2C22AF1503C65DC370ACAB8853E32278C87B2D2E014F8C81E3A0D9F6AE68291478E87854E616C6AAD034993224E7CA32907911391153AC0F1D7716E2B55772A0F2A33FBC2EE0F795DC37076D694907432FBCAEE0F795DC5B83B6B5E10308CBEF2BB83DE5770EE83B2B5E113431BB95DC1EF2BB87743ECADB944CA317BD203BA0EE83B2B7651399183DE81EF41DF0763A1CC89CC8E77BD03DE83BE1FC6E973A073A39AEE994DCF1054694A7278490BBC7C6A7DA9E20A16CEDA9BF354D25E89A67908A4FF00E1E8AC45BCCDEF8E8D96713E25E24A75AA6EF318AEE67B4ADCB38A9E9CF893F54C8DDB5A4C6631D0BABAA569C33923A67C8DFF0033C6E726D6B46DA2EA3D253788AF99978D5EFBC5FC28AD29D24BF46C48A94E4E59F22D8AB7424DBB353894A74D51CE125E6F5671ABD7FE2453D9E06A53CCEA54ED9462E5728393D9EE6772DAE46794D51A6A973664F7D0CB70DB83CE85CD625293427812ACFF00E51CBA1A67A753C28F34565F4F433CE352A3E67AB3A2E9283DB5E880E126B3243EE4F6B328547439673E5875582875A9D3F2D2865AEB9354A84E7BE880AD1ADA3F51F70ED6394ABD578E6C27E88B632746972C25E67F13C174A838EEBE4572A737AB5843EE2ED1A771E047CBF13DD9A2D2EE953ABE24E9F893EFCD8C18E34B5D3565B1A72C6120D8D3AB77C567714F57CABA2396E32BDB9842ACBCAF3858F4246936F1CD8932DA51858A7393E6AD2D9761CA563A573C5E5CBE0D297E1D2EB8EFF4169CE56D5E752A4BCD59259C6F8392E0A9CA3CDD7745956EA57D7F19C9E231C63EC56D2F41755631AD159F33483C6AFE556D6865FE25392717F439579730A97D4E507A2497E8095CF8B4A6B3E68E5A0D87A5E0BC72A3A0A2E5E65A49616DA7A1DBB1E312ABCF4A53C7367974EBB2E87CE2D2E2A52A8E717AA5AA3B7677FCD494D68D4B2D7A8B634F6964DD594E359EB19BC33A70B9AB6D0D1F3C33ABDB079CE1FC4F9E34F9579B0B3F23ADEF6BCB2A6B2BAA0A2BADEFDCD14D750FBDB3053A91AD3FC27AADE25A8CEDB0F51ABDE993DE599B01C0B746A347BCC82ABB2848326A10727B21EE8D16FAF1C21C89EB2D0E254A8A326DFC4DE037570EAD594BB689199B72965F4D48F6B9E1A293E69A5DB56C4B9A9CF57962FE1DC116E1094DF5D8A7129BE55BCDE5950A954657757FFC7136B49ACBF862485254E0A9C7A6E0ACDE5463D0AD968F4F5797BBE9D8AB99CA5379DF0594B4526549396174104B58F2ADB41EAF9A6927F32D8D3E587CC1186ED7500AE30D73D4D1149471DC584703B19166B4E55B6E53516ABB26698C746CAE50F32620AE71C472B4CF42CA49F2E12D46A90F2278EA3D15E6F468609378A79651179878B2E9B2EE5B5B186BB9434F3083DA390816432B318BF33DD94DDDC3941C69E9EA5929A8424FA99F96536B4F28C8D6F14E29C7593DCD918469AFA6589463CB14B1AB0CE139279784F418669B955B8CBF8223BEEDF956CBB8CB921A2D5826E52D9610053393A9A60D16B45452CAC0B04A2F32FB96CA4A2B2DE8D68047B8A9D169146292F0D36F594BA1A33CF4D4BD0CAE59967F5EE30E65D55F020E4DEDBBEC53696F567525466B30D353A51A6AE13938E22B765F0A5CB4D69811B1B94614D51A6B11FEA08AE683715A2D87AD4F96A2E45ABDBD0918F245453C6B990C965379828A7AEE3D1717709378C2CFCF5D8CB2AF1A73492D5BC1B23770A504E0B2DE8DFA850EBD9AD9A8617CCE9C25A2EE797F7BAEDC5A7A7CBA1AEDAFDCAA28B64A9E8E9AD726DA5F09C8B4B8E67CADEA75A84938F62B14647A9F09CABB5E63AB3D8E6DD2D4322C58F94182C680D19E9A1304C0D8200260981F00C002E0181F00C002E0181C823761D742BB85DCE7CA52EE5529CBB87C953DAE9BBA5DC0EED773912A8FB95CAABEE2F929F63B2EF23DC0EF63DCE1BACFB83C57DC3E4A7D8EE3BD5DC0EF57738AAA3EE1E77DC3BE8ED8EC7BEAEE077ABB9C9E764E661DF476C753DF57707BEAEE7332C9961DD476C74DDEAEE0F7D39B961CB0EEA351D0F7D07BE98321C87751A8DBEF8C9EF8CC410DD1A6BF7B60F7A665086E8D469F79913DE65DCCF80E03746977BC4BB83C79772AC0701E42CF1A5DCE859CDC923978D4E8D96C8AC7D964E8AD8CF70DE19A16C5170B466B97A678FB73E72797A954A72EE5B516ACA648C2BA215D47DC1E2BEE0921702358A6FB879D8890C90C8DCCFB9149830148027330E59301C0C832C9A8704C00020D80600175231B04C0021E778FDDCA553C28BD16ACEFDC4D53A729763C2713BFF16E6A72EB8DDF4153575AA29CD49EAA1AE3E467F78789D66F09652FEA668DC4B924DEF26E284B9ABCD4E34E38E8DFCC73C02BA8EACDCDEF29633F33A3CDE1DB469C7E26964C34F1CD08AE914FEA76B86584AEA719B5E544E5558C53EEEE95865AF34DA15D9CBC2508ACFC8F4D5786F8CA114B118FA1B2970EA715B2667BB5AEA478EA7C12A54C2E56B06A7C27C25CAA3AFC8F5CA84239C457D8A656AA4F2D6A1E47878A8F07A929B6D3C97AE0926F2D64F611B4847A223B74B641E4787915C1F1AB5848A2E2CD456211CB3D756B7CF4D0C35ACB9B292C361BA34F215AD5C1FC2E53ECBA0D4B854E6B9EB689EB8D8F510E18A0F2E397EA833E1EE7D1FD07DD4BB63CCCECA105A2D1196A538E7113D355E0F2AAF7692117068C5E916FE613217179876F26B2A384BB99FC17E23961B67ACADC3311C4519FFD2B0F5454CD3707989DBCA6DEE552878723D2D6B18528B72D11C895BCEE2A36A0D417A15334DC34C1252CB92DF05B69A679BA9B2AD9B8C7628951715A22E65B45C74CEA5CB5163FFDCD7E46DA1579272874965FD4C9520D4D3C0F4F2F1DE321ECB4EBDADCCA9548B52C3DB07AAE1775AC64DA716B0D1E1B9F5D5EB9CA3BDC32F3929439A496DB86C69E82ACAADA711856A5974B54D7CCF41171A915383CC5ECD1E6A574AA72A8EB83ABC2AEE35253A4B658C642F94BA381922243244E822460E2B70A14DC5337D59AA54E536F63CCF12AFE23979B7165FA3C7F648CF29CBB6A18BE6C2FE679FA14278A6916C66A0E3DC50E9EE25AC6117B245F694FF3CBE86483756ABF9E0E9463CB4A30EAF03031597297428D652C9B6A43928AEECCEE0D41BC04148BE0F42DB6A195962C57E19D1B5A58A7A8C94D4A7E51230C40D93879594463E57911A84B4F90B9D97A964BAF62BC6A325A97F40548EC3D3595FA02A6FF00400AA6DF2C97D436AF30CBEC0A9F08696214B3D0099DCBF11E4A9CB3393EC34DFE26448E1CDE7EA5425724E788BFA96C239DB65B8B4DE539745FA8CDE28617500B157CCB4584B765756B39BC67963EA553AB1A716D3CBEC518A95A7A3C2EA017B96AA3192CF62DE4708A6DE5BD4AE9C214DAD732EE3B8CE72CECB20062DCA4B3D032F3B6F64818E5CEBEA552A9CCF4CE002F94D469F2E708A9D34E69ADCAE7529D349C9E5F6C96D09E7CCFECC60B5A9B8F250D93CE71F71E5533971D96C570ABE2D77516DDFA6C33C538E7A2025705A4A5D4A6B623BBC35A9A1C54619C9939255AAE374C6093A2E589F57B0D5A0E9D3A71C6AE699A5E14E31ED829B8A8A55A296AD3401727A431E899A5454EA439161A6B2678CB54B4D8E9F0D8A9B7192D56CC54DD6A7414A9C64B496326EB2A8A51E57A4919ED9629A468853F0EA73AFA8E26B44B3839F75B9D196A8E7DD2D474B1656063340C19ACB8207040302040040409001481C130235932999A268A264538A265322E995488AA5524048668890018A19222432432448380E0382B40304C0D826008B8260620C1701C0701C000C0704080048380900204980800204980086FB2D9180DD65D0AC7DA6BA51D8A6BECCB63B15D6D8D6FA44F6E7D45A94C91A2A6ECA24635BC55242E0762894290522243243482436088380018084981800E038260006081260017041B02CFCB16F3B00707DA4BD74E9F850961BDF53C5569271928FE6DD9D2F69788F35C4945B79D3438B4EA663294B2F424C2A492D31F0AC95D17CEE537B472CAAAD4CC24F3AC9B4875954E9D186F269CB1EA311D1E156CEE6B26D69CD9FA687B8E196B1A54E2925B1C0F67ED54230EAF4CFE87ACB78A8C568657CD6B3C45DCA96C88D11BC0B9C8C225DC920362B79119B20605A053005945B13C259CF52E6C56015F86BB05524FA0E3218512A2BB15BA0B3A2358A92C8B4191DAA7D0A6B5A7F2A5F53A9CAB02CE09A1E86DE62EB864AB4F95F363AFEF009F0C84629462925E9FEC7A19515D91554A0B1B13A3DBCBDD5969A2FD0E5D6B46E7A2D0F61716AA49A48C53E1E924F1AE425D0B36F27736D9D96C8A695071CE9B9E86B59E3C46D6D931CEDF14F38EBD8A9922E2E555872E3E668A527C9BF51EE68E99C742986525F22E5DA6E2EC59DD4DA514D2C2DD9D2E15773A55949BD25D56C79CA139462F1937D9D672A697334D7A9719D7D0ED6B46BD18D48B4D3C97A479AF6578878B56ADBE729631D96ECF4D1434573F8DD6E4B6E5CE1C8F2F567CCF393AFED2D7CD4E44F6FF00070EB3E5505D5B32CAF9692785AE78E54BE65ADE527D91969BE7AD84F64697F1463F20D8D3658D3DA4FABE63A105CF53D1328B58E20B4DA26AB58EB9185B731F2AF4299C7F08D75D6628AEA413A7B0C33D1864E9D18A5130505891D1A6BB8E11651D1A33B8E11B651C94B8E5341439F25E6F4171965F521AB2B5A32766B28AC262D41A93D595D7DC7B2D126D38E0AF38A2D7624659CA62CDE22D042ACCE79516533A8D3E55BCB77D8659E69458B8CCFA64A23B7CB49413D5F60DC54C43960B32E9E82AD3D7018475CBFB8C1214524936DBDDB658B6D1617EA4E6E66D4569DC13972AF4025894561B7F25D49E2BCFA7646775629E5B6DF4445571ABEBA805D525A65BC2DD952A8A49B49A49E8C4966A6B26D2E882A185ABC7A2D80289479ABB936F97D762F849D4DBCB1EFB02A45359D9129EB14BA003C795E397CB05FA85F34EA3CFF0D6DEA56F97CB173E5F93C0956B4A524A97C2F600BDCB9DE238C751E8C145E76656A2A953EF260A9524A6A2B4180AAF0A4D6FAEA50E3E783F936CBB973BEC2359D31E8B030B296253725B2474EC2A787E6F5EA73A9C541460BE26D366E82C471B083D0DB558CE29A7B9BE093491E6ECEEBC1C296B83D05A558D584651791E353945F8D35305C9BE5B186E075319580662B25A0102C020800903400810000204020BA6513344CA2645546799548BA655220D5B22230A00643202190E04482829106498204981829060012102419A209104090812004090200081200036D9F4319AECCAC7D9574A1B095761E1F08957634BE913DB0D55AB2891A2AAD59448CAB68AA428CC88950A0A220A2890291020498080230842100210382000C1878C5D46D2C6A546FA7F746E7B1E4FDB8BBE5A50B64F7CF37E8C54E3C5DED7955AADBEFB94A9E28BD7405CCD4731455CDCB6EFF510569B9D48A4F6793A16914ABC52D64DAD7D3273ECF5936FF68EB706A5E35D7335A2785F742C958C7B1E074B969C5B5D31FD0EF43489CEE174B96947E5FE0E8A4651AD4930648F715B1846C19011BC88D33A8722BDC2B2005B2200738190850A4C8C1983A901D44674C2DE50A4C8123591251C8E41867952CE98F9895E869A236244714D0B436E0DCDAE60D773054B4934A096CF2CF4F3A1196E8AE76D15D113A56DE4EEED3969EA8E64A8E278C6C8F5F7D68AA6CBA9CABAB351CE104BA166DC0A89C318D341ECEBAF15472597B4DC6273E93F0EA26FA1D18573E51E87D96B9F078B475F2BCE57FF00567D192C1F26E1B5D50BE539691FF667D629EB4F2B52D95793E2CDD5BB93E873AE20DD48BEC7A2AD612AB393C1CABAB76A7A2D8E7D35DB1D943F125235C619A917EA359D0C45E56AD9A61475DBA8E4F01AAD63E466AB6586576D0F21A6947964512D9C7314272E6382DDC1CB81932A8F2CCE840CB286A5F4DE810D71549624582C874A33568E1E4CD2586CDD516519651DC8AA8AE0F1B15D579C866B95E5154E5AFCC5B3D2B83F3305678D8682C49BFA1557EBDF2389AA61E6CB7B8BCAE2F3AE474B5459BCD23488AAE4B9572ADC5798E211D5F5C962CB9E593E14DFE6632245A8E62B5EE24A2EA3C745AE074BB6E151E44FBB18659D3F36DB750D3873CB1D16ACB249B788AF9864B96185D4415CA6B99EBA278483BAF5F51234BCD9C22C8AC65F618272CA6F0F62CE5508E338C6EC309F36A960A6BC972CA2BEA20C9E24AB5594A2B48EC8D7429786925ABEE51C3A1274D4A7A3974FB9AE73518BC6EF619D48B5296F9C6E372F34B99ADF41614B929E3BEE58DE1A5D8212B9E8B41A9C124DE33D75EE3469F341B7DC8F38518FD7E40029C713E6EBBFD0BAA54F2795F51562106FA63067E6C4F7D1BC8136C67CD1CAF891D5E0B78D3E5CE9DBB1C3849C2B4574923458D7F06F9C7BB17AA7EE3DAB7A186EB735529F3D352EA66B92EA232B00580950321190020020008008041004201B4542899A2A233D433A719E65522D9954990A2322232262B7416446454A4373EA6397538E3E2ABB2AC089CE47327FCBC07655806F057E2092AA1FE6603E3ABB9913265F1B52D84F26D873639FA4DC74B82854F409BA4C4020A00212106048420042040010D569B994D368F51CF655D487C285ABB069FC28153634FA673DB155DCA2468ABBB28999D6F14C80869009314320209442420402108102421083024210006327CDBDB2B97578AD4ED1C617FF00547D16E2A7870C9F29E3D5955E233D3B7F444D38E5547CD524DBD302D697930B6247E09B7D76127BE3B6A06B2DE3E578EBA1EA7D98B4E6945E345FEC799B4CCA1A77D0FA17B3369E159C24D6B249FE88CB3FD35C27DBB56D4F9608B9820B082D8A28A2BD869492406D35943040243E846B51686C98221B040082E46234301902D191B62E75119F245AB02D83D000E49907422191930881E6103649CDA8AD81B16CF47CEA496A2263674105538296E60BCB75CADE0E9328AC9E1A1553C6F148724CE1D6C736BD0F47C7D72CF0B73CDDCBF36A6DC6C7922E9E792335AE373EB5C16B78F614A6FAE7FAB3E4D424BC39AF960FA9FB369C785D24F7D7FAB368E7C9D4F0E2A2F0B7389734139358EA7791CAB98FE231650635869D148B6149761D4478A2566A51C17C509045B100288D681410056830D10C4C001CE056162B6070B228A8B0CD0CA6A6A455C65A8B433D55A1B271C99EA470893AAA9E5ADCAEBC7CD92CA4F96A63A31AE238794B4654456670F2A64A9E4795D47C7931D84A8B6E6348CE963A3C8B524D2DFF00D864BCDF22BABB63AF5288686DCCC696AF4D3A8294B31D7E141F8B5E800B8CBF42A93729E3A1A2A690C6D92A84777D908165A68868C70B1DC11CB6DF4C8C9369BD802A71924CA6A6179719F99A2AC946197AB3239E6597AE002E8E1378E8342399372D96C0B7D69E7058F74B7183D38E929379D045E693C0D26D45C56ADEE0C351518ADC02C6F14F22C3324F3B86A6145473F32C84710D3B0C954F2E387B2DCA7954AAA6B68A3455E5853D5E33FD4AE09461FF0050034573548CB3B95D75385DF32D1A65D4179B6D131B89C146B52A8FAEE45547AAE1355CEDBCDBAFF71AE19570D6E32517B32CB9D197F48FB666C0C8C0234264990001C9320C93201004C8320119080106CA9B99AA1AAA196A915519AA3D4A64CB2A3289333AA46C99172433CFFA9C493173EA490307CB75795F96F97563E87998722E0782396DAA8192AA8CBDAD0A6A2C0637C9B339352365096C6297C469A0CF73F1D9563C8DF17A0725717A0D93DD95CC74C64CAD3193289626111319318310010084010604D168F5331A2D1F982157529FC24A9B1297C21A9B1A33FB63ABB99E669ABB99A6675B454C083215094741150C8642101008C401060480200301FA806863396F4EA015DCDB4EADBCE5CDCA9631A67A9F17B993F1AA36F99BC6A7D89DE46E215229EB1C687C6F88669DD4E0F758FE844CA65E9A6585C7D95A5C8A2BA955758935E818BCB82EB9166F351BC6911A5D3E096CEE2EA9535FCCB27D36C68AA5429C3B452FD0F27EC3583945D79AF97E87B58A515832F75AFA9A3475F919AE6EE145349E5A25DD592A6E30389734EACDBCBFD02D3936BAB7106E595B7EFD0A9F1394658E9FBF430CEDEB3E9832DC59D749B516FD04A77E97178B787FBFD0DD46F29D4EA78474EAF3625071FA9A2D6ACA2D45BFA016B6F72A69ECC6DCF2D6D79529CB95B3AB6B7FCDA48367A753246CA21594BAE858A432335A0A16F406400E022E721009D089E81480005B1738081A25439064290AF7104CEA326237A9322333964AAA3EE336515A61B1A799F685FF00C47DCF2D753FC592C6C7A0F682AE6E24BB1E6AE25979EACD78D8F22FA5372A4E393EC9C1938F0FA49E8D67FAB3E37C3E3E25CD2A6BAE7FA33ED36B1E4A693368C326B4CE6DCEB559B6ACF9219398EA73D561952C623D1853165A30670895B440B6266A75117C6A2185882B615343A024C04310B406AD824B23F288F4269C26C24B52D62C912B5124515568CD12D99455F8580AC3278A88BA53CC70FE85157F88329658E33A89ED8EA5752516F19C30C9EADAD8AE3AEE69134EA385A99E4F351B5D0BD3C379298472F0F7604B12E5A787AAEC32D1665F442F327AF444CE537F41184B5D583F2E177165AAC21E18C7C90C8AD61E174DC13A89472F624AA734B1D3AB11CA329612D10C2B79AD2CF45B07C28E53EA8B748AD49B473216C0ED1EF82885DA956705D371DCB993E5EA2D0A0A1394B772185B08E53935A8565BC82ACF13508F4DC786980014E97355E696C8B73CCF18D338166DB492D16723517CB1969DD8829BA962515EA97D0684799A6F64857152A8DCBE2D97C8D097252D0615E739C742BB8AAAAAA2F3AADFEE18492949BDB0CCD6D4E556F22A3D7526AA3DBDAC316F07D4374F312CB55F851C95DD3D19A3264C83200644A30004C880E49906419003900193200400C93220DF50CB54D750C9588C9518AAB33C997D6334998D5C4E60A62642B7233F47067A9120E087CB759FF76BA70F4290D1151363914B3A1455D4B5312A6CC27B362A9F117D065153E22DA2CF6FF1F58F236C5E8364AE1B0C99EFCF4E7AB131932B43A288E98E8AD0C9944741C8A82043901083085F69F119CBED7E309EC575E8FC283536168FC234F634FA67F6C958CD33555DCCD322B68A6428D2149332190A82864620023084210090842640264AEEEA7856B26B76398F8C4F16C92EBFE48E5BAC2D6DC18F77248E3DB5774EB789D3A9E13DACB3950E2939630A58C7D91EFB87D075AA2D3CB1DFF5307B61C3A3756B3AB14B9A0BFC1CBD3EE4DD7775B25BA9EDE028C7CCA4FA0695175ABA8475D751E9E70DB5B1D3F672D1D6BFA6B19CCB53AAD79F23DF7B3B66AD7875358DD27FA23A728E81A1054E8C22BA24193D085DF6C7569E5B13C249619754960C575731A516DB49226D6926CF38417A154947D0E15E71D8A72E492C2FCDD0E2DCFB495E2DACAC749634629BBE8EEA7B7AFAB4A9C9612462AD634DE251D19E6A97B4959BC392CBF43A56DC779BE359C7615C6C18E58D7455AB1A34E5169F541B7BCA75D66124FD0D29A689DAF436F5A5186AB5C9AE85579D4CB18F62EA7169A1CA5636A9681CE85517A0DCC56D0B1327308E42CA5EA3D8D2DE62392333ADAA423B8496AC367A6E4C3839F1BD58CB7A16438841EEF40DC2D56CC0AD091B984B54D0FCF16B4600B8D48C7DD682BD09B0E5572325CCF09FC8D355E0E65FD4E584DF64C8AB8F21C6EBE6EAA6BD4E44F592F42FBEAFE2DC5479DD99A52C75D4E9C26A3973BE5D5F65E8BB8E336F14B38E6FFF00AB3EC51DCF9BFF00E9B58CAB7109DCB5E5A78D7E6A48FA572E0D2565919C54D619CBAF4951AFB9D589CFE2CBF321E53C271F6AAA2CE1A15ACA2BB5ABE25369EF1C974564CDA2B69A273B45928E854DE181ACA756496A6AA554CB06997460BA31969B2324C632C5B896467EA3D8D2D11854B207A88CAC568726046A25133D48EE8D92895CE19269B8F5E0D4B3D4A9BC37D0EB54B74F531DCDB3DD0E158C53979740A789E3A11C1C7711799B5D59719D36732D0104DB6DEC0C65A1D269B48640BF872F4267F093F502FCC9F5447F028F7D05A00DF512A49CD28C3E6C66BCBE88AB99FE55B8C192518E1EAC8A496896054B1979CB24639630329C57999454AD2ABE5FCA3DDC3384B4486841416A802CA506D0CE6A941BC99DDC666D47E05DBA9554A93AB55528ACF36EFB000A15A5524DB4F1D59BE9B7BB2AF0A29C6115A2DC2AAA79E55949083568E190432934BE6CAE537C91E55AB2C826A3EA00904F9E727EA34E59A4D757A81C9460F3DCAA73CE3B6002953E55CAFEA6BE114D3E211CEDAE3EC732B4F1532B63B9C021E2568CD0AFB57D3D6D38E20F065BAD8DC968CC376B43464C3926456C99119B20C8324C818E4991724C801C8320C81B00392360C83220EA543256D8D950C958CE9C60AE6496E6AAE64918D5C00A78148F626CF066753413C7D71929AB36B266F11E7A9F3DD6F14EFDB5C73F0E878C0957312AAC57393671FC6AB9B7C6E04A95CC8A5204A521CE39B1DE352B65EE5F6F3CE0E6D4934CD56727A1ECF47C7DACF2CB6EBD37943A2AA4FCA588F627A654E98E8AD0E8A847432150C8A0641C8B9179D6402C2013C9323212DB57E728E62EB67F88820AEC50F850F3D8AEDDF9516CF634FA47DB256334CD358CD322B48A6428D21095190D9150C8A21080804242220C2002000873F8C65A8A5FBD8DECA2EA9AA95A09EDA98F34DE3A7474D7B73DAAB4A31B6A2A2F1CCF729BEA30A94A5194A294B7C95DF5D72D47878EDA9C5BBAD5ABCB0AA4D2F49331B94C66A3A2639677BABC6DEDBBA1772A3B473A9E9BD89B7F12E65531A452C7DCE2F1D4A172DBDDA5FD0F59EC45050B37531ACB269BDC73C9AB5EA16D812A6C58902711939F733E48B6CF2BC72F9E5A8C6725DA3D4F615E8A9A69AD0C32E194253CCA9C5FCD2FF045C775AE39491F3BA74AB5FDD38CA12A51D5E1AC19AE787A8D49A94FCC9E91CEC7D26BF07A12D630519778A4BFB1C2BDF669D4A92A8A52CFCFFD8DF1B24639E36FA78BB2B052BB54AA4F19EB9DB43B7C278157AF4AACE32798E395BCE1EE5DFE83751B85950FFA9279FE87AEB09DADB5BAA5184A296EE4926F56CBDCACBB728F250556954C61D3AB1FCAF44FE8766CEE7C6A797A3EA86E350B7AABC4A4E2A71EA9AD763170E9C2BA72A6D26BE259397931D5F0EBE3CAD9E5D8A33CBDCD505939D45BE63A149BE5444564BF6404A591E0B2931DC4BD236AB98AAA4B05D5161192ACD2EA4D5457393CB68CB5272CE5B2D95548A9CE2F7C13B568929E9B332D5AB2CE92C60D3271975C153B45379E6C7D472958C2EFAB529E9378F99AED38D548C929BCA12B70994D66125F7FF63254E1B714DE56CBB67FC1A6E22CAF516BC45558EFA9BA1554E195B9E46CE7383C3CA6B4C33B76377AA4FE4236DAD2C64E271DADE158D4967D0EBD696F83CB7B6171C965C89EB2688D6EAADD4791849D4937B93E2AADF440A29C29671B96D18F972D6E754F11CB5F49FF00D30A6970CACDADF975FACCF6523CD7B036CEDB82C1B58E7EFE9291E8DEE73F0F27767749CA6A1E27338ED5853A6B32C37D326F9B6A2F071AA59D5BAB9FC5E67AEDAE0ECBE994F6AF8345D4A5527D3546F84705D1B785BD254E9C525BBC2EA05122C6915C96863ADE591BE6B430DDC9413786D8AC33D1AB07B9AA186B4670A95E4A33973C56174C6A6DB5E2542AE8E4E12ED2697F71C85B74FE642A8D5CAD25192F4791D493D98AAA2C4F03A654A591E2233300480000D0C4C00552586515A2B06A9229ACB400E45C4524CC74F7C9BEE961B30A5CA98E22996921A1AE595C9E36DC78F9625241AD722EEF25A9795E4AB38CE8009396711F507A63D0953758C076DC7004524F52DA50C664FB08973C9177E6515B6002894534E6D6E53526E516D7D0D55FCB048CB2596924F1E80096B4DCE2D457D4BE9C614569ACDEFE809565469F2C12E629A52924A52D5B00BAEAAF81424F4E692D0A2CE4DDABCFC4DB1EE5F3B8E56DDCA6DE69431EAC9A6E85BF99E5F42F6F14A527EBA94DB79B44B465B7ED42DD416F2D3F400C12A929CDA5B64696904BD06A14B9229EFF00312E65E1C1C9F5784019ABC70E1AFA1EB7D9DB3F0E9424D3D8F294E0EBDC528475EFF73E81634FC2A508A5B20C7CD3BE2367430DEEC6FE873EFB635651CE6F50645C932499B21C89926401B24C8B906401B24C8AD81B006C8322E49903766A192B6C6BA865AC674E39D70649EE6CB8314CC725C291BD019074269ABAB8C332BDFA1AAA6C6651CCCF13AEFECBC4631CF419537D8D14A8EC689D2C2D8F3FCD5E98318DD0951AC1A2BC39519AA6C563ECAB255669B47B145445F6A7B3D2D675D5A0F42E5A94507A17E708F527A499219143AD8EA1A7554BA877454C2D6A5B0C253964693E845E592AE71D2D49E1199D6C7525CD4E5460AB55A8E726F8DDCDB1CA6ABA70AEB1B91DC27D4E346EF10DC4F7D6F5C99679F6B4C30DBB5EF0B3B9AECE799A3CEDBDC39BDCEDF0D966687C796CB3923D1DB7C28BA5B145ABD117CB63A639EFB65AA65A86AAC64A8456915484EA3485128C86110C86932200230240100210800082555E752EC3B16BFF000F4233F4D38AF9799E21372AED27FBC22B54B9639686BB8B8DCEBD7AFD0BFC3CC3973B9CBADD7A3BD478FF006960DDEC1F2B517E9E87B7F65E9787C361A6ECE77B53C2E35ADA2E945735359D17C8ED704A6E9D8538F5348E5CBDDAE9C760482B60B592D9A99A289686A9474653380AAA33B65739AC6A8B2A41AD8CB55C9742775526C955C3D0CD3947B458D51B97433CE95496D9177569242558519A6A492F924536B6D46DE52F022FCDBE5235D3B294BE246AA76B18AD106AD2B949E9928D27CF9C1D1A54F314894E825AE0D34E01222D4A70C688794708BA10C212BE912AC4B05CCDA4CE657A8CE8576DB6609C39A6F3A1956B18AE2BC6941B9338975C626DB5094238F5C3FEA6AE24E7717B2A11F2C219D76CE993CE46D255653536F9960D70E2F1BACB93975E236AE315A4F31ACBFEE7FE4DB478E578A5CC9493DE4B2D7DF271F86DB51AAA707169C71BA3D0F00E0AAE6DAB45E5D3C2E57F5D4D6F146539AFDBAF61C469568AF3C73DB28E8469C2A7A9E2AEACEBF08AEDA949C7B9DAE0FC5BC6C4279E6E8CC32C7B5D18E5DCEAD5E1F0CF34561FA19254E56D5D3CB69FF93AB4EA732DCAEE692A8B659128213E7A499E43DB0A9CF5A30ECBFB9EBE941D3A2D33C1FB4D5B9F894A29FC395FA8633CA73BE1CC4B2D41743A3C32D277B7B4EDA09F9B39C7A2C98E8431E77BB3DA7FE9B70EF1F88D4B89AF2D3DBEB1669CB976616C733E81C3ECA3676D0A30588C7385F53578658922652D59C3C18FC75172DAA74FD0594614D652592B9DD272C47615CF9BA9EACBE0A6259EAF2C5C0C46895AB9232DC4134FCA9FD0D6D15CE19404E2D6A3173E6E5C3F44619DB555539A0A2776AD1C37A650214A9F66BE813C1EB6E651A77716B1397CB99E0DD41DD43F8B14D7A659B21422DE72D1A6304961EA2BE44F0CF4EA297A334458AE84739490F18609D556CCB50E0290705117001F00C08CAD15545A32E91554D809CABC8981AD59D2B88E64CC1563AB40559949C9E4BD6A967A8B4E9E5AD0D30A5992C21A55B5A7C8A24F2D2EB9373A4F0F08B2CEC39E7CD35A7A86CF4E74694DCFCB0935F21A76F55FE56BE8CF474E95082C251CFC877469CB648367DAF31C92A6B2E2D63AE0B29352927E87A09D9D39A69C5358EC72EF6C5DA7E241669F6EC3D95C5CEB969CDC7B1545A8472D0652E7936BEE813F33C634456F6950A2EA54D7AFE858FCF24A3B11629C673EBA607A30E5FA004A90E648C14B9957D7E1C9D46B11F430D4A78A91C77D7D4597A38EA58C56332FA155F4B9EAA4BA16D27E1DBA7D7A14F24A72CBDDB24247CB06DED8315C37564A0B5CBCA355C4B0D538FCDB34704B1F79BC7292F241341ED50FC0F87E2E39A71DBAB47AEA3B60C74ADE349B7158C9AE8958CD0CFD34F4399C467CABF7E874DFC270B8D55E4A6DFEFA1A49B611CF770B3B83DE5773CE4F893E66B224B89B5D59BCE9F2A2E71E97DE57F37EA2BBA8F7FD4F33FEA6DBDD927C4258DD9A7F8B4BBE3D2FBDC7F9BF522BB8FF0037EA7929714927BB1A1C525DD977A2CB49F963D6FBCC7B8AEE63DCF33FEA6FF9BF515F147FCDFA91FE1E67F2E2F4FEF51EE07771EFFA9E59F137FCDFA81F137FCDFA8E745951F362FA8D432D6D8D550CB58F3AB58E75C1867B9BAE4C353731C9708C806426A8950AA18522DA9B199CB96478BD7C6983A76CF3B9A66D60E6D0AFA1A235B4D4F371CB5E1A12E31230D45A1A6AD44F267995BF29ACB22EB668CF558F6D2D4F5FA5675D7A0F42CA92C4594DBBC96C9651EB4F4CEB9F7370E2DA2BB5BB7CF86C6BEA5A3672653953ABF539B96593C37E9B39DDAAF556D5B2CD53793876371949E4EC426A5147065C9E5DFC9C7AF4CD7DF09CABAABCB48EBDE6B4D9E5F89DCE1359DBFD8F53A5E4EEC74F3F9B0D5DA78F94F50C6598FCCE6DBD6E646FB75CD2489E6BBCB4BC26B1DBA36717947A1E1AB965138F650D51DAB5D25137E39A8E7CAEDE82D7E146896C65B37E546A96C744637DB2D6325435D6325526AE2890BD46931495990C844321A4C400460480C90021084C303D5024F58870C8D69A9397A5E12CAC75787D2B95992D575C1C8BC4EDAA28A6CF4906A3F531DDD953B9C3969830CB1FD3A30E4D5D5572A4AACD296A9A468B7A6A9AE5424312ABA6C8BE9AF30E4465562D83B20643B9490E82490EC0C0D4CA0994CA8C5F434B42B4236495BC7B0BE0C56B846A92C88E3A0067E544502E54F50F2005718E116D342A5AEA5D088407894DCEC684BB19EE077D08C1520FA196BD2C2783A2E39455529E73933D2F7A70AADB52AD3E66B96A75696E736EF80CAA4DD4B6A9E77BC5E123BB796EE32E64554A4A4F0F463995C4EE18E71E7EC380D7557151F2296F24CF6DC3EDADACAD951A2D63ABD8CD082A91C4F50CACD49795F2FC8DA7230CB87FDD93DA2B5A556DA59C3783C8D94A74AB722D3965947B1AFC3E538352A8DAF91C7B8E0B38565569C9F3232E4BB6BC7876BAF6351CE945BDF08D6B5DCC5C3E1254D296EB73747B194694B5B4A537DA2CF9B7134EAF14AFFF005B3E8BC52A2A163565FF002B4BECCF07636CEEEF9699739659AE13CB1E4BF4CDCADCA308A3DCFB1756A5A42718BC671FDCA2F78150A3E1CE8457889625EA76784F0E76F05A64BBE7C23524F2EEDBDCD6851FC59664FD46BDBD6AD5E377BFDCAA1169604AF4DCE84D25A20B27E93A84A136CD717A1CDA32E5DDEC5F4EF697372F36BF21CA76370259053AB19AD1E479630523448BC8797254A58A982E88401E167A01508F62E43607A0A9524BA0794B0180B013948876898168C104840202606008C1A2B9C728B48D068B6E755A1AB3256B669B783B32826C49514C5A37168DBBE5E668D96B43C9CCD1BBC18E318D0650C2C202678DBACEC3D65C90E58F52CD8A2E6AF87522F75D44A551838B34453C681828D45988F18E18F43658D5C3C48B2708D6A5284926A48A2E61A64B6DDBE45909EF47ADC790B9A4ED6EAA514B0A2F115E816D46385B9AF8FA51E26BBB4CE7A7CD25D8A9E195492E77CAF65B9753D90994A492FA97D2828EAFA15B21AAD46383246399293EE5F55B9B12A536E29474C3CB272A71AA32E758E91457755BC2A5E5F89E885A39A745E772469BAD34B19EC49A9A119D56B4F348F59C1ACD5B5AACAF34B57F632F08E17CA955A8B5CE9FA1D9D960BC619663D12B90F447F62FA697F09E6FDA56FC0935FBD8F49F94F39ED1AFC097EFB1BF17F68E7BE9F3AA5CD3A8F5357BB73C7D4C542A7257699DDB48A9A583D3EA2DE2F23A7C71E49A72E95A4E33792CA941E363B91A0B1B0956DD24F43CFBF909967AAEB9D2498BCAD7A728D465596B4C9D5BEA389378397556247BBC1C933C63CAE6E3ECA0E4FB80832836747860549B19C5ADCD5676EE7BA363B073D91CFC9CF861755BE1D3E59CDBEA550CB58D550CB54F97AEE8E75C982A6E6FB939F53731C9715B20191135413D8CB3F88D33D119AA4D291E3F5F1A62906D3D0B79DB285510CAA23CBB15B5A9026B4229AEE0A9358092930DC682DACBCC4B9A88AADAA2E73D8E925D33CABBD6CF4468C98ED25948D593D6C7D22ABB8873459C3BEA2D367A1DD196E2D94C9CE6D3BD5DB9363392D3B1DEB5A8DC0C546D3965B1D0A34B94F2F9BA7B6F87A987538E586AABB993E5678FE2D4AA4AA34B6FFC1EDAAD3CA39B7162A72D8DFA5C72E3F6E6E5E597D3CA5A5B4E2B53B16549A7968DAAC947A0F4A8F2BC1D1EF2DB2BC9E34D9650D11D1A0FF12264B75CA91A693FC45F33A71655E82C9F951ADEC62B17E546D7B1BCF4CEB2D6EA63AA6CADD4C5549ABC54B148C08859D050A828A4982293200C3C6392B4F52C52C205E18ECD82601CE81E221B6D1B046B411D44075501F6D54D3948AAE3296225AE7AE5144E7AEA61978F07AF296B9E67935474462B59735D497C8DAF4418FA4E5ED321CA456E40720D8D2D7211C84E615C836A916E456C4E715CC3634772C08E624E78466A9570B416C69A5D6C0CA79325AC5D69EBB237BA5858413C95F09086752D8C490F2A1932B494453708B72575B5414E32A447119359D474898759AA5253473AE2CF965CC91D9E5C304A9A96E166CF1CAC71A9CA503546ABC17D4B459CA155BB446AAFBA50E6E615C398B7C2194303D1298D2482A296A5AD682C9A8AD4341C1F6B2BF25A2A4B7935FDCC9EC9D861CABC96DA2FB157189BBFE2D1A30D5278FD4F456D6DEE7690A4BE278C953C46595DD5D6D4BC7AD97F0C763B54218461B5878718C523A148D233CAAD924A0DBD912D29B952F3E898B59E62A2BF317C1E160A93CA2FA555B87D1AA9E9CACE25D70E8D3AB8C6BDCF4699455A4AA574D85929E3958E2D1B1B8A5253856697F2F2AD4D1EF1553E492D7E67525496D8315D53507942EDD1F76D4A94B2A4CD94E5948C99CC4BA8CB441E8DAA2CB114C5964594561C804C2324C1081022E098093A88C003831902041C0701C011704C0F8C0301A04C680E52C62E751538CF5EA2A6D27D4A2E23E2A4D6E8B6EB12994C6787822FB5C2534E0F28D14AB393C30E14915A8FE22C0CFDAFAD8715F31E9AC2F9092D5C623559AA74A527D10C7D3CBF1E9AABC425DA0DA6628E37FCA87BA94AADC549BDA4C0B1851E812ED9D3D2F349BC7C8BEA378E54082E459EAB6245B7FD8A4828A5B8EF0936D0918666E5D067B36DE81A0AF3CCDB7B6D83BBC16D23C8AA496AFF00D8E3DAC3C6AF1D344CF51669469A4B64822A4FB6A5A2C0AC22B2842C87A22486A2255F4D4BE13CEFB44BF025FBEC7A25F09E7BDA2FE04BF7D8DB8BFB473DF4F98FFF003C8ECF0DAFB44E1559F2D791BF87D74A5967AFD563DFC6CBA6CFB737A8A524D64957631DB5CA960B6A56491F27974F94E67BBF24B839FC464B0D63F7A9C1AF1C49B3A9C46BA4DFEFB9CAA93E667D7F43C7DB84785D5E52E5A2C56A8E959D152C1CE82726923BBC26968B98D7ACCFB30DA7A4C3BB36EB4B5496C6D850487A714968587C4757D7E773B23E878F8648F55332D6355432D63D1AF2239B73D4E7D5DCE8DC9CEABB99E4A8A9910190CD4CF755395338D757AA33DCE8F11CF2B3C97129CD55786465D3CE5F656D8EAFFA87A8D1E20BB9E739E7DC65527DC9FF00CBF02EEC9E957115DC13E209ADCF3AAA497503A937D47FE060375D6AF7B9EA358DC735447179A4DEACDDC35FE21B63C18E13C16EBD9584F3146EC9CDE1AFCA8E914A34596C526528B60C9C93562A686C2404C3932B223760365724876CAE6C90A2AB48A22F322DAA9B28A79E6D427B38DB4997D37F891F999E96C5D07E75F33A62DE82C5F951BFA1CEE1EFCABF7D8E87E5369E99D67AFD4E7D666EB8784CE4DDD6E4272698C17217991CCA9C4231786CADF128F7236DA71DAECA9A273A38BFEA51EE572E2B15F983BA0F87277FC45DC9CEBB9E77FD622BF30F438B4675631E6DD8FB8AF158F494A2E5B0F3A6D20F0D6AA413EE741D24E25EB68C73EDAE254724C4E691D7A96A9B13DD576176D74CE7C74E5E64C98933A9EECBB13DDD760EDA7F3E2E572CFA0254A535AA3AFEEEBB13C044DC37ED379F1BF4E5DA5BAA5272EACBE65F5A0A2F432D464D9AF09EEEEBB24A42F36449CB0C0A442E1A52EE2B989524513A98D89B5722F7505955C19675F1F32B4E753D113DC7A5D3AD960516D6C185245D8C15222D4E1B5141C94B435FBD426F10926FB1CDA916A5989CAE27C3EAD78B95BD4709F4DC2E561CC664F4F1ABDCB154391C32AD556AA371AD48F5C6328D1E3EB843EE2ED7479D60AAA4D191D7690B0B84E78949643B84C57CA2F0E4351A8A4B5239A749B4CCB4A7AE4365A6EDDE8324554E45AA5A8C85C5605711D6A46015F2AC08D24592423406AE4CE7F15B956F6956A3FE5697CF0CDD37838DC4ADE57D711A4BF8506A4FE69BFF00223BE230FB356DCF732BAAAB59B6D7D70CF4715E2DDBED1D0CF656CA8C74588C5611BAC29EAE4FF33C9518D6BA74F975C1A60B2960905D0B52E5592F48B54B7F8FF2FF0005F1D0A68AE66E4FA9A628A89A8B502FE20E915EF51FC8647918EFA3F84D9AF528BB59A13F93FE8144F6E745F950F4A5CB233C26B559D875244ADBE0F42D4CC942A6560D09E470D6A614CAF2326325883913214C08CC04C90087044420010E4088046200991904B633DCC9C709752F6F51651525A8AAA31BD8574DBD706D54E31E849609D2B6C7096342D8471993EA338EB9482A3DC0C60BABEA61E2F5F149C57D4D75AAAA70F53CFF0013B8739B8A7F3272BA82B9B34E72CF42EA71CBCF42B8AE69673A234D3595E83C514679C24864B1026FF20F4F434404A3E55811EAB956A5F8736921D5154936F7272B235E3E3B9DD435B2F0F1DD9DCB396608F390A9F8C77AC65982270CB6E8E5E3EC9A6FE82B0AD886AE62487A22B1A96E23BE9A57C2703DA0FE0CBF7D8F40BE1381C7FF00832FDF635C3DB9EFA7CA6E74B898D6F53945BBD2E6655968F764EEC5C332EDCB6EA51BDF0E5B9AFDEF9A393CFF00332F85C351C1CF974B2DDC74E1D55F55A6FAA29EA61E61AA54732B676F1CB8E3A737267DD96DA2DE6B9CEE70EAAB28F389E19B6C6E2519A30EAF8EF26174DFA4E69865AAF654AA7947E738F42EF2B566B570B1B9F1BD47419F76DF43873CB1EF2A196B1AE665AA7A55E3B9B73B339B5773A774B73995B733C9714908C066A62E20BCACF25C4D7E21EBAFFE06793E28BF119B7193000243631446420181B7873FC446266AB07F8A88C915EC3863F2A3A7D0E4F0B7E547596C634C51640ACBA84799868B5B5B18B6B6238C97466EB7A09A45D2B658D89F8CFE372795BE8590B772DCDBE0C53D8D14E8AC04E3F2738F5EDCD9D9F97631D6B6E4E877AAC5289CBBA9AD8AB848AD4D32D3581E2FCEBE62A614FCCBE60CDDEE1CFCB1FDF63A5F94E5F0D7E58FEFB1D45F09B63E9158EEBE1679AE3155C22F07A6BB5E56797E34B316466D30AF1B7B7F515578C99FDFAABEACB2F62BC4651186A73DAECC3934BA373564B76555EB558ADD9A68D1CACA25C50CC08DB5BCDA8E44EEEAA7F131ECAF6AFBDD3F33F8915D6A7CB2659C2A8789729F6655CB536E7CF97C3EAFECE5CF35B53CBD70BFA23D0C6A2E53C770393A54E2B3D17F63B7EF9CB1C64AC3AAC75E5C39652D75255115BAABB9CB95EBEE553BC97A85EAF09F69EE759D65DD0AEBAEE71DDD4DF7278F37DC8BD6623BDD7770BB8AEE177393E34FD41E24DF727FCC83BABA339F3BCE4CD51EE5907E4450E4DA6DAC6A6FBDCDBAF8FD28AAF12592259CB16BE72BE63C3E021B28AA659CF0CD95167262ACBCFE888AB86A74B9BCD2DD9A234D25A189DD2A6FCCF06BA15399656A563A2CB6B947046B2C75A9305A153815CA1834342C926829CACAF31CB5D4A54B967979344D618AA9E7A19D8D2566BC8D4B8A32853972E5359FA1CFB4E193B7799D6949E73F133B5E0BC611236E96FA86B67DFA2D294E505159C0FAC4B611496825643D6916EEADA527A1A63230529E19A633C31CA34D4A44E62852D43CDA6E56C696B964AE4072D00DE50129B8972C1BFB06CA8657335AC9E4AEBF9EAC61D9A6746DE1CB0429ED195F0A6EA3CB4E318A596D1A2D69F24522BE5752BE5ED1D0D708E0D24656AD8205C4B14F0B763C0ADAE7ADE912927A71C4522E42243C4A49BA1552D5B63559620D929AC4407D23DC4A91CC249F54CB58953E07F20A228A56F4D43E1D4E5F159C6D6A45A4DF36984759CB969A39B7A956A8B293C7726AE2BB7A8DC91D18339F4A1892374188D6850A9872503A61422636408C8613214C64620324023264C8B926401B24C8324604453CD4C0D92A6B12C939C5B548B5CB42BEA2BA807216D526963924573A9A0ADE4AEABC458B6196F6BF2C5EA70EB373936CDD7D372960C4E1CCD25B117CD20843C8B4DCBF970B04588C521D4798D22295BD30875A440B1971DF03D38BA93518ACAEA512EB58359935A02E65A3354A0E30C28BFB18EE61369E22FEC639DB5E9F4D84C6304678ADF53D170C9660BF7D8F30E9D555D795EFD8F47C294941653FDE038C753A75D6C16082D06C1D0F3C8D0696E16B42535A886FC342F84E171E5F832FDF63BB1D8E2F1AA729D29249BFDA34C3DB1AF935EAFF008A9FD0A19D2BDE1B732BA9B54A58D3F2B11708BB7FFC52FF00B59F41C79E1A9BAF3B2976E7B4448E9C7825DBFF00E37FF6B1E3C02EDFE47FF6BFF06D3938E7DA7B72BF4E501B3B0BD9DBB7F95FD9FF0081D7B3374FF2BFB3FF0002CB978FF67D997E9C3C9652A8E2F276E3ECB5CBE9FA3FF0591F652BF5CFEBFE0CAF3F1FEC4C33977A732378D2D19A285EB947566F8FB275BD7F5FF05B0F652B2EAFF5FF00073E5970D8E9C7939657D2A665AA8D7332D547875D4E6DCADCE656DD9D5B95A1CBAEB566792A33B0125B80CD6CB7DF033CA7145E767ABBCF859E5F8AAF3335E30E58484373441D8896438032334593C5546765D69FC544648AF5DC29F951D88EC717853D11D98EC8C6831A6D13E64534E939BD8E85B50E548721C8E85B24A28B6A4D25D0CF1972A28B8B8C2DCAB96A2B7164EB453DD17D1A8A4B738356AC9CB29B35D9DD6346CCF1E4F25DF2BAD5A398E8716F684F2DA4CECD2A8A685AD414D6C6B66C579D86568C74F546DB9B4E56DA462945C5FD4CF5A43B9C31F963FBEC75A3F09C7E16FCABF7D8EC43E146D8FA4565BAF859E538E4B1191EAEED7959E478FE919119B5E29BAF177953F1595C669A2BBC97E3B1212D4E6AF4B0E0DC74EDAA623864B8A8B94CB4A4D15DC5496086B7A6F0CB7134E6CD5C19AF1D25BE4E6559BE666DE07512BB8E5F55FD45C93F8D73E7C135A7D1B84526E9C73DBFC1D3F774F7661E113E6A71C765FD8EB283C1C18F16793972E1C31F6A1508A03A11EC68E5F515A5DD17FE2E747671C51E0C507C38F62C6A3DC9E5EE39D1F21EB8C9E1C7B139223663DC1CD0CEE5CE8F3DF9837C674B9519EA6F8345478667AAF53D1D6A6938FB513591968B007AB335BCEA2B8A919E79756BEE47A6ABA4B732548E64D1B24CCF28E664D39592E2CD56A78D53EE8F3F7FC4B89F009FF07C7A1D1A84A6FF00AA47B1505829B9B3A5734DC2AC1497AA4CAC641DCF2F61EDDD1B95E7A1529B5BA9412FFF00D1D9A7ED0D392CF2497CE2BFC9C5BFF65E9C26DD38A87FD292FEC50EDAE6DD6147997AE59567E9531BAFDBD553E3142A2D3FB7F934D2AF4EB2F2C97DD1E42D2A24FCEA507EAB0698DC54A59942A6DEA2F27AC7D7A7A69D26DE8485368E15BF1E935869BC75FDB35478CB92D97EFEA2F03E3CBE9D651C740E0C5478A5370CCDC4D14EEA9555E592FAB045C6C59B742AAD92D73582A9CD30A51427CACBA3533D4A9C72F4160F04348D71A9DD879D2EA675223986CDA54C74F0B2FA19A9B6CBA6F14FD5E854464AE979AAB93EF8474E9E94B4DCC14A38713A54579122B16390D0A785EAF52FC020B033358CA9A21514BEA043219196889127406C320ABACA312C5A215C5379EA1C804C8B55F91872555E58581538A6A4BC8644B9A4D9A67AC599E0BCCC4A151C6A5A9831A1318108B131B2549E06C8CD6261C95A64E60D85BCC326551632604B324C899264647C8531020474402611916484945762D656C54E11A5D8181981BC126568A6B3F2B2E6F4335CCB1162372AEF59B4538E58E88B669CEA36F62349FC90A42A5A706D6644E76961632FA8CDB9E8B45E82B5CAB093C9A48918AE58FAB3AFC0ED39E2EA497CBF53934632AB38C1267AEB0A11A141452C17226DD2B76B17D3F42B9D8C5FE55F63A3840690EE30E72E51C8970D83967917DBFD8D342D553D91B342682ED905E4CAFB2461841E41B9907990D3BA4E42280DCC89CC806E8A5A19EE282A8B54694F22CE496E34B8F2E114A52CF247ECBFC0CB84D25F917D97F83A3E3C17627BC417543EFBFB1A615C2E9AFC8BEDFEC3AE194FF917DBFD8D4EEA0BAA07BDC3BA1F7DFD8ED50B86D3FE58FDBFD865C3E1FCABEDFEC58EF61DD01DF43BA177D1A2AB082FCABEC37B943F957D857C421DD7DC57C4A9AFCCBEE2EEA34B559C3B2FB07DD21D97D8CEF89D3FE78FDC57C569AFCF1FBFFB8771E9B6666AA8D738945486490E5DCADCE5D78BCB3BD56DDC8CB3B1CF422C54AE14A2F22F233B9FE9FE80FF004E5D88ECAAEE79CBB83E47A33CC715A6D37A33E8F578629471839B75ECF42AEF145632C1DCF9AF237D1FD82A12ECFEC7BF5ECAD3FE55F6197B2D4FF957D8D767DCF00A12FE57F627873C7C2FEC7D097B314FF957D865ECC53FE55F60D8EF7CEBC09B7F0BFB1AACECEABA8BCAFEC7BF8FB35497E45F63550E034E0F3CA89BE4BBB6E070BB3A98594CEFD0B3D1651D2B7E1B182588A3642D52E84F69EE39D4ADD47A16F2F2AD8DFE024B62B9D0C8F47DD1CEAB531B1927CD37B33AEECD3DD115947B19E585ACF2CAD715D27D8A9C27079499E87DCE3D80EC62FA11F1544736CEE64B4793A94EA7322B56314F445D0A1CA6B8CB1A4C95578E51CDAF45B7B1DB74B2B62B76C9F42ACD9DC99F86C1A4BF7D8EBC1794CF428A874352D8BC633CAB35CC7299E5F8D5A4EAA96133D7D48E518EADAA9EE89CA6D7865A7CA6EF81DC4AAB6932B8F03B95F959F52970D837F0A27FA653FE546778DD98F5963E671E0F70BF2B2BABC1AE64BE167D43FD361FCA89FE9B0FE542F8A34FF3EE9F249FB3B7527F0BFDFD0B2D3D9FBAA15A3349EE7D63FD329FF2A27FA6D3FE5457C71865D56593CD70A7568538A927A2FF00074DDF4D2F859D45C3E0BF2A23B08FF2A3A78F1E3C7DC7072E5CB97AAE34EFAABDA2FF005289DE5C3DA2FF0053BFEE11FE541F708F63799F14FA735C39AFFA9E6DDD5D3FCAFF005078F76FF2FF0053D2FB8C7B20FB8C7B15F371FF00F8A7E0E5BFEAAF33E25DBFCBFD490F7B752395A7CD9E9BDCA3D83EE715D03E7C3F43FC7CF7E72AC351E719DF067A8F42FACF13667A8F43CBB7CBD7C66A457915BD7D45CEA1899D6B0CB542F2E6432192118C513180A0F4288B52946AC70D1CEAB6BC8F5594749B164D35AEA3DAB1CAE2E2CEC28D54F3159F9196B709C45F24DA3B5528AE6CAD0A9C2590DB6DCAF3B4F8756A09A5E6D73AB2E8C254D3E7A5F647679796596864E2F741E28B8C794B8AF52339F92696B8C26638F14BAB772927530B385A9EBEE2DE1392C413CB11707A755EB4E2906A15C75F6F3DC3BDB2AB297875A854D34CA8367669712AB7324E14E493EE9A3A14382DAD2D7C28B7F2352B68416229215911DD19694A58CBD0B6943304CB1D25B22E841462468B6CED0AD6645D3D014E3D45A56CF4A3B067E6A918AE836908B93E82DAAE79B97A97233CAB4469EA99B6968915421A174160B918DABA3B056E2A1916830C9899C85003E40D8A98252D47B1A58984A14F0C6E716C68652C19EACF9A781AA54D4CDCF99B62B5521EACF962D15D22BAF535486A6C5B3D2F23179C0E41B23649911B2640D664991321C8C2D4C392B4C391A5664298899398096263265698E86474C2044190B15918AD8A98315858AC930918EF1F959AE463B9594C54DCE93DD20420DEEF42D749FEA591A78D10F189A449463B154DBE8B736CA8F2D3E6250B67512D0A4870DA4FDE21E5D1675FA33D329E118ADADE34A0B0B52D9368B9E137CAF955C752A95C25D4A272665A927DC9B9098B64AE92EA2BBC5DCE6CA4F3B8B966773ABED74FDED7727BD7A9CD4DF71E21DF476BA0AE7D47A55F999CF469B7DC732B458E94259462BFB8F0A2D9B29EC72F8CFF000A5FBEC6A88F317BED4C685671CBD0C73F6C22BABFDFD4F31C69B5793FA7F439936C8DAF4F673F6CFE7FAFF9299FB692E99FD7FC9E365CC56F983634F612F6D2A3DB3FAFF913FF0077D796D9FBB3C862592EA6D8AD391E96B7B5B72968DFDD9CDB8F6D2EE0F7FD59CCAC9B89CABBA539378C8F1BB2CA69DE97B697AF693FFB9FF913FF00767109ED27FF00733CED2B79B7AE4DF46DE5D8ABA8992D7E9762B8E439214923A62F848B4820ABC244F09169002AF0901D08B2E20C28F778F627BBC4BC8036A7C05D89E022E20053E0A0C69219863B8822820F2848301CA4E4412000E444E441208072A272A0906039513950480039507950480012C0D9010091B26084009840C209002611308840098260840098260840018234100C260984403F50022CF48B672EFF00DA3E1F639556AF9974E597F8F53934BDB7B5BCBA8DAD0A7973D3397DB3D517F167ADE98FF91C7DDDBBF2D756599328A8F41A4F322B9EC70EDE948A1CB51A2CAE6F0C0A6071A10F14530964BA1AA128D8C91EC15A118C11EE2C9963592B94580236235D877078C830C9B152931AEA1505D50468A407B48A8AD8B10A92E836469A3A2F98B2D892915B0D8D0A696A4731252C682B6DB276A90D8E6658960AE3A097370A852737D3618A175579A4A9477EA6DB3A788A395611752A73CB56D9DEB78E22562CB2AB628B6281143A348CAA13242010E464F41324CE001B224A44722A9C856AA24A623AAD6824A5A94D49E08B5A48B25534654E788B652EA394BD05B8AAA14E5E88367A0F179AA7C997C2A9C785C799BCF52E8DC86C58EAAABEA1F17539B1B8C96C6A8F69D37730548CD0A858A59192F4C2995290CA4526AD4C2A45790A6095991915A1E2325912C457163A191C991724C8C0B62B646C56C9B4D1B1591B15B11A32AA91E62C60C040A150E778437BA4E324B05F058927EA6F84E324BB9726D16D8E7CED253C45EC8D742DD538E30687A6AC4956A705ACB1F41E93BB4C24B6046BD39691967E8190C6B4A2A19AA1AA68CD5119E4A8CD2DC0879AD44464A3450E8443A18591468B75A99E268A1B953D9574296C7338C2FC27FBEC74E9EC7378B7F09FEFB1B5F49C7DBE4DC6A3FF001B2FA7F430F8674B8EB4AF25FBE861535838B2E4D57AD874DBC76AD50E6E85AACD35B175BB4CE85382E41CCD3974DAAE43B449EC156ABB1D1AAA2848B8937934AC7A4DB17BA27D00B85C67BA3A51E5724742DA8C6581E3C9B4E7D269E7D7088C7F296D3E1F15F94F4552DE2919E508A63BC89C7A5DBEAA4210EC7968421002108400842100080841810108205648EE096E18EE0660808321200800480200121080108420042108010842001200201084201210840084210021080949477631B10196F388D0B3A4EA559A8C52DCE02E3B5B8BD5953B25CB422FCD534699B61C19E7E7E9CFCBD4E1C7E3DD7A3AB734E9E72F54785F6B7DAB7CB2A16D2FAE3E5DD1D0E3373EE9C32AB84B18DD9F22BBAF75C4EB38D1CA83FCDA3C9A59870F9BEDCF6F27537B67A5B79C4967339E5F7C7FB1E87D82B0BBB9E211BF9D271B683CA9656BA497CF727B21EC552AF5635EED3925EAD67492EE7D1AE230A34A34A9A5182E872F2F53DD2C8EDE0E8A71D96B3B126389238DE83355451CD8669A866AABA8B6A5D4A66AA523970A9CACD742A8C37E7242A8CC74C61620311C89CD81EC6824B04273132800720BCB82CC91A42322D00C2D8927810093124C92914CE7926AA4194890960A9C86A519569A843762877C45F4D4AACD463B97717B554F8728A5B672CDD696F1A11C2DFAB07158E6C25F23698EA39B2E4DE5E1CCE1F0C2476692D0E65947091D4A7B20C464B12180904B421301C104000C2C46C0D1BD0A2A32C93C14D4969B93552299C8A26F23D4919E73F533AD21D351A6DFEA532B4AB7F4A5E1CB9629B59C279FDE4B285295D4D457C0B767561054E0A31D92C158E3B4E596BD3CCD4E0D774F385CCBE8BFB94CA857A4F13A78C7AA3D693979B748AEC4FC97EDE4E1571B9A29D65DCF472B5A53F8A1FA88F85DB4BF23FBB1F617C91C78542E8543A3FE9143A69F5647C1E3F92581F6D2EF8C8A632992ADA54A2F125F51145A01B5CA432914ADCB2204BA2CB22CA605B1192C88E995A6326323E40D800D8016C56C8E42364D382D8099208D10E919EADDD2A3A3965F639D75C4E72CC69AE55DF72A4B5531B93B13AD0A4B3378305DDE53AB8E45AAEA71E55DC9E5BE664759E517316938A7DBA4EEEA4928CA594BA60752CA39F49C9BCE0D907CB1FEC356B4D5432A699DA7B23CEC2E9C743A56BC439B0AA75EA265CB85BE63649145489A5EAB42B9A158E78C552257834D4894B46562E52A1E22E06406789A686E6789A28EE542ADD4F639FC575A6FF7D8E853D8C1C4F5A6FF007D8D6FA4E3EDF2BE3D4FFE31FEFA2302A5A1DCE374D3BA6FF7B19151583873C66DEDF0E77B6335AD1793AB4E8BF0C5B4B74CEAD2B7FC31CC633E4E5BB70AE29359288D37D8ED5CDB6FA19A36FE8679E11D3C5CDE186117CEB43B16307A14D3B6CCD68762CADF09685618239B9D96E22D239D516A7A1B9B7D3639D52DBCDB06781F073C7D1C8421DEF9F42108010842004210801084200421080092DC91DC92DC11DC0D6108402421080108420C21084002401000908400842196EB88DA5A27E35C5383ECE586398DCBC489CB2C719BCAE9A88706E3DA6836E3696F56ABE928E1A31D4E2DC4AB6F2A5463DA51699BE3D3677DF87365D671CF5E5EAF04C1E0EAF1C74A7CB3AEE4FAF2C8E859DDFBDC7342E7965DA526CD2F47949BB58E3F90C32BA91EB087949718E2B63371B9B795782DA54A1FE47FFDD146387529D4A79E92688FF173FA5FF9BC7F7E1E9F297503A915D51E667ED1D2724A9C2A4DBE9168D342E6E2BC79EA41D187FF0091618FFC6B3D8FF331B758BAF56EE304F2F18EA71389718ACD4A36746556493F347185BFFB19EF6BDAA6D54AED4BA2E7C64E754BBA715A568C7A2D7193A38B824F2E4E7EAB2BE36E7AB1E23C62EE53BF9BA74613F8718CEB9E9F33D15A53A56B47C3A6B96318E17A9CDB7BB94E0FCCB09FDCB2AD56A9B6DF4D0E8CA5BE1CD86724DC66F68A5E3F07A89756BFA9E5F8270D8CA5158D0F4751F8F615219CBCAD0A382515149B5FBD4F2BF212E39C8F6BF17665C76BD3F0DA31A1452585FB60B8A9CF317C65186132AE6CF53CFDBD390F91640C8B27A0295CCA2A17C9144D618A9C669A053AAE0F52E944A65116CDB68D64D6E5F1A872149C19A217056F64E8B9AC83C4C6E63F1BD48AAA685B5C8D32A99D868CCCDCF9EA153F50D8D36296439322AA9751954CF50D8D2F72D0A6A4C59D5C192BDC2CEE2B448B6754A2757066A971D11539392CB168F7A689D7496E76381D27E13AB35ACB6FD4F3908BAD5A304F193DA50A6A9538C23B44D70C7ED872E5F4BE051C59E2D12EF934C119B8B6B0A6BD59ADF4C31F6CF691C246FA666A11D0D51D088D2AC4402D864521122048C464908C790926238AE6CCD5658D8BAA3C186BD4C226AE2AAF5124F512DADE7753CE1AA4B77DC4A78A9553A9F0F63A51B982872C3092149E7CABCFD34D154E945421A7F72D68E4CEEBCD94F5C9D3B2ACABD24FAAD19A4BBF0CB3C75E4EA23A88EA232897A67B2288E90C907181E92090C8A6AD650D16ACCD5AF1A585B834C78ED6BAF2A738B8C8E655A5CAF42D8394F5791EA2538650AAEE3319E18D4751D20B5A8512818A2C424474306430898D9023640C99164C4118ADE0A6B5D53A5BC97DCE75CF1094D350D10F5B5E385ADF71774E847326B3D8E657E2552A6797CA8C556A393DDB6FB9528B6F5654C5BE3C727B5F2AD9D5BDC1AC96CD9214B9B1D4D54EDE5858582977C33C6837B97C28C61B9A2343F99A43F24175CE05B4DAAA2B5D351D464B3DC6535D12073BCF41022525F91B2EF373472B0BA3EC14DB5AA1B0DC1AEA0A6FB7BBE54A3335E92595B1C484A4BCB23A765594E1CBD509CFCDC724EE879A289234C91549136308A7014168889D28F12EA3B94C4BA96E384DD4F630F14FE1BFDF63753D8C1C53F86FF7D8D6FA2C7DBE69C7AAF2DD63F7B231C6BE9B96FB459576FF007D11CC4DE0F3F3CBCBDEE1E3DE11D9B3B8D773B14AE3F0CF2F69292675A9557E1958E5E19F270F96AAF73BEA510B85931DC547A9442AC89CB36DC5C374ED51B85E223B7655D6878FA75DA9A3B56372F42B0CD973F0D77ABD58E0C53AB0E633DC5CE860A974F9B71E79C4F070E4FA810843B5E2A1084008421002108400842100200240049023B92608EE0160401008421002108402421324008421CFE29C5EDB87536EA4D4A7D29C5A727F4C958E373BA89CF3C709BCAB7CE71845B949452EAD9C9BDF686DA8370B752B8A9DA9625FDCE1D5BABFE312E6AB39DBDBE7E1839426D7AAD51A2D28D2B792E5A70FFAE515CCFEA76E1D3638FF006F2F3B3EB32CFC61E27ECD5AEF8AF11CFC36F45F46A519E3FF000CA55841493A8EAD5977A8F991D68CE328F728B8D1368DB1BAF12698658EFCE576C93A7E12CC2308FF00D2B073EF5D5A917CADA37559B9C719C3304A738B69EA6B8B9F9357C381754E5193728BF9E06B2BE9DB544E2D9DAAD1A75A9E254F1EBCA8F3D794BC1A8D2D8E997BA69E7E585E3B2CAF75C3EF69DFD151949397CFF7D8B570C84DF9A1464BFE68E4F0DC2F894ED2B2926FE4FEBEA7ADA7ED252F77E6C79BE4BFC9CB9F1E58DFE2F4787A8C339FF53DC745D3B4B2839CE9D1CAFF00951E7B8CFB43CC9C28B58DB0BFF273B8B71AAB7326A126A3F37FE4C1656756FABA4B386F57A97C7C327F2C98F375372BD9C7E9B6D6E637B5231AF24B0F396F06B7469AA8D724AA2FCAE2B28DF65C0ADAD69A9569294B7DD3FEA85AB420AAF924E31E9CAF0577CB7C2670E526F2F6E751A9E0D59C64B1ABC2C16DCDCE296B8D762ABCA4A15F29C9E5672D98AE6A3C61B65CC65F2CB2CEE12C6CE1B38F349D492C3E992DB49AA5271EC709579426B0DE3E675E1514E2AAC71AEF8E879FF92E2B7199CFA7ADF85E7932BC77EDD28576DE725F19E4E62A9D8D74AA651E1E9F492B66456C452073028CD954C76C47A01AB922B922E657358D5082971582B9471B17E322B888D473C907C6EE34A056E986C69646E1771BDE17732CA1811C65EA1B36EF1E3DC8EED2EA61E597764F0DBEAC367B5F56F1CB44CA1B9CDF52C8515D5162A7802531A78DC5AAF9517CF4462B9A98C842AE4F1DE273B1A5174A58A8F6FB9EA7D8BF68257F6EA9DC3CC97E6EFBFAFA1F32F692F5D4E22A0F3CB0CA5FA1E9BD8AAFE1D0725F75FF00D8F4F838E5C3B6FDBC7EAF932C793BA7D3EB10464E26F9ABC22BA7F835DBBE78465DCC572F9EEE5E98FE873E7E23AF0F34F451A228AA9A2E8911A53A432408A186902309002B914CF63448A2A45326AA32579611CEA92E766CBD4E30DCC918682936B955F26A2C1B8CDE597F2E0AA71FC40B152A3926F4474B82A6E73DF187FD8E7A8A5AB3A5C32A7829E8B0FD3E439E2A73BB8EAA4324551B983F42C85584B66BEE6BB8E7B29B0557155528FA8F3A8A299CEAD53C4A8DB7A741B4E3C37774B39BF9C9868D1727997EA08B87C5269192FF008BD3A11C4357D14777FA83A356F88E8CEB53A69C53593350AAE2A519BF9196DD4DC7C4ACFCD2D97FE4A6A549C6B654963D58AB3CE3A1292C8398C91AF95BA19575DD10CF55AD4865231FBC456F25F71277F4E1D723131B5D15224AB421F1492FA9C6ABC4A4FE0C25FBF533CAEE53DE4DFA64A98D5CE2B7DBAF5B88C22BC8F262AD7D527F9B08C0E6DECF7039ECBCCC7316B38E45B3AADEEF3F32AE7796B12F9B1E34DCE5A26F3D8D34ED94566AB59EC995E97B91969D29D47B67D523442DE31F8DA2F8A6F484525DF1824A54E8AE69BCBF5698B69D8C2292C421F568B54E315E692CFA339373C669425C909C5C9BC2516B7EDB94C6ADDDC36942693D9E186AABE3CBDDF0ED4AE69AF5046EA937B7F43052B4AF28253E6CFD4B159544F3AFEA2D16A7EDD153A12E98FB0EA30DD60E7C69D586E9FEA5D094E2B54C09A93C3DB40AC49359C32A849BFF0071B2D3CE34129634A4BA069C9D3965094E5A6A32C3D846E852AAAAC74DC8D18A1270798B3552AAAA2C7E60AE4E4E2B8F99E91A060B1A15A2594045F4B72948B696E10DB69EC62E27FC37FBEC6DA7B18F896B07FBEC697D163EDF2DF6917FC5FEFB2396968763DA3A6DDD7EFB2396A8BC1E7724FE4FA1E0CA7645968B53AB497E19CDB4A6F275E9527E18F19745C994DB0DCAC64CD146DB983D4C8A2F3B19E73CBA38ACD1A1A4D1D7B2D91C98A7CEB43AF62B6D07842E6B17DC2D0E7D4DCE9DC47439B51798331C0FAC10843D37CBA10040020210021084008421002108400598AB71A622DC02D5B100B60801200804240100202738C1664FFDC5AB5634A0E52E9D16E71675EE2F17349F86A5B24F18FDE0D78F8AE7FF000C39B9E71F8F7478B71C9D35E1594154AAFAB4DC57CDA670E9DB4A55BC5BB9BB8AEFA4DF3463F23A352D7C3CC69F973BC96EC5A34E31CE773D1C31C709AC5E572659F265BC96508AC6BBE0170B963CCBA7442AA893EC557171E4692CE8549E4AD9225BDF627C9235D4973D36D6BA1E56B5CCE95C36F4CBFEE763865F46B4391BE982F2E3D798C78B9FBBF8D575EBBA537B33257BAC4B55A32DE2B054AA392D99CE954538A4D9A6326B6C3932B2D8B677DCBA64E55DD47393E6D596DCE14B43256969EA6B248E6CB2B95D5549E25935D3ACF18EE61CEA68A335D900CA3542D65564BB33BF60E970EA1CD38C738DD23976B3F22C35F729BFB99F2B873B6BD591677786B86538E777DBA7538CC2BD5E44E4967A7FE4B6B558CA8A719493FEC794855953AAA49F53B9C3EE61734E4A5853E57F5D857193D2F1E4CB2F157DC3E7A49A965FCCE55CE799E4DCAA7C54E318A6B2B2F430D66DB717BAD0AC7C32E5BB8C337896A6EE1D74A0DC2A37C8CC559752A8C9A63CF1994D51C795C6CCB1F71E83584B19CAE8CD942471EC6ED548AA751E31B33A54E5CAFD4F9DEA7A7BC397FB3EBBA3EAF1EA30DFDFDBA0A44E6D4A235340F39C963BE55DCDA03256A590E4951DA15913E846B2008D76158ED342B790046BD05712C00B4A53248471F42F71D418D43436A953CF41D5348B120EC04551490B2D87932AA92D0028AD2C675395795B09EA6CB9A984F5389C46B616325633CA72BA8E0F1AB755E6E692527D4EE7B2D176DC2E0E79CFFBB3937599E1753BB698A76F0A78EFFD4F53A496D789F93CA6387FCBEA7C36AAF060A525D7AFAB33A7CD5E4CE353BD708D38A94B5C9D6B679D7A99F5584C755AF43CDF2774FD365345D12AA65F139A3BA99040119210201007AA2A9A582D6573D854E397C59B8D1E65D3FCA3251A8A48E8DE45548F2BD8E12A9E15570969814537BC14D49255108EE62A396CC73BA72A9949E00DAE757352315DCEADA2C44F3D46AB9574CEDDB555CA826ADD9DF4D5532DE9A7C834DBC6EF28ADCD37A06124B2CB455F2AADD3D5EA61B9B98D3D32B40DD5C2A54DBCEE793E33C5254F3CB2CBED92A7974F0F1DCFC4747887198D14D39631D73FEE57C028D5BE9BBEBB8F2D2FFE28CB7EA9E53F91C4E156771C62EB1597E12FE237F2D31DF63D9A82938D0A2B11EBFD4AD69BF2CC78A76CF6D56B175A7CF25E45B2397C4E128D594A32693DB0CEEA4A9D3E58EC8E4DEF99B4C972CF6E653AD28A799BFB8BEF125530E4F1F32B9C5A9BEC533C2DF71B592568AF70D7E678C772A857E6DD944E5CEBE5A090A5272D1BC15315CC66BCB52949ECF72C4A5D304A345E127A9AE95158D515B2B948AA9D279CFE8CD14AD9C9E5E897565F0A318ACCF616555D49A8525FE09B59DCAD3A7083E5A6B2FBA5A8DC8979AABFA641E4B78E5BCCBBB33AF12F1BD650877D894C86AB79F92945B6F4F2AD0C74F875E5E38CEF2ABA5CB3CA8D193C49744F27528D1852588C567BE0B5E7D7E815532EDF4C94B8559C1A93A14A524F29CA2B393646308ED18AC76028B27235D106D36DBECFCDEAB1F30736766BEE272EF948184BD3E4016393EC98B29AC6A8ADF32F864FEA2CEA4A31F3453F96A071741F5CE076F45DD99E9DCD29AC49617AA2D8E8F3CCE49EDE82387D3A133DB4038E169AA067512A2D8C9AD18D19B4F29E1952D42B2981B751AEA7E5968CB5A39AA5AF666CB6AFE22E593D50AB9B978B5FCA2D4594F71703D3DC51CED74F632F105983FDF63553D8CBC41F91FEFB1A7D09EDF3DE3B494ABBFDF44608D05836FB415796E3F7D91CF85C69B9C79FB7B3C32F6B55ADBEBB1D5A36FF0087B1CAB4B9D773B342E13A63C5972EE562B9B6DF4322B5D5E9D4E957AEB5D8CF0AB1CBF993948DB872CB4CEAD7CCB43AD656D8C68514EA439D1D7B374DE030913CF9E4CF736D98EC72EADAF9B63D3575068E7D6A706C79E313D3F3652BDB10843B1E421084008421002100400240100090040013110D3156E0162D8205B04021084008093C2CF421CBE2BC4634A328A7A2DD97C785CEEA32E5E49C78EEB1F19E2B0B352A929664FE15F6305BF157E13AB70DBE6D96F83CB711BE9DFDCCE6DF973A2EC741D78C795747FA1EB4E198E323E7EF5573CEDFA7A2A75DD5873465CC9F729AD5F0F1B1CDB7BF8524B0BEA4B8B9557CE9EA54C3C9DE5DC68AB5B1D74289DC3E56949986559E70F72BAB358DF52E62C6F26FD2AE23352D799BFDB17875DCA15124F186535E69A6BA98D4DC2AA35B3C39A5BDDB7AEBD6AE2C954586D6E79F9D4C6CF0747855DA9D3745BDE2CE55E45C2E2716F54C9C26BC35E6BDDACA1A7539E0B3B99661E66909265B0FB23DC34DE18B2C813D417AF0DB4AB7222AAD3E67A889BC118255F52FB6AD2A351497729C062F0C4A75EA54E7E5A98CB6B6F528BBCE14F0977C32BA353C9CB9C05F9B3151CBEF9016EFDB3CF533CE3865EDE1B8BDD09343A58F8570934F3D4EAD85F29792A6FDCE4670CB22F1B19727163C98F6E4E8E1E6CF873EFC1E9A9CF41F98E3D95F786F966F31FE874D4F9A398EC7CFF51D3E5C3979F4FABE93ABC3A9C773DFDC5F19683A91914B059099CDA762F72CB0E4A79F0473035CE582368AF9F40730B40F840C3E8C5E6267B81ECD8C030D3073033A88CE9770640E424A605B19C8CB5AA68C7A93F532579868B6C9775346706F2A73543A97B5346716ABF336CD708CB3A36F0F16E16765B9D584F353E461B4878749CDAD597D26F98F67A6E3ECC3FE5F33F90E5F9396C9EA3D3F0FAD2AB2826F3BE0F556BF0A3C770797E3C1FCFF00B9ECED7E1473F5DEF1757E1ADB8E7BFDB6D3D8B625502D89C51ECD3A081050108020600195CCB195CC9A7186E9E1A385C4E9E6B294746F7FB1D9E232E5865FEF639355F8B2C84F30D8A349B7ABC9A61416362C8D2582E8471A31E8F6C71A3CB3D8D945B8A1A54F2B2B70C525B84C742D58AAC9AC6C5B4939A7293C462509736303711AEADACF1E8548AC71DD70FDA3E2B1A11787E891E6ED2854E215E35536E72FCBD1038A5595DDEA8C9B513D57B3F614ED2DFC66BE469E31FBF2F57C74FC52CFED5B6DE9438659AA71F8BABFAFFB9AECB34E8A94BF892EA72A571EF7790827A3CFF43B19CD4515D097065BFB6994BCB839F79B64D771B673A982A554E587A312586A4519E50CCB26EA91525B152A03DAA5D322A197A6FDCBA95B6377934468A8EFF42C8A8F45CCC3B8EE5429C30928A3424A9AE69FD88A5E1C32F4F43142B3BFAF3A545B5183C54963A8FDA756F9594AE5DF569D2A595C8F1278C7D8D139D2B4A6F974CEEC5A952959D0E586915D9155ADAD4BA9F8B59793F2C7B8CEEAF9FA1A76F3BB92A955B50FE4E8CDEA0B188AD067CB1DC5955ECF085B45B69D412F89FD03CD15A2452DB6449B105CE685E6CEE2A8B6154C023647B05C300E5EC00B28E4A9C65D1E85CF478174038CF2A5196938AC9295695BCD42A79A0F665F2594553D572CF54C0DAA124F45B124B0CCB4EA3A6D425F0BD99AE12CAC311820EA06B0C3B89456F0F20854719A92DD06654F46254F2ED50A8AB53525BF52E86E71EC6BBA7570FE167663BE811C3CDC7D9934D3D8CBC45791FEFB1AA9997887C0FF007D8BFA678FB7CCBDA7CAB8FDF6471E35248ED7B51FC7FDF647123B1E7725FE4FA2E9E4EC8D36955F31DAB7ACFC338769F11D9B7FE18F0BE13CB84D92E6B35932C6E1E5FCCBAEBA9897C4C8CF2AD78B8E69B6172F996A76AC2E763CDC7E24766C764571E551CFC52C762BDC797739F56EF0F72DAEBCA72EB6E5679D67C1C136FAA10803B9E00900418421080108420042100004800802C8443C84EA0164760823B040090057715A3428CEA4DE14536126FC42B649BAC5C6B88C6C6872A7F892DBE5F63C171AE24E6DD08CB2FF0033FDA2FE3DC59D6B8A953BB6A3E8BEC79D86652729753D9E9F8671E3E7DBE6BACEAAF36575E97DBC72F1DCE85EE89E3731DB47135AE869B9D16E745F6E2C7D52D39F89152CEACD509370C1CEB7A9E14DC5ED235C6AF45A0AB4C6CF6929625AEC575A788BC0D575D77F528AB2F2318ACD296AF266AEF1B16547A94D67A15538C6FE1B5B1CAFB345DC5E29D5535F9D64E5D94F13699D5B97E258C5ADE1844C5653C69CF53C85EA237AFA93252348C010319AC83780B62458E24D2C81EA10003D3961E4D1CFCD1EC658BC0F1961F6006A8BAA5868AF9B98B24D3E85524E2F3D0621251CEC2A658F0D154961E704D5CFD1E2F0F4365A5ECE8B4B78F54608B1D344678639E3DB9469C7C99F165DD85D57A1A35A15E398BF98F1D343CF52AD2A72CC5E1AEA74ADB88A788D4D1F73C8E7E832C3CF1F98FA0E97F298727F1E5F17FF0066F7311D4C014A33598BC95CDFD0F3EE3ABAAF5A652CDC5D1AB9EA175306472073B0D1EDB155D47F13D4C4A4CB619C0B436D3CF91B25312CD85A3DA4995C98ED6593945A0A268C771B337D4D8C373B32A42AE45E3CE4C11A5E24FD11D2B986599A78A51F53B7A5E1F932F3EA3CEEB7A99C386A7BBE895278F2C7643DBEAF2CC9CCE52365B2D4F5BDD7CEE7351DFE10D78D05F7FD4F696DF0AC1E2386CD46A417579CAFB9EE2D7E047075DEF17A7F85FEB9FF00CB64762D89544B627047B47414041190908400565722C6573D89A71CDE2AB341E7F7AA3919C68767892CDBCFE9FD51C1E66F71C3AD34E59F99726638CD27AB36DADAD7B8D631C2EFA1443CF829AF539250E9CCD23A71B585B45B6F32C7C8F3D7F539F8A528F4534FF51C8DB8F8F7EDD883CCA0BB24CE27B4B772E6E48ACE3FDCECF3725194DF66BF43C67B41713F15F86F0DBCB78E85633CBA3A7C3BF38AACAD677B7908465CADBE6CE33B1E9F88D68D0A2A845EC60F656D15AD8CEEA73E775BCD178C6980D44AE2E5CA4FE856F7FF000D79B2EEE4D7D46CE0B41C5BA92D7F6CEA519E6AB6FA155BD3F06DD7A8D4748BC12E6CAEEECD5AB25AB31D49464DE372DA9E66555311D90895782FF9BF41A145B7ACB2BE4159916BC463BEA015B8C21AEEC68C9A8F34B6E88118E7596C8CD7B5DE634E9ACCA4F97E49F5090E4DF83548CEF67E1C25CAB3E678E9D8D79A7694152A4B115A0B421EEF4634E3ACDAD58DCCA8BD7CD51FD303D8B77E155B5A4FC6957BBA9CC9BF253C7C1F55B9B2771D8CEBC4AB2CC8BE9DBACE770BE4AF9F6AE337378C16C297316E230F982551B5840918D24B71972C4A1C9B224FB88697B988EA08A2C8A2005CC1CCC38FB916FA800CE498C871BB173E8063B08D7368C7EA2B00AE504D3A725E5906DEA38CBC2A9BFE563C967E655529F3AFF9A3AA11B6A7958CEA04B0CA6DAAF3C39BAC7466A586B280F6492CAC94CD60D0D685535A0952A8CB4F4E8CEF58D4F168465D7070E6B43A7C125E4947B0A23A89BC37FA75E999AFD7919A6067BE5E42FE9C38BE6BED3D3CD6FDF647115267A8F68697355FDFA1C98DBE8717263BAF73A7E4D6118AD60D4CECDB45F219EDEDFCC75ADE879360C711CBCDE5CABA5B9897C4CEDDD5BE73A1855B79999E7836E1E69A658EE8EBD8F4327BB6A8E9D9506B018634F9B96696D75E53995FE23B57141F29CAAF425CC3E4C6E8BA7E4C6D7D3882E4193BDF3A7209926401882E49900620B906401C826499007209926401A5B15865B099D402E8BD06C95458C3073CBFB61C5153A7EEF17B6AFE7A9DFBCAEADAD6A5493DA2F1F3C1F30E3FC42575733C3DE4DFEA76F47C5DD9775FA799F92E7ECC3B27BAE757ACEB54CF4E83D2592882D4D5411EAC7CF65E269741616517D56BB7C8CF1796CB2796F22A31F4A2BA6D68F52CA559CA187BA1652C6FD4CF39B84F996DD42AE34B9EBBFD092965152969CCBA8D9CA13467ADBB32D497436555BE4C7552D4AA9C7C5D2BA13C56476A8BE7A3287D4E02972D55F33B16D3C35EA89C57C934CAF461DC35962722B4CA67ECF9203E44C8C86259D0AD31F3A01547B81A0E40C0227A8EC44C64C0AA6FA3647A6DD76232673B81C56D38E5ADBFA0ADE762C69E3D0AE51EB1FB09508DE0298ADE404AF4B54868C8A531931ECB4BE15E509662CD74AFF3A4D64E7A219F270F1F27F68DB87A9E5E1FE993AF1AD4A7B3C31A31E6D8E42935D47857941E8CE1E4FC74BFD2BD4E2FCBD9E3931FFD1DA8C4BE1148E3D3BF9C5747F43453E2C96F067265D0F34F536EEC3F27D3E5EEE9D4510B5D8C11E2B49EF16BEA3AE25465D71F531BD3734FF4D7463D6705F59C6C5B024F4C18FDFA8FF3AFB9554E214BF6C53A7E5BFE9A77ABE09EF38D35248C17555453CB2AAFC4329A89CFAF70E4D9D7C3D0656EF93C470753F94C319AE2F37FF61AF597430D6A9CCC6A9329C659E94C6633B719E1E45CB2E4CBBF3BBA6A68D94165FA19228DB4160719727A74AC9BF7887D7FA1EFED74844F05C3A39B8837EBFD0F7B6BF023CFEBBDC7A7F86FEB9FFCB5C0BA2551D11644E07B27430B1190C84842019645722C657211C63BA8F35392391C3F86D4BB4DB788AEB83B554E4597117677F3A151FE1BC63ED92F8B0B96F5F4CB9B9671EB7F7E1D8B5E1942DD7C3CCFBE596DC568D28F2C70869D68C69F3E743935EBB9CDBCE83ADB8B0EEBBAB6AD4CC24CF237F5BC2E374652F86728C17CDC8F4D297E0C9B3CE714B595C5EDA4A0BE0B8849FC9363C3DBB78AC997975F89D7F0AC96BBAFECCF1D4ED9DEF148D284F0E53F1251C674CEA77FDA0AC95054DBFCB8FEA61F63282957B8AAF5F0E4E2B3F42A65DB3C37E0BF1F1659BB97AE342DE3461A28AC60A3865B39CF9A5AE46BC7E2557D7537F0CA3CB1C8BE9CBBD62D170924915474A7ABC64B2B61C9A12715CA92133DA9972E752AD1C8B270CEA0847A8942B45B6A2B59963B8EF085CF2C5B7A760115DC54508B8F448C9C3E3E356A95E71F81B847D7A94716B85182A527FC79786B1DE5937D8D0F06DE9518FE582CE47F4BD76E3BFDAE954E45CD8D58D4684AABE696C17C94F57AC89EF126B44247FC34C5420B1B8CE79D118D549487CC80B4D1A3E84C22A4D8E9BEC046E5414901684181013427500006160C0800BB8CC5EA068D908D684E8005A16594B3D864410509F835E325F0CF09AF537D2927A7D4C5522DD392FCCB545D6D3CD38BEAB0981B4CA3A8925A166EB39100E553346CE0CF96BB8F7FF06692D0BB86BE5BB8FC98867E70AEFC0CD7BF0334A335F7C0CA7063EDE07DA2A9CB57F7E872A171A1B3DA86D55FDF64706351A38B932D57B9D3F1EF08ED5ADC798ECDB574E0793B6AAF9CECDAD6F20F1C91CDC576E8D7AB17932C65072666B8AF8CEA648DCF99EA2CB28BE2E2BA76528368E9D9D383C1E6A375AAD4EBD85CE71A86194473F1DD3B756845C4E757B659EE68A973886E61AB77AEE5E76698F06396DEE70C987D8721D2F30982728C4005C13958C4005E52728C4005E52728C4005E52728C400594742BC16BD8AC00C10D82404BBAF1B7B7A9564D2518B7AFA21C9BBA856C9375E6BDB4E291A143DDE32D5AD75F9A3E7B3939CDB7BB793A7ED05FBBDBFAB36F315278FBB3949E4F77878E71E123E5FA8E6BCDC9725903453D119E1B97E708D5C997B326686F31DD1933966893C410A8C59EAD4C18E751B2DAB2CB33C855AE316D1AAD7959AA32D0C11F4DCD14A79587B89557CDF344C170F9726D6F28C974B42BE84F19304A5E75F33AF6EF34A2CE2D5787F53AB672CDBC75E84637CB5E69FC62DB85E7CF728EA5F5B6450695CF8FA320A02D83D060623E0AD0E98151D404D7206048142E42981E8EC57A056A46808BCF8C676035D5324A2844F95EE2AA8124A5E8CAE598BC497D4BF496DA3175D9AD3D512A955A6BA0C991D2EB07F7172D7C4B007ED62231530A7A8CB4217A03A8720133806591EA2E4467522396046FB0B2906C48B79F412554ADC98AD8B6A90653F52A9488DF61704D69211E5B0ECB0325D88972FAB1695B3D28E357B9AE8472CCD05AEA6DB743D30E4BE1D3E1F1FF0088A7F53DC5B7C28F17C3E38AD4FEA7B4B7D91E775FEE3D7FC37F4CAFFBB5C4B63B1544B6279EF64E86422632183E4002000915C8B195C846CF551E678EC396E29CB6CE755F247A6A8B7387C7E8A952551E730CFF00637E932D72CDFDB87F2785CBA5CB5F5E55D8711A95283A537AC47727938B1A92A15149674FD4EA53A8AAC6338B4CDFAAE1EDBDD3D27F0FD7FCD87C59FF0068D55678A060A0F9AE5FA2CFEA68B9ABCB4CC36B27CB5AA3DD2960E58F6F5E1CAF68EE24E5570B449EBF7377B1F41D0E173A8F3F8AF9B2FD523CF71FAEE7292E6C36DE89EFB9EAF81479781DB74CD38BFD0ACA798EBE59DBD3C9FBAB5D3E6A8B5CEA766DA1C94D1CCB48B955D7075D2E580570E77E99EA3CC81516709681C3CE4335960851CB8EE23DFD0BE6B08A9AD70847B0C65FA19AEAA6367A17546D45F439D795310930698CDB1C24AEB8B2838B74E947C4CF4E6523B9439B9652EEFCBF2389C0E9CBC3AD270A9CD52BCA29C96B878D7E47A5A14953A714F7482AB97C5D2A8D06F59162A2916E806D0996E82A6BB0545137D501A6860D840D3A131A7A0302039D004C835181C90046D6C208406E328B600B240699672E9A81C7000A913015B11B118002D810007BA2BB4CC25520FF0099C8B278C7AA2A4F96E14BA4925FA81B7C1E62BE43359455078FB8EA5A01049128BE4AD16497A0B9D53F512E799A7A5899AF979197D0973D28B5D4A6F5791957D3CF9E2BE6FED57F13F7E879E47A5F6A69B753F7E879CF0D9E7F2CBDCF7FA6CA7643DBBF39D8B67E538F422D4CEBDAA7CBB0612AF92C25C98BF3336DD18BF3B2736BC3E8EBA1D6B1E9A9C84F63AB60F61607CD3C3A555BE43995E52CEE74AAFC072EE372F3BE197049B7D488421DEF9C4210801084000120080048020012008011EC56CB3A15BDC01A079AF6DB8A2B7B5F76A72F34D6B87D1A92EE7A1AD5E36F42A559B49422DEA7CB7DA0E212BEBFAB51BD149A8EBD32F076F47C5DD9F75F51E6FE4B9FB38FB27BAE655965BC8888DE487AAF0B4B21B96B6554F72C636797B14F52EA93C53466CEA5B565F862A2334F57B94C8B245626B15B728EDB16D29EB9125B0294B0F04AFDC6D848AAE5662C3196CC357586BD51512E357786CE9F0D927423F239777A4E48DDC2259A2FD0CF1BFC9D3CB3FE9CADF5358E86779C9A1EB168CF2DCD9C789A396862B8C874074465A01208D22021008180615E81550D163365717863B08562379423896604680454F29E81557A35A05A2B922173556A59598B2359D248A54A50D996C2AA97C41B3B03917478072C9766BD0B5C549682B8CA3B3D0652939B1BA683CC9F54373670A51CFD03883E9801B201AD06704D68D81C3D40F70BD05686709775F707872F4168F708C47A97785DD93C38A168FBA29E507237BE8BD0BF0BA2125EA1A3EE268B44818D750C9AE880965894B20B2CDD6F1325346DA1A21B0E5BE1D0B5962E297D7FA1EDE87C28F0146AF2DDD059DDBFE87BFA1F0AF91E575D7F947B9F869AE2CAFF00BFFF004D70D8B122A8172385EB8A43215050C191084C88031243312406A6A1CAE2F4DD4B59A5BE3FBA3AB3315DC79A9B43E3CBB73951CD84E4E3CB0BF71E46AB5BE35EB92FE1D5D425E1BC61ED928A8BCAFE6CA79DC649ADD1EF6784CF1D3E23839F2E0E699CFA747895C7874DE7449196DAAE787D5936F1272C6BE8595E92E27692A4A4E326B1CCB4E865B8A53B1B18D193CB5A65BE98C7F63C8CB8EE196ABEFBA5EAB8FA8C25C6F970AFDAA97708B8B7992516D6EF3A67D0F6D671943865BC1A8A928453E5DB63C34F32BEB7E69A7F8F149279D327BE4B1469C70BE142B7F969E8F55758E11A2C29E3566F9E9033DAAC2D8BEABC404F3F2BBAA62D2DC692D75C0918E5964979864AE49329AB88A78DCBA4F4D0A671FA88E33D4F875C9C6E2CE4E9BA7172E7A9E58F2EF9676EAC252F2C44A5654635555AED4A6B549E1A5EA0DB0CA63E4783DABB6B2A4AA65CF95379DF3846E6F3D45F129E32A5F44C1E243B49FD0945DDBB3733E9A8D14E5D1A13C68A49A83FFB43E3B6B2A325F4192CE551036BB95F3CDFE57F6165E23DA28069636BA3D00E5F62A54EB63F2FDC0E956EF1C7CC347A58E4901D4C7C8576D27BCF1F261850843E29CA5F3790F03C073CA5B2CFC8B69D2937AFEA32708FC315F6239E7A86CB66518C49CC56E6B7029E45B077203976172C2205CB2671F30B4060133F7236C0460612D8A6B67F09AE951173D8AAA6D1FF00AC0E3545F5F41B3A8B49E525E8334048DE81E82B0A7A02A3BFC3A7CD6B1F4FF21BB5E433F0696694A3DB1FDCD177F031FD38B39ACEC785F68A9734FF007E870BDDF3D0EFFB4553965FBF43851AE8E5CFDBD4E9F7DA14ADBCFB1D3B6A1E5D8C542BAE7E875ED2AC1AD4588E5CAED8AEADF7D0E7BB6F33D0EF57941991460E6F6273C634E0E4B1CDF776B1A1D1B1A2D60B3C183C6C746CEDD69B0B1C22F9B9AC8AEAD17C872AE6124F63D455B7F21CBB9B4D762B3C3C33E0EA2EDEEC84064EB78C24010021084008401000900400242100215B1CCF755E36D42A569E9182C8E4DF8856C9375E6FDB6E2BE0505694A5E69FC587D1A6781A92CBD4DFC6AF5DEDED5AB279D5A5F2CB39AD9EE70F1CE3C262F97EA39AF372DCFF00F407B901D7213564B298F2782BA6F51E43676790CE196D47E4450F25ADE602154C8A9BC1648AE484D203D8A64DC64A45ACAEAACA26B4C5A294B997D3259BA325B4F0F94D91DB3D4252B3574E2F115CB559A7834B3092ECCA78B2F3E43C0A5994D7A91EB374E5E7836EC6ED94547865EF0B633D537FA71CFEC907965C91914B0CBE32C84A7962B5EC2E499D00151A3208A987205518B21812414E1532C8B297A0F0628762C628DD36032905656D32C7815B42AB8A9A153C32C922B9135716466D07C56848B1B0981590CAB2EA89E245A2B943A95F234C5BA72469E78BCF4FEC17CAFA997120A5241B3ED68C2D35263D4AA390B781ED3A3BC2EA239A456E4D8B86C5B54C4F2A9D8ADC9C86E526015350B188E96A4511921E8AD59496A6A83D0CF0D02E7CB115F0C729B59427CFC56DD27A26F3F63E9743E15F23E5DC25F35FD29BEADFF467D42DDE62BE4791D5F9CA3E8FF1B35C7635C4B51540B6271BD11190A32002421320018921D89211AA9996BACA66A96A67AAB42551E42FA0A9D79C52C25D0C52D8E9717A7285E49FE5925839B3D373E8B8B2EEC257C275787C7CF963AF56B5D855E48B8ADF7327B5159BB3A1CAF0DD5516FD30C342AF2D45EBA1CFF696A3F069C13C2735FD19CDD4C92BE8BFF0FDB972E33F4E753A6BDF6D6715AF8F0CE3E67D0E2FC90F923E77635317F6B153928A9C3A75C9F42A5994A3D160E0B3CEDF55D55B7B5D1A0F443577E54253D2286ADD04E0FB2C5E361E79C95536F1B164E4C63ECB25B82349D47BE111666F96268C72C5242A15BA7082C229952A5D609E7BA2E93EE23595A12A8450A517A538FD86E68ADA289CBA0B283DC0C79FB240755AE823CA6152EE07A175981D69637D4384C551403C0BAB27B3073BC6AD8795240C682D04E7F9832FB0DCB8D4980D004E59C0797D42838D40812192444838C000C6A4205002F7031BA8B2D18002649803DBD40D3A14D56F926FB26CB932A9AD65EA80E2EA12CD284BAE116F314506BC2F93C16BD0085BCA245F417244C151D6E0B3C56947BFF866FBBF80E4F0A972DD47D73FD19D7BB5E5639E9CBCD3F9BE7DED536A5FBF43CC3A8D1EA7DABDFF007E8795923879B7DCF5FA5D7643D1AED4CEC5A5C794E153F8CEA5AB581616AB97095AEBDC63A9955D79F705C6CCC5F9F70CB25F1714756377B6A75AC2EB38D4F2E9BD353A961392C6A1867E473F0CB1EA6573E45A98AB5CA2995497868E75C5592669967E1CDC3C17B9F4C2100753C81010801084200420080048020109080003D4F21EDC715E4A7EE74DE5BF8BE4D1E9789DEC387D954B89FE5594BB9F29E25753BAB99D593CB933BBA3E2EECBBEFA8F2FF25D47661F1E3EEFFF000CB3792B633D7711EE7A8F12442360CE08251E1B8ED8902481367933687CF90AB2345E501585656F71D95B60B88D15C9160927A0AAE33B7C9553F5C1D0A72CD35839B5DE9A1AACAA7351C76225D5D2F3C7C4ACFC5E398737633F0297E3C91AB88AE6A4F061E08FFE2DAF464E5FDE36C3CF064F419D7053556A5A555BD0DFE9C5F6CED9642454F71A18276D6CF0D01113D074CA65A44F51D313214C2269D8AC3BA0606449122F0C3213A897ED7279447B89163EA389B018AF033CB1185380C496C59D046855515F372BD4BA9C94914D442C1E1E84EF4BB371AF9513950B09A686CE0BDB2D581C88592482E6FA14C936C9B5520CA58D8479930A8B1D4702D6D7B90AA23610483D2765D0812600D12192025A8C32A39C19AE6AE20D174E48C3713E6A8918F25F0BE2C775BF843E5B8A6F1B67FB9F50B579845FA1F2BB37CBAE363EA3C3E5CD420FD0F37AB9EABD9FC6E5BEEC5BE1B16C4A22CBA2F4389EA1C290105003220020018B2D860303532451511A645351134E3CDFB434DC5C269670CF3D5A596F43D6F1DA4E7673E559691E46A379F53D7E8B3EEE2D7E9F2FF97E2EDEA3BBF658CF18C74307B49971A126F46E3FDCD89EB82AE351F13874678F825DFB265F533F86DBFE0F97E3EAA4FDB8F64E73E216EA3AC635639FB9F44B793D32FA1F38B1AB257F414754E51D3EA7D06CE7971CF63CD8FB1EA7774EB5269E131EE25878453464DCBD106E64B9B5638E2FB48F361BCE4B69665058D5B33F34FC37E1C399F48E706FB4A0E8D35CEF9A5DF61D3AB2149535BE64493EE19311BFB1098592FB0928F5437AF4068F61288A58D1EE368D124BBA02F2BF4030943B1538F46698BD049252D862556A38D898C741F0F00C7D40D5E4897A8D24BAAC017D80222603D49B6A2098C13E43674001061840F6226062D032363A8AF6000F503DF50FC901F660017AEE0C6770EC80C46093C8B3D27F31F224B1959EE006D9E54F3D26CB994DBAC4E7F36CBB9B3B00FB2B44446FB12280DAACE5CB5A2FE677AE5662CF3949E25F23D137E2514FB8E30E79E65788F69AD9D47FBF43CB55B2927A1F43E276AAAB38F5786A7D3F7F732CB096B4E2E6CB19E1E33DDE71964D5479E28F413E15E9FBFB95BE18D74FDFDC8F8DB5EA2D70AAD4975467E7F36A8F415385B7D3F7F72A97097DBF7F7272E3DB5C3AA98B911923A76325A6A17C29F6FDFDCB29584A1B1138AC6B97558E51BDCD3A7B9CFB86F2697426A38465AB46A7EF02CB1BA57173632BEA04200ED78620210021084008421002108000244B3821CAF68F89C7875849A78A93F87E8D7F92F0C2E794C633E4E49C785CB2FA797F6CF8BFBD5C7BB537F874F5F9E57C8F272792DB9AAEA546DBCE59433DCC309863318F96E4E4CB973B9E5F656C56F50BDC57B945209004007830C98B00CD816BC864683D044C31D042C191537A9632AA9A02B1327A093D80A4096C2DAE466AFD46E1B3F34E2FD595D77A3070E7FF001125E8CCF7FC9BD9BE3AD377AC24BD0E6F09F2F10C7A33A771F0B39563E5E29F7167FDA2B8BCF1E53FD9E9195D4D50EF76096A8E88E0639E8C90DC6AA8AE2F0C9ADE798D11791E382A8BC8F106762C264543632520C9E84604F01C8C8189243B623D4555122CB7A14EC3A904A5619E82498FB8B218842364C018940CAA5A32D6859226AE5084B52E5A995E8CB6954EE128CB1FB8B92272A0A79412D96C1A14662B03819C1190896A23448980A44631B0164F40B657264DA7216A4B08C2E5CD51B2FAF3F299A9EF939B3BBAEAE3C7536E8DAFC2CFA6F0A966D60CF995A9F44E01579EC60D7AFF005393AB9FC65777E36FFD4CA3B5065F17A19A9B2F83D0F39EC2D5B050130A183220104020184806468AA68BA48492C934305DD3E6A724FA9E1EE6128549C5AC3526CF7F563A1E3F8F5BCA9DE732DA58476F439EB2B8FEDE4FE5F8BBB8E673EBFF00B71A584F6C7F70D68BAB63714B6CD3935F624A38CA7DCB697F2F492C1E9724EEC2C78BD2F27C7CF8673EAC794A1054EEE86BAC6AC62D7D4FA05838A8C5FA68782AB9A3C5671FFF0092F4FF00EC7B8B26FDDD3EB83C89BFB7E81CD772575ADEA39CB1D86AFE6A8D27AE4AEC232E44DEE77B8670DA4DC6B557993D90FD571E794C6A9E1B615A51E6C613EA69AB6D569EEB3EA7663149616882D656A166DCFF002DDBCEC98ACED5CD853AAB2B4977393736D52DDF9D797B8B4D71CE64A1833AEE0CA6078626A7CEB86FEA17D3B2112791D7EA2057A3D370C649BC751649E70B7176FA005D27D24533C442A4BA871DC0114F98990CA187A0B87B018AD409326E1CE36009A93544C69A930D6801081C13A004CE81C6404008D605EA33C6A2BD4004B4158DD00C46568596EBE63BE824B395F3001473E34B1D996EC534B2AE258FE57FD4B1E7A801CF4C053426750AF4035D079C1E82CA5CF691FAFF0053CF53783B9C2259A0E3DBFCB1C65CD3F8EC9734F98CCEDDB3AB382656E9858C265A737DD7D09EE8BB1D1F0C9C82D1F739FEE69F427B8C5F43A3C889CA8343B9CDFF004F83E84FF4D8763A5841D0343B9CA7C322FA154F85AEC7674036B02D41DD5790041A4480200101080108400012008C024A518A6E6F115BB3E6BED37167C42F2524FF000D63957D167FA1EA3DB2E2BEEB6BEED4E58A93DDA7B61C59F3BAB372793D3E8B8B53BEBC3FC9751DD97C58FA9ECB211B0B119DCF32406C046440A1E8420001A3A058B17A8CD8152B0A1659046423D783316682C596C0715E4127A01BD40D935A6996BBD45E1D2FF8B6BFE57FD4976F9531384C5CAE2551E70B2BFA18FF00AA3AB5FF004AD746BAD1E4E3D17CBC517D4EC57794CE33F2F1083F51F27D27A7F567FB3D34B77922DB4049E59133A6382FA53556A50D6A69A88A2489AD70A9065A9942D0B22C4762D4FD464CA936345EA36762D5B1054D84A49BA0AC206008F71E2F256FE618BD4475720490130BD51510A993A065B8AC4D22203D499088D4CD6A2A786592456D12B8BE9CCB54B28CB165B163951962B5B0113D08CA4224148090CF44316808D86522B9315A72249A4553906722A9BD0CF2ADB18A2BBC8B4D12A3C8696E617DBA3D62DF6BBA47B8F65AA7FC0A5D567FAB3C35B3C3C9EC3D94AA9C650CEDFE598F5537C55A741949D47FCCAF5549EC698332D37A17C59E53E81A104AE2F4193191D3184432006C900403062B4381A1067A8B39385ED25B73DB78A96B0D4F433463BCA4AA52945ACA6BA95C79F6673267CDC73978EE17EDF3F9C72FD5A2525CB28CB74A5A9A6F68BA55A707BE5B58EC66A6B2DA3DD97736F8DCF1B865AD7971F8F518C38AD0A9951525197CFCCCF4FC364A542928ACB9258460E29C2EB712A36F1B5873558D4845B4B3CAB5DFEE7B0F67B81C787DAD355B13AD85CCFA278E993C8E4FE19D8FB8E0EA27274BC795F7A5DC3387CDC54AB68BA2D8ECC29A49633A022B05A8CB76A32BBA68559D3F5469A75233DB7EC6644C7678654CB48B1B04A94E3522D49268AE9D7C69534F52FCE565172ED1AD38B7BC2DC732A3AFA1CD6A50789269AE87AB7A98EEEC61593696242B1AE1CBAF15C28B1932CB8B69DBC9F32D3BE0A96C26F2CBE91B4D6188F6C30C809F41183CE3D468CB4FEE09037D3640164856B00527D42DE5000C26C8478C8B9C3C74033684C8AC000D92675D801C77003906499C74268001B2649D098009D05C84125A000CE5093E83B165B311ABA79575AECE1FDCBE5A64A3FF009E0D3E8BFA96CD799E4052F519314806B6075F8454E5A8E3DFFDCE3C4DD635392A45E4139CDE363BCD95C98CDE4AA591DAE388E42B98AF223C93B3D1DCC9CE56F20C0B67A59CE0E7F5130C9816E9E8CE62B9E80C0AE3A06E86FC9019264A489080181200800480C93200725575710B5A12AB51A518FA9664F21EDA7174BFE1294F6F8B0FE4D7535E0E2BCB9F6B9FAAE79C1C772FBFA799E35C4277D752A93965BD967D17F8396C3524E4F3911B3DB9249A8F98F395DD1C8AC8D8ADEA33D2108411A321000046E820C80158B9C0ECAD8AAA1B206F40648D886954B715B0D478656D935B48C97D96D456F27836D9D25428C5756B2CC751E6EA09FA3FD4BE55E506D3D88964B6B5CE5B8CC634556A516D338D57FF00D743E66DA35F9AA4A19DF2CC372DC6EE3F3273CB71A706371B63D3E489E058BF2A61C9D51E6D49ACA33CA2697AA299A0A78552C316492D48896AB13191521F209B16A632657163265467619EA460C85EC04596045B8ED60490AAA2C4D8D92A849F71C72958935D44C8EF5454F71D386D099149924F492D4ADA1DEC2C96455509AA2C8C8ADB0C589562E521D48A724E663DA2E2BF990B2995738323EE29899CB5167203624B24DAB901B2A9CB23C8AA44655AE315CB71E915BDCB2999B5BE9B28E8F43D37B2F3E5BA92EF8FEE798A476F81D674EF69FF00CCC9E59BE3B19F4F94C79F1B7F6F7B4A5A17C199283CA46987CCF15F4EBE2CB148A62C74C616A63265698C9803856E2A61C8C8484208CB245152394686553D841E3BDA1B7952BDF1163966947FA99B87F0CAB7535CB1718E7CCE49EDE9A1E8B8959C6F2B538BFCB24CDD6D6D0A30518452C76476CEABB78A49EDE55FC6CCFA8CB3CBFAFF00FDB55C3EC29DAD38C61159C6B26B56CE842208C705B14726EDBBAF4E63319AC7D0A5A0C8090C302114232092C869D5952787971201AC86F434D719292CC5E8431C672A4F31D57634D3AAAA472B7EC6932DA2CD12E28C6AC1A6B2712F6D67427949B89E80AEBD18D48B5249E7D0761E19DC6BCDBD50AF6DD64D77B693B79369370664C92EA9659B864D75C025E578DD00991183DF3DFAF41A3A6FB01AC6AB6EC0CBFA7A081DAC3D00E24CE02B559E83056B503581DAEC06BB019585108011119107A8004FB8038030004DD048C01181AD18F915AE806AA4B1383F548B6A7C65159E1431D268BE5D1F740081EA0E9B9046683D706AA2F1B19168F43451601E8E8CB9E8C58248CFC32A735BE1BDBFC9A26D771B8B29ACAC57211A1A538F72B9558AEA4D3838060475A2BA81D78F7420B304297711EE07731EE846B98ACA5DD4576125771EE803A1E213C432F3B27331770D357884F10CBCCC3CCC3B869A7C4278866E664E663EE1A69E72789EA66E66494B116DBC24B2C365A2F13E211B2B49D494BCDB247CC7885D4AE6BCAA4DE64F7D4EC7B51C5DDCD674E9C9F24743CD4A4E4F2CF6FA5E1F8B0DDF75F37D7751F3F26A7A88DE4564C83A1D0E5D203A90806842674000121019008F40C5F70322118BD04633158510A4C81B274255A5758A64CB6B2D0CF264E4DF0F4A1CB37716FA25FD4AF885F469E631597F212EA7C95A2D7A64AEEA11A949C92E9930CB2BAB23AF0C25B2E43C26A4AB5794E5B24C6BBFE3C5FA8FC16972509CDF57FD8AEE9E6BAF462C77D93676CF96E9E921AD38B18AE8BCD183F41FA1D91E4D32624E2327A065AA2D33C33C908CB66B252F422B58641CEA26464C4762C4CB1329521E321CA8B0EB51CAD486CE4A4582D08D0F9D056022BCE19641E44920C7412AF9599E82C8299245267854C191A426496907981926847810248098CF028970D90B62C5E46020C933A11EE06001B164D8CD88F626AA164CAE63B657222B4C55F52DA655D4BA04C5E5E9A69E87478754E4B8A72ECCE6419AE8CB4CA2ACDCD39EDEDCA653E9F47B59E69C5FA1AE0CE570BA9CF6B079E874632D91E165356C7D563772569522C4CCF065B16252E4C6455163A7900B131932B4C64F5191F24C8320C80165351E132C6CCB7526D72ADE5A0A88AEDE3E25594DAF43646225BD350825F72F48240890E80864515408088642C202300888420006854DD39663F519818C9A69558D45A6FD5161CFCBA72E68EFD8D542BAAABB4BA9732DA2E3A355A519C5C64B299C5BEB09529734166277459C14A386B28AB0F1CAE35E5F048EA746FF0087B8373A4B4EC7397AE84E9D38E5329E05EEB00C65F948F38CA041E5E44A1CAC7F60A78449453795B8165FCC0196C46BAA157A0CDE1002B211ED911CBB819F3A87284C853D000E49B223606C0032364D190001049D4514552AADE880E41ABAAF94B25BCDE48E7AA33E734E5AEA5F1FE0C33D9000D991BD08F70279118AD0BE93C3454B62C88074786D57172897D5ACCC369350ACB3B33A33A09ACE7462B5CFCB8EB2DB154AEFBB289D791BA56A995CAD22676D4C8E7CAE25EA23B897A9D07670EC0F7487644DB552473DD693EE2BAB53B33A6ADA1D907DDE1D913E4F51C9F12A3E8C12F15F4675BC18AFCA89E1C7B0791A8D0413C48F727891EE6ACCF80E04F1224F110681F01C09E247B93C58F7183E0E1FB53C51595B78307E79AFD0E95FDFD3B3B59D59BD93C7CF07CE38BF109DF5D4EAC9FC4DB4BB1DBD1F07765DF7D4799F90EA7B31F8F1F77FF864AD51CE4DE4ADB15B22793D6DBC39348D939B207803128482EC14C06848400C0E49B8099104C813D492027A08F460489D00D8C424809864C44F522AE40A8F432CE58C9AAA6C61ADA264E4DB8E315CCB9A64A6F9A3C8FAE82557993F99759C79EA2F439E79AEEBE316EA7154AD94576304BCD573EA6DB896226484732FA9797E98F1FDD77EDFF810F90F92BB7FE0473D87C9D33D3CEBEE9D30B1131B25C4584922A96E5ECAA685578D54C9923010D0F190E9948530D958BF2346450A63290E545C57E4991148392B68D24B513381C5685550E9E81C95A63A6872958132B6CB5EA8AA6829E219064042569B818DB0AC0E02D18D9142B6101C82446C56D80D202416C49326AA16457263BD4AAA115AE20B72D8154516C76143C97C4D345E9831C59AA8C8A8E7CE3DAFB3D5B9ECE3DD3676A9B3CCFB3157C928F63D25396878DD44D7257D274997770E37FD9A62F41E32E85317945913174AD8BE858995261CEA0172632652A43458C97A64C88993204337A14421CF5399F4D8B5AC8D15800648742A1931909130649918364991721C8C1B20C8324C810E4991419006C9320064024994C9B84B9A3A345AD954F500DB6974AB470F492341C393709F341E1A3A36378AB2E59E9345E396FC54658FE9ADC535A9CCBEE1CA7E7A6B0CEA11A2CA6565DC795945C1B52586855A3F43D05E58C2BACE312EE716BD09D09B8CD63D49D3A30E4991101EE46B085CEA2682B70CB0898CA06FF34209B8AF1F40BD3FB8BA3D8608F46345E41222033E74C641B30095AB429479A6F410599518E5E88CD5AE96D130D6BBAB564F5C2FE51A11CE1834ECD79AB54DCDEA5905A95F3469ACB96012B869369623DF23DE87FC34546A305EACB97F0D7A239F4EA4A53F12A3C452C25BE7D4795DC7A4B4F913B4EAB4F3113EA6477315B6A18D7D36DC367AADCA432AA8C2A737A6C864A5B86C69B3C7C1DCE1F5BC7B54DEE8F289CD3C3EA7ABE1F4BC1B38AEAF716D9F36BB56484634995B9116B09058AD1321119700198AC93062B430188E391E2CFBFE81F167DC842D22AA4FB87C4977210649E24BB87C4967721003CC7B597155D58D372F2A5A2C2EECF3926F2421F41C535C78EBF4F94E6B6F2E5BFDD2919085A108C841806144201A01108007A93A9080412151082AA9E8DD4596E42008AD8A42115A42CF631DC7C2C84272F4DB8BDB9937E637D824A9B6B7210C30FECEBE6FE87ACF25705AA210B653D3B347F8311C843A67A79D7DD18EA32D8842A26A09221029C53211908456B118510823424590804B22D96A210A8CF21148419406326420406E8572EA420E88401084ACADEA4C9080A421084840752100232B6420AAA17A154C8422B4C5223C484143AB23B9A2910838C7377BD9993F7A92CE9847AEA7B108797D67FDD7BBF8EFFB13FF00DB4C361D10872BB8C98C88410321E2420C2C5B051083488C88400621085120484008421009084200401083084642081195CC8400A665127CAD35BA2109A71DCB0A92A9422E6F2CD28843A67A637DA3335E5384E9BE659210047064B1269772B64210EC86C7945968932100C1EF8F41367A108211189DC840319B786CE2D46EB554EA6AD6C420BEDAF17DB4462953724B5315C5CD5538C54F4CF644215F6BE39BBE596A5284AAF3B5E6EF91A849B96AF678210329E1B7B8D4A2A69B92CBCE0B542384B1A221089E9864BE096078258210A66B16E5D0DC8410A57F1A3D4C3F831F91082AC79BE95CCAD9086759C287242094992321001457B108488FFFD9, N'PROMOCION')
INSERT [dbo].[FamiliaFoto] ([Id], [FamiliaId], [Foto], [FotoNombre]) VALUES (4, 3, 0xFFD8FFE000104A46494600010100000100010000FFDB008400090607121012121212121010151015100F101010100F0F100F0F1512161615111515181D2820181A251B151521312125292B2E2E2E171F3338332C37282D2E2B010A0A0A0E0D0E171010172B1D151D2D2B2D2B2B2D2B2D2D2D2D2D2D2B2B2D2D2D2D2D2D2D372B2D2D2B2D2D2D2D2D2B2D2D372B2D2B2B372B2D2B372B2B2B2B2DFFC000110800BD010A03012200021101031101FFC4001C0000020301010101000000000000000000030402050601070008FFC4004110000103030301060304060A010500000001000203041121051231410622325161711381912342A1B107335292C1D1141562637382A2B2D2E1C21624435472FFC400190100020301000000000000000000000000020300010405FFC40020110003010003010100030100000000000000010211032131124104132251FFDA000C03010002110311003F00F38A71DD08351C7CD1A0381EC8353C0444109F844774439DC8EEE8AC84A4FE0AEF421DC54D20577A2F815E107E11F691FAC918FF00505ECCDC5C05E3DA6B374D08FEF23FF705ECBB73F55A787C32F3048B364DB45824E23629D0F4DA330584DC29BC802E7A2146575EDDC40E83292D76507A518B9E4A6021B54DA954F5848985D5C0A4807239651214D45CA22A9007AC6F6F5DFF00BAA31E41A7EB28FF008AD948162FB6BDEAD807ECC6D3F8C8EFE0993EA271F8CDCE91FA887FC38FFD81368548CDAC637F65AD1F408AB3B36A2A6ACF78A0A2D5788FBA12DB3E239D5EB3E5F5D7CB8AC12417CE5F05F394202BA928ED5F39584995DA8B373862FD3C9564B4A48B702FC1CFE2BED5A4709B0EB0EEA66493A58B81CEE1E6B3F27254BC4689F0AD8749370E2F690D26CD02C45FCCF55E8D0B6CD68F2007E0B1F4B303769681623A656C58E16191C0EA95FD8E9761A3F274031F240A9E88F0F08151D141C57CE323DD32464204DC84C3B90AC84DEAFF00496771503B95A2D37F5611228B5D063DD5300FEF187E8E0BD70745E59D946DEAE1FF00F4DFCD7A9B4DB95AB87C3273BEC2313086D6A2B423A6670B094567284C44694A653190A6105A515A92CB9642AAA5B1B4B9C434017249030B0BAA7E93E28DE5914665DBD4BAC0FB59647F485DA5334F232FDC6F72C09CDADFCCAC536A3376B7D32A6A5E9AB8F89D1E9551FA42AEB991B035D182080CB9207A8BAD3F657B7F15690D7B7E13CE05C8DA5DE42FD7D178DD16A1344E0F6827F25AAD2B58F88E7FD946D3236CF69036B8FED7A3BD421572FD436FF8ED2E8F659390B0FDAC37D4983FBB68B7F95E3FF2563D8FD68CA1B13EE1C00B5CDCE3045FAF090D5CEFD5ADFB22367D767FC9317A2A273A67A3AF97CBE598D453D5788FBA12ECE7BCEF72A2B74AE91CDAF4EDD757170950AC26B8E5C0E5C7150B472E833BED953BA52ADEA365AECA4AD687B89BA6A8AA2C0EEE01E7A2A9797FC4EE901AEBDEE2FC792054578DAC6606E7D9DC838EBF82CFC9D9A12E8D6C10309043AFB8E4E38568699831B9D8599A07FC336E01EF0253675577A2CC8B3F3F4630969FA2659C25A74E3409CBC84723BC10A4F1046FBCA109BF95A3A01DC1ECB38EE568A93C03D822453343D8A17AA67A5C8F92F4879DD617E32579BF635DB6A011C8079F2C2F458E4073E6B6717863E5F4758F46122AD15165D15098D262196825466481531ABB21FF005A590384CAC340EA96332E70683D49002F3CED57E919EC97651BA37B597F88E2DBDCF90255BEB63FA5C463DCE6DF37678863A2F1CD4A8260E7DC16ED2459CDD84DBEF630526E3E47F1427E8092F3485C7975DC6DE6998A300A0D24768F7FBB50A29CDD64B3A7C58BA361D9D8D8F758D8FA1EA16D6BBB3F07C033471D9ED177649E84F0BCCEB619608E295BB9BBF82D3CAF4AFD1D4AF919693E239AE032E3B9A6FD0A01AE8ACECF4E1B346E1B810736B5C0571F0CBF5473F3FAC87C8123ECEF7FDD44D37476475CF68C069BB5BC8209208287A158EA2F02E4091A3249B59921B7E013A370C7C8D3A3D2570AEAE392C228A4393EE5442ECBC9F7512B7AF0E6BF4EEE430E50DCBE8D42C25D7C1CA24AEA851F39C929D364204F1671F4434F039479E6B3A9173816DDBB0B86DFED03C95D6C923CC5602E40271924925372D140F738B7746F271725D1B8DFA8E853714EEA621C6263F6168248BD87A2CB768D892C2CA20ED8D1390C232075F9A6DB036DCA42579A9797E3BFDE03C85B856F1D31B0F60B5F170C394F4C9C9CB8F11F9EEF84ACC533D12D28FC964370B3CF79A8C39417789A8AC3950849FCFCD69294F747B059B3CFCD6929C7747B0568A668BB25FAD24631F82D789AD61758CECABBED0FB2D319402B5C3E8C96BB1F6D428CB556EAAADF51649555622760A82CEA350B0E528CAB2E3CAA29EAD769AA90AB0FFACDCE94FCFD133AD96CB1C9186071B105C78693F9F0B3BA756D88F923D56A45B13DB18DC5A1EF91FF007598BE4F9A2AA5F2024D51E78181AD2DB64137FAA0B616DD49951B9C43BC44072EBDC173E99D585D1E97A7CF47369EC649B498EC1DFB4DB9C387A2BAEC41F8378EF76FDD3E9D1623B1D514C1AE8EA0359B859B238018CF76E7E4B5FD8E7B773DA087061B03CDC5F05004CD2C700352E92D9EE807CF25647B12EDF5B23BCE590FC80781F9AD942E3B8DC836DC47B58AC57E8D45EA09FF0018FE5FCD6ACC939CABEACF525098E0A9A0D51EE9485E8EAF19472B90A47223DC967BB2B79CF3E0A4D724ABEAC44C2EF2E3DD423D4059BE6E40E920F0B3520802A0581BD81C237C418C837F254E91308CD333C25E1A4E3900ACC558A985E47C4718DC70E2F0E75BD95FEA9A7B256F81BB85C875B3F5593A996588F79BB8DAC2F7E3C964E6BA090B5343BA4B020871276F1F35A0A599BF06A63940BB19707A9C8B595751441C49707472B3BCC691E216E885A8D687824B035E1A1AE230307C966AAEBB1F364682B36B806DEF6B0238B7AAB51ACCA31B2F6EB8CAAAA00E0D166DC9CF17576CAC9AC3ECFA0E8B471DDCCE2622A536783F44BC9C84CA5A6E423370B91DE08918CA17DE468472A1449A323DD68A1381F259D61C8F75A18F81F256885EF66B0F71F456F512AA4D19D627D93AF94E53D56210E7B092CF60AA6A6A512A6655B23EE9754314AC26E92EA713EC965263956965B40FB9FF00B2131ACCD28A67DDCD6C4C05EE646C2C2FFEC975F2ABA9E4C857B4507C5698DDDE6BF05A7170533F05D74CF3A84B9B28BE775B3EFD13D530DCE49F9613874F8609E4123CFC185C33F7DD717D8D1D4DD2D51387BDCF682D6B89D809B9DBD2EB352ECD9C4FA2DBB390C05E04919900B1CDDF73E4BD07B254DF0A696C2CD9082D68C6D1E4BCD34DD4DD09BB6D9C1B8BADF7647512F717388B9B58792159AB46DAEBA375BEC5E7C98F3FE92B2FFA2C677DC7C813FBC07F244D67B4CC85B359AE7E1D112DCB5A5C08B92B2BD93EDAC7405D761903834137B116BF18F55B3931A7872E62A2BFD23DC52DA83ACC2B35A47E91286A2C3798C9E8F040FAABBAFAD8DD192C7B5C0DB820ACF2B2968DB6BE59525D84A3E51D481F308931DC08E2E0DBE8BCD3576B9AE7073B82792B45DE192674D8EBEF0E601706E6E6C46384B691A831DF64706D8713827A05896D613B6DB4065EE4389B82AD60A72E6BAE5AD0035DBB7020DF8B7AACF6DB344C17DAB5596B5D11C1B8773C591BB2D5BBA50C39C1392B39FD28BC778DDC3BB7F303AA050D618E5DDC608E2E3FE92229AA23947AB39CAB359898E664126D61B5A49553A6F69230D2D99C1A7EE60E4F9294BDAC89A406B8DEF963A37B6E3D1DC2D753F485E313648F6399B81BB7C05D7DD63D0AADD65F77103979CABED60FC52C9D8FBB3BA36DACE041EA167EA212F7875EC5C4587CECB1D47FAC0A5164C2E6460890305873C9F44B7F58C9FB4EFF0052B46F679E7607BB6820D8822E5D6E147FAAAA0606FB0C0C33809DF2C9878A1283304628133911A85D9E2458BAA133C48B1A84251F887BAD0B0E07C967E1F10F757DD15945B698FB5D1269B295A3360A47947F80B40E57DD2C51E570402E40CB4776A231896927B24A5AC75F048F657A8B49B2E1F5F1466DE32390DE142AFB48F188BECBD478950928597207C8FC342E19CD61CCA6576E712E37BDCF37F34669436476088D6206F424BFE0561573A76A4F8AE6FD30A99813AD76FB01D3281B3470C7D3EFC353D9CD4035AE64A03C4A497870BDEEA9FB5BD99743F6F4E1CF83EF0F13A238C11E4B91D6ED3C792D5685AB17F70F0EC16F208F54516D3C27F23895FF00A67957F482D22E4B7EA16A74AED2491B0343C91EF7579DB2D00463E29634C6EB7DD17612B2CDD3A336B0207F64ED4C7462FEA93794BDA71233C658F68BDF162AB46A4C9DD77C71BFCC9B8BFD0AA8A4A5A268B486A9A7F683B70FC0A3B34C81A7EC6B1A6FC3258DEDFC512ADF45DC4FE1A4A6A9A71834B0FF0095838F994664B465F7F84E63081DDDBDDDC38556DD2EA06408DE3A164838F628151BE3CBDAE6F4B9F0AB407C17CC868DD20734B5996D83AE01C1DD742AFED069D03CC5BE00EFBD66EE681E45C3AAC36ABAE969DADF3E551495CDBD8C6D37C93C13F8225281F9D1BED6EB22597EC773236F82E083CF2554C3AB543789A43D6C4EE1F8AB0FE88D91B78C9C72D71BFD0AA49585AEC8B7A29B81FCA66FFB37DBEFFE1ACBED245A66B0774FF6ADD3E4B5916C73E2782D746E376BDA6ED22F7BAF21929C18C39AD7137B1B67EA3C96B7B1F56238FE14D23DAD73B7358D0096DEDC5F84353BD8AA8FF87A7EA55CD6B9844BB84392C68BDCB85812981DA21FB0EFA2A984C018D3B9EF6100791F981CA6C4D07FF6ADE9B1D8F4E14D17F0CF0609598E538024EA3080D60A3F17C91A3EA97879478FAA2206A3177857DB70A8E8477C2BE1C2850DD30C2EC85729CE17C530A1495C9773D333049CA52D962D3B901A2EA52394A16E12DB1FC6804A7A272922C2AF909DCACE988212FF004D39D047B6C8424469F012912B0527B834C298A590341293B213E5C86F9A166D95F1259C4EDC6EB55D9D67787BACA52F45ACD05F6287F4CF5D9A9ED1CC1F4B231D9EE93F30BCA59391C15E91A892F8DC3CDAE1F82F2F7E1C479123F147A024BF464D4143F8F7E50B72148E569B2AA10E89B6E439CDF671097D5AAA57B037E23DC1A43AC5C48BD90DE6E872705326B04D71AC131527839F54174854885191A8FEB44FC87A4AD31F02F745A99C483C06FE612B04775650E14745FC08D307B4E37B3D728D2CC41C9BFA9E53C4DD44C60F2D07DD0FD695981348ED04B4E6ED3BC71B49E9E8AE3FF5538E7E13739CC86EA85B4B4FF7A27FBB262DFE09A6BA98003E15462C3F5CCFE4A165484955F29C092ABE558046019288CEA8701C9456F05590674FF1857DD150E9BE30AF8F0A614C7291B85231AED178516C9F9D0B6C4678D55D49B2B8AA2A82B1F949A0A45CF29D89966DD25164A72A1D6624B3771CF424D1725331003AD926D2A7B92CDB1890F48EB8B5EEBE8A30920FB2345328367E746A54846DDD27B23CD3614F4D8B93E6A01FC8ADE91634ADCAD2E978547471655FD29B041FA23C45BFC601B73D395E69A949F6D25B82E2B55AEEA4238CE6D7586F89725DE66E99226E86C150705C8A5531305607D1D5078466B81439C59A4AB5E91DE15D2289692BE69BA7218709BA84AED92A58EC8AE46882EB9974A63D60388A9531DC4DFA2EC6CC15F40DB5D401AD645EE175C439B06EA1F1142FE459A52953CA6C14A4C729C662307DE458F84287928CCE1590674DF1ABD543A6F8C2BE770A2F41659D137BA8AE43A4F0851A87593FF0588EA52D82CFCCEB94FEA735CAAE664A450E8433471A257F851A91BD146BE95FB4D85FD9228D72F1148D91103D05B1E4A3B622847C3A3EDCBE6C8BA63417821419B814B8B8D95ED1B2C00551A5C1B892B474F0DD55316DEB1DA28D5897868CFBA0D3C56557DA2ABD8C2072410867D2ABC33DDA1AD334840276B71EEAADA4851175DB94D32B0903CDF94D9094A7194DC6542E4EB5E4234AFEE21D918B4116568AAEC4A102E13CD39C208A64C462C881F069AD53684B35E519B2A02FE5932DB20B9A8AD9975EF0A116A14962BA17C04F06DD7362816B294A564E532E4AC9CA72339C8F928CCF0A0C3C9461C2220DE99E30AF09547A48EFAB9775568165B427BA1295B3582EB24B3554EA7517C263AE814B446AA5B94285D90A04A883659DBD1CBA2DA37D958535659514535D1D9225549A268B3AEA38E7CB6D1BBCF16290769538E185E3CD8777E0BE64AAC28EB4B3AA1C1F3C8D14D2C4F6F2C7B4F916381FC92B2871E5AEFDD2B7F4BAD91D7EB95674BA9B5E6CEB58F5B03FC1504F974C66994F668F50AEA961565A8C7136401CC2CDF96CADC31DE9E4892521885CDAC7820837085AD053169A40C693E42EB07AE5617B8ABFED0D61036858EA990DD1422727F9922C7A9DD0D854804C328684269A968D331B95161095364884BA029A5A49860F44684B0536B94D2DC0E35AB8E6A1B1EA7F115130E5974952250DCD501D091C8A7F1528490B9BD59040A59E394C5D2D23B94E4673E83AA3B4612D01E53319C23286F491DF56D31B2ABD27C4ACA7693C0BFB654299374C2CA96679255CC94CE0DBB9A52418C3CB48414C394563F0865CAC6AA068E02AF95E021088092CA6D9EC959A50877530BFAC2CD95613B14E0AA1694FD2C4EE50391B345C31EAC28A6C81E782A92196D82AC29DD6209E1060CD3593D4EC8C453344B09B67A34F38238291A9736368F86F2F61E038DCB3D10A39DEC6EE6BDB3308378DC2EE1EB6383F255B535719680D058725C2E40F6B28D0CE24AA8475192FCAAD6D36F07D13552E40A2A92DB8B03BBCD5C85FCCEB0AE7C45A6C575A9DD51D902D94AC56B1BA3C312611A8AC364361440D4231056B948143014DAA82F926D53B28B515A542B5A38C7226D5CC29150BFA22E2A6D7A110A4F65958AF493805CDAD502D51B2817C8814B483251DC812F54D331087AAB0D3E91F31D91B7738FC80F527A2429866DE640FC57A8E9FA7B29600D664BFBCE790038A624537827A17637E1D9F2BC389FBACBDBDAEB4228D8C166B5ADF603F346A2368DA127A8545B762F6F54E6960B4CA1D725CD9672B1E182EFEB903AA8EB9DA195F76B6D1D8E4B7C47E6B3EE7139249F52492B3548E435575FBBC22C902F2795F3D44202CEAF805F27F4BA40F393F251B2D2D3BA750979B9E02BA3081808ED6868B0C290096D9A6612127529E57D138B3273EFC26E77D951D7551371C288974913AFD54F0CBB7D8E3E4AB8CAEE6E73CE571CD51099823EEB7A0EDACF356FA5507C4EF1361959E7B56D34260F86D1E87F8A288079B9A9A4999BD4BF5AF6837DA768F90461A5CA43486DC117B8212AC6EE90DCF89E6FF00BCB692520747B6E46D6B6C421A0A0C64D13A336383F54689D845A876E71047184068CA03439C196B948210520A81EC385F382E34A9EE508DF645A880A931ABAE0A06B19F35CA56C5D02EA6D7280549D05754572EAC0D67FFD9, N'CHURRASS')
SET IDENTITY_INSERT [dbo].[FamiliaFoto] OFF
SET IDENTITY_INSERT [dbo].[FamiliaProducto] ON 

INSERT [dbo].[FamiliaProducto] ([CodigoFamilia], [Familia], [Impresora], [Estado]) VALUES (1, N'FAMILIA', N'PDF24', 1)
INSERT [dbo].[FamiliaProducto] ([CodigoFamilia], [Familia], [Impresora], [Estado]) VALUES (2, N'COMPLETO', N'PDF24', 1)
INSERT [dbo].[FamiliaProducto] ([CodigoFamilia], [Familia], [Impresora], [Estado]) VALUES (3, N'CHURRASS', N'PDF24', 1)
INSERT [dbo].[FamiliaProducto] ([CodigoFamilia], [Familia], [Impresora], [Estado]) VALUES (4, N'PROMOCION', N'PDF24', 1)
SET IDENTITY_INSERT [dbo].[FamiliaProducto] OFF
SET IDENTITY_INSERT [dbo].[FolioBoleta] ON 

INSERT [dbo].[FolioBoleta] ([FolioBoleta], [NroTicket], [IdUsuario]) VALUES (1, 12, 1)
INSERT [dbo].[FolioBoleta] ([FolioBoleta], [NroTicket], [IdUsuario]) VALUES (2, 12, 1)
INSERT [dbo].[FolioBoleta] ([FolioBoleta], [NroTicket], [IdUsuario]) VALUES (3, 19, 1)
INSERT [dbo].[FolioBoleta] ([FolioBoleta], [NroTicket], [IdUsuario]) VALUES (4, 20, 1)
INSERT [dbo].[FolioBoleta] ([FolioBoleta], [NroTicket], [IdUsuario]) VALUES (5, 21, 1)
INSERT [dbo].[FolioBoleta] ([FolioBoleta], [NroTicket], [IdUsuario]) VALUES (6, 23, 1)
INSERT [dbo].[FolioBoleta] ([FolioBoleta], [NroTicket], [IdUsuario]) VALUES (7, 24, 2)
INSERT [dbo].[FolioBoleta] ([FolioBoleta], [NroTicket], [IdUsuario]) VALUES (8, 27, 1)
SET IDENTITY_INSERT [dbo].[FolioBoleta] OFF
SET IDENTITY_INSERT [dbo].[Impresoras] ON 

INSERT [dbo].[Impresoras] ([Id], [ImpresoraUno], [ImpresoraDos], [ImpresoraTres]) VALUES (1, N'PDF24', N'PDF24', N'')
SET IDENTITY_INSERT [dbo].[Impresoras] OFF
SET IDENTITY_INSERT [dbo].[LogInterno] ON 

INSERT [dbo].[LogInterno] ([Id], [NroTicket], [Fecha], [Accion], [IdUsuario]) VALUES (1, 0, CAST(N'2019-11-28T02:01:02.610' AS DateTime), N'Impreme Ticket', NULL)
INSERT [dbo].[LogInterno] ([Id], [NroTicket], [Fecha], [Accion], [IdUsuario]) VALUES (2, 3, CAST(N'2019-11-28T02:02:48.880' AS DateTime), N'Impreme Boleta', 1)
INSERT [dbo].[LogInterno] ([Id], [NroTicket], [Fecha], [Accion], [IdUsuario]) VALUES (3, 23, CAST(N'2019-11-28T02:09:30.520' AS DateTime), N'Impreme Ticket', 1)
INSERT [dbo].[LogInterno] ([Id], [NroTicket], [Fecha], [Accion], [IdUsuario]) VALUES (4, 6, CAST(N'2019-11-28T02:09:44.567' AS DateTime), N'Impreme Boleta', 1)
INSERT [dbo].[LogInterno] ([Id], [NroTicket], [Fecha], [Accion], [IdUsuario]) VALUES (5, 23, CAST(N'2019-11-28T02:13:44.563' AS DateTime), N'Elimina Registro', 1)
SET IDENTITY_INSERT [dbo].[LogInterno] OFF
SET IDENTITY_INSERT [dbo].[Oferta] ON 

INSERT [dbo].[Oferta] ([CodigoOferta], [NombreOferta], [PrecioOferta], [idOferta], [Activo]) VALUES (N'', N'PROMOCION', 5000, 1, 1)
SET IDENTITY_INSERT [dbo].[Oferta] OFF
SET IDENTITY_INSERT [dbo].[OfertaDetalle] ON 

INSERT [dbo].[OfertaDetalle] ([IdDetalleOferta], [IdOferta], [Descripcion_Producto], [Precio], [Codigo_interno], [Codigo], [CodigoFamilia], [Familia], [idproducto], [Linea], [Cantidad]) VALUES (1, 1, N'CHURASSQUIO                                                                     ', CAST(0 AS Numeric(18, 0)), N'                              ', N'                              ', N'3', N'CHURRASS', 3, 1, 2)
INSERT [dbo].[OfertaDetalle] ([IdDetalleOferta], [IdOferta], [Descripcion_Producto], [Precio], [Codigo_interno], [Codigo], [CodigoFamilia], [Familia], [idproducto], [Linea], [Cantidad]) VALUES (2, 1, N'COMPLETO AS                                                                     ', CAST(0 AS Numeric(18, 0)), N'                              ', N'                              ', N'2', N'COMPLETO', 2, 2, 2)
INSERT [dbo].[OfertaDetalle] ([IdDetalleOferta], [IdOferta], [Descripcion_Producto], [Precio], [Codigo_interno], [Codigo], [CodigoFamilia], [Familia], [idproducto], [Linea], [Cantidad]) VALUES (3, 1, N'PRODUCTOFAMILIA                                                                 ', CAST(0 AS Numeric(18, 0)), N'                              ', N'                              ', N'1', N'FAMILIA', 1, 3, 6)
SET IDENTITY_INSERT [dbo].[OfertaDetalle] OFF
INSERT [dbo].[parametros] ([nombre_param], [valor_param]) VALUES (N'CiudadOrigen                            ', N'CIUDAD')
INSERT [dbo].[parametros] ([nombre_param], [valor_param]) VALUES (N'ComunaOrigen                            ', N'COMUNA')
INSERT [dbo].[parametros] ([nombre_param], [valor_param]) VALUES (N'DirOrigen                               ', N'DIRECCION 1266')
INSERT [dbo].[parametros] ([nombre_param], [valor_param]) VALUES (N'Email_empresa                           ', N'emails@algo.cl')
INSERT [dbo].[parametros] ([nombre_param], [valor_param]) VALUES (N'Giro                                    ', N'GIRO')
INSERT [dbo].[parametros] ([nombre_param], [valor_param]) VALUES (N'Impresora                               ', N'Microsoft XPS Document Writer')
INSERT [dbo].[parametros] ([nombre_param], [valor_param]) VALUES (N'Licencia                                ', N'223696994')
INSERT [dbo].[parametros] ([nombre_param], [valor_param]) VALUES (N'NroCopias                               ', N'1')
INSERT [dbo].[parametros] ([nombre_param], [valor_param]) VALUES (N'RUTEmpresa                              ', N'11111111-1')
INSERT [dbo].[parametros] ([nombre_param], [valor_param]) VALUES (N'RznSoc                                  ', N'RAZON SOCIAL')
INSERT [dbo].[parametros] ([nombre_param], [valor_param]) VALUES (N'Telefonos                               ', N'1234567')
SET IDENTITY_INSERT [dbo].[Perfil] ON 

INSERT [dbo].[Perfil] ([Id_Perfil], [Perfil]) VALUES (1, N'Admin')
INSERT [dbo].[Perfil] ([Id_Perfil], [Perfil]) VALUES (2, N'Vendedor')
INSERT [dbo].[Perfil] ([Id_Perfil], [Perfil]) VALUES (4, N'Cajero')
SET IDENTITY_INSERT [dbo].[Perfil] OFF
SET IDENTITY_INSERT [dbo].[productos] ON 

INSERT [dbo].[productos] ([id_producto], [descripcion_producto], [precio], [codigo_interno], [codigo], [CodigoFamilia], [Estado]) VALUES (1, N'PRODUCTOFAMILIA                                                                 ', CAST(5000 AS Numeric(18, 0)), N'                              ', N'                              ', N'1', 1)
INSERT [dbo].[productos] ([id_producto], [descripcion_producto], [precio], [codigo_interno], [codigo], [CodigoFamilia], [Estado]) VALUES (2, N'COMPLETO AS                                                                     ', CAST(2000 AS Numeric(18, 0)), N'                              ', N'                              ', N'2', 1)
INSERT [dbo].[productos] ([id_producto], [descripcion_producto], [precio], [codigo_interno], [codigo], [CodigoFamilia], [Estado]) VALUES (3, N'CHURASSQUIO                                                                     ', CAST(3500 AS Numeric(18, 0)), N'                              ', N'                              ', N'3', 1)
INSERT [dbo].[productos] ([id_producto], [descripcion_producto], [precio], [codigo_interno], [codigo], [CodigoFamilia], [Estado]) VALUES (4, N'CHURRASCACA                                                                     ', CAST(1000 AS Numeric(18, 0)), N'                              ', N'                              ', N'3', 1)
SET IDENTITY_INSERT [dbo].[productos] OFF
SET IDENTITY_INSERT [dbo].[Stock] ON 

INSERT [dbo].[Stock] ([Id], [IdProducto], [Entradas], [FechaEntrada], [Salidas], [FechaSalidas], [Saldo], [StockCritico], [UnidadesStock]) VALUES (9125, 1, 100, CAST(N'2019-12-01T00:00:00.000' AS DateTime), 36, CAST(N'2019-12-01T03:31:26.233' AS DateTime), 64, 10, 24)
INSERT [dbo].[Stock] ([Id], [IdProducto], [Entradas], [FechaEntrada], [Salidas], [FechaSalidas], [Saldo], [StockCritico], [UnidadesStock]) VALUES (9126, 2, 0, CAST(N'2019-12-01T03:25:58.220' AS DateTime), 12, CAST(N'2019-12-01T03:31:26.233' AS DateTime), -12, 10, 8)
INSERT [dbo].[Stock] ([Id], [IdProducto], [Entradas], [FechaEntrada], [Salidas], [FechaSalidas], [Saldo], [StockCritico], [UnidadesStock]) VALUES (9127, 3, 0, CAST(N'2019-12-01T03:25:58.220' AS DateTime), 12, CAST(N'2019-12-01T03:31:26.233' AS DateTime), -12, 10, 8)
SET IDENTITY_INSERT [dbo].[Stock] OFF
INSERT [dbo].[tipo_doc] ([id_doc], [documento]) VALUES (30, N'FACTURA                                 ')
INSERT [dbo].[tipo_doc] ([id_doc], [documento]) VALUES (32, N'FACTURA EXENTA                          ')
INSERT [dbo].[tipo_doc] ([id_doc], [documento]) VALUES (33, N'FACTURA ELECTRONICA                     ')
INSERT [dbo].[tipo_doc] ([id_doc], [documento]) VALUES (34, N'FACTURA EXENTA ELECTRONICA              ')
INSERT [dbo].[tipo_doc] ([id_doc], [documento]) VALUES (35, N'BOLETA                                  ')
INSERT [dbo].[tipo_doc] ([id_doc], [documento]) VALUES (39, N'BOLETA ELECTRONICA                      ')
SET IDENTITY_INSERT [dbo].[usuarios] ON 

INSERT [dbo].[usuarios] ([id], [usuario], [clave], [supervisor], [perfil_Id]) VALUES (1, N'Admin     ', N'          ', 1, 1)
INSERT [dbo].[usuarios] ([id], [usuario], [clave], [supervisor], [perfil_Id]) VALUES (2, N'Vendedor  ', N'123       ', NULL, 2)
INSERT [dbo].[usuarios] ([id], [usuario], [clave], [supervisor], [perfil_Id]) VALUES (6, N'Cajero    ', N'123       ', NULL, 4)
SET IDENTITY_INSERT [dbo].[usuarios] OFF
ALTER TABLE [dbo].[cabecera_doc] ADD  CONSTRAINT [DF_cabecera_doc_fecha_emision]  DEFAULT (getdate()) FOR [fecha_emision]
GO
ALTER TABLE [dbo].[cabecera_doc] ADD  CONSTRAINT [DF_cabecera_doc_Eliminado]  DEFAULT ((0)) FOR [Eliminado]
GO
ALTER TABLE [dbo].[FamiliaFoto] ADD  CONSTRAINT [DF_FamiliaFoto_FamiliaId]  DEFAULT ((0)) FOR [FamiliaId]
GO
ALTER TABLE [dbo].[FamiliaFoto] ADD  CONSTRAINT [DF_FamiliaFoto_FotoNombre]  DEFAULT ('') FOR [FotoNombre]
GO
ALTER TABLE [dbo].[FamiliaProducto] ADD  CONSTRAINT [DF_FamiliaProducto_Famiia]  DEFAULT ('') FOR [Familia]
GO
ALTER TABLE [dbo].[FamiliaProducto] ADD  CONSTRAINT [DF_FamiliaProducto_Estado]  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[Oferta] ADD  CONSTRAINT [DF_Oferta_NombreOferta]  DEFAULT ('') FOR [NombreOferta]
GO
ALTER TABLE [dbo].[Oferta] ADD  CONSTRAINT [DF_Oferta_PrecioOferta]  DEFAULT ((0)) FOR [PrecioOferta]
GO
ALTER TABLE [dbo].[Oferta] ADD  CONSTRAINT [DF_Oferta_Activo]  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[OfertaDetalle] ADD  CONSTRAINT [DF_OfertaDetalle_Descripcion_Producto]  DEFAULT ('') FOR [Descripcion_Producto]
GO
ALTER TABLE [dbo].[OfertaDetalle] ADD  CONSTRAINT [DF_OfertaDetalle_Precio]  DEFAULT ((0)) FOR [Precio]
GO
ALTER TABLE [dbo].[OfertaDetalle] ADD  CONSTRAINT [DF_OfertaDetalle_Codigo_interno]  DEFAULT ('') FOR [Codigo_interno]
GO
ALTER TABLE [dbo].[OfertaDetalle] ADD  CONSTRAINT [DF_OfertaDetalle_Codigo]  DEFAULT ('') FOR [Codigo]
GO
ALTER TABLE [dbo].[OfertaDetalle] ADD  CONSTRAINT [DF_OfertaDetalle_CodigoFamilia]  DEFAULT ('') FOR [CodigoFamilia]
GO
ALTER TABLE [dbo].[OfertaDetalle] ADD  CONSTRAINT [DF_OfertaDetalle_Familia]  DEFAULT ('') FOR [Familia]
GO
ALTER TABLE [dbo].[OfertaDetalle] ADD  CONSTRAINT [DF_OfertaDetalle_idproducto]  DEFAULT ((0)) FOR [idproducto]
GO
ALTER TABLE [dbo].[OfertaDetalle] ADD  DEFAULT ((0)) FOR [Linea]
GO
ALTER TABLE [dbo].[OfertaDetalle] ADD  DEFAULT ((0)) FOR [Cantidad]
GO
ALTER TABLE [dbo].[parametros] ADD  CONSTRAINT [DF_parametros_valor_param]  DEFAULT ('') FOR [valor_param]
GO
ALTER TABLE [dbo].[productos] ADD  CONSTRAINT [DF_productos_descripcion_producto]  DEFAULT ('') FOR [descripcion_producto]
GO
ALTER TABLE [dbo].[productos] ADD  CONSTRAINT [DF_productos_precio]  DEFAULT ((0)) FOR [precio]
GO
ALTER TABLE [dbo].[productos] ADD  CONSTRAINT [DF_productos_codigo_interno]  DEFAULT ('') FOR [codigo_interno]
GO
ALTER TABLE [dbo].[productos] ADD  CONSTRAINT [DF_productos_codigo]  DEFAULT ('') FOR [codigo]
GO
ALTER TABLE [dbo].[productos] ADD  CONSTRAINT [DF_productos_CodigoFamilia]  DEFAULT ('') FOR [CodigoFamilia]
GO
ALTER TABLE [dbo].[productos] ADD  CONSTRAINT [DF_productos_Estado]  DEFAULT ((1)) FOR [Estado]
GO
/****** Object:  StoredProcedure [dbo].[actualiza_producto]    Script Date: 01-12-2019 3:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[actualiza_producto]
@codigo char(30),
@descripcion nchar(80),
@precio  int ,
@cod_interno nchar(30),
@CodigoFamilia nvarchar(20)
as
begin
update productos 
set descripcion_producto=@descripcion ,
precio=@precio,
codigo_interno=@cod_interno,
CodigoFamilia=@CodigoFamilia
where id_producto=@codigo
END
GO
/****** Object:  StoredProcedure [dbo].[BuscarVentas]    Script Date: 01-12-2019 3:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[BuscarVentas]
@FechaIni datetime,
@FechaFin datetime 
as
begin
SELECT        cabecera_doc.id_doc, cabecera_doc.fecha_emision, cabecera_doc.total, isnull(FolioBoleta.FolioBoleta,0) NroBoleta, usuarios.usuario
FROM            cabecera_doc LEFT OUTER JOIN
                         usuarios ON cabecera_doc.IdCaja = usuarios.id LEFT OUTER JOIN
                         FolioBoleta ON cabecera_doc.id_doc = FolioBoleta.NroTicket
 where cabecera_doc.fecha_emision>=@FechaIni and cabecera_doc.fecha_emision<=@FechaFin AND cabecera_doc.Eliminado=0
end
GO
/****** Object:  StoredProcedure [dbo].[BuscoOferta]    Script Date: 01-12-2019 3:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[BuscoOferta]
(
@CodigoOferta nvarchar(20)
)
as
begin

SELECT     Oferta.CodigoOferta, Oferta.NombreOferta, Oferta.PrecioOferta, Oferta.idOferta, OfertaDetalle.IdDetalleOferta, OfertaDetalle.IdOferta AS idOfertadetalle, 
                      OfertaDetalle.Descripcion_Producto, OfertaDetalle.Precio, OfertaDetalle.Codigo_interno, OfertaDetalle.Codigo, OfertaDetalle.CodigoFamilia, OfertaDetalle.Familia, 
                      OfertaDetalle.idproducto
FROM         Oferta INNER JOIN
                      OfertaDetalle ON Oferta.idOferta = OfertaDetalle.IdOferta
WHERE     (Oferta.CodigoOferta = @CodigoOferta)

end
GO
/****** Object:  StoredProcedure [dbo].[cab_compras]    Script Date: 01-12-2019 3:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[cab_compras]
@fecha char(10),
@folio numeric,
@tipodoc int,
@rut_proveedor char(10),
@neto numeric,
@iva numeric,
@total  numeric
as
insert into cebecera_compra
(fecha,folio,tipodoc,rut_proveedor,neto,iva,total)
values
(@fecha,@folio,@tipodoc,@rut_proveedor,@neto,@iva,@total)

GO
/****** Object:  StoredProcedure [dbo].[cab_ticket]    Script Date: 01-12-2019 3:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[cab_ticket]
@fecha datetime,
@forma_pago char(20),
@total  numeric,
@efectivo numeric,
@IdUsuario int
AS
DECLARE @idcaja int
DECLARE @NroTicket int
SELECT @idcaja=id FROM caja WHERE dbo.caja.Id_Usuario=@idUsuario AND dbo.caja.Accion='Apertura'
insert into cabecera_doc
(forma_pago,fecha_emision,total,efectivo,IdUsuario,idcaja)
values
(@forma_pago,@fecha,@total,@efectivo,@IdUsuario,@idcaja)

--SELECT @NroTicket = SCOPE_IDENTITY() 
--EXEC GrabaBoleta @NroTicket ,@IdUsuario

SELECT SCOPE_IDENTITY() AS [SCOPE_IDENTITY]  

GO
/****** Object:  StoredProcedure [dbo].[CerrarCaja]    Script Date: 01-12-2019 3:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CerrarCaja]
@IdUsuario int 
AS

BEGIN
UPDATE dbo.Caja
	SET
    dbo.Caja.Accion = 'Cerrada'
	where dbo.Caja.Id_Usuario = @IdUsuario

	DECLARE @idCaja AS int

	SELECT @idCaja= max (id) FROM caja WHERE dbo.caja.Id_Usuario = @IdUsuario	

	SELECT @idCaja	
	END
GO
/****** Object:  StoredProcedure [dbo].[detalle_compras]    Script Date: 01-12-2019 3:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[detalle_compras]
@codigo  char(30),
@descripcion Char(80),
@precio int,
@cantidad int,
@total_item int,
@id_cab int

as
insert into detalle_compra 
(codigo,descripcion,precio,cantidad,total,id_cabecera)
values
(@codigo,@descripcion,@cantidad,@precio,@total_item,@id_cab)
GO
/****** Object:  StoredProcedure [dbo].[detalle_ticket]    Script Date: 01-12-2019 3:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[detalle_ticket]
@id_doc int,
@descripcion Char(80),
@precio int,
@total_item int,
@cantidad int,
@codigo  char(30)
as
insert into detalle 
(id_doc_cab,descripcion,precio,total,cantidad,codigo )
values
(@id_doc,@descripcion,@precio,@total_item,@cantidad,@codigo)

DECLARE @existe int
SELECT @existe = 1 FROM stock WHERE dbo.stock.IdProducto = convert(int,@codigo)
IF @existe IS NULL
   SET @existe=0

if(@existe = 0)
BEGIN
INSERT INTO dbo.Stock
(
    --Id - column value is auto-generated
    IdProducto,
    Entradas,
    FechaEntrada,
    Salidas,
    FechaSalidas,
    Saldo,
    StockCritico,
    UnidadesStock
)
VALUES
(
    convert(int,@codigo), -- IdProducto - int
    0, -- Entradas - int
    getdate(), -- FechaEntrada - datetime
    @cantidad, -- Salidas - int
    getdate(), -- FechaSalidas - int
    -@cantidad, -- Saldo - int
    10, -- StockCritico - int
    -@cantidad -- UnidadesStock - int
)	
END
ELSE
BEGIN
UPDATE dbo.Stock
SET
    dbo.Stock.Salidas = @cantidad + dbo.Stock.Salidas, -- int
    dbo.Stock.FechaSalidas = getdate(), -- int
    dbo.Stock.Saldo =  dbo.Stock.Saldo - @cantidad, -- int
    dbo.Stock.UnidadesStock = dbo.Stock.UnidadesStock - @cantidad -- int
WHERE dbo.Stock.IdProducto	= convert(int,@codigo)

END

SELECT 'OK'
GO
/****** Object:  StoredProcedure [dbo].[EliminarFamilia]    Script Date: 01-12-2019 3:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[EliminarFamilia]
@CodigoFamilia as int
as
update FamiliaProducto SET Estado = 0 
WHERE CodigoFamilia	= @CodigoFamilia	
select 'OK'
GO
/****** Object:  StoredProcedure [dbo].[EliminarProducto]    Script Date: 01-12-2019 3:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EliminarProducto]
@Codigo int
AS
UPDATE  dbo.productos
SET    dbo.productos.Estado = 0
WHERE dbo.productos.id_producto	= @Codigo	

SELECT 'OK'
GO
/****** Object:  StoredProcedure [dbo].[EliminaTicket]    Script Date: 01-12-2019 3:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[EliminaTicket]
@NroTicket int
AS
BEGIN
	UPDATE cabecera_doc SET Eliminado=1 WHERE id_doc=@NroTicket

	INSERT INTO dbo.LogInterno
	(
	    --Id - column value is auto-generated
	    NroTicket,
	    Fecha,
	    Accion,
	    IdUsuario
	)
	VALUES
	(
	    -- Id - int
	    @NroTicket, -- NroTicket - int
	    getdate(), -- Fecha - datetime
	    'Elimina Registro', -- Accion - nvarchar
	    (SELECT idUsuario FROM cabecera_doc WHERE id_doc=@NroTicket) -- IdUsuario - int
	)

SELECT 'OK'
END


GO
/****** Object:  StoredProcedure [dbo].[existe_codigo_producto]    Script Date: 01-12-2019 3:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[existe_codigo_producto]
(
@codigo nchar(80),
@codigofamilia nvarchar(10)
)
as
begin
declare @existe int
set @existe=0
select @existe=COUNT(*) from productos 
where descripcion_producto=@codigo and CodigoFamilia=@codigofamilia
if @existe>0
 select 'Existe codigo'
else
  select 'OK'

end

GO
/****** Object:  StoredProcedure [dbo].[FamiliaProducto_Grabar]    Script Date: 01-12-2019 3:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[FamiliaProducto_Grabar]
@Familia nvarchar(50),
@Impresora varchar (50)
as
begin
insert into FamiliaProducto 
(Familia,Impresora)
values
(@Familia,@Impresora)

declare @Id int
select @Id=0

select @Id=max(CodigoFamilia) from FamiliaProducto

select @Id
end
GO
/****** Object:  StoredProcedure [dbo].[FamiliaProducto_Modificar]    Script Date: 01-12-2019 3:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[FamiliaProducto_Modificar]
@CodigoFamilia int,
@FamiliaProducto nvarchar(50),
@Impresora varchar (50)
as
begin
update FamiliaProducto
set Familia = @FamiliaProducto,
Impresora = @Impresora
where CodigoFamilia=@CodigoFamilia

delete FamiliaFoto where FamiliaId=@CodigoFamilia
select 'OK'
end
GO
/****** Object:  StoredProcedure [dbo].[get_parametros]    Script Date: 01-12-2019 3:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[get_parametros]
as
begin 
declare @RUTEmpresa varchar(10)
declare @Impresora varchar(300)
declare @NroCopias int
declare @Licencia  varchar(200)
declare @RznSoc varchar(200)
declare @Giro varchar(200)

select 
@RutEmpresa=valor_param
from parametros where nombre_param='RUTEmpresa'

select 
@Impresora=valor_param
from parametros where nombre_param='Impresora'

select 
@NroCopias=valor_param
from parametros where nombre_param='NroCopias'

select 
@Licencia=valor_param
from parametros where nombre_param='Licencia'

select 
@RznSoc=valor_param
from parametros where nombre_param='RznSoc'

select 
@Giro=valor_param
from parametros where nombre_param='Giro'



select @RUTEmpresa as RUTEmpresa,
@Impresora as Impresora,
@NroCopias as NroCopias,
@Licencia as Licencia,
@RznSoc as RznSoc,
@Giro as Giro

end
GO
/****** Object:  StoredProcedure [dbo].[Get_ProdExcel]    Script Date: 01-12-2019 3:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_ProdExcel]
as
SELECT [id_producto]
      ,[descripcion_producto]
      ,[precio]
      ,[codigo_interno]
      ,[codigo]
      ,[CodigoFamilia]
  FROM [dbo].[productos]
GO
/****** Object:  StoredProcedure [dbo].[Get_VentasDiarias]    Script Date: 01-12-2019 3:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_VentasDiarias]
@fecha_ini datetime,
@fecha_fin datetime
AS
SELECT a.id_doc, a.forma_pago, a.fecha_emision, d.descripcion, a.total, 
d.precio AS efectivo
--a.efectivo
FROM            cabecera_doc AS a LEFT OUTER JOIN
                         detalle AS d ON a.id_doc = d.id_doc_cab
					
WHERE        (a.fecha_emision >= @fecha_ini) AND (a.fecha_emision <= @fecha_fin) AND (a.Eliminado=0)
GO
/****** Object:  StoredProcedure [dbo].[GetFamiliaProducto]    Script Date: 01-12-2019 3:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetFamiliaProducto]
as
begin
SELECT FamiliaProducto.CodigoFamilia, FamiliaProducto.Familia, 
       isnull(FamiliaFoto.FotoNombre,'SinFoto.JPG')FotoNombre, dbo.FamiliaProducto.Impresora
FROM   FamiliaProducto LEFT OUTER JOIN
       FamiliaFoto ON FamiliaProducto.CodigoFamilia = FamiliaFoto.FamiliaId
	   WHERE dbo.FamiliaProducto.Estado	 = 1
ORDER BY FamiliaProducto.Familia
end	
GO
/****** Object:  StoredProcedure [dbo].[GetImpresora]    Script Date: 01-12-2019 3:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetImpresora]
AS
BEGIN
DECLARE @Impresora nvarchar(100)
SELECT @Impresora=i.ImpresoraUno FROM dbo.Impresoras i

SELECT @Impresora
END
GO
/****** Object:  StoredProcedure [dbo].[GetImpresoraBoleta]    Script Date: 01-12-2019 3:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetImpresoraBoleta]
AS
BEGIN
DECLARE @Impresora nvarchar(100)
SELECT @Impresora=i.ImpresoraDos FROM dbo.Impresoras i

SELECT @Impresora
END
GO
/****** Object:  StoredProcedure [dbo].[getImpresoras]    Script Date: 01-12-2019 3:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getImpresoras]
as
begin
select * from Impresoras
end
GO
/****** Object:  StoredProcedure [dbo].[getproductos]    Script Date: 01-12-2019 3:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getproductos]
AS
BEGIN
SELECT        productos.id_producto, productos.descripcion_producto, productos.precio, productos.codigo_interno, productos.codigo, productos.CodigoFamilia, fp.Familia
FROM            productos LEFT OUTER JOIN
                         FamiliaProducto AS fp ON productos.CodigoFamilia = fp.CodigoFamilia
						 WHERE dbo.productos.Estado = 1
END

GO
/****** Object:  StoredProcedure [dbo].[getProductosFamilia]    Script Date: 01-12-2019 3:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE	 [dbo].[getProductosFamilia]
@Id int
AS
BEGIN
select productos.id_producto Id, ltrim(rtrim(productos.descripcion_producto)) nombre 
FROM   productos RIGHT OUTER JOIN
       FamiliaProducto ON productos.CodigoFamilia = FamiliaProducto.CodigoFamilia
where  FamiliaProducto.CodigoFamilia=@Id
order by productos.descripcion_producto

END
GO
/****** Object:  StoredProcedure [dbo].[GetVentaTicket]    Script Date: 01-12-2019 3:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetVentaTicket]
@IdTicket AS int
AS
BEGIN
SELECT d.codigo AS id_producto,d.cantidad,d.descripcion,precio,d.total FROM dbo.cabecera_doc cd	inner join dbo.detalle d on cd.id_doc	= d.id_doc_cab	WHERE cd.id_doc	= @IdTicket
END
GO
/****** Object:  StoredProcedure [dbo].[GrabaBoleta]    Script Date: 01-12-2019 3:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GrabaBoleta]
@NroTicket int,
@IdUsuario int
AS
BEGIN
INSERT INTO dbo.FolioBoleta
(
    NroTicket,
    IdUsuario
)
VALUES
(
    @NroTicket, -- NroTicket - int
    @IdUsuario-- IdUsuario - int
)	

SELECT SCOPE_IDENTITY() AS [SCOPE_IDENTITY]  
END


GO
/****** Object:  StoredProcedure [dbo].[grabo_oferta]    Script Date: 01-12-2019 3:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[grabo_oferta]
(
@codigooferta nvarchar(20),
@nombreoferta nvarchar(50),
@preciooferta bigint
)
as
 begin
 insert into Oferta 
 (CodigoOferta,NombreOferta,PrecioOferta)
 values
 (@codigooferta,@nombreoferta,@preciooferta)
 end

GO
/****** Object:  StoredProcedure [dbo].[grabo_producto]    Script Date: 01-12-2019 3:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[grabo_producto]
@codigo    char(30),
@descripcion char(80),
@precio    numeric,
@codigoInt char(30),
@CodigoFamilia nvarchar(10)
as
insert into productos 
(codigo,descripcion_producto,precio,codigo_interno,CodigoFamilia)
values
(@codigo,@descripcion,@precio,@codigoInt,@CodigoFamilia)
GO
/****** Object:  StoredProcedure [dbo].[graboDetalleOferta]    Script Date: 01-12-2019 3:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[graboDetalleOferta]
(
@idproducto int,
@descripcion nvarchar(80),
@codigoInt nvarchar(30),
@codigo nvarchar(30),
@CodigoFamilia nvarchar(20),
@familia nvarchar(50)
)
as
begin
declare @idoferta int
select @idoferta =  max(idOferta) from Oferta
insert into OfertaDetalle
(IdOferta,Descripcion_Producto,Precio,Codigo_interno,Codigo,CodigoFamilia,familia,idproducto)
values
(@idoferta,@descripcion,0,@codigoInt,@codigo,@CodigoFamilia,@familia,@idproducto)
end
GO
/****** Object:  StoredProcedure [dbo].[GuardarRetiro]    Script Date: 01-12-2019 3:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GuardarRetiro]
@IdUsuario int,
@Monto int,
@Glosa varchar (max)
AS
DECLARE @idcaja int
SELECT @idcaja=id FROM caja WHERE dbo.caja.Id_Usuario=@idUsuario AND dbo.caja.Accion='Apertura'
BEGIN
	INSERT INTO dbo.RetiroCaja
	(
	    IdUsuario,
	    Monto,
	    Glosa,
		IdCaja
	)
	VALUES
	(
	    @IdUsuario, -- IdUsuario - int
	    @Monto, -- Monto - int
	    @Glosa, -- Glosa - varchar
		@idcaja
	)
	SELECT 'OK'
END

GO
/****** Object:  StoredProcedure [dbo].[Impresoras_Grabar]    Script Date: 01-12-2019 3:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Impresoras_Grabar]
@primera nvarchar(50),
@segunda nvarchar(50),
@Id int
as
begin
if @Id =0
	insert into Impresoras
	(ImpresoraUno,ImpresoraDos,ImpresoraTres)
	values
	(@primera,@segunda,'')
	
else
update Impresoras Set ImpresoraUno=@primera,ImpresoraDos=@segunda
where Id=@Id

select 'OK'
END
GO
/****** Object:  StoredProcedure [dbo].[ImprimeRegistro]    Script Date: 01-12-2019 3:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ImprimeRegistro]
@NroTicket int,
@NroBoleta int,
@Tipo int
AS
-- 1 ticket
-- 2 boleta
BEGIN
IF @Tipo=2
   INSERT INTO  dbo.LogInterno
   (
       --Id - column value is auto-generated
       NroTicket,
       Fecha,
       Accion,
       IdUsuario
   )
   VALUES
   (
       -- Id - int
       @NroBoleta, -- NroTicket - int
       getdate(), -- Fecha - datetime
       'Impreme Boleta', -- Accion - nvarchar
       (SELECT idUsuario FROM cabecera_doc WHERE id_doc=@NroTicket) -- IdUsuario - int
   )
ELSE
   INSERT INTO  dbo.LogInterno
   (
       --Id - column value is auto-generated
       NroTicket,
       Fecha,
       Accion,
       IdUsuario
   )
   VALUES
   (
       -- Id - int
       @NroTicket, -- NroTicket - int
       getdate(), -- Fecha - datetime
       'Impreme Ticket', -- Accion - nvarchar
       (SELECT idUsuario FROM cabecera_doc WHERE id_doc=@NroTicket) -- IdUsuario - int
   )

SELECT 'OK'
END
GO
/****** Object:  StoredProcedure [dbo].[Oferta_Actualizar]    Script Date: 01-12-2019 3:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Oferta_Actualizar]
@Id int,
@NombreOferta nvarchar(30),
@PrecioOferta int,
@Activo int
as
begin

UPDATE Oferta
SET NombreOferta = @NombreOferta
   ,PrecioOferta = @PrecioOferta
   ,Activo = @Activo
WHERE idOferta = @Id

select 'OK'
END


GO
/****** Object:  StoredProcedure [dbo].[Oferta_Buscar]    Script Date: 01-12-2019 3:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Oferta_Buscar]
@Id int
AS
BEGIN
SELECT        o.CodigoOferta, o.NombreOferta, o.PrecioOferta, o.idOferta, o.Activo, od.IdDetalleOferta, od.Descripcion_Producto, od.Precio, 
                         od.Codigo_interno, od.Codigo, od.CodigoFamilia, od.Familia, od.idproducto, od.Linea, od.Cantidad
FROM            Oferta AS o LEFT OUTER JOIN
                         OfertaDetalle AS od ON o.idOferta = od.IdOferta
WHERE        (o.idOferta = @Id)
END
GO
/****** Object:  StoredProcedure [dbo].[OfertaDetalle_Borrar]    Script Date: 01-12-2019 3:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[OfertaDetalle_Borrar]
@Id int
as
begin

DELETE dbo.OfertaDetalle WHERE IdOferta=@Id

select 'OK'

end	
GO
/****** Object:  StoredProcedure [dbo].[OfertaDetalle_Grabar]    Script Date: 01-12-2019 3:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[OfertaDetalle_Grabar]
@Idoferta int,
@Linea int,
@IdProducto int,
@Cantidad int,
@Precio int
as
begin
DECLARE @Articulo nvarchar(80),@Codigo nvarchar(30),@FamiliaId nvarchar(20)
SELECT @Articulo=descripcion_producto,@Codigo=p.codigo,@FamiliaId=p.CodigoFamilia 
FROM dbo.productos p WHERE p.id_producto=@IdProducto

DECLARE @Familia nvarchar(40)
SELECT @Familia=Familia FROM dbo.FamiliaProducto fp WHERE fp.CodigoFamilia=@FamiliaId


INSERT INTO dbo.OfertaDetalle
(   IdOferta, Descripcion_Producto, Precio, Codigo_interno, Codigo, CodigoFamilia, Familia, idproducto,Linea,Cantidad)
VALUES
(   @Idoferta, -- IdOferta - int
    @Articulo, -- Descripcion_Producto - nvarchar
    @Precio, -- Precio - numeric
    '', -- Codigo_interno - nchar
    @Codigo, -- Codigo - nvarchar
    @FamiliaId, -- CodigoFamilia - nvarchar
    @Familia, -- Familia - nvarchar
    @IdProducto, -- idproducto - int
	@Linea,
	@Cantidad
)

select 'OK'
END
GO
/****** Object:  StoredProcedure [dbo].[Productos_X_Familia]    Script Date: 01-12-2019 3:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Productos_X_Familia]
@IdFamilia int
AS 
BEGIN
SELECT isnull(productos.id_producto,0)id_producto, isnull(productos.descripcion_producto,'')descripcion_producto, 
       isnull(productos.precio, 0)precio,
       isnull(productos.codigo_interno,'')codigo_interno, 
       isnull(productos.codigo,'')codigo, FamiliaProducto.CodigoFamilia AS IdFamilia,          
       FamiliaProducto.Familia
FROM   productos RIGHT OUTER JOIN
       FamiliaProducto ON productos.CodigoFamilia = FamiliaProducto.CodigoFamilia
where  FamiliaProducto.CodigoFamilia=@IdFamilia
END
GO
/****** Object:  StoredProcedure [dbo].[Promocion_Grabar]    Script Date: 01-12-2019 3:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Promocion_Grabar]
@Nombre nvarchar(50),
@Precio int
as
begin
insert into Oferta
(CodigoOferta,NombreOferta,PrecioOferta)
values
('',@Nombre,@Precio)

DECLARE @IdOFerta int
select @IdOFerta=MAX(iDoFERTA) from Oferta
select @IdOFerta
end
GO
/****** Object:  StoredProcedure [dbo].[Rpt_Boleta]    Script Date: 01-12-2019 3:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Rpt_Boleta]
@idventa int
AS
BEGIN
SELECT        cabecera_doc.id_doc, cabecera_doc.forma_pago, cabecera_doc.fecha_emision, cabecera_doc.total, d.descripcion, d.precio, d.total AS totaldetalle, d.cantidad, FolioBoleta.FolioBoleta, FolioBoleta.IdUsuario
FROM            FolioBoleta RIGHT OUTER JOIN
                         cabecera_doc ON FolioBoleta.NroTicket = cabecera_doc.id_doc LEFT OUTER JOIN
                         detalle AS d ON cabecera_doc.id_doc = d.id_doc_cab
WHERE        (cabecera_doc.id_doc = @idventa)

declare @RUTEmpresa varchar(10)
declare @comuna varchar(300)
declare @DirOrigen  varchar(200)
declare @RznSoc varchar(200)
declare @Giro varchar(200)

select @RutEmpresa=valor_param from parametros where nombre_param='RUTEmpresa'
select @comuna=valor_param from parametros where nombre_param='ComunaOrigen'
select @DirOrigen=valor_param from parametros where nombre_param='DirOrigen'
select @RznSoc=valor_param from parametros where nombre_param='RznSoc'
select @Giro=valor_param from parametros where nombre_param='Giro'

select @RUTEmpresa as RUTEmpresa,
@RznSoc as RznSoc,
@Giro as Giro,
@DirOrigen as  Direccion,
@comuna as Comuna

end
GO
/****** Object:  StoredProcedure [dbo].[RPT_Productos]    Script Date: 01-12-2019 3:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[RPT_Productos]
as
begin

SELECT     productos.id_producto, productos.descripcion_producto, productos.precio, productos.codigo_interno, productos.codigo, FamiliaProducto.Familia
FROM         productos INNER JOIN
                      FamiliaProducto ON productos.CodigoFamilia = FamiliaProducto.CodigoFamilia
                      
end
GO
/****** Object:  StoredProcedure [dbo].[Rpt_StockCritico]    Script Date: 01-12-2019 3:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Rpt_StockCritico]
as
SELECT p.descripcion_producto AS Producto,s.Saldo,s.StockCritico FROM stock s JOIN productos p on s.IdProducto	= p.id_producto	WHERE s.Saldo <= 10
GO
/****** Object:  StoredProcedure [dbo].[Rpt_TicketFamilia]    Script Date: 01-12-2019 3:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Rpt_TicketFamilia]
@idventa int
as
begin
SELECT       detalle.id_doc_cab, detalle.descripcion, detalle.precio, detalle.total, detalle.cantidad, FamiliaProducto.Impresora
FROM            FamiliaProducto INNER JOIN
                         productos ON FamiliaProducto.CodigoFamilia = productos.CodigoFamilia RIGHT OUTER JOIN
                         detalle ON productos.id_producto = detalle.codigo
where detalle.id_doc_cab=@idventa
order by FamiliaProducto.Impresora
end	

GO
/****** Object:  StoredProcedure [dbo].[Rpt_VentasTicket]    Script Date: 01-12-2019 3:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Rpt_VentasTicket]
@idventa int
AS
BEGIN

SELECT        cabecera_doc.id_doc, cabecera_doc.forma_pago, cabecera_doc.fecha_emision, cabecera_doc.total, d.descripcion, d.precio, d.total AS totaldetalle, d.cantidad
FROM            cabecera_doc LEFT OUTER JOIN
                         detalle AS d ON cabecera_doc.id_doc = d.id_doc_cab
WHERE cabecera_doc.id_doc=@idventa	

declare @RUTEmpresa varchar(10)
declare @comuna varchar(300)
declare @DirOrigen  varchar(200)
declare @RznSoc varchar(200)
declare @Giro varchar(200)

select @RutEmpresa=valor_param from parametros where nombre_param='RUTEmpresa'
select @comuna=valor_param from parametros where nombre_param='ComunaOrigen'
select @DirOrigen=valor_param from parametros where nombre_param='DirOrigen'
select @RznSoc=valor_param from parametros where nombre_param='RznSoc'
select @Giro=valor_param from parametros where nombre_param='Giro'

select @RUTEmpresa as RUTEmpresa,
@RznSoc as RznSoc,
@Giro as Giro,
@DirOrigen as  Direccion,
@comuna as Comuna

END	
GO
/****** Object:  StoredProcedure [dbo].[RptCerrarCaja]    Script Date: 01-12-2019 3:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RptCerrarCaja]
@IdUsuario int,
@IdCaja int
AS

SELECT Id,Accion,Id_Usuario,Monto,Fecha,Glosa,(SELECT isnull(sum(monto),0) FROM dbo.RetiroCaja rc WHERE Id_Usuario=@IdUsuario AND IdCaja=@IdCaja) MontoRetiro
 FROM caja WHERE id = @IdCaja AND Id_Usuario = @IdUsuario

SELECT        
isnull(cd.id_doc,0) AS id_doc, 
isnull(cd.forma_pago,'') AS forma_pago, 
isnull(cd.fecha_emision,'') AS fecha_emision, 
isnull(cd.total,0) AS total, 
isnull(cd.efectivo,0) AS efectivo, 
isnull(usuarios.usuario,'') AS usuarios, 
isnull(cd.IdCaja,0) AS IdCaja

FROM            cabecera_doc AS cd LEFT OUTER JOIN
                         usuarios ON cd.IdUsuario = usuarios.id
WHERE cd.IdCaja=@IdCaja AND cd.IdUsuario=@IdUsuario

SELECT 
isnull(rc.Id,0) AS Id, 
isnull(rc.IdUsuario,0) AS IdUsuario, 
isnull(rc.Monto,0) AS Monto, 
isnull(rc.Glosa,'') AS Glosa, 
isnull(rc.IdCaja,0) AS IdCaja 

FROM dbo.RetiroCaja rc WHERE rc.IdCaja=@IdCaja AND rc.IdUsuario=@IdUsuario

GO
/****** Object:  StoredProcedure [dbo].[Set_AbrirCaja]    Script Date: 01-12-2019 3:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Set_AbrirCaja]
@IdUsuario int,
@Monto int,
@Glosa varchar (100)
AS
INSERT INTO Caja
(
    --Id - column value is auto-generated
    Accion,
    Id_Usuario,
    Monto,
    Fecha,
	Glosa
)
VALUES
(
    -- Id - int
    'Apertura', -- Accion - varchar
    @IdUsuario, -- Id_Usuario - int
    @Monto, -- Monto - int
    getdate(), -- Fecha - datetime
	@Glosa
)

SELECT 'OK'
GO
/****** Object:  StoredProcedure [dbo].[Stock_Grabar]    Script Date: 01-12-2019 3:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Stock_Grabar]
@Fecha datetime,
@Folio int,
@IdProducto int,
@Cantidad int,
@Usuario int
AS
INSERT INTO dbo.Compra
(	Fecha,
    Folio,
    IdProducto,
    Cantidad,
    IdUsuario
)
VALUES
(	@Fecha,
    @Folio,
    @IdProducto,
    @Cantidad,
    @Usuario
)

DECLARE @existe int
SELECT @existe = 1 FROM stock WHERE dbo.stock.IdProducto = @IdProducto
IF @existe IS NULL
   SET @existe=0

if(@existe = 0)
BEGIN
INSERT INTO dbo.Stock
(	IdProducto,
    Entradas,
    FechaEntrada,
    Salidas,
    FechaSalidas,
    Saldo,
    StockCritico,
    UnidadesStock
)

VALUES
(	@IdProducto, -- IdProducto - int
    @Cantidad, -- Entradas - int
    @Fecha, -- FechaEntrada - datetime
    0, -- Salidas - int
    getdate(), -- FechaSalidas - int
    @Cantidad, -- Saldo - int
    10, -- StockCritico - int
    @Cantidad -- UnidadesStock - int
)
END
ELSE
BEGIN
UPDATE dbo.Stock
SET
    --Id - column value is auto-generated
    dbo.Stock.Entradas = @Cantidad + Stock.Entradas, -- int
    dbo.Stock.FechaEntrada =  @fecha, -- datetime
    dbo.Stock.Saldo = Saldo+@Cantidad, -- int
    dbo.Stock.UnidadesStock = dbo.Stock.UnidadesStock+ @Cantidad -- int	
WHERE dbo.Stock.IdProducto = @IdProducto
END

SELECT 'OK'
GO
/****** Object:  StoredProcedure [dbo].[StockPromocion]    Script Date: 01-12-2019 3:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[StockPromocion]
@IdProducto int,
@Cantidad int
AS
BEGIN
DECLARE @CodProd int
DECLARE @CantPromo int

DECLARE Cpromo CURSOR FORWARD_ONLY FOR

SELECT idproducto,cantidad FROM oferta o 
JOIN ofertadetalle od ON o.idOferta = od.IdOferta	
WHERE o.idOferta = @IdProducto ORDER BY od.idproducto	
OPEN Cpromo
FETCH Cpromo INTO @CodProd,@CantPromo

WHILE (@@FETCH_STATUS=0)
BEGIN 
DECLARE @existe int
SELECT @existe = 1 FROM stock WHERE dbo.stock.IdProducto = convert(int,@CodProd)
IF @existe IS NULL
   SET @existe=0
   
if(@existe = 0)
BEGIN
	INSERT INTO dbo.Stock
	(
		--Id - column value is auto-generated
		IdProducto,
		Entradas,
		FechaEntrada,
		Salidas,
		FechaSalidas,
		Saldo,
		StockCritico,
		UnidadesStock
	)
	VALUES
	(
		convert(int,@CodProd), -- IdProducto - int
		0, -- Entradas - int
		getdate(), -- FechaEntrada - datetime
		@cantidad * @CantPromo, -- Salidas - int
		getdate(), -- FechaSalidas - int
		-@cantidad * @CantPromo, -- Saldo - int
		10, -- StockCritico - int
		-@cantidad * @CantPromo -- UnidadesStock - int
	)	
END
ELSE
BEGIN
	UPDATE dbo.Stock
	SET
		dbo.Stock.Salidas = (dbo.Stock.Salidas + (@cantidad * @CantPromo)), -- int
		dbo.Stock.FechaSalidas = getdate(), -- int
		dbo.Stock.Saldo =  ((@cantidad * @CantPromo) - dbo.Stock.Saldo) * -1, -- int
		dbo.Stock.UnidadesStock = dbo.Stock.Salidas - (@cantidad * @CantPromo)-- int
	WHERE dbo.Stock.IdProducto	= convert(int,@CodProd)
END


FETCH Cpromo INTO @CodProd,@CantPromo
END
CLOSE Cpromo
DEALLOCATE Cpromo
END



GO
/****** Object:  StoredProcedure [dbo].[ticket]    Script Date: 01-12-2019 3:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ticket]
@nro_ticket as int
as
select  * from cabecera_doc where id_doc=@nro_ticket
GO
/****** Object:  StoredProcedure [dbo].[ValidaCaja]    Script Date: 01-12-2019 3:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ValidaCaja]
@IdUsuario int
AS
DECLARE @Validador int
SET @Validador = (SELECT count(*) FROM caja WHERE dbo.caja.Id_Usuario = @IdUsuario	AND dbo.caja.Accion	= 'Apertura')
IF(@Validador > 0)
BEGIN	
SELECT 'OK'
END
ELSE
SELECT 'NO'
GO
/****** Object:  StoredProcedure [dbo].[ValidaMonto]    Script Date: 01-12-2019 3:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ValidaMonto]
@IdUsuario int,
@Monto int
AS
BEGIN
	DECLARE @Validador int 
	SET @Validador = (SELECT count(*) FROM dbo.Caja c WHERE Id_Usuario = @IdUsuario AND Accion = 'Apertura' AND Monto < @Monto)

	IF	(@Validador = 0)
	BEGIN
		SELECT	'OK'
	END
	ELSE
	BEGIN
	SELECT 'NO'
	END
END

GO
/****** Object:  StoredProcedure [dbo].[ValidaProducto]    Script Date: 01-12-2019 3:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ValidaProducto]
@idPromocion AS int
AS
if EXISTS (SELECT* FROM Oferta WHERE dbo.Oferta.idOferta = @idPromocion)
BEGIN
SELECT 'OK'
END
ELSE
SELECT 'NO'
GO
/****** Object:  StoredProcedure [dbo].[ValidaTicket]    Script Date: 01-12-2019 3:33:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ValidaTicket]
@NroTicket int
AS
DECLARE @existe int
SET @existe = (SELECT count(*) FROM dbo.FolioBoleta WHERE NroTicket = @NroTicket)
IF @existe >= 1
BEGIN
	SELECT 'OK'
END
ELSE
BEGIN
	SELECT 'NO'
END
GO
USE [master]
GO
ALTER DATABASE [delivery] SET  READ_WRITE 
GO
