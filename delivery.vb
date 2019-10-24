Public Class delivery

    Public es_supervisor As Boolean = False
    Public oconfig As New BE.Parametros

    Private Sub ToolStripButton1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ToolStripButton1.Click
        Form1.Show()
    End Sub

    Private Sub menu_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Try
            LoginForm1.ShowDialog()
        Catch ex As Exception

        End Try

        'Me.uic_versionApp.Text = "APP: " & System.Reflection.Assembly.GetExecutingAssembly.GetName.Version.Major & "." & System.Reflection.Assembly.GetExecutingAssembly.GetName.Version.Minor & "." & System.Reflection.Assembly.GetExecutingAssembly.GetName.Version.Build
        Dim resp As String = ""
        resp = oconfig.get_parametros()
        Dim licencia As New dac.Licencia
        If licencia.licencia_valida(oconfig.RUTEmpresa, oconfig.Giro, oconfig.Licencia) = False Then
            MsgBox("Licencia no valida", vbCritical, "Aviso")
            End
        End If
        Me.Text = "  Empresa  " & Me.oconfig.Giro & "   RUT " & Me.oconfig.RUTEmpresa
    End Sub

    Private Sub ToolStripButton5_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ToolStripButton5.Click
        Application.Exit()
    End Sub

    Private Sub ToolStripButton4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ToolStripButton4.Click
        If es_supervisor Then
            Productos.Show()
        Else
            MsgBox("Opción disponible solamente para el supervisor", MsgBoxStyle.Information, "Aviso")
        End If
    End Sub

    Private Sub ToolStripButton3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ToolStripButton3.Click
        If es_supervisor Then
            usuario.Show()
        Else
            MsgBox("Opción disponible solamente para el supervisor", MsgBoxStyle.Information, "Aviso")
        End If
    End Sub

    Private Sub XxToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs) Handles XxToolStripMenuItem.Click
        If es_supervisor Then
            formapago.Show()
        Else
            MsgBox("Opción disponible solamente para el supervisor", MsgBoxStyle.Information, "Aviso")
        End If
    End Sub

    Private Sub DIARIOToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles DIARIOToolStripMenuItem.Click
        If es_supervisor Then
            diario.Show()
        Else
            MsgBox("Opción disponible solamente para el supervisor", MsgBoxStyle.Information, "Aviso")
        End If
    End Sub

    Private Sub ToolStripButton6_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ToolStripButton6.Click
        compras.Show()
    End Sub

    Private Sub COMPRASDIARIOToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles COMPRASDIARIOToolStripMenuItem.Click
        Compras_diario.Show()
    End Sub

    Private Sub FamiliaProductosToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles FamiliaProductosToolStripMenuItem.Click
        If es_supervisor Then
            FamiliaProducto.Show()
        Else
            MsgBox("Opción disponible solamente para el supervisor", MsgBoxStyle.Information, "Aviso")
        End If
    End Sub

    Private Sub PromocionesToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles PromocionesToolStripMenuItem.Click
        If es_supervisor Then
            Promocion.Show()
        Else
            MsgBox("Opción disponible solamente para el supervisor", MsgBoxStyle.Information, "Aviso")
        End If
    End Sub

    Private Sub RetiroCajaToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles RetiroCajaToolStripMenuItem.Click
        If es_supervisor Then
            Retiro.Show()
        Else
            MsgBox("Opción disponible solamente para el supervisor", MsgBoxStyle.Information, "Aviso")
        End If
    End Sub

    Private Sub InformacionTicketToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles InformacionTicketToolStripMenuItem.Click
        If es_supervisor Then
            DatosGral.Show()
        Else
            MsgBox("Opción disponible solamente para el supervisor", MsgBoxStyle.Information, "Aviso")
        End If
    End Sub
End Class