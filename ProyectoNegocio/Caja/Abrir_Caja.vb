﻿Imports ProyectoService

Public Class Abrir_Caja

    Public Function AbrirCaja(ByVal IdUsuario As Integer, ByVal Monto As Integer, ByVal Glosa As String)
        Dim dt As New DataTable
        Dim b As New AbrirCajaService
        dt = b.AbrirCaja(IdUsuario, Monto, Glosa)
        Return dt
    End Function

    Public Function ValidaCaja(ByVal IdUsuario As Integer) As String
        Dim dt As String = ""
        Dim b As New AbrirCajaService
        dt = b.ValidaCaja(IdUsuario)
        Return dt
    End Function

    Public Function CerrarCaja(ByVal IdUsuario As Integer) As String
        Dim dt As String = ""
        Dim b As New AbrirCajaService
        dt = b.CerrarCaja(IdUsuario)
        Return dt
    End Function
End Class