Public Class VentaCajaService

    Public Function GetVentaTicket(ByVal IdTicket As Integer) As DataTable
        Dim con As New Conexion
        Dim dt As New DataTable
        If con.Conexion Then
            Try
                Dim odac As New dac.myhelper3
                odac.paramQUERY.Add("IdTicket", IdTicket)
                dt = odac.ExecuteDatatable(con.con.ConnectionString, CommandType.StoredProcedure, "GetVentaTicket", odac.paramQUERY, 90000)
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
