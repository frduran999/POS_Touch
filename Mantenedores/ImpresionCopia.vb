Public Class ImpresionCopia
    Private vId As Integer = 0

    Private Sub ImpresionCopia_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        getimpresoras()
    End Sub


    Private Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Dim frm As New Impresoras
        frm.inicia()
        frm.ShowDialog()
        If frm.Impresora_Select <> "Vacio" Then
            Me.uic_primera.Text = frm.Impresora_Select
        End If
    End Sub

    Private Sub Button4_Click(sender As Object, e As EventArgs) Handles Button4.Click
        Dim frm As New Impresoras
        frm.inicia()
        frm.ShowDialog()
        If frm.Impresora_Select <> "Vacio" Then
            Me.uic_segunda.Text = frm.Impresora_Select
        End If
    End Sub

    Private Sub Button5_Click(sender As Object, e As EventArgs) Handles Button5.Click
        Dim frm As New Impresoras
        frm.inicia()
        frm.ShowDialog()
        If frm.Impresora_Select <> "Vacio" Then
            Me.uic_tercera.Text = frm.Impresora_Select
        End If
    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Dim neg As New ProyectoNegocio.Impresoras
        Dim resp As String = ""
        resp = neg.GrabaImpresoras(Me.uic_primera.Text, Me.uic_segunda.Text, Me.uic_tercera.Text, vId)
        If resp = "OK" Then
            Telerik.WinControls.RadMessageBox.Show("Graba registros correctamente", "Impresoras")
        Else
            Telerik.WinControls.RadMessageBox.Show("A ocurrido un error" & vbCrLf & resp, "Impresoras")
        End If
    End Sub
    Private Sub getimpresoras()
        Dim dt As New DataTable
        Dim neg As New ProyectoNegocio.Impresoras
        dt = neg.GetImpresoras()
        If dt.Rows.Count > 0 Then
            Me.uic_primera.Text = dt.Rows(0)("ImpresoraUno")
            Me.uic_segunda.Text = dt.Rows(0)("ImpresoraDos")
            Me.uic_tercera.Text = dt.Rows(0)("ImpresoraTres")
            Me.vId = dt.Rows(0)("Id")
        End If
    End Sub

    Private Sub uic_Salir_Click(sender As Object, e As EventArgs) Handles uic_Salir.Click
        Me.Close()
    End Sub
End Class