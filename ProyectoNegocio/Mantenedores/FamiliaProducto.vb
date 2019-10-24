﻿Imports ProyectoService

Public Class FamiliaProducto
    Public Function GetFamiliaProducto() As DataTable
        Dim dt As New DataTable
        Dim b As New FamiliaProductoService
        dt = b.GetFamiliaProducto
        Return dt
    End Function
    Public Function ModificarFamilia(ByVal CodigoFamilia As String, ByVal FamiliaProducto As String) As String
        Dim resp As String = ""
        Dim bsp As New FamiliaProductoService
        resp = bsp.ModificarFamilia(CodigoFamilia, FamiliaProducto)
        Return resp
    End Function

    Public Function GrabarFamilia(ByVal Familia As String)
        Dim resp As String = ""
        Dim bsp As New FamiliaProductoService
        resp = bsp.GrabarFamilia(Familia)
        Return resp
    End Function
End Class
