Public Class FamiliaProducto
    Private Linea As Integer
    Private Sub FamiliaProducto_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        carga_grilla()
        btn_modificar.Enabled = False
    End Sub

    Private Sub btn_grabar_Click(sender As Object, e As EventArgs) Handles btn_grabar.Click
       
        If Me.uic_FamiliaProducto.Text = "" Then
            MsgBox("Debe agregar Familia")
            Me.uic_FamiliaProducto.Focus()
            Exit Sub
        End If

        Try
            Dim dts As New producto
            Dim func As New dac.produc

            dts.get_NombreFamilia = Me.uic_FamiliaProducto.Text.Trim
            If func.GrabaFamiliaProducto(dts) Then
                MsgBox("Familia Agregada", vbInformation, "Aviso")
            End If
        Catch ex As Exception
        End Try
        Me.uic_FamiliaProducto.Text = ""
        Me.uic_CodigoFamilia.Text = ""
        carga_grilla()
    End Sub

    Private Sub carga_grilla()
        Dim dt As New DataTable
        Dim Neg As New ProyectoNegocio.FamiliaProducto
        dt = Neg.GetFamiliaProducto
        If dt.Rows.Count > 0 Then
            Me.RadGridView1.DataSource = dt
            ConfiguraGrilla()
        Else
            Me.RadGridView1.DataSource = Nothing
        End If

        Me.FamiliaProductoTableAdapter.Fill(Me.DeliveryDataSet.FamiliaProducto)
    End Sub
    Private Sub ConfiguraGrilla()
        Me.RadGridView1.Columns("CodigoFamilia").IsVisible = False

        Me.RadGridView1.Columns("Familia").Width = 200
        Me.RadGridView1.Columns("Familia").IsVisible = True
        Me.RadGridView1.Columns("Familia").ReadOnly = False
        Me.RadGridView1.Columns("Familia").HeaderText = "Familia"
    End Sub

    Private Sub btn_salir_Click(sender As Object, e As EventArgs) Handles btn_salir.Click
        Me.Close()
    End Sub

    Private Sub uic_FamiliaProducto_TextChanged(sender As Object, e As EventArgs) Handles uic_FamiliaProducto.TextChanged
        Me.uic_FamiliaProducto.CharacterCasing = CharacterCasing.Upper
    End Sub

    Private Sub uic_CodigoFamilia_TextChanged(sender As Object, e As EventArgs) Handles uic_CodigoFamilia.TextChanged
        Me.uic_CodigoFamilia.CharacterCasing = CharacterCasing.Upper
    End Sub
    Private Sub RadGridView1_Click(sender As Object, e As EventArgs) Handles RadGridView1.Click

    End Sub

    Private Sub RadGridView1_MouseDoubleClick(sender As Object, e As MouseEventArgs) Handles RadGridView1.MouseDoubleClick
        Try
            Linea = Me.RadGridView1.Rows.IndexOf(Me.RadGridView1.CurrentRow)
            Me.uic_CodigoFamilia.Text = Me.RadGridView1.Rows(Linea).Cells(0).Value
            Me.uic_FamiliaProducto.Text = Me.RadGridView1.Rows(Linea).Cells(1).Value
            Me.btn_modificar.Enabled = True
            Me.btn_grabar.Enabled = False
        Catch ex As Exception
        End Try
    End Sub

    Private Sub btn_modificar_Click(sender As Object, e As EventArgs) Handles btn_modificar.Click
        If Me.uic_FamiliaProducto.Text = "" Then
            MsgBox("Debe agregar Familia")
            Me.uic_FamiliaProducto.Focus()
            Exit Sub
        End If
        Dim resp As String = ""
        Dim neg As New ProyectoNegocio.FamiliaProducto
        resp = neg.ModificarFamilia(Me.uic_CodigoFamilia.Text, Me.uic_FamiliaProducto.Text)
        If resp = "OK" Then
            Telerik.WinControls.RadMessageBox.Show(Me, "Registro modificado exitosamente", "Alerta")
            carga_grilla()
            Limpiar()
        Else
            Telerik.WinControls.RadMessageBox.Show(Me, "A ocurrido un error" & vbCrLf & resp, "Alerta")
        End If
    End Sub
    Private Sub Limpiar()
        Me.uic_CodigoFamilia.Text = ""
        Me.uic_FamiliaProducto.Text = ""
        carga_grilla()
        btn_modificar.Enabled = False
        Me.btn_grabar.Enabled = True
    End Sub
End Class