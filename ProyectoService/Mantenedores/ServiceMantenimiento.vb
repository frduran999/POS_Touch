﻿Imports System.Data.SqlClient

Public Class ServiceMantenimiento
    Public Function RespaldoBase() As String
        Dim res As String
        Dim NombreRespaldo As String = "BACKUP_" & Now.Day & "_" & Now.Month & "_" & Now.Year & "_" & Now.Minute & ".bak"
        Dim RutaRespaldo As String = "C:\POS\RespaldoBD_POS\"
        Dim sql As New dac.myhelper3
        Dim con As New Conexion
        If con.Conexion Then
            Try
                sql.FireAndForget(con.con.ConnectionString, CommandType.Text, "BACKUP DATABASE delivery TO DISK = '" & RutaRespaldo & NombreRespaldo & "'", Nothing, 60000)
                res = "OK " & RutaRespaldo
            Catch ex As Exception
                res = ex.Message
            End Try
            Try
                con.Desconectar()
            Catch ex As Exception
            End Try
        End If
        Return res
    End Function
End Class
