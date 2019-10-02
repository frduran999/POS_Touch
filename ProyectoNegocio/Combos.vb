Imports ProyectoService
Public Class Combos
    Public Function GetOfertas() As DataTable
        Dim dt As New DataTable
        Dim bsp As New CombosServices
        dt = bsp.GetOfertas()
        Return dt
    End Function
End Class
