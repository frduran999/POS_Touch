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

    Public Function Rpt_Ticket(idventa As Integer) As DataSet
        Dim dt As New DataSet
        Dim con As New Conexion
        Dim sql As New dac.myhelper3
        If con.Conexion Then
            Try
                sql.paramQUERY.Add("idventa", idventa)
                dt = sql.ExecuteDataSet(con.con.ConnectionString, CommandType.StoredProcedure, "Rpt_VentasTicket", sql.paramQUERY, 60000)
            Catch ex As Exception
                dt = New DataSet
                con.Desconectar()
            End Try
            Try
                con.Desconectar()
            Catch ex As Exception
            End Try
        End If
        Return dt
    End Function
    Public Function Rpt_CierreCaja(ByVal IdUsuario As Integer, ByVal IdCaja As Integer) As DataSet
        Dim dt As New DataSet
        Dim con As New Conexion
        Dim sql As New dac.myhelper3
        If con.Conexion Then
            Try
                sql.paramQUERY.Add("IdUsuario", IdUsuario)
                sql.paramQUERY.Add("IdCaja", IdCaja)
                dt = sql.ExecuteDataSet(con.con.ConnectionString, CommandType.StoredProcedure, "RptCerrarCaja", sql.paramQUERY, 60000)
            Catch ex As Exception
                dt = New DataSet
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
