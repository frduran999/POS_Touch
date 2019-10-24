Public Class FamiliaProductoService
    Public Function GetFamiliaProducto() As DataTable
        Dim con As New Conexion
        Dim dt As New DataTable
        If con.Conexion Then
            Try
                Dim odac As New dac.myhelper3
                dt = odac.ExecuteDatatable(con.con.ConnectionString, CommandType.StoredProcedure, "GetFamiliaProducto", Nothing, 180000)
            Catch ex As Exception
                dt = New DataTable
            End Try
        End If
        Return dt
    End Function
    Public Function ModificarFamilia(ByVal CodigoFamilia As String, ByVal FamiliaProducto As String) As String
        Dim resp As String = ""
        Dim con As New Conexion
        If con.Conexion Then
            Dim odac As New dac.myMSSQL(con.con.ConnectionString, 180000)
            odac.paramQUERY.Add("CodigoFamilia", CodigoFamilia)
            odac.paramQUERY.Add("FamiliaProducto", FamiliaProducto)
            resp = odac.GetValorNoNull("FamiliaProducto_Modificar")
        End If
        Return resp
    End Function

    Public Function GrabarFamilia(ByVal Familia As String)
        Dim resp As String = ""
        Dim con As New Conexion
        If con.Conexion Then
            Dim sql As New dac.myMSSQL(con.con.ConnectionString, 60000)
            sql.paramQUERY.Add("@Familia", Familia)
            resp = sql.GetValorNoNull("GrabaFamilia")
        End If
        Return resp
    End Function
End Class
