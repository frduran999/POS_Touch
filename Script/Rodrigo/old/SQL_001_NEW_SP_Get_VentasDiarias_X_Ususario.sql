
ALTER procedure [dbo].[Get_VentasDiarias_X_Ususario]
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
