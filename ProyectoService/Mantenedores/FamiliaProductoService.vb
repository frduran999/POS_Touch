﻿Public Class FamiliaProductoService
    Public Function GetFamiliaProducto() As DataTable
        Dim con As New Conexion
        Dim dt As New DataTable
        If con.Conexion Then
            Try
                Dim odac As New dac.myhelper3
                dt = odac.ExecuteDatatable(con.con.ConnectionString, CommandType.StoredProcedure, "GetFamiliaProducto", Nothing, 180000)
            Catch ex As Exception
                dt = New DataTable
            End Try
        End If
        Return dt
    End Function
    Public Function ModificarFamilia(ByVal CodigoFamilia As String, ByVal FamiliaProducto As String) As String
        Dim resp As String = ""
        Dim con As New Conexion
        If con.Conexion Then
            Dim odac As New dac.myMSSQL(con.con.ConnectionString, 180000)
            odac.paramQUERY.Add("CodigoFamilia", CodigoFamilia)
            odac.paramQUERY.Add("FamiliaProducto", FamiliaProducto)
            resp = odac.GetValorNoNull("FamiliaProducto_Modificar")
        End If
        Return resp
    End Function
<<<<<<< HEAD

    Public Function GrabarFamilia(ByVal Familia As String)
        Dim resp As String = ""
        Dim con As New Conexion
        If con.Conexion Then
            Dim sql As New dac.myMSSQL(con.con.ConnectionString, 60000)
            sql.paramQUERY.Add("@Familia", Familia)
            resp = sql.GetValorNoNull("GrabaFamilia")
        End If
        Return resp
    End Function
=======
    Public Function GrabarFamilia(ByVal Familia As String) As String
        Dim resp As String = ""
        Dim con As New Conexion
        If con.Conexion Then
            Dim odac As New dac.myMSSQL(con.con.ConnectionString, 180000)
            odac.paramQUERY.Add("Familia", Familia)

            resp = odac.GetValorNoNull("FamiliaProducto_Grabar") 'Graba_Familia
        End If
        Return resp
    End Function
    Public Function TraerImagenes(ruta As String) As String
        Dim con As New Conexion
        If con.Conexion Then
            Dim ruta_ As String = ruta
            Try
                Dim dt As New DataTable
                Dim odac As New dac.myhelper3
                dt = odac.ExecuteDatatable(con.con.ConnectionString, CommandType.Text, "select * from FamiliaFoto", Nothing, 180000)

                For Each dato As DataRow In dt.Rows
                    Dim archivo() As Byte = CType(dato("Foto"), Byte())
                    ruta_ &= "\" & dato("FamiliaId").ToString & ".jpg"
                    Dim fstram As New System.IO.FileStream(ruta_, System.IO.FileMode.Create, System.IO.FileAccess.Write)
                    fstram.Write(archivo, 0, archivo.Length)
                    fstram.Close()
                    ruta_ = ruta
                Next

            Catch ex As Exception

            End Try
        End If
        Return ruta
    End Function
>>>>>>> rodrigo
End Class
