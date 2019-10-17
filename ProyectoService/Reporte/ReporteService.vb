Public Class ReporteService
    Public Function ReporteProducto() As DataTable
        Dim dt As New DataTable
        Dim con As New Conexion
        Dim sql As New dac.myhelper3
        If con.Conexion Then
            Try
                dt = sql.ExecuteDatatable(con.con.ConnectionString, CommandType.StoredProcedure, "RPT_Productos", sql.paramQUERY, 60000)
            Catch ex As Exception
                dt = New DataTable
                con.Desconectar()
            End Try
            Try
                con.Desconectar()
            Catch ex As Exception
            End Try
        End If
        Return dt
    End Function

    Public Function RptVentasDiarias(ByVal FechaIni As String, ByVal FechaFin As String) As DataTable
        Dim dt As New DataTable
        Dim con As New Conexion
        Dim sql As New dac.myhelper3
        If con.Conexion Then
            Try
                sql.paramQUERY.Add("Fecha_Ini", FechaIni)
                sql.paramQUERY.Add("Fecha_Fin", FechaFin)
                dt = sql.ExecuteDatatable(con.con.ConnectionString, CommandType.StoredProcedure, "Get_VentasDiarias", sql.paramQUERY, 60000)
            Catch ex As Exception
                dt = New DataTable
                con.Desconectar()
            End Try
            Try
                con.Desconectar()
            Catch ex As Exception
            End Try
        End If
        Return dt
    End Function

End Class
