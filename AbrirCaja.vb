Imports ProyectoNegocio

Public Class AbrirCaja
    Private _IdUsuario As Integer

    Public Property IdUsuario As Integer
        Get
            Return _IdUsuario
        End Get
        Set(value As Integer)
            _IdUsuario = value
        End Set
    End Property
    Private Sub uic_cancelar_Click(sender As Object, e As EventArgs) Handles uic_cancelar.Click
        limpiar()
        Me.Close()
        System.Diagnostics.Process.GetCurrentProcess().Kill()
    End Sub
    Private Sub uic_monto_KeyPress(sender As Object, e As KeyPressEventArgs) Handles uic_monto.KeyPress
        If Char.IsDigit(e.KeyChar) Then
            e.Handled = False
        ElseIf Char.IsControl(e.KeyChar) Then
            e.Handled = False
        Else
            e.Handled = True
        End If
        If e.KeyChar = ChrW(Keys.Enter) Then
            e.Handled = True
            SendKeys.Send("{TAB}")
        End If
    End Sub
    Private Sub uic_glosa_KeyPress(sender As Object, e As KeyPressEventArgs) Handles uic_glosa.KeyPress
        If e.KeyChar = ChrW(Keys.Enter) Then
            e.Handled = True
            SendKeys.Send("{TAB}")
        End If
    End Sub
    Private Sub uic_aceptar_Click(sender As Object, e As EventArgs) Handles uic_aceptar.Click
        If Not validador.validoNumero(Me.uic_monto.Text.Trim, 0) Then
            If Me.uic_monto.Text = "" OrElse Me.uic_monto.Text = "0" Then
                MsgBox("Debe ingresar monto", vbInformation, "Aviso")
                Me.uic_monto.Text = ""
                Me.uic_monto.Focus()
                Exit Sub
            End If

        Else

            Dim vmonto As Long = IIf(Me.uic_monto.Text = "", 0, CInt(Me.uic_monto.Text))
            Dim vglosa As String = Me.uic_glosa.Text.Trim
            Dim dt As New DataTable
            Dim Neg As New Abrir_Caja
            dt = Neg.AbrirCaja(IdUsuario, vmonto, vglosa)
            MsgBox("Apertura registrada exitosamente", vbInformation, "Aviso")
            limpiar()
            Me.Close()
        End If
    End Sub
    Private Sub limpiar()
        Me.uic_monto.Text = ""
        Me.uic_glosa.Text = ""
    End Sub

    Private Sub apertura_caja_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Me.uic_monto.Focus()
    End Sub
End Class