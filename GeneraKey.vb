Public Class GeneraKey

    Private Sub uic_genera_Click(sender As Object, e As EventArgs) Handles uic_genera.Click
        Dim licencia As New dac.Licencia

        Dim giro As String = Me.uic_giro.Text.Trim
        Dim rut As String = Me.uic_rutEmp.Text.Trim
        Me.uicLicencia.Text = licencia.genkey(giro, rut)

    End Sub

    Private Sub GeneraKey_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Me.uic_rutEmp.Text = "22222222-2"
        Me.uic_giro.Text = "DEMO GIRO2"
    End Sub
End Class