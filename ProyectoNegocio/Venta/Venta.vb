Imports ProyectoService
Imports proyectoDTO

Public Class Venta
    Public Function GrabarCab(ByVal dto As ticket) As String
        Dim dt As String
        Dim b As New VentaService
        dt = b.GrabarCab(dto)
        Return dt
    End Function

    Public Function DetalleTicket(ByVal dto As ticket) As String
        Dim dt As String
        Dim b As New VentaService
        dt = b.DetalleTicket(dto)
        Return dt
    End Function
End Class
