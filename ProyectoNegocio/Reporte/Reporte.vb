Imports ProyectoService
Public Class Reporte
    Public Function ReporteProducto() As DataTable
        Dim dt As New DataTable
        Dim b As New reporteService
        dt = b.ReporteProducto
        Return dt
    End Function
End Class
