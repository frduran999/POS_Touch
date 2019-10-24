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

    Public Function GrabaOFerta(ByVal Promocion As String, ByVal precio As Integer) As Integer
        Dim resp As Integer = 0
        Dim con As New Conexion
        If con.Conexion Then
            Dim odac As New dac.myMSSQL(con.con.ConnectionString, 180000)
            odac.paramQUERY.Add("Nombre", Promocion)
            odac.paramQUERY.Add("Precio", precio)

            resp = odac.GetValorNoNull("Promocion_Grabar")
        End If
        Return resp
    End Function
    Public Function GrabaDetalleOferta(Idoferta As Integer, Linea As Integer, IdProducto As Integer, Cantidad As Integer, Precio As Integer) As String
        Dim resp As String = ""
        Dim con As New Conexion
        If con.Conexion Then
            Dim odac As New dac.myMSSQL(con.con.ConnectionString, 180000)
            odac.paramQUERY.Add("Idoferta", Idoferta)
            odac.paramQUERY.Add("Linea", Linea)
            odac.paramQUERY.Add("IdProducto", IdProducto)
            odac.paramQUERY.Add("Cantidad", Cantidad)
            odac.paramQUERY.Add("Precio", Precio)

            resp = odac.GetValorNoNull("OfertaDetalle_Grabar")
        End If
        Return resp

    End Function

    Public Function EliminaProducto(ByVal Codigo As String)
        Dim con As New Conexion
        Dim dt As String = ""

        If con.Conexion Then
            Try
                Dim sql As New dac.myMSSQL(con.con.ConnectionString, 60000)
                sql.paramQUERY.Add("Codigo", Codigo)
                dt = sql.GetValorNoNull("EliminarProducto")
            Catch ex As Exception

            End Try
        End If
        Return dt
    End Function
End Class
