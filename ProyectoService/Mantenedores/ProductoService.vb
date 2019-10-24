Public Class ProductoService
    Public Function getProductos() As DataTable
        Dim con As New Conexion
        Dim dt As New DataTable
        If con.Conexion Then
            Try
                Dim odac As New dac.myhelper3
                dt = odac.ExecuteDatatable(con.con.ConnectionString, CommandType.StoredProcedure, "getProductos", Nothing, 180000)
            Catch ex As Exception
                dt = New DataTable
            End Try
        End If
        Return dt
    End Function
    Public Function GetProductoOferta(ByVal IdFamilia As Integer) As DataTable
        Dim con As New Conexion
        Dim dt As New DataTable
        If con.Conexion Then
            Try
                Dim odac As New dac.myhelper3
                odac.paramQUERY.Add("IdFamilia", IdFamilia)
                dt = odac.ExecuteDatatable(con.con.ConnectionString, CommandType.StoredProcedure, "Productos_X_Familia", odac.paramQUERY, 180000)
            Catch ex As Exception
                dt = New DataTable
            End Try
        End If
        Return dt
    End Function

    
End Class
