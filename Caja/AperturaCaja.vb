Public Class AperturaCaja

    Private _IdUsuario As Integer

    Public Property IdUsuario As Integer
        Get
            Return _IdUsuario
        End Get
        Set(value As Integer)
            _IdUsuario = value
        End Set
    End Property

    Private Sub uic_Volver_Click(sender As Object, e As EventArgs) Handles uic_Volver.Click
        Me.Hide()
    End Sub

    Private Sub btnGrabar_Click(sender As Object, e As EventArgs) Handles btnGrabar.Click

        Dim MontoEfectivo As String
        MontoEfectivo = Me.uic_MontoEfectivo.Text
        If Not validador.validoNumero(Me.uic_MontoEfectivo.Text.Trim, 0) Then
            If Me.uic_MontoEfectivo.Text = "" OrElse Me.uic_MontoEfectivo.Text = "0" Then
                Telerik.WinControls.RadMessageBox.Show(Me, "Debe ingresar monto.", "Alerta")
                Me.uic_MontoEfectivo.Text = ""
                Me.uic_MontoEfectivo.Focus()
                Exit Sub
            Else
                Dim vmonto As Long = IIf(Me.uic_MontoEfectivo.Text = "", 0, CInt(Me.uic_MontoEfectivo.Text))
                Dim vglosa As String = Me.uic_Glosa.Text.Trim
                Dim dt As New DataTable
                Dim Neg As New ProyectoNegocio.AdminCaja
                dt = Neg.AbrirCaja(IdUsuario, vmonto, vglosa)
                MsgBox("Apertura registrada exitosamente", vbInformation, "Aviso")
                limpiar()
                Me.Hide()
                Me.Close()
                Dim frmCaja As New FrmCaja
                frmCaja.IdUsuario = IdUsuario
                frmCaja.ShowDialog()
            End If

        End If

    End Sub

    Private Sub limpiar()
        Me.uic_MontoEfectivo.Text = ""
        Me.uic_Glosa.Text = ""
    End Sub
End Class