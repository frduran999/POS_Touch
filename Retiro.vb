Public Class Retiro

    Private Sub uic_monto_KeyPress(sender As Object, e As KeyPressEventArgs) Handles uic_monto.KeyPress
        Dim valida As String = "0123456789" & Convert.ToChar(8)
        If (valida.Contains("" + e.KeyChar)) Then
            e.Handled = False
        Else
            e.Handled = True
        End If
        If e.KeyChar = ChrW(Keys.Enter) Then
            e.Handled = True
            SendKeys.Send("{TAB}")
        End If
    End Sub


    Private Sub btn_aceptar_Click(sender As Object, e As EventArgs) Handles btn_aceptar.Click
        If Not validador.validoNumero(Me.uic_monto.Text.Trim, 0) Then
            Me.uic_monto.Focus()
            Exit Sub
        End If
        'valida monto efectivo con total efectivo basedato
        'If Val(Me.uic_monto.Text) > obc_caja.SaldoEfectivoActual Then
        '    MsgBox("Monto ingresado mayor a total efectivo en caja", vbInformation, "Error")
        '    Me.uic_monto.Focus()
        '    Exit Sub
        'End If
        If Me.uic_monto.Text <> "" Then
            Me.DataGridView1.Rows.Add(1, "EFECTIVO", Val(Me.uic_monto.Text))
            Me.uic_monto.Text = ""
            sumar_grilla()
        End If
    End Sub
    Public Sub sumar_grilla()
        Dim sumas As Long = 0
        For x = 0 To Me.DataGridView1.Rows.Count - 1
            sumas += Val(Me.DataGridView1.Rows(x).Cells(2).Value)
        Next
        Me.uic_monto_total_retiro.Text = FormatNumber(Val(sumas), 0)
    End Sub

    Private Sub uic_glosa_retiro_TextChanged(sender As Object, e As EventArgs) Handles uic_glosa_retiro.TextChanged
        Me.uic_glosa_retiro.CharacterCasing = CharacterCasing.Upper
    End Sub

    Private Sub DataGridView1_CellContentClick(sender As Object, e As DataGridViewCellEventArgs) Handles DataGridView1.CellContentClick
        If Me.DataGridView1.Rows.Count > 0 Then
            If Me.DataGridView1.Columns(e.ColumnIndex).Name = "Eliminar" Then
                Try
                    Me.DataGridView1.Rows.RemoveAt(e.RowIndex)
                Catch ex As Exception
                End Try
            End If
        End If
        sumar_grilla()
    End Sub
End Class