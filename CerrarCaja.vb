Imports ProyectoNegocio

Public Class CerrarCaja
    Private _IdUsuario As Integer

    Public Property IdUsuario As Integer
        Get
            Return _IdUsuario
        End Get
        Set(value As Integer)
            _IdUsuario = value
        End Set
    End Property


    Private Sub btnCerrarCaja_Click(sender As Object, e As EventArgs) Handles btnCerrarCaja.Click
        Dim Neg As New Abrir_Caja
        Dim vresp As String = Neg.CerrarCaja(IdUsuario)
        If vresp = "OK" Then
            MsgBox("Caja Cerrada", vbInformation, "Aviso")
            Me.Close()
        End If

    End Sub
End Class