﻿Public Class CombosServices
    Public Function GetOfertas() As DataTable
        Dim dt As New DataTable
        Dim Con As New Conexion
        If Con.Conexion Then
            Try
                Dim sql As String = "select idOferta Id, NombreOferta nombre from Oferta  order by NombreOferta"
                Con.da = New SqlClient.SqlDataAdapter(sql, Con.con.ConnectionString)
                Con.da.Fill(dt)
                Dim row As DataRow = dt.NewRow()
                row("id") = 0
                row("nombre") = "Seleccione..."
                dt.Rows.InsertAt(row, 0)
            Catch ex As Exception
                dt = New DataTable()
            End Try
            Try
                Con.Desconectar()
            Catch ex As Exception
            End Try
        End If
        Return dt
    End Function
    Public Function getFamilia() As DataTable
        Dim dt As New DataTable
        Dim Con As New Conexion
        If Con.Conexion Then
            Try
                Dim sql As String = "select CodigoFamilia Id, Familia nombre from FamiliaProducto where Estado = 1  order by Familia"
                Con.da = New SqlClient.SqlDataAdapter(sql, Con.con.ConnectionString)
                Con.da.Fill(dt)
                Dim row As DataRow = dt.NewRow()
                row("id") = 0
                row("nombre") = "Seleccione..."
                dt.Rows.InsertAt(row, 0)
            Catch ex As Exception
                dt = New DataTable()
            End Try
            Try
                Con.Desconectar()
            Catch ex As Exception
            End Try
        End If
        Return dt
    End Function
    Public Function getProductos() As DataTable
        Dim dt As New DataTable
        Dim Con As New Conexion
        If Con.Conexion Then
            Try
                Dim sql As String = "select id_producto Id, descripcion_producto nombre from Productos  order by descripcion_producto"
                Con.da = New SqlClient.SqlDataAdapter(sql, Con.con.ConnectionString)
                Con.da.Fill(dt)
                Dim row As DataRow = dt.NewRow()
                row("id") = 0
                row("nombre") = "Seleccione..."
                dt.Rows.InsertAt(row, 0)
            Catch ex As Exception
                dt = New DataTable()
            End Try
            Try
                Con.Desconectar()
            Catch ex As Exception
            End Try
        End If
        Return dt
    End Function
End Class
