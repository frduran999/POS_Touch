Imports ProyectoService

Public Class Mantenimiento
    Public Function RespaldoBase() As String
        Dim resp As String
        Dim b As New ServiceMantenimiento
        resp = b.RespaldoBase
        Return resp
    End Function
End Class
