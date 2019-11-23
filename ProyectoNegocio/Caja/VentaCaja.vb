Imports ProyectoService

Public Class VentaCaja

    Public Function GetVentaTicket(ByVal IdTicket As Integer) As DataTable
        Dim dt As New DataTable
        Dim b As New VentaCajaService
        dt = b.GetVentaTicket(IdTicket)
        Return dt
    End Function
End Class
