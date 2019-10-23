Public Class ImpresoraService
    Public Function GrabaImpresoras(ByVal primera As String, ByVal segunda As String, ByVal tercera As String, ByVal Id As Integer) As String
        Dim resp As String = ""
        Dim con As New Conexion
        If con.Conexion Then
            Dim odac As New dac.myMSSQL(con.con.ConnectionString, 180000)
            odac.paramQUERY.Add("primera", primera)
            odac.paramQUERY.Add("segunda", segunda)
            odac.paramQUERY.Add("tercera", tercera)
            odac.paramQUERY.Add("Id", Id)
            resp = odac.GetValorNoNull("Impresoras_Grabar")
        End If
        Return resp
    End Function
    Public Function GetImpresoras() As DataTable
        Dim con As New Conexion
        Dim dt As New DataTable
        If con.Conexion Then
            Try
                Dim odac As New dac.myhelper3
                dt = odac.ExecuteDatatable(con.con.ConnectionString, CommandType.StoredProcedure, "getImpresoras", Nothing, 180000)
            Catch ex As Exception
                dt = New DataTable
            End Try
        End If
        Return dt
    End Function
   
End Class
