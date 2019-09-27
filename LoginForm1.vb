Public Class LoginForm1

    ' TODO: Insert code to perform custom authentication using the provided username and password 
    ' (See http://go.microsoft.com/fwlink/?LinkId=35339).  
    ' The custom principal can then be attached to the current thread's principal as follows: 
    '     My.User.CurrentPrincipal = CustomPrincipal
    ' where CustomPrincipal is the IPrincipal implementation used to perform authentication. 
    ' Subsequently, My.User will return identity information encapsulated in the CustomPrincipal object
    ' such as the username, display name, etc.

    Private Sub OK_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles OK.Click
        Dim clave As String
        Dim Perfil As Integer
        Try

            Perfil = DeliveryDataSet1.Tables("usuarios").Rows(Me.cbo_usuario.SelectedIndex).Item("Perfil_Id")
            clave = DeliveryDataSet1.Tables("usuarios").Rows(Me.cbo_usuario.SelectedIndex).Item("clave").ToString.Trim
            If clave <> Me.PasswordTextBox.Text Then
                ErrorProvider1.SetError(Me.PasswordTextBox, "Clave no valida")
            Else
                Select Case (Perfil)
                    Case 1
                        delivery.es_supervisor = True

                    Case 3
                        delivery.es_supervisor = False
                        Me.Hide()
                        Form1.ShowDialog()

                End Select
                'If IsDBNull(DeliveryDataSet1.Tables("usuarios").Rows(Me.cbo_usuario.SelectedIndex).Item("supervisor")) OrElse DeliveryDataSet1.Tables("usuarios").Rows(Me.cbo_usuario.SelectedIndex).Item("supervisor") = 0 Then
                '    delivery.es_supervisor = False
                'Else
                '    delivery.es_supervisor = True
                'End If
                Me.Close()
            End If
        Catch ex As Exception

        End Try
    End Sub

    Private Sub Cancel_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Cancel.Click
        Application.Exit()
    End Sub

    Private Sub LoginForm1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        'TODO: This line of code loads data into the 'DeliveryDataSet1.usuarios' table. You can move, or remove it, as needed.
        Me.UsuariosTableAdapter.Fill(Me.DeliveryDataSet1.usuarios)
        Me.cbo_usuario.SelectedValue = -1
    End Sub
End Class
