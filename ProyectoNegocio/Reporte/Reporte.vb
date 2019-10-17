Imports ProyectoService
Public Class Reporte
    Public Function ReporteProducto() As DataTable
        Dim dt As New DataTable
        Dim b As New reporteService
        dt = b.ReporteProducto
        Return dt
    End Function

    Public Function RptVentasDiarias(ByVal FechaIni As String, ByVal FechaFin As String) As DataTable
        Dim dt As New DataTable
        Dim b As New ReporteService
        dt = b.RptVentasDiarias(FechaIni, FechaFin)
        Return dt
    End Function
End Class
