Imports ProyectoNegocio

Public Class LoginForm1
    Private _IdUsuario As Integer

    Public Property IdUsuario As Integer
        Get
            Return _IdUsuario
        End Get
        Set(value As Integer)
            _IdUsuario = value
        End Set
    End Property

    Private Sub OK_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles OK.Click
        Dim clave As String
        Dim Perfil As Integer
        Dim IdUsuario As Integer
        Dim resultado As DialogResult
        Try
            IdUsuario = DeliveryDataSet1.Tables("usuarios").Rows(Me.cbo_usuario.SelectedIndex).Item("id")
            Perfil = DeliveryDataSet1.Tables("usuarios").Rows(Me.cbo_usuario.SelectedIndex).Item("Perfil_Id")
            clave = DeliveryDataSet1.Tables("usuarios").Rows(Me.cbo_usuario.SelectedIndex).Item("clave").ToString.Trim
            If clave <> Me.PasswordTextBox.Text Then
                ErrorProvider1.SetError(Me.PasswordTextBox, "Clave no valida")
            Else
                Select Case (Perfil)
                    Case 1
                        Dim frm As New delivery
                        frm.es_supervisor = True
                        frm.IdUsuario = IdUsuario
                        Me.Hide()
                        frm.ShowDialog()
                    Case 2
                        delivery.es_supervisor = False
                        Me.Hide()
                        Dim dt As New DataTable
                        Dim Neg As New Abrir_Caja

                        Dim vresp As String = Neg.ValidaCaja(IdUsuario)
                        If vresp <> "OK" Then
                            Dim frm As New AbrirCaja
                            Dim frmMenu As New delivery
                            frm.IdUsuario = IdUsuario
                            frm.ShowDialog()
                            frm.Hide()
                            frmMenu.IdUsuario = IdUsuario
                            frmMenu.ShowDialog()
                        Else
                            MsgBox("Caja Abierta", vbInformation, "Aviso")
                            resultado = MsgBox("Desea Cerrar Caja", vbOKCancel, "Confirmar")
                            If resultado = vbOK Then
                                delivery.es_supervisor = False
                                Me.Hide()
                                Dim frmCerrar As New CerrarCaja
                                frmCerrar.IdUsuario = IdUsuario
                                frmCerrar.ShowDialog()
                                Dim frm As New AbrirCaja
                                frm.IdUsuario = IdUsuario
                                frm.ShowDialog()
                                Dim frmCaja As New Form1
                                frmCaja.Usuario = IdUsuario
                                frmCaja.ShowDialog()
                                System.Diagnostics.Process.GetCurrentProcess().Kill()
                            Else
                                Me.Hide()
                                Dim frmMenu As New delivery
                                Dim frmCaja As New Form1
                                frmCaja.ShowDialog()
                                'System.Diagnostics.Process.GetCurrentProcess().Kill()
                                frmCaja.Hide()
                                frmMenu.IdUsuario = IdUsuario
                                frmMenu.ShowDialog()
                            End If

                        End If
                End Select
                Me.Hide()
            End If
        Catch ex As Exception

        End Try
    End Sub

    Private Sub Cancel_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Cancel.Click
        Application.Exit()
    End Sub

    Private Sub LoginForm1_FormClosing(sender As Object, e As FormClosingEventArgs) Handles Me.FormClosing
        System.Diagnostics.Process.GetCurrentProcess().Kill()
    End Sub

    Private Sub LoginForm1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Me.UsuariosTableAdapter.Fill(Me.DeliveryDataSet1.usuarios)
        Me.cbo_usuario.SelectedValue = -1

        Dim ruta As String = "C:\POS"
        If Not System.IO.Directory.Exists(ruta) Then
            System.IO.Directory.CreateDirectory(ruta)
        End If
        ruta &= "\Imagen"
        If Not System.IO.Directory.Exists(ruta) Then
            System.IO.Directory.CreateDirectory(ruta)
        End If
        Dim neg As New ProyectoNegocio.FamiliaProducto
        Dim res As String = neg.TraerImagenes(ruta)
    End Sub

End Class
