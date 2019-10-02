Imports ProyectoNegocio
Public Class Promocion

    Private Sub Promocion_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        'TODO: This line of code loads data into the 'DeliveryDataSet.Promocion' table. You can move, or remove it, as needed.
        Me.PromocionTableAdapter.Fill(Me.DeliveryDataSet.Promocion)
        cargacombo()
    End Sub
    Private Sub cargacombo()
        Dim neg As New combos
        Try
            Me.uic_Oferta.DataSource = neg.getOfertas
            Me.uic_Oferta.DisplayMember = "nombre"
            Me.uic_Oferta.ValueMember = "id"
        Catch ex As Exception
        End Try
    End Sub
    Private Sub Chk_productos_CheckedChanged(sender As Object, e As EventArgs) Handles Chk_productos.CheckedChanged
        If Me.Chk_productos.CheckState = CheckState.Checked Then
            'todos
            Me.PromocionTableAdapter.FillBy_SinPromo(Me.DeliveryDataSet.Promocion)
        Else
            'solo promocion
            Me.PromocionTableAdapter.Fill(Me.DeliveryDataSet.Promocion)
        End If
    End Sub

    Private Sub GridProducto_CellContentClick(sender As Object, e As DataGridViewCellEventArgs) Handles GridProducto.CellContentClick
        Dim descripcion As String = ""
        Dim id_producto As String = ""
        Dim codigo_interno As String = ""
        Dim codigo As String = ""
        Dim CodigoFamilia As String = ""
        Dim Familia As String = ""
        If GridProducto.RowCount > 0 Then
            If GridProducto.Columns(e.ColumnIndex).Name = "Agregar" Then
                'paso producto a promocion
                id_producto = Trim(GridProducto(1, GridProducto.CurrentRow.Index).Value)
                descripcion = Trim(GridProducto(2, GridProducto.CurrentRow.Index).Value)
                codigo_interno = Trim(GridProducto(4, GridProducto.CurrentRow.Index).Value)
                codigo = Trim(GridProducto(5, GridProducto.CurrentRow.Index).Value)
                CodigoFamilia = Trim(GridProducto(6, GridProducto.CurrentRow.Index).Value)
                Familia = Trim(GridProducto(7, GridProducto.CurrentRow.Index).Value)

                GridPromocion.Rows.Add(id_producto, descripcion, 0, codigo_interno, codigo, CodigoFamilia, Familia)

            End If
        End If
    End Sub

    Private Sub GridPromocion_CellContentClick(sender As Object, e As DataGridViewCellEventArgs) Handles GridPromocion.CellContentClick
        If GridPromocion.RowCount > 0 Then
            If GridPromocion.Columns(e.ColumnIndex).Name = "Eliminar" Then
                'elimina linea
                GridPromocion.Rows.RemoveAt(e.RowIndex)
            End If
        End If
    End Sub

    Private Sub btn_salir_Click(sender As Object, e As EventArgs) Handles btn_salir.Click
        Me.Dispose()
    End Sub

    Private Sub btn_grabar_Click(sender As Object, e As EventArgs) Handles btn_grabar.Click
        'If Me.uic_CodigoPromocion.Text = "" Then
        '    MsgBox("Debe ingresar código promoción", vbInformation, "Aviso")
        '    Me.uic_CodigoPromocion.Focus()
        '    Exit Sub
        'End If
        If Me.uic_Promocion.Text = "" Then
            MsgBox("Debe ingresar nombre promoción", vbInformation, "Aviso")
            Me.uic_Promocion.Focus()
            Exit Sub
        End If
        If Me.uic_precio.Text = "" Then
            MsgBox("Debe ingresar precio promoción", vbInformation, "Aviso")
            Me.uic_precio.Focus()
            Exit Sub
        End If
        If Me.GridPromocion.RowCount = 0 Then
            MsgBox("Debe ingresar productos para promoción", vbInformation, "Aviso")
            Exit Sub
        End If

        Dim dts As New Oferta
        Dim func As New dac.O_ferta

        'dts.get_codigoOferta = Trim(Me.uic_CodigoPromocion.Text)
        dts.get_nombreOferta = Trim(Me.uic_Promocion.Text)
        dts.get_precioOferta = Me.uic_precio.Text

        If func.grabo_oferta(dts) Then
            ' MsgBox("Oferta Agregado")
        End If

        Dim num_linea As Integer = Me.GridPromocion.Rows.Count - 1
        If Me.GridPromocion.Rows.Count >= 0 Then
            For i = 0 To num_linea
                Dim dts2 As New Oferta

                dts2.get_idproducto = Me.GridPromocion.Rows(i).Cells(0).Value
                dts2.get_descripcion = Me.GridPromocion.Rows(i).Cells(1).Value

                dts2.get_codigoInt = Me.GridPromocion.Rows(i).Cells(3).Value
                dts2.get_codigo = Me.GridPromocion.Rows(i).Cells(4).Value
                dts2.get_Cod_FamiliaProducto = Me.GridPromocion.Rows(i).Cells(5).Value
                dts2.get_NombreFamilia = Me.GridPromocion.Rows(i).Cells(6).Value

                If func.detalle_oferta(dts2) Then

                End If
            Next
        End If
        MsgBox("Promocion grabada")
        limpiar()
    End Sub

    Private Sub uic_Promocion_TextChanged(sender As Object, e As EventArgs) Handles uic_Promocion.TextChanged
        Me.uic_Promocion.CharacterCasing = CharacterCasing.Upper
    End Sub

    Private Sub uic_CodigoPromocion_TextChanged(sender As Object, e As EventArgs)
        ' Me.uic_CodigoPromocion.CharacterCasing = CharacterCasing.Upper
    End Sub

    Private Sub uic_precio_KeyPress(sender As Object, e As KeyPressEventArgs) Handles uic_precio.KeyPress
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

    Private Sub limpiar()
        'Me.uic_CodigoPromocion.Text = ""
        Me.uic_Promocion.Text = ""
        Me.uic_precio.Text = ""
        Me.GridPromocion.Rows.Clear()
    End Sub

    Private Sub btn_buscar_Click(sender As Object, e As EventArgs) Handles btn_buscar.Click
        'If Me.uic_CodigoPromocion.Text = "" Then
        '    MsgBox("Debe ingresar codigo promocion", vbInformation, "Aviso")
        '    Me.uic_CodigoPromocion.Focus()
        '    Exit Sub
        'End If
        Dim dts As New Oferta
        Dim func As New dac.O_ferta

        ' dts.get_codigoOferta = Me.uic_CodigoPromocion.Text.Trim
        Dim datos As DataTable
        datos = func.buscoOferta(dts)
        For Each dr In datos.Rows
            Me.uic_Promocion.Text = dr("NombreOferta")
            Me.uic_precio.Text = dr("PrecioOferta")

            Me.GridPromocion.Rows.Add(dr("idproducto"), dr("Descripcion_Producto"), dr("Precio"), dr("Codigo_interno"), dr("Codigo"), dr("CodigoFamilia"), dr("Familia"))
        Next


    End Sub

    Private Sub uic_Volver_Click(sender As Object, e As EventArgs) Handles uic_Volver.Click
        Me.Close()
    End Sub

End Class