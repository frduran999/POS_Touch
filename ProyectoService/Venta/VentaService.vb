Imports proyectoDTO
Public Class VentaService
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
    Public Function GrabarCab(ByVal dto As ticket) As String
        Dim resp As String = ""
        Dim con As New Conexion
        If con.Conexion Then
            Dim odac As New dac.myMSSQL(con.con.ConnectionString, 180000)
            odac.paramQUERY.Add("fecha", dto.get_fecha)
            odac.paramQUERY.Add("forma_pago", dto.get_forma_pago)
            odac.paramQUERY.Add("total", dto.get_total)
            odac.paramQUERY.Add("efectivo", dto.get_efectivo)
            odac.paramQUERY.Add("IdUsuario", dto.idUsuario)

            resp = odac.GetValorNoNull("cab_ticket")
        End If
        Return resp
    End Function

    Public Function DetalleTicket(ByVal dto As ticket) As String
        Dim resp As String = ""
        Dim con As New Conexion
        If con.Conexion Then
            Dim odac As New dac.myMSSQL(con.con.ConnectionString, 180000)
            odac.paramQUERY.Add("id_doc", dto.get_id_doc)
            odac.paramQUERY.Add("descripcion", dto.get_descripcion)
            odac.paramQUERY.Add("cantidad", dto.get_cantidad)
            odac.paramQUERY.Add("precio", dto.get_precio)
            odac.paramQUERY.Add("total_item", dto.get_total_item)
            odac.paramQUERY.Add("codigo", dto.get_codigo)

            resp = odac.GetValorNoNull("detalle_ticket")
        End If
        Return resp
    End Function
End Class
