Imports ProyectoService

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
<<<<<<< HEAD

    Public Function GrabarFamilia(ByVal Familia As String)
=======
    Public Function GrabarFamilia(ByVal Familia As String) As String
>>>>>>> rodrigo
        Dim resp As String = ""
        Dim bsp As New FamiliaProductoService
        resp = bsp.GrabarFamilia(Familia)
        Return resp
    End Function
<<<<<<< HEAD
=======
    Public Function TraerImagenes(ruta As String) As String
        Dim resp As String = ""
        Dim bsp As New FamiliaProductoService
        resp = bsp.TraerImagenes(ruta)
        Return resp
    End Function
>>>>>>> rodrigo
End Class
