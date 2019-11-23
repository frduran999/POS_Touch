Public Class AdminCaja

    Private Sub uic_apertura_Click(sender As Object, e As EventArgs) Handles uic_apertura.Click
        Dim frmApertura As New AperturaCaja
        frmApertura.ShowDialog()
        Me.Hide()
    End Sub

    Private Sub uic_retiro_Click(sender As Object, e As EventArgs) Handles uic_retiro.Click
        Dim frmRetiro As New RetiroCaja
        frmRetiro.ShowDialog()
        Me.Hide()
    End Sub

    Private Sub uic_cierre_Click(sender As Object, e As EventArgs) Handles uic_cierre.Click
        Dim frmCierre As New Cierre_Caja
        frmCierre.ShowDialog()
        Me.Hide()
    End Sub
End Class