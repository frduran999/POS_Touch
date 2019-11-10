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
        Dim resp As String = ""
        Dim neg As New ProyectoNegocio.Abrir_Caja
        resp = neg.CerrarCaja(IdUsuario)
        Try
            If CInt(resp) > 0 Then
                Dim frm As New CierreCaja
                frm.IdUsuario = IdUsuario
                frm.IdCaja = resp
                frm.ShowDialog()
                Telerik.WinControls.RadMessageBox.Show("Caja Cerrada", "Caja")
            Else
                Telerik.WinControls.RadMessageBox.Show("A ocurrido un error" & vbCrLf & resp, "Aviso")
            End If
        Catch ex As Exception
        End Try
        Me.Close()
    End Sub
End Class