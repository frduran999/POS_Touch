Imports ProyectoService

Public Class Productos
    Public Function getProductos() As DataTable
        Dim dt As New DataTable
        Dim b As New ProductoService
        dt = b.getProductos
        Return dt
    End Function
    Public Function GetProductoOferta(ByVal IdFamilia As Integer) As DataTable
        Dim dt As New DataTable
        Dim Bsp As New ProductoService
        dt = Bsp.GetProductoOferta(IdFamilia)
        Return dt
    End Function
    Public Function GrabaOFerta(ByVal Promocion As String, ByVal precio As Integer) As String
        Dim resp As String = ""
        Dim b As New ProductoService
        resp = b.GrabaOferta(Promocion, precio)
        Return resp
    End Function
    Public Function GrabaDetalleOferta(Idoferta As Integer, Linea As Integer, IdProducto As Integer, Cantidad As Integer, Precio As Integer) As String
        Dim resp As String = ""
        Dim bsp As New ProductoService
        resp = bsp.GrabaDetalleOferta(Idoferta, Linea, IdProducto, Cantidad, Precio)
        Return resp
    End Function
End Class
