Imports ProyectoService

Public Class Impresoras
    Public Function GrabaImpresoras(ByVal primera As String, ByVal Id As Integer) As String
        Dim resp As String = ""
        Dim bsp As New ImpresoraService
        resp = bsp.GrabaImpresoras(primera, Id)
        Return resp
    End Function
    Public Function GetImpresoras() As DataTable
        Dim dt As New DataTable
        Dim b As New ImpresoraService
        dt = b.GetImpresoras
        Return dt
    End Function
End Class
