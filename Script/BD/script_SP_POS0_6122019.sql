USE [delivery]
GO
/****** Object:  StoredProcedure [dbo].[actualiza_producto]    Script Date: 06-12-2019 11:05:46 ******/
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
/****** Object:  StoredProcedure [dbo].[BuscarVentas]    Script Date: 06-12-2019 11:05:46 ******/
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
                         usuarios ON cabecera_doc.IdUsuario	 = usuarios.id LEFT OUTER JOIN
                         FolioBoleta ON cabecera_doc.id_doc = FolioBoleta.NroTicket
 where cabecera_doc.fecha_emision>=@FechaIni and cabecera_doc.fecha_emision<=@FechaFin AND cabecera_doc.Eliminado=0
end
GO
/****** Object:  StoredProcedure [dbo].[BuscoOferta]    Script Date: 06-12-2019 11:05:46 ******/
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
/****** Object:  StoredProcedure [dbo].[cab_compras]    Script Date: 06-12-2019 11:05:46 ******/
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
/****** Object:  StoredProcedure [dbo].[cab_ticket]    Script Date: 06-12-2019 11:05:46 ******/
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
/****** Object:  StoredProcedure [dbo].[CerrarCaja]    Script Date: 06-12-2019 11:05:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CerrarCaja]
@IdUsuario int,
@Glosa varchar (100)
AS

BEGIN
UPDATE dbo.Caja
	SET
    dbo.Caja.Accion = 'Cerrada',
	dbo.Caja.Glosa  = @Glosa
	where dbo.Caja.Id_Usuario = @IdUsuario

	DECLARE @idCaja AS int

	SELECT @idCaja= max (id) FROM caja WHERE dbo.caja.Id_Usuario = @IdUsuario	

	SELECT @idCaja	
	END
GO
/****** Object:  StoredProcedure [dbo].[detalle_compras]    Script Date: 06-12-2019 11:05:46 ******/
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
/****** Object:  StoredProcedure [dbo].[detalle_ticket]    Script Date: 06-12-2019 11:05:46 ******/
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
/****** Object:  StoredProcedure [dbo].[EliminarFamilia]    Script Date: 06-12-2019 11:05:46 ******/
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
/****** Object:  StoredProcedure [dbo].[EliminarProducto]    Script Date: 06-12-2019 11:05:46 ******/
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
/****** Object:  StoredProcedure [dbo].[EliminaTicket]    Script Date: 06-12-2019 11:05:46 ******/
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
/****** Object:  StoredProcedure [dbo].[existe_codigo_producto]    Script Date: 06-12-2019 11:05:46 ******/
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
/****** Object:  StoredProcedure [dbo].[FamiliaProducto_Grabar]    Script Date: 06-12-2019 11:05:46 ******/
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
/****** Object:  StoredProcedure [dbo].[FamiliaProducto_Modificar]    Script Date: 06-12-2019 11:05:46 ******/
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
/****** Object:  StoredProcedure [dbo].[get_parametros]    Script Date: 06-12-2019 11:05:46 ******/
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
/****** Object:  StoredProcedure [dbo].[Get_ProdExcel]    Script Date: 06-12-2019 11:05:46 ******/
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
/****** Object:  StoredProcedure [dbo].[Get_VentasDiarias]    Script Date: 06-12-2019 11:05:46 ******/
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
/****** Object:  StoredProcedure [dbo].[Get_VentasDiarias_X_Ususario]    Script Date: 06-12-2019 11:05:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[Get_VentasDiarias_X_Ususario]
@FechaIni datetime,
@FechaFin datetime,
@Usuario int
as 
begin
if @Usuario=0
SELECT     a.id_doc, a.forma_pago, a.fecha_emision, d.descripcion, a.total, d.precio AS efectivo, usuarios.usuario
FROM         cabecera_doc AS a LEFT OUTER JOIN
                      usuarios ON a.IdUsuario = usuarios.id LEFT OUTER JOIN
                      detalle AS d ON a.id_doc = d.id_doc_cab
WHERE (a.fecha_emision >= @FechaIni) AND 
      (a.fecha_emision <= @FechaFin) AND 
      (a.Eliminado=0)
      
else

SELECT     a.id_doc, a.forma_pago, a.fecha_emision, d.descripcion, a.total, d.precio AS efectivo, usuarios.usuario
FROM         cabecera_doc AS a LEFT OUTER JOIN
                      usuarios ON a.IdUsuario = usuarios.id LEFT OUTER JOIN
                      detalle AS d ON a.id_doc = d.id_doc_cab
WHERE (a.fecha_emision >= @FechaIni) AND 
      (a.fecha_emision <= @FechaFin) AND 
      (a.IdUsuario = @Usuario) and
      (a.Eliminado=0)
end
GO
/****** Object:  StoredProcedure [dbo].[GetFamiliaProducto]    Script Date: 06-12-2019 11:05:46 ******/
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
/****** Object:  StoredProcedure [dbo].[GetImpresora]    Script Date: 06-12-2019 11:05:46 ******/
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
/****** Object:  StoredProcedure [dbo].[GetImpresoraBoleta]    Script Date: 06-12-2019 11:05:46 ******/
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
/****** Object:  StoredProcedure [dbo].[getImpresoras]    Script Date: 06-12-2019 11:05:46 ******/
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
/****** Object:  StoredProcedure [dbo].[GetProductoFamilia]    Script Date: 06-12-2019 11:05:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetProductoFamilia]
@IdFamilia int
as
begin

select id_producto id, ltrim(rtrim(descripcion_producto)) nombre 
from productos where CodigoFamilia=@IdFamilia order by descripcion_producto

end
GO
/****** Object:  StoredProcedure [dbo].[getproductos]    Script Date: 06-12-2019 11:05:46 ******/
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
/****** Object:  StoredProcedure [dbo].[getProductosFamilia]    Script Date: 06-12-2019 11:05:46 ******/
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
/****** Object:  StoredProcedure [dbo].[GetVentaTicket]    Script Date: 06-12-2019 11:05:46 ******/
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
/****** Object:  StoredProcedure [dbo].[GrabaBoleta]    Script Date: 06-12-2019 11:05:46 ******/
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
/****** Object:  StoredProcedure [dbo].[grabo_oferta]    Script Date: 06-12-2019 11:05:46 ******/
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
/****** Object:  StoredProcedure [dbo].[grabo_producto]    Script Date: 06-12-2019 11:05:46 ******/
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
/****** Object:  StoredProcedure [dbo].[graboDetalleOferta]    Script Date: 06-12-2019 11:05:46 ******/
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
/****** Object:  StoredProcedure [dbo].[grillaCierre]    Script Date: 06-12-2019 11:05:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[grillaCierre]
@fechaini datetime,
@fechafin datetime
AS
begin
SELECT        c.Id idcaja, c.Monto, c.Fecha, usuarios.usuario, c.Id_Usuario
FROM            Caja AS c LEFT OUTER JOIN
                         usuarios ON c.Id_Usuario = usuarios.id
WHERE        (c.Accion = 'Cerrada') AND Convert(Varchar(10),c.Fecha,120) >= Convert(Varchar(10),@fechaini,120) 
AND Convert(Varchar(10),c.Fecha,120) <= Convert(Varchar(10),@fechafin,120) 
END

GO
/****** Object:  StoredProcedure [dbo].[GuardarRetiro]    Script Date: 06-12-2019 11:05:46 ******/
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
		IdCaja,
		fecha
	)
	VALUES
	(
	    @IdUsuario, -- IdUsuario - int
	    @Monto, -- Monto - int
	    @Glosa, -- Glosa - varchar
		@idcaja,
		getdate()
	)
	SELECT 'OK'
END

GO
/****** Object:  StoredProcedure [dbo].[Impresoras_Grabar]    Script Date: 06-12-2019 11:05:46 ******/
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
/****** Object:  StoredProcedure [dbo].[ImprimeRegistro]    Script Date: 06-12-2019 11:05:46 ******/
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
/****** Object:  StoredProcedure [dbo].[Oferta_Actualizar]    Script Date: 06-12-2019 11:05:46 ******/
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
/****** Object:  StoredProcedure [dbo].[Oferta_Buscar]    Script Date: 06-12-2019 11:05:46 ******/
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
/****** Object:  StoredProcedure [dbo].[OfertaDetalle_Borrar]    Script Date: 06-12-2019 11:05:46 ******/
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
/****** Object:  StoredProcedure [dbo].[OfertaDetalle_Grabar]    Script Date: 06-12-2019 11:05:46 ******/
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
/****** Object:  StoredProcedure [dbo].[Productos_X_Familia]    Script Date: 06-12-2019 11:05:46 ******/
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
/****** Object:  StoredProcedure [dbo].[Promocion_Grabar]    Script Date: 06-12-2019 11:05:46 ******/
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
/****** Object:  StoredProcedure [dbo].[Rpt_Boleta]    Script Date: 06-12-2019 11:05:46 ******/
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
WHERE        (dbo.FolioBoleta.NroTicket	 = @idventa)

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
/****** Object:  StoredProcedure [dbo].[RPT_Cierre]    Script Date: 06-12-2019 11:05:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RPT_Cierre]
@fecha datetime,
@Idusuario int,
@IdCaja int
AS 
BEGIN

SELECT Id,Accion,Id_Usuario,Monto,Fecha,Glosa,(SELECT isnull(sum(monto),0) FROM dbo.RetiroCaja rc WHERE IdUsuario=@Idusuario AND IdCaja=1 AND rc.fecha=@fecha) MontoRetiro
FROM caja WHERE id = @IdCaja AND Id_Usuario = @Idusuario AND convert(char(10),dbo.caja.Fecha,120) =@fecha

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
WHERE cd.IdCaja=@IdCaja AND cd.IdUsuario=@Idusuario AND cd.fecha_emision=@fecha

SELECT 
isnull(rc.Id,0) AS Id, 
isnull(rc.IdUsuario,0) AS IdUsuario, 
isnull(rc.Monto,0) AS Monto, 
isnull(rc.Glosa,'') AS Glosa, 
isnull(rc.IdCaja,0) AS IdCaja 

FROM dbo.RetiroCaja rc WHERE rc.IdCaja=@IdCaja AND rc.IdUsuario=@Idusuario AND fecha=@fecha

END
GO
/****** Object:  StoredProcedure [dbo].[RPT_FormaPago]    Script Date: 06-12-2019 11:05:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[RPT_FormaPago]
@FechaIni datetime,
@FechaFin datetime,
@Tipo int
as
--Tipo 1 Delivery, 2 Tarjeta, 3 Cantado, 4 Todos
begin
If @Tipo=1
SELECT ISNULL(FolioBoleta.FolioBoleta, 0) AS id_doc, cabecera_doc.forma_pago, cabecera_doc.fecha_emision, cabecera_doc.total, 
       cabecera_doc.efectivo, FamiliaProducto.Familia, usuarios.usuario, detalle.descripcion Producto
FROM   usuarios RIGHT OUTER JOIN
       cabecera_doc LEFT OUTER JOIN
       FolioBoleta ON cabecera_doc.id_doc = FolioBoleta.NroTicket ON usuarios.id = cabecera_doc.IdUsuario LEFT OUTER JOIN
       detalle ON cabecera_doc.id_doc = detalle.id_doc_cab LEFT OUTER JOIN
       FamiliaProducto RIGHT OUTER JOIN
       productos ON FamiliaProducto.CodigoFamilia = productos.CodigoFamilia ON detalle.codigo = productos.id_producto
WHERE  (cabecera_doc.Eliminado = 0) and (cabecera_doc.fecha_emision>=@FechaIni) and 
       (cabecera_doc.fecha_emision<=@FechaFin) and (cabecera_doc.forma_pago='Delivery')

If @Tipo=2
SELECT ISNULL(FolioBoleta.FolioBoleta, 0) AS id_doc, cabecera_doc.forma_pago, cabecera_doc.fecha_emision, cabecera_doc.total, 
       cabecera_doc.efectivo, FamiliaProducto.Familia, usuarios.usuario, detalle.descripcion Producto
FROM   usuarios RIGHT OUTER JOIN
       cabecera_doc LEFT OUTER JOIN
       FolioBoleta ON cabecera_doc.id_doc = FolioBoleta.NroTicket ON usuarios.id = cabecera_doc.IdUsuario LEFT OUTER JOIN
       detalle ON cabecera_doc.id_doc = detalle.id_doc_cab LEFT OUTER JOIN
       FamiliaProducto RIGHT OUTER JOIN
       productos ON FamiliaProducto.CodigoFamilia = productos.CodigoFamilia ON detalle.codigo = productos.id_producto
WHERE  (cabecera_doc.Eliminado = 0) and (cabecera_doc.fecha_emision>=@FechaIni) and 
       (cabecera_doc.fecha_emision<=@FechaFin) and (cabecera_doc.forma_pago='Tarjeta')
       
If @Tipo=3
SELECT ISNULL(FolioBoleta.FolioBoleta, 0) AS id_doc, cabecera_doc.forma_pago, cabecera_doc.fecha_emision, cabecera_doc.total, 
       cabecera_doc.efectivo, FamiliaProducto.Familia, usuarios.usuario, detalle.descripcion Producto
FROM   usuarios RIGHT OUTER JOIN
       cabecera_doc LEFT OUTER JOIN
       FolioBoleta ON cabecera_doc.id_doc = FolioBoleta.NroTicket ON usuarios.id = cabecera_doc.IdUsuario LEFT OUTER JOIN
       detalle ON cabecera_doc.id_doc = detalle.id_doc_cab LEFT OUTER JOIN
       FamiliaProducto RIGHT OUTER JOIN
       productos ON FamiliaProducto.CodigoFamilia = productos.CodigoFamilia ON detalle.codigo = productos.id_producto
WHERE  (cabecera_doc.Eliminado = 0) and (cabecera_doc.fecha_emision>=@FechaIni) and 
       (cabecera_doc.fecha_emision<=@FechaFin) and (cabecera_doc.forma_pago='Efectivo')
       
If @Tipo=4
SELECT ISNULL(FolioBoleta.FolioBoleta, 0) AS id_doc, cabecera_doc.forma_pago, cabecera_doc.fecha_emision, cabecera_doc.total, 
       cabecera_doc.efectivo, FamiliaProducto.Familia, usuarios.usuario, detalle.descripcion Producto
FROM   usuarios RIGHT OUTER JOIN
       cabecera_doc LEFT OUTER JOIN
       FolioBoleta ON cabecera_doc.id_doc = FolioBoleta.NroTicket ON usuarios.id = cabecera_doc.IdUsuario LEFT OUTER JOIN
       detalle ON cabecera_doc.id_doc = detalle.id_doc_cab LEFT OUTER JOIN
       FamiliaProducto RIGHT OUTER JOIN
       productos ON FamiliaProducto.CodigoFamilia = productos.CodigoFamilia ON detalle.codigo = productos.id_producto
WHERE  (cabecera_doc.Eliminado = 0) and (cabecera_doc.fecha_emision>=@FechaIni) and 
       (cabecera_doc.fecha_emision<=@FechaFin)
       
end
GO
/****** Object:  StoredProcedure [dbo].[RPT_Productos]    Script Date: 06-12-2019 11:05:46 ******/
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
/****** Object:  StoredProcedure [dbo].[RPT_Productos_Revision]    Script Date: 06-12-2019 11:05:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[RPT_Productos_Revision]
@FechaIni datetime,
@FechaFin datetime,
@Usuario int,
@Familia int,
@Producto int	
as
begin

if @Usuario=0 and @Familia=0 and @Producto=0
begin
SELECT ISNULL(FolioBoleta.FolioBoleta, 0) AS id_doc, cabecera_doc.forma_pago, cabecera_doc.fecha_emision, cabecera_doc.total, 
       cabecera_doc.efectivo, FamiliaProducto.Familia, usuarios.usuario, detalle.descripcion Producto
FROM   usuarios RIGHT OUTER JOIN
       cabecera_doc LEFT OUTER JOIN
       FolioBoleta ON cabecera_doc.id_doc = FolioBoleta.NroTicket ON usuarios.id = cabecera_doc.IdUsuario LEFT OUTER JOIN
       detalle ON cabecera_doc.id_doc = detalle.id_doc_cab LEFT OUTER JOIN
       FamiliaProducto RIGHT OUTER JOIN
       productos ON FamiliaProducto.CodigoFamilia = productos.CodigoFamilia ON detalle.codigo = productos.id_producto
WHERE  (cabecera_doc.Eliminado = 0) and (cabecera_doc.fecha_emision>=@FechaIni) and (cabecera_doc.fecha_emision<=@FechaFin)             
end
if @Usuario>0 and @Familia=0 and @Producto=0
begin
SELECT ISNULL(FolioBoleta.FolioBoleta, 0) AS id_doc, cabecera_doc.forma_pago, cabecera_doc.fecha_emision, cabecera_doc.total, 
       cabecera_doc.efectivo, FamiliaProducto.Familia, usuarios.usuario, detalle.descripcion Producto
FROM   usuarios RIGHT OUTER JOIN
       cabecera_doc LEFT OUTER JOIN
       FolioBoleta ON cabecera_doc.id_doc = FolioBoleta.NroTicket ON usuarios.id = cabecera_doc.IdUsuario LEFT OUTER JOIN
       detalle ON cabecera_doc.id_doc = detalle.id_doc_cab LEFT OUTER JOIN
       FamiliaProducto RIGHT OUTER JOIN
       productos ON FamiliaProducto.CodigoFamilia = productos.CodigoFamilia ON detalle.codigo = productos.id_producto
WHERE  (cabecera_doc.Eliminado = 0) and (cabecera_doc.fecha_emision>=@FechaIni) and (cabecera_doc.fecha_emision<=@FechaFin) AND dbo.cabecera_doc.IdUsuario	= @Usuario                 
end
if @Usuario>0 and @Familia>0 and @Producto=0
begin
SELECT ISNULL(FolioBoleta.FolioBoleta, 0) AS id_doc, cabecera_doc.forma_pago, cabecera_doc.fecha_emision, cabecera_doc.total, 
       cabecera_doc.efectivo, FamiliaProducto.Familia, usuarios.usuario, detalle.descripcion Producto
FROM   usuarios RIGHT OUTER JOIN
       cabecera_doc LEFT OUTER JOIN
       FolioBoleta ON cabecera_doc.id_doc = FolioBoleta.NroTicket ON usuarios.id = cabecera_doc.IdUsuario LEFT OUTER JOIN
       detalle ON cabecera_doc.id_doc = detalle.id_doc_cab LEFT OUTER JOIN
       FamiliaProducto RIGHT OUTER JOIN
       productos ON FamiliaProducto.CodigoFamilia = productos.CodigoFamilia ON detalle.codigo = productos.id_producto
WHERE  (cabecera_doc.Eliminado = 0) and (cabecera_doc.fecha_emision>=@FechaIni) and (cabecera_doc.fecha_emision<=@FechaFin) AND dbo.cabecera_doc.IdUsuario	= @Usuario
AND dbo.FamiliaProducto.CodigoFamilia = @Familia	                
end
if @Usuario>0 and @Familia>0 and @Producto>0
begin
SELECT ISNULL(FolioBoleta.FolioBoleta, 0) AS id_doc, cabecera_doc.forma_pago, cabecera_doc.fecha_emision, cabecera_doc.total, 
       cabecera_doc.efectivo, FamiliaProducto.Familia, usuarios.usuario, detalle.descripcion Producto
FROM   usuarios RIGHT OUTER JOIN
       cabecera_doc LEFT OUTER JOIN
       FolioBoleta ON cabecera_doc.id_doc = FolioBoleta.NroTicket ON usuarios.id = cabecera_doc.IdUsuario LEFT OUTER JOIN
       detalle ON cabecera_doc.id_doc = detalle.id_doc_cab LEFT OUTER JOIN
       FamiliaProducto RIGHT OUTER JOIN
       productos ON FamiliaProducto.CodigoFamilia = productos.CodigoFamilia ON detalle.codigo = productos.id_producto
WHERE  (cabecera_doc.Eliminado = 0) and (cabecera_doc.fecha_emision>=@FechaIni) and (cabecera_doc.fecha_emision<=@FechaFin) AND dbo.cabecera_doc.IdUsuario = @Usuario
AND dbo.FamiliaProducto.CodigoFamilia = @Familia AND dbo.detalle.codigo	= @Producto	                      
end


end
GO
/****** Object:  StoredProcedure [dbo].[Rpt_StockCritico]    Script Date: 06-12-2019 11:05:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Rpt_StockCritico]
as
SELECT p.descripcion_producto AS Producto,s.Saldo,s.StockCritico FROM stock s JOIN productos p on s.IdProducto	= p.id_producto	WHERE s.Saldo <= 10
GO
/****** Object:  StoredProcedure [dbo].[Rpt_TicketFamilia]    Script Date: 06-12-2019 11:05:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Rpt_TicketFamilia]
@idventa int
as
BEGIN
SELECT       FolioBoleta.FolioBoleta id_doc_cab, detalle.descripcion, detalle.precio, detalle.total, detalle.cantidad, FamiliaProducto.Impresora
FROM            FolioBoleta RIGHT OUTER JOIN
                         detalle ON FolioBoleta.NroTicket = detalle.id_doc_cab LEFT OUTER JOIN
                         FamiliaProducto INNER JOIN
                         productos ON FamiliaProducto.CodigoFamilia = productos.CodigoFamilia ON detalle.codigo = productos.id_producto
WHERE        (detalle.id_doc_cab = @idventa)

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
/****** Object:  StoredProcedure [dbo].[Rpt_VentasTicket]    Script Date: 06-12-2019 11:05:46 ******/
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
/****** Object:  StoredProcedure [dbo].[RptCerrarCaja]    Script Date: 06-12-2019 11:05:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RptCerrarCaja]
@IdUsuario int,
@IdCaja int
AS

SELECT Id,Accion,Id_Usuario,Monto,Fecha,Glosa,(SELECT isnull(sum(monto),0) FROM dbo.RetiroCaja rc WHERE IdUsuario=@IdUsuario AND IdCaja=@IdCaja) MontoRetiro
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
/****** Object:  StoredProcedure [dbo].[Set_AbrirCaja]    Script Date: 06-12-2019 11:05:46 ******/
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
/****** Object:  StoredProcedure [dbo].[Stock_Grabar]    Script Date: 06-12-2019 11:05:46 ******/
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
/****** Object:  StoredProcedure [dbo].[StockPromocion]    Script Date: 06-12-2019 11:05:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[StockPromocion]
@IdProducto int,
@Cantidad int,
@total_item int,
@precio int,
@descripcion varchar (100),
@id_doc int
AS
BEGIN
insert into detalle 
(id_doc_cab,descripcion,precio,total,cantidad,codigo )
values
(@id_doc,@descripcion,@precio,@total_item,@Cantidad,@IdProducto)

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
/****** Object:  StoredProcedure [dbo].[ticket]    Script Date: 06-12-2019 11:05:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ticket]
@nro_ticket as int
as
select  * from cabecera_doc where id_doc=@nro_ticket
GO
/****** Object:  StoredProcedure [dbo].[ValidaCaja]    Script Date: 06-12-2019 11:05:46 ******/
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
/****** Object:  StoredProcedure [dbo].[ValidaMonto]    Script Date: 06-12-2019 11:05:46 ******/
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
/****** Object:  StoredProcedure [dbo].[ValidaProducto]    Script Date: 06-12-2019 11:05:46 ******/
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
/****** Object:  StoredProcedure [dbo].[ValidaTicket]    Script Date: 06-12-2019 11:05:46 ******/
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
