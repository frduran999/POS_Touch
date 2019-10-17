Public Class AbrirCajaService

    Public Function AbrirCaja(ByVal IdUsuario As Integer, ByVal Monto As Integer, ByVal Glosa As String) As DataTable
        Dim con As New Conexion
        Dim dt As New DataTable
        Dim sql As New dac.myhelper3
        If con.Conexion Then
            Try
                sql.paramQUERY.Add("IdUsuario", IdUsuario)
                sql.paramQUERY.Add("Monto", Monto)
                sql.paramQUERY.Add("Glosa", Glosa)
                dt = sql.ExecuteDatatable(con.con.ConnectionString, CommandType.StoredProcedure, "Set_AbrirCaja", sql.paramQUERY, 60000)
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

    Public Function ValidaCaja(ByVal IdUsuario As Integer) As String
        Dim con As New Conexion
        Dim dt As String = ""


        If con.Conexion Then
            Try
                Dim sql As New dac.myMSSQL(con.con.ConnectionString, 60000)
                sql.paramQUERY.Add("IdUsuario", IdUsuario)
                dt = sql.GetValorNoNull("ValidaCaja")
            Catch ex As Exception

            End Try
        End If
        Return dt
    End Function

    Public Function CerrarCaja(ByVal IdUsuario As Integer) As String
        Dim con As New Conexion
        Dim dt As String = ""

        If con.Conexion Then
            Try
                Dim sql As New dac.myMSSQL(con.con.ConnectionString, 60000)
                sql.paramQUERY.Add("IdUsuario", IdUsuario)
                dt = sql.GetValorNoNull("CerrarCaja")
            Catch ex As Exception

            End Try
        End If
        Return dt
    End Function
End Class
