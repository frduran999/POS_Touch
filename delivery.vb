Imports ProyectoNegocio

Public Class delivery

    Public es_supervisor As Boolean = False
    Public oconfig As New BE.Parametros
    Private _IdUsuario As Integer
    Private _PerfilUsuario As Integer

    Public Property PerfilUsuario As String
        Get
            Return _PerfilUsuario
        End Get
        Set(ByVal value As String)
            _PerfilUsuario = value
        End Set
    End Property

    Public Property IdUsuario As Integer
        Get
            Return _IdUsuario
        End Get
        Set(value As Integer)
            _IdUsuario = value
        End Set
    End Property

    Private Sub ToolStripButton1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ToolStripButton1.Click
        If PerfilUsuario = 2 Or PerfilUsuario = 1 Then
            Me.Hide()
            Dim frmVenta As New Form1
            frmVenta.Usuario = IdUsuario
            frmVenta.ShowDialog()
            frmVenta.Close()
            Me.Show()
        Else
            MsgBox("Opción disponible solamente para el Vendedor y Administrador", MsgBoxStyle.Information, "Aviso")
        End If

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
        Me.WindowState = FormWindowState.Maximized

    End Sub



    Private Sub ToolStripButton5_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ToolStripButton5.Click
        Application.Exit()
    End Sub

    Private Sub ToolStripButton4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ToolStripButton4.Click
        If es_supervisor Then
            Productos.ShowDialog()
        Else
            MsgBox("Opción disponible solamente para el supervisor", MsgBoxStyle.Information, "Aviso")
        End If
    End Sub

    Private Sub ToolStripButton3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ToolStripButton3.Click
        If es_supervisor Then
            usuario.ShowDialog()
        Else
            MsgBox("Opción disponible solamente para el supervisor", MsgBoxStyle.Information, "Aviso")
        End If
    End Sub

    Private Sub XxToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs) Handles XxToolStripMenuItem.Click
        If es_supervisor Then
            formapago.ShowDialog()
        Else
            MsgBox("Opción disponible solamente para el supervisor", MsgBoxStyle.Information, "Aviso")
        End If
    End Sub

    Private Sub DIARIOToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles DIARIOToolStripMenuItem.Click
        If es_supervisor Then
            diario.ShowDialog()
        Else
            MsgBox("Opción disponible solamente para el supervisor", MsgBoxStyle.Information, "Aviso")
        End If
    End Sub

    Private Sub ToolStripButton6_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ToolStripButton6.Click
        If PerfilUsuario = 4 Or PerfilUsuario = 1 Then
            Dim frmCaja As New FrmCaja
            frmCaja.IdUsuario = IdUsuario
            frmCaja.ShowDialog()
            frmCaja.Hide()
        Else
            MsgBox("Opción disponible solamente para el Cajero y Administrador", MsgBoxStyle.Information, "Aviso")
        End If

    End Sub

    Private Sub COMPRASDIARIOToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles COMPRASDIARIOToolStripMenuItem.Click
        Compras_diario.ShowDialog()
    End Sub

    Private Sub FamiliaProductosToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles FamiliaProductosToolStripMenuItem.Click
        If es_supervisor Then
            FamiliaProducto.ShowDialog()
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
            Retiro.ShowDialog()
        Else
            MsgBox("Opción disponible solamente para el supervisor", MsgBoxStyle.Information, "Aviso")
        End If
    End Sub

    Private Sub InformacionTicketToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles InformacionTicketToolStripMenuItem.Click
        If es_supervisor Then
            DatosGral.ShowDialog()
        Else
            MsgBox("Opción disponible solamente para el supervisor", MsgBoxStyle.Information, "Aviso")
        End If
    End Sub

    Private Sub ImpresorasToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles ImpresorasToolStripMenuItem.Click
        Dim frm As New ImpresionCopia
        frm.ShowDialog()
    End Sub
End Class