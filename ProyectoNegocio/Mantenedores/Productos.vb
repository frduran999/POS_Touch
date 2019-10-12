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
End Class
