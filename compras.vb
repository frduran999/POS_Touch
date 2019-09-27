Public Class compras
    Dim rut As New bc.RUTman
    Dim myhelper As New dac.myhelper2

    Private Sub compras_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        'TODO: This line of code loads data into the 'Tipo_doc_DataSet.tipo_doc' table. You can move, or remove it, as needed.
        Me.Tipo_docTableAdapter.Fill(Me.Tipo_doc_DataSet.tipo_doc)
        Me.DateTimePicker1.Value = Now
        Me.cbo_tipoDoc.SelectedValue = -1
    End Sub

    Private Sub txt_rut_KeyPress(ByVal sender As Object, ByVal e As System.Windows.Forms.KeyPressEventArgs) Handles txt_rut.KeyPress
        If e.KeyChar = ChrW(Keys.Enter) Then
            e.Handled = True
            SendKeys.Send("{TAB}")
            If Not rut.check_es_valido(Me.txt_rut.Text.Trim) Then
                MsgBox("Error, RUT no valido", MsgBoxStyle.Critical, "Error")
            End If
        End If
    End Sub

    Private Sub btn_agregar_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btn_agregar.Click
        If Me.uic_descripcion.Text = "" Then
            MsgBox("Debe Ingresar producto", MsgBoxStyle.Critical, "Error")
            Exit Sub
        End If

        calculo_detalle()

        Me.uic_codigo.Text = ""
        Me.uic_descripcion.Text = ""
        Me.uic_cantidad.Text = ""
        Me.uic_precio.Text = ""

    End Sub
    Private Sub calculo_detalle()
        Dim neto As Integer = 0
        Dim cantidad As Integer = 0
        Dim precio As Integer = 0
        Dim total As Integer = 0

        If Me.uic_cantidad.Text = "" Then
            cantidad = 0
        ElseIf IsNumeric(Me.uic_cantidad.Text) Then
            cantidad = Val(Me.uic_cantidad.Text)
        End If
        If Me.uic_precio.Text = "" Then
            precio = 0
        ElseIf IsNumeric(Me.uic_precio.Text) Then
            precio = Val(Me.uic_precio.Text)
        End If

        total = precio * cantidad

        Me.DataGridView1.Rows.Add(Me.uic_codigo.Text.Trim, Me.uic_descripcion.Text.Trim, cantidad, precio, total)

        'poner valor neto
        For i As Integer = 0 To Me.DataGridView1.Rows.Count - 1
            neto += Me.DataGridView1.Rows(i).Cells(4).Value
            Me.uic_neto.Text = neto
        Next
    End Sub

    Private Sub uic_neto_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles uic_neto.TextChanged
        Dim iva As Integer = 0
        iva = Val(Me.uic_neto.Text) * 19 / 100
        Me.uic_IVA.Text = iva
    End Sub

    Private Sub uic_IVA_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles uic_IVA.TextChanged
        Dim total As Long = 0
        total = Val(Me.uic_neto.Text) + Val(Me.uic_IVA.Text)
        Me.uic_total.Text = total
    End Sub

    Private Sub uic_descripcion_KeyPress(ByVal sender As Object, ByVal e As System.Windows.Forms.KeyPressEventArgs) Handles uic_descripcion.KeyPress
        If e.KeyChar = ChrW(Keys.Enter) Then
            e.Handled = True
            SendKeys.Send("{TAB}")
        End If
    End Sub

    Private Sub uic_cantidad_KeyPress(ByVal sender As Object, ByVal e As System.Windows.Forms.KeyPressEventArgs) Handles uic_cantidad.KeyPress
        If e.KeyChar = ChrW(Keys.Enter) Then
            e.Handled = True
            SendKeys.Send("{TAB}")
        End If
    End Sub

    Private Sub uic_precio_KeyPress(ByVal sender As Object, ByVal e As System.Windows.Forms.KeyPressEventArgs) Handles uic_precio.KeyPress
        If e.KeyChar = ChrW(Keys.Enter) Then
            e.Handled = True
            SendKeys.Send("{TAB}")
        End If
    End Sub

    Private Sub uic_codigo_KeyPress(ByVal sender As Object, ByVal e As System.Windows.Forms.KeyPressEventArgs) Handles uic_codigo.KeyPress
        If e.KeyChar = ChrW(Keys.Enter) Then
            e.Handled = True
            SendKeys.Send("{TAB}")
        End If
    End Sub

    Private Sub txt_folio_KeyPress(ByVal sender As Object, ByVal e As System.Windows.Forms.KeyPressEventArgs) Handles txt_folio.KeyPress
        If e.KeyChar = ChrW(Keys.Enter) Then
            e.Handled = True
            SendKeys.Send("{TAB}")
        End If
    End Sub

    Private Sub uic_salir_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles uic_salir.Click
        Me.Close()
    End Sub

    Private Sub uic_grabar_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles uic_grabar.Click
        If Me.cbo_tipoDoc.Text = "" Then
            MsgBox("Debe ingresar Documento", MsgBoxStyle.Critical, "Error")
            Me.cbo_tipoDoc.Focus()
            Exit Sub
        End If
        If Me.txt_folio.Text = "" Then
            MsgBox("Debe ingresar folio", MsgBoxStyle.Critical, "Error")
            Me.txt_folio.Focus()
            Exit Sub
        End If
        If Me.txt_rut.Text = "" Then
            MsgBox("Debe ingresar RUT", MsgBoxStyle.Critical, "Error")
            Me.txt_rut.Focus()
            Exit Sub
        End If
        If Me.DataGridView1.RowCount = 0 Then
            MsgBox("Debe ingresar Detalle", MsgBoxStyle.Critical, "Error")
            Exit Sub
        End If

        Dim cabecera As DataTable
        Dim dts As New comprar
        Dim func As New dac.compra

        dts.get_fecha = Format(DateTimePicker1.Value, "yyyy-MM-dd").ToString
        dts.get_folio = Val(Me.txt_folio.Text)
        dts.get_tipodoc = Me.cbo_tipoDoc.SelectedValue
        dts.get_rut_preveedor = Me.txt_rut.Text
        dts.get_neto = Val(Me.uic_neto.Text)
        dts.get_iva = Val(Me.uic_IVA.Text)
        dts.get_total = Val(Me.uic_total.Text)
        If func.cab_compras(dts) Then

        End If

        ' GRABO EL DETALLE

        cabecera = myhelper.ExecuteDataSet(My.Settings.deliveryConnectionString, CommandType.Text, "select max(id_doc) id from cebecera_compra", Nothing, 60).Tables(0)
        Dim id_doc_cab As Integer
        For Each dr As DataRow In cabecera.Rows
            id_doc_cab = dr("id")
        Next

        Dim num_linea As Integer = Me.DataGridView1.Rows.Count - 1
        If DataGridView1.Rows.Count >= 0 Then

            For i = 0 To num_linea
                Dim dts2 As New comprar

                dts2.get_codigo = Me.DataGridView1.Rows(i).Cells(0).Value
                dts2.get_descripcion = Me.DataGridView1.Rows(i).Cells(1).Value
                dts2.get_precio = Me.DataGridView1.Rows(i).Cells(2).Value
                dts2.get_cantidad = Me.DataGridView1.Rows(i).Cells(3).Value
                dts2.get_total_detalle = Me.DataGridView1.Rows(i).Cells(4).Value
                dts2.get_id_cab = id_doc_cab

                If func.detalle_compras(dts2) Then
                    'ok
                End If
            Next
        End If
        limpiar()
    End Sub
    Private Sub limpiar()
        Me.txt_folio.Text = ""
        Me.txt_rut.Text = ""
        Me.uic_codigo.Text = ""
        Me.uic_descripcion.Text = ""
        Me.DataGridView1.Rows.Clear()
    End Sub

    Private Sub DataGridView1_CellContentClick(ByVal sender As System.Object, ByVal e As System.Windows.Forms.DataGridViewCellEventArgs) Handles DataGridView1.CellContentClick
        If DataGridView1.RowCount > 0 Then
            If DataGridView1.Columns(e.ColumnIndex).Name = "eliminar" Then
                'elimina linea
                DataGridView1.Rows.RemoveAt(e.RowIndex)
                calculo_neto2()
            End If
        End If
    End Sub

    Private Sub calculo_neto2()
        Dim total As Integer
        For i As Integer = 0 To Me.DataGridView1.Rows.Count - 1
            total += Me.DataGridView1.Rows(i).Cells(4).Value
        Next
        Me.uic_neto.Text = total
    End Sub

End Class
