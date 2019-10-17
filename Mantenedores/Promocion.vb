Imports ProyectoNegocio
Public Class Promocion
    Private Linea As Integer
    Private vIdProducto As Integer
    Private Sub Promocion_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        cargacombo()
    End Sub
    Private Sub cargacombo()
        Dim neg As New combos
        Try
            Me.uic_Oferta.DataSource = neg.getOfertas
            Me.uic_Oferta.DisplayMember = "nombre"
            Me.uic_Oferta.ValueMember = "id"

            Me.uic_Familia.DataSource = neg.getFamilia
            Me.uic_Familia.DisplayMember = "nombre"
            Me.uic_Familia.ValueMember = "id"
        Catch ex As Exception
        End Try
    End Sub
    'Private Sub Chk_productos_CheckedChanged(sender As Object, e As EventArgs)
    '    If Me.Chk_productos.CheckState = CheckState.Checked Then
    '        'todos
    '        Me.PromocionTableAdapter.FillBy_SinPromo(Me.DeliveryDataSet.Promocion)
    '    Else
    '        'solo promocion
    '        Me.PromocionTableAdapter.Fill(Me.DeliveryDataSet.Promocion)
    '    End If
    'End Sub

    'Private Sub GridProducto_CellContentClick(sender As Object, e As DataGridViewCellEventArgs)
    '    Dim descripcion As String = ""
    '    Dim id_producto As String = ""
    '    Dim codigo_interno As String = ""
    '    Dim codigo As String = ""
    '    Dim CodigoFamilia As String = ""
    '    Dim Familia As String = ""
    '    If GridProducto.RowCount > 0 Then
    '        If GridProducto.Columns(e.ColumnIndex).Name = "Agregar" Then
    '            'paso producto a promocion
    '            id_producto = Trim(GridProducto(1, GridProducto.CurrentRow.Index).Value)
    '            descripcion = Trim(GridProducto(2, GridProducto.CurrentRow.Index).Value)
    '            codigo_interno = Trim(GridProducto(4, GridProducto.CurrentRow.Index).Value)
    '            codigo = Trim(GridProducto(5, GridProducto.CurrentRow.Index).Value)
    '            CodigoFamilia = Trim(GridProducto(6, GridProducto.CurrentRow.Index).Value)
    '            Familia = Trim(GridProducto(7, GridProducto.CurrentRow.Index).Value)

    '            GridPromocion.Rows.Add(id_producto, descripcion, 0, codigo_interno, codigo, CodigoFamilia, Familia)

    '        End If
    '    End If
    'End Sub

    'Private Sub GridPromocion_CellContentClick(sender As Object, e As DataGridViewCellEventArgs)
    '    If GridPromocion.RowCount > 0 Then
    '        If GridPromocion.Columns(e.ColumnIndex).Name = "Eliminar" Then
    '            'elimina linea
    '            GridPromocion.Rows.RemoveAt(e.RowIndex)
    '        End If
    '    End If
    'End Sub

    Private Sub btn_salir_Click(sender As Object, e As EventArgs)

    End Sub

    Private Sub btn_grabar_Click(sender As Object, e As EventArgs)
        'If Me.uic_CodigoPromocion.Text = "" Then
        '    MsgBox("Debe ingresar código promoción", vbInformation, "Aviso")
        '    Me.uic_CodigoPromocion.Focus()
        '    Exit Sub
        'End If

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
        Me.uic_Promocion.Text = ""
        Me.uic_precio.Text = ""
    End Sub

    Private Sub uic_Volver_Click(sender As Object, e As EventArgs) Handles uic_Volver.Click
        Me.Close()
    End Sub

    'Private Sub btnGrabar_Click(sender As Object, e As EventArgs) Handles btnGrabar.Click
    '    If Me.uic_Promocion.Text = "" Then
    '        MsgBox("Debe ingresar nombre promoción", vbInformation, "Aviso")
    '        Me.uic_Promocion.Focus()
    '        Exit Sub
    '    End If
    '    If Me.uic_precio.Text = "" Then
    '        MsgBox("Debe ingresar precio promoción", vbInformation, "Aviso")
    '        Me.uic_precio.Focus()
    '        Exit Sub
    '    End If
    '    If Me.GridPromocion.RowCount = 0 Then
    '        MsgBox("Debe ingresar productos para promoción", vbInformation, "Aviso")
    '        Exit Sub
    '    End If

    '    Dim dts As New Oferta
    '    Dim func As New dac.O_ferta

    '    'dts.get_codigoOferta = Trim(Me.uic_CodigoPromocion.Text)
    '    dts.get_nombreOferta = Trim(Me.uic_Promocion.Text)
    '    dts.get_precioOferta = Me.uic_precio.Text

    '    If func.grabo_oferta(dts) Then
    '        ' MsgBox("Oferta Agregado")
    '    End If

    '    Dim num_linea As Integer = Me.GridPromocion.Rows.Count - 1
    '    If Me.GridPromocion.Rows.Count >= 0 Then
    '        For i = 0 To num_linea
    '            Dim dts2 As New Oferta

    '            dts2.get_idproducto = Me.GridPromocion.Rows(i).Cells(0).Value
    '            dts2.get_descripcion = Me.GridPromocion.Rows(i).Cells(1).Value

    '            dts2.get_codigoInt = Me.GridPromocion.Rows(i).Cells(3).Value
    '            dts2.get_codigo = Me.GridPromocion.Rows(i).Cells(4).Value
    '            dts2.get_Cod_FamiliaProducto = Me.GridPromocion.Rows(i).Cells(5).Value
    '            dts2.get_NombreFamilia = Me.GridPromocion.Rows(i).Cells(6).Value

    '            If func.detalle_oferta(dts2) Then

    '            End If
    '        Next
    '    End If
    '    MsgBox("Promocion grabada")
    '    limpiar()
    'End Sub

    Private Sub uic_Familia_SelectedIndexChanged(sender As Object, e As EventArgs) Handles uic_Familia.SelectedIndexChanged
        Me.Cursor = Cursors.WaitCursor
        Try
            Dim IdFamilia As Integer = Me.uic_Familia.SelectedValue
            If Not (IdFamilia = 0) Then
                BuscarProductoFamilia(IdFamilia)
            Else
                'Limpiar()
            End If
        Catch ex As Exception
        End Try
        Me.Cursor = Cursors.Default
    End Sub
    Private Sub BuscarProductoFamilia(ByVal IdFamilia As Integer)
        Dim dt As New DataTable
        Dim Neg As New ProyectoNegocio.Productos
        dt = Neg.GetProductoOferta(IdFamilia)
        If dt.Rows.Count > 0 Then
            Me.GridProductos.DataSource = dt
            If dt.Rows(0)("id_producto") <> 0 Then
                ConfiguraGrillaProducto()
            Else
                Me.GridProductos.DataSource = Nothing
            End If
        Else
            Me.GridProductos.DataSource = Nothing
        End If
    End Sub
    Private Sub ConfiguraGrillaProducto()
        Me.GridProductos.Columns("id_producto").IsVisible = False

        Me.GridProductos.Columns("descripcion_producto").Width = 230
        Me.GridProductos.Columns("descripcion_producto").IsVisible = True
        Me.GridProductos.Columns("descripcion_producto").ReadOnly = True
        Me.GridProductos.Columns("descripcion_producto").HeaderText = "Producto"

        Me.GridProductos.Columns("precio").IsVisible = False
        Me.GridProductos.Columns("codigo_interno").IsVisible = False
        Me.GridProductos.Columns("codigo").IsVisible = False
        Me.GridProductos.Columns("IdFamilia").IsVisible = False
        Me.GridProductos.Columns("Familia").IsVisible = False
    End Sub

    Private Sub GridProductos_Click(sender As Object, e As EventArgs) Handles GridProductos.Click

    End Sub
    
    Private Sub GridProductos_MouseDoubleClick(sender As Object, e As MouseEventArgs) Handles GridProductos.MouseDoubleClick
        Dim Nombre As String = ""
        Try
            If Me.GridProductos.Rows.Count > 0 Then
                Linea = Me.GridProductos.Rows.IndexOf(Me.GridProductos.CurrentRow)
                Me.vIdProducto = Me.GridProductos.Rows(Linea).Cells(0).Value
                Nombre = Me.GridProductos.Rows(Linea).Cells(1).Value
                If Me.uic_Cantidad.Text = "" Or Me.uic_Cantidad.Text = "0" Then
                    Me.GridOferta.Rows.Add(Me.vIdProducto, Nombre, CInt(1), 0, 0, "Eliminar")
                Else
                    Me.GridOferta.Rows.Add(Me.vIdProducto, Nombre, CInt(Me.uic_Cantidad.Text), 0, 0, "Eliminar")
                End If
                Me.uic_Cantidad.Text = ""
                Me.uic_Producto.Text = ""
                'Me.uic_Familia.SelectedValue = 0
                'Me.GridProductos.DataSource = Nothing
            End If
        Catch ex As Exception

        End Try
    End Sub

    Private Sub MasterTemplate_Click(sender As Object, e As EventArgs) Handles GridOferta.Click

    End Sub

    Private Sub GridOferta_CommandCellClick(sender As Object, e As Telerik.WinControls.UI.GridViewCellEventArgs) Handles GridOferta.CommandCellClick
        Try
            If Me.GridOferta.Columns.Contains("Eliminar") Then
                Dim pos As Integer = Me.GridOferta.Rows.IndexOf(Me.GridOferta.CurrentRow)
                Me.GridOferta.Rows.RemoveAt(pos)
            End If
        Catch ex As Exception
        End Try
    End Sub

    Private Sub uic_Buscar_Click(sender As Object, e As EventArgs)
        BuscarProductos()
    End Sub
    Private Sub BuscarProductos()
        Dim categoria As Integer = 0
        If Me.uic_Familia.SelectedValue = 0 Then
            categoria = 0
        Else
            categoria = Me.uic_Familia.SelectedValue
        End If
        Dim buscar As String = Me.uic_Producto.Text

        Dim dt As New DataTable
        Dim Neg As New ProyectoNegocio.Productos
        '  dt = Neg.GetProductoOferta_IdCat_Producto(categoria, buscar)
        If dt.Rows.Count > 0 Then
            Me.GridProductos.DataSource = dt
            ConfiguraGrillaProducto()
        Else
            Me.GridProductos.DataSource = Nothing
        End If
    End Sub

    Private Sub btnGrabar_Click(sender As Object, e As EventArgs) Handles btnGrabar.Click
        If Me.uic_Promocion.Text = "" Then
            Me.uic_Promocion.Focus()
            Exit Sub
        End If
        If Me.uic_precio.Text = "" Then
            Me.uic_precio.Focus()
            Exit Sub
        End If
        Dim Neg As New ProyectoNegocio.Productos
        Dim resp As Integer = 0
        resp = Neg.GrabaOFerta(Me.uic_Promocion.Text, CInt(Me.uic_precio.Text))
        Dim resp2 As String = ""
        If resp > 0 Then
            Dim numlineas As Integer = Me.GridOferta.Rows.Count - 1
            For i = 0 To numlineas
                Dim IdOferta As Integer = resp
                Dim linea As Integer = i + 1
                Dim IdProducto As Integer = Me.GridOferta.Rows(i).Cells(0).Value
                Dim cantidad As Integer = Me.GridOferta.Rows(i).Cells(2).Value
                Dim precio As Integer = Me.GridOferta.Rows(i).Cells(3).Value

                resp2 = Neg.GrabaDetalleOferta(IdOferta, linea, IdProducto, cantidad, precio)
            Next
            Telerik.WinControls.RadMessageBox.Show("Registro grabado correctamente", "Ofertas")
            'CargarCombo()
            limpiar()
        Else
            Telerik.WinControls.RadMessageBox.Show("A ocurrido un error " & resp, "Aviso")
        End If
    End Sub
End Class