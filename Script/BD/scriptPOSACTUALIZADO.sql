USE [master]
GO
/****** Object:  Database [delivery]    Script Date: 25-11-2019 19:14:24 ******/
CREATE DATABASE [delivery]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'pz_fl', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\delivery.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'pz_fl_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\delivery_log.ldf' , SIZE = 3840KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  User [delivery]    Script Date: 25-11-2019 19:14:24 ******/
CREATE USER [delivery] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[cabecera_doc]    Script Date: 25-11-2019 19:14:24 ******/
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
 CONSTRAINT [PK_cabecera_doc] PRIMARY KEY CLUSTERED 
(
	[id_doc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Caja]    Script Date: 25-11-2019 19:14:25 ******/
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
/****** Object:  Table [dbo].[detalle]    Script Date: 25-11-2019 19:14:25 ******/
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
/****** Object:  Table [dbo].[FamiliaFoto]    Script Date: 25-11-2019 19:14:25 ******/
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
/****** Object:  Table [dbo].[FamiliaProducto]    Script Date: 25-11-2019 19:14:25 ******/
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
/****** Object:  Table [dbo].[FolioBoleta]    Script Date: 25-11-2019 19:14:25 ******/
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
/****** Object:  Table [dbo].[forma_pago]    Script Date: 25-11-2019 19:14:25 ******/
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
/****** Object:  Table [dbo].[Impresoras]    Script Date: 25-11-2019 19:14:25 ******/
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
/****** Object:  Table [dbo].[Oferta]    Script Date: 25-11-2019 19:14:25 ******/
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
/****** Object:  Table [dbo].[OfertaDetalle]    Script Date: 25-11-2019 19:14:25 ******/
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
/****** Object:  Table [dbo].[parametros]    Script Date: 25-11-2019 19:14:25 ******/
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
/****** Object:  Table [dbo].[Perfil]    Script Date: 25-11-2019 19:14:25 ******/
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
/****** Object:  Table [dbo].[productos]    Script Date: 25-11-2019 19:14:25 ******/
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
/****** Object:  Table [dbo].[RetiroCaja]    Script Date: 25-11-2019 19:14:25 ******/
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
/****** Object:  Table [dbo].[tipo_doc]    Script Date: 25-11-2019 19:14:25 ******/
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
/****** Object:  Table [dbo].[usuarios]    Script Date: 25-11-2019 19:14:25 ******/
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
SET IDENTITY_INSERT [dbo].[Impresoras] ON 

INSERT [dbo].[Impresoras] ([Id], [ImpresoraUno], [ImpresoraDos], [ImpresoraTres]) VALUES (1, N'PDF24', N'PDF24', N'')
SET IDENTITY_INSERT [dbo].[Impresoras] OFF
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
/****** Object:  StoredProcedure [dbo].[actualiza_producto]    Script Date: 25-11-2019 19:14:26 ******/
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
/****** Object:  StoredProcedure [dbo].[BuscoOferta]    Script Date: 25-11-2019 19:14:26 ******/
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
/****** Object:  StoredProcedure [dbo].[cab_compras]    Script Date: 25-11-2019 19:14:26 ******/
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
/****** Object:  StoredProcedure [dbo].[cab_ticket]    Script Date: 25-11-2019 19:14:26 ******/
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
SELECT @idcaja=id FROM caja WHERE dbo.caja.Id_Usuario=@idUsuario AND dbo.caja.Accion='Apertura'
insert into cabecera_doc
(forma_pago,fecha_emision,total,efectivo,IdUsuario,idcaja)
values
(@forma_pago,@fecha,@total,@efectivo,@IdUsuario,@idcaja)

SELECT SCOPE_IDENTITY() AS [SCOPE_IDENTITY]  

GO
/****** Object:  StoredProcedure [dbo].[CerrarCaja]    Script Date: 25-11-2019 19:14:26 ******/
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
/****** Object:  StoredProcedure [dbo].[detalle_compras]    Script Date: 25-11-2019 19:14:26 ******/
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
/****** Object:  StoredProcedure [dbo].[detalle_ticket]    Script Date: 25-11-2019 19:14:26 ******/
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

SELECT 'OK'
GO
/****** Object:  StoredProcedure [dbo].[EliminarFamilia]    Script Date: 25-11-2019 19:14:26 ******/
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
/****** Object:  StoredProcedure [dbo].[EliminarProducto]    Script Date: 25-11-2019 19:14:26 ******/
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
/****** Object:  StoredProcedure [dbo].[existe_codigo_producto]    Script Date: 25-11-2019 19:14:26 ******/
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
/****** Object:  StoredProcedure [dbo].[FamiliaProducto_Grabar]    Script Date: 25-11-2019 19:14:26 ******/
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
/****** Object:  StoredProcedure [dbo].[FamiliaProducto_Modificar]    Script Date: 25-11-2019 19:14:26 ******/
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
/****** Object:  StoredProcedure [dbo].[get_parametros]    Script Date: 25-11-2019 19:14:26 ******/
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
/****** Object:  StoredProcedure [dbo].[Get_ProdExcel]    Script Date: 25-11-2019 19:14:26 ******/
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
/****** Object:  StoredProcedure [dbo].[Get_VentasDiarias]    Script Date: 25-11-2019 19:14:26 ******/
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
					
WHERE        (a.fecha_emision >= @fecha_ini) AND (a.fecha_emision <= @fecha_fin)
GO
/****** Object:  StoredProcedure [dbo].[GetFamiliaProducto]    Script Date: 25-11-2019 19:14:26 ******/
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
/****** Object:  StoredProcedure [dbo].[GetImpresora]    Script Date: 25-11-2019 19:14:26 ******/
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
/****** Object:  StoredProcedure [dbo].[GetImpresoraBoleta]    Script Date: 25-11-2019 19:14:26 ******/
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
/****** Object:  StoredProcedure [dbo].[getImpresoras]    Script Date: 25-11-2019 19:14:26 ******/
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
/****** Object:  StoredProcedure [dbo].[getproductos]    Script Date: 25-11-2019 19:14:26 ******/
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
/****** Object:  StoredProcedure [dbo].[GetVentaTicket]    Script Date: 25-11-2019 19:14:26 ******/
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
/****** Object:  StoredProcedure [dbo].[GrabaBoleta]    Script Date: 25-11-2019 19:14:26 ******/
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
/****** Object:  StoredProcedure [dbo].[grabo_oferta]    Script Date: 25-11-2019 19:14:26 ******/
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
/****** Object:  StoredProcedure [dbo].[grabo_producto]    Script Date: 25-11-2019 19:14:26 ******/
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
/****** Object:  StoredProcedure [dbo].[graboDetalleOferta]    Script Date: 25-11-2019 19:14:26 ******/
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
/****** Object:  StoredProcedure [dbo].[GuardarRetiro]    Script Date: 25-11-2019 19:14:26 ******/
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
/****** Object:  StoredProcedure [dbo].[Impresoras_Grabar]    Script Date: 25-11-2019 19:14:26 ******/
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
/****** Object:  StoredProcedure [dbo].[Oferta_Actualizar]    Script Date: 25-11-2019 19:14:26 ******/
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
/****** Object:  StoredProcedure [dbo].[Oferta_Buscar]    Script Date: 25-11-2019 19:14:26 ******/
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
/****** Object:  StoredProcedure [dbo].[OfertaDetalle_Borrar]    Script Date: 25-11-2019 19:14:26 ******/
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
/****** Object:  StoredProcedure [dbo].[OfertaDetalle_Grabar]    Script Date: 25-11-2019 19:14:26 ******/
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
/****** Object:  StoredProcedure [dbo].[Productos_X_Familia]    Script Date: 25-11-2019 19:14:26 ******/
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
/****** Object:  StoredProcedure [dbo].[Promocion_Grabar]    Script Date: 25-11-2019 19:14:26 ******/
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
/****** Object:  StoredProcedure [dbo].[Rpt_Boleta]    Script Date: 25-11-2019 19:14:26 ******/
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
/****** Object:  StoredProcedure [dbo].[RPT_Productos]    Script Date: 25-11-2019 19:14:26 ******/
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
/****** Object:  StoredProcedure [dbo].[Rpt_TicketFamilia]    Script Date: 25-11-2019 19:14:26 ******/
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
/****** Object:  StoredProcedure [dbo].[Rpt_VentasTicket]    Script Date: 25-11-2019 19:14:26 ******/
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
/****** Object:  StoredProcedure [dbo].[RptCerrarCaja]    Script Date: 25-11-2019 19:14:26 ******/
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
/****** Object:  StoredProcedure [dbo].[Set_AbrirCaja]    Script Date: 25-11-2019 19:14:26 ******/
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
/****** Object:  StoredProcedure [dbo].[ticket]    Script Date: 25-11-2019 19:14:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ticket]
@nro_ticket as int
as
select  * from cabecera_doc where id_doc=@nro_ticket
GO
/****** Object:  StoredProcedure [dbo].[ValidaCaja]    Script Date: 25-11-2019 19:14:26 ******/
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
/****** Object:  StoredProcedure [dbo].[ValidaMonto]    Script Date: 25-11-2019 19:14:26 ******/
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
/****** Object:  StoredProcedure [dbo].[ValidaTicket]    Script Date: 25-11-2019 19:14:26 ******/
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
