<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Promocion
    Inherits System.Windows.Forms.Form

    'Form overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.components = New System.ComponentModel.Container()
        Me.GroupBox1 = New System.Windows.Forms.GroupBox()
        Me.btn_buscar = New System.Windows.Forms.Button()
        Me.Label3 = New System.Windows.Forms.Label()
        Me.uic_CodigoPromocion = New System.Windows.Forms.TextBox()
        Me.Label2 = New System.Windows.Forms.Label()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.uic_precio = New System.Windows.Forms.TextBox()
        Me.uic_Promocion = New System.Windows.Forms.TextBox()
        Me.GroupBox2 = New System.Windows.Forms.GroupBox()
        Me.Chk_productos = New System.Windows.Forms.CheckBox()
        Me.GridProducto = New System.Windows.Forms.DataGridView()
        Me.Agregar = New System.Windows.Forms.DataGridViewButtonColumn()
        Me.IdproductoDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DescripcionproductoDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.PrecioDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.CodigointernoDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.CodigoDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.CodigoFamiliaDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.FamiliaDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.PromocionBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.DeliveryDataSet = New delevery.deliveryDataSet()
        Me.GroupBox3 = New System.Windows.Forms.GroupBox()
        Me.GridPromocion = New System.Windows.Forms.DataGridView()
        Me.id_producto = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.descripcion_producto = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.precio = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.codigo_interno = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.codigo = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.codigofamillia = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.familia = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Eliminar = New System.Windows.Forms.DataGridViewButtonColumn()
        Me.PromocionTableAdapter = New delevery.deliveryDataSetTableAdapters.PromocionTableAdapter()
        Me.btn_salir = New System.Windows.Forms.Button()
        Me.btn_grabar = New System.Windows.Forms.Button()
        Me.ToolTip1 = New System.Windows.Forms.ToolTip(Me.components)
        Me.GroupBox1.SuspendLayout()
        Me.GroupBox2.SuspendLayout()
        CType(Me.GridProducto, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.PromocionBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.DeliveryDataSet, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.GroupBox3.SuspendLayout()
        CType(Me.GridPromocion, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'GroupBox1
        '
        Me.GroupBox1.Anchor = CType(((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Left) _
            Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.GroupBox1.Controls.Add(Me.btn_buscar)
        Me.GroupBox1.Controls.Add(Me.Label3)
        Me.GroupBox1.Controls.Add(Me.uic_CodigoPromocion)
        Me.GroupBox1.Controls.Add(Me.Label2)
        Me.GroupBox1.Controls.Add(Me.Label1)
        Me.GroupBox1.Controls.Add(Me.uic_precio)
        Me.GroupBox1.Controls.Add(Me.uic_Promocion)
        Me.GroupBox1.Location = New System.Drawing.Point(6, 0)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Size = New System.Drawing.Size(641, 68)
        Me.GroupBox1.TabIndex = 1
        Me.GroupBox1.TabStop = False
        Me.GroupBox1.Text = "Datos Promocion"
        '
        'btn_buscar
        '
        Me.btn_buscar.Image = Global.delevery.My.Resources.Resources.find
        Me.btn_buscar.Location = New System.Drawing.Point(561, 16)
        Me.btn_buscar.Name = "btn_buscar"
        Me.btn_buscar.Size = New System.Drawing.Size(37, 37)
        Me.btn_buscar.TabIndex = 8
        Me.ToolTip1.SetToolTip(Me.btn_buscar, "Buscar oferta por codigo")
        Me.btn_buscar.UseVisualStyleBackColor = True
        '
        'Label3
        '
        Me.Label3.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
        Me.Label3.Location = New System.Drawing.Point(6, 21)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(52, 19)
        Me.Label3.TabIndex = 6
        Me.Label3.Text = "Codigo"
        '
        'uic_CodigoPromocion
        '
        Me.uic_CodigoPromocion.Location = New System.Drawing.Point(64, 21)
        Me.uic_CodigoPromocion.Name = "uic_CodigoPromocion"
        Me.uic_CodigoPromocion.Size = New System.Drawing.Size(72, 20)
        Me.uic_CodigoPromocion.TabIndex = 0
        '
        'Label2
        '
        Me.Label2.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
        Me.Label2.Location = New System.Drawing.Point(406, 21)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(52, 19)
        Me.Label2.TabIndex = 4
        Me.Label2.Text = "Precio"
        '
        'Label1
        '
        Me.Label1.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
        Me.Label1.Location = New System.Drawing.Point(143, 21)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(52, 19)
        Me.Label1.TabIndex = 3
        Me.Label1.Text = "Nombre"
        '
        'uic_precio
        '
        Me.uic_precio.Location = New System.Drawing.Point(464, 21)
        Me.uic_precio.Name = "uic_precio"
        Me.uic_precio.Size = New System.Drawing.Size(64, 20)
        Me.uic_precio.TabIndex = 2
        '
        'uic_Promocion
        '
        Me.uic_Promocion.Location = New System.Drawing.Point(201, 21)
        Me.uic_Promocion.Name = "uic_Promocion"
        Me.uic_Promocion.Size = New System.Drawing.Size(177, 20)
        Me.uic_Promocion.TabIndex = 1
        '
        'GroupBox2
        '
        Me.GroupBox2.Controls.Add(Me.Chk_productos)
        Me.GroupBox2.Controls.Add(Me.GridProducto)
        Me.GroupBox2.Location = New System.Drawing.Point(0, 74)
        Me.GroupBox2.Name = "GroupBox2"
        Me.GroupBox2.Size = New System.Drawing.Size(324, 424)
        Me.GroupBox2.TabIndex = 2
        Me.GroupBox2.TabStop = False
        Me.GroupBox2.Text = "Productos"
        '
        'Chk_productos
        '
        Me.Chk_productos.AutoSize = True
        Me.Chk_productos.Location = New System.Drawing.Point(12, 19)
        Me.Chk_productos.Name = "Chk_productos"
        Me.Chk_productos.Size = New System.Drawing.Size(122, 17)
        Me.Chk_productos.TabIndex = 2
        Me.Chk_productos.Text = "Todos los productos"
        Me.Chk_productos.UseVisualStyleBackColor = True
        '
        'GridProducto
        '
        Me.GridProducto.AllowUserToAddRows = False
        Me.GridProducto.AllowUserToDeleteRows = False
        Me.GridProducto.Anchor = CType((((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
            Or System.Windows.Forms.AnchorStyles.Left) _
            Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.GridProducto.AutoGenerateColumns = False
        Me.GridProducto.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.GridProducto.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.Agregar, Me.IdproductoDataGridViewTextBoxColumn, Me.DescripcionproductoDataGridViewTextBoxColumn, Me.PrecioDataGridViewTextBoxColumn, Me.CodigointernoDataGridViewTextBoxColumn, Me.CodigoDataGridViewTextBoxColumn, Me.CodigoFamiliaDataGridViewTextBoxColumn, Me.FamiliaDataGridViewTextBoxColumn})
        Me.GridProducto.DataSource = Me.PromocionBindingSource
        Me.GridProducto.Location = New System.Drawing.Point(8, 51)
        Me.GridProducto.Name = "GridProducto"
        Me.GridProducto.ReadOnly = True
        Me.GridProducto.RowHeadersVisible = False
        Me.GridProducto.Size = New System.Drawing.Size(308, 361)
        Me.GridProducto.TabIndex = 1
        '
        'Agregar
        '
        Me.Agregar.HeaderText = "Agregar"
        Me.Agregar.Name = "Agregar"
        Me.Agregar.ReadOnly = True
        Me.Agregar.Text = "Agregar"
        Me.Agregar.UseColumnTextForButtonValue = True
        Me.Agregar.Width = 50
        '
        'IdproductoDataGridViewTextBoxColumn
        '
        Me.IdproductoDataGridViewTextBoxColumn.DataPropertyName = "id_producto"
        Me.IdproductoDataGridViewTextBoxColumn.HeaderText = "id_producto"
        Me.IdproductoDataGridViewTextBoxColumn.Name = "IdproductoDataGridViewTextBoxColumn"
        Me.IdproductoDataGridViewTextBoxColumn.ReadOnly = True
        Me.IdproductoDataGridViewTextBoxColumn.Visible = False
        '
        'DescripcionproductoDataGridViewTextBoxColumn
        '
        Me.DescripcionproductoDataGridViewTextBoxColumn.DataPropertyName = "descripcion_producto"
        Me.DescripcionproductoDataGridViewTextBoxColumn.HeaderText = "descripcion_producto"
        Me.DescripcionproductoDataGridViewTextBoxColumn.Name = "DescripcionproductoDataGridViewTextBoxColumn"
        Me.DescripcionproductoDataGridViewTextBoxColumn.ReadOnly = True
        Me.DescripcionproductoDataGridViewTextBoxColumn.Width = 170
        '
        'PrecioDataGridViewTextBoxColumn
        '
        Me.PrecioDataGridViewTextBoxColumn.DataPropertyName = "precio"
        Me.PrecioDataGridViewTextBoxColumn.HeaderText = "precio"
        Me.PrecioDataGridViewTextBoxColumn.Name = "PrecioDataGridViewTextBoxColumn"
        Me.PrecioDataGridViewTextBoxColumn.ReadOnly = True
        Me.PrecioDataGridViewTextBoxColumn.Width = 80
        '
        'CodigointernoDataGridViewTextBoxColumn
        '
        Me.CodigointernoDataGridViewTextBoxColumn.DataPropertyName = "codigo_interno"
        Me.CodigointernoDataGridViewTextBoxColumn.HeaderText = "codigo_interno"
        Me.CodigointernoDataGridViewTextBoxColumn.Name = "CodigointernoDataGridViewTextBoxColumn"
        Me.CodigointernoDataGridViewTextBoxColumn.ReadOnly = True
        Me.CodigointernoDataGridViewTextBoxColumn.Visible = False
        '
        'CodigoDataGridViewTextBoxColumn
        '
        Me.CodigoDataGridViewTextBoxColumn.DataPropertyName = "codigo"
        Me.CodigoDataGridViewTextBoxColumn.HeaderText = "codigo"
        Me.CodigoDataGridViewTextBoxColumn.Name = "CodigoDataGridViewTextBoxColumn"
        Me.CodigoDataGridViewTextBoxColumn.ReadOnly = True
        Me.CodigoDataGridViewTextBoxColumn.Visible = False
        '
        'CodigoFamiliaDataGridViewTextBoxColumn
        '
        Me.CodigoFamiliaDataGridViewTextBoxColumn.DataPropertyName = "CodigoFamilia"
        Me.CodigoFamiliaDataGridViewTextBoxColumn.HeaderText = "CodigoFamilia"
        Me.CodigoFamiliaDataGridViewTextBoxColumn.Name = "CodigoFamiliaDataGridViewTextBoxColumn"
        Me.CodigoFamiliaDataGridViewTextBoxColumn.ReadOnly = True
        Me.CodigoFamiliaDataGridViewTextBoxColumn.Visible = False
        '
        'FamiliaDataGridViewTextBoxColumn
        '
        Me.FamiliaDataGridViewTextBoxColumn.DataPropertyName = "Familia"
        Me.FamiliaDataGridViewTextBoxColumn.HeaderText = "Familia"
        Me.FamiliaDataGridViewTextBoxColumn.Name = "FamiliaDataGridViewTextBoxColumn"
        Me.FamiliaDataGridViewTextBoxColumn.ReadOnly = True
        Me.FamiliaDataGridViewTextBoxColumn.Visible = False
        '
        'PromocionBindingSource
        '
        Me.PromocionBindingSource.DataMember = "Promocion"
        Me.PromocionBindingSource.DataSource = Me.DeliveryDataSet
        '
        'DeliveryDataSet
        '
        Me.DeliveryDataSet.DataSetName = "deliveryDataSet"
        Me.DeliveryDataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        '
        'GroupBox3
        '
        Me.GroupBox3.Anchor = CType((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.GroupBox3.Controls.Add(Me.GridPromocion)
        Me.GroupBox3.Location = New System.Drawing.Point(327, 74)
        Me.GroupBox3.Name = "GroupBox3"
        Me.GroupBox3.Size = New System.Drawing.Size(320, 424)
        Me.GroupBox3.TabIndex = 3
        Me.GroupBox3.TabStop = False
        Me.GroupBox3.Text = "Productos en Promocion"
        '
        'GridPromocion
        '
        Me.GridPromocion.AllowUserToAddRows = False
        Me.GridPromocion.AllowUserToDeleteRows = False
        Me.GridPromocion.Anchor = CType((((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
            Or System.Windows.Forms.AnchorStyles.Left) _
            Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.GridPromocion.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.GridPromocion.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.id_producto, Me.descripcion_producto, Me.precio, Me.codigo_interno, Me.codigo, Me.codigofamillia, Me.familia, Me.Eliminar})
        Me.GridPromocion.Location = New System.Drawing.Point(7, 51)
        Me.GridPromocion.Name = "GridPromocion"
        Me.GridPromocion.ReadOnly = True
        Me.GridPromocion.RowHeadersVisible = False
        Me.GridPromocion.Size = New System.Drawing.Size(307, 357)
        Me.GridPromocion.TabIndex = 0
        '
        'id_producto
        '
        Me.id_producto.HeaderText = "id_producto"
        Me.id_producto.Name = "id_producto"
        Me.id_producto.ReadOnly = True
        Me.id_producto.Visible = False
        '
        'descripcion_producto
        '
        Me.descripcion_producto.HeaderText = "descripcion_producto"
        Me.descripcion_producto.Name = "descripcion_producto"
        Me.descripcion_producto.ReadOnly = True
        Me.descripcion_producto.Width = 170
        '
        'precio
        '
        Me.precio.HeaderText = "precio"
        Me.precio.Name = "precio"
        Me.precio.ReadOnly = True
        Me.precio.Width = 80
        '
        'codigo_interno
        '
        Me.codigo_interno.HeaderText = "codigo_interno"
        Me.codigo_interno.Name = "codigo_interno"
        Me.codigo_interno.ReadOnly = True
        Me.codigo_interno.Visible = False
        '
        'codigo
        '
        Me.codigo.HeaderText = "codigo"
        Me.codigo.Name = "codigo"
        Me.codigo.ReadOnly = True
        Me.codigo.Resizable = System.Windows.Forms.DataGridViewTriState.[True]
        Me.codigo.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.NotSortable
        Me.codigo.Visible = False
        '
        'codigofamillia
        '
        Me.codigofamillia.HeaderText = "codigofamillia"
        Me.codigofamillia.Name = "codigofamillia"
        Me.codigofamillia.ReadOnly = True
        Me.codigofamillia.Resizable = System.Windows.Forms.DataGridViewTriState.[True]
        Me.codigofamillia.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.NotSortable
        Me.codigofamillia.Visible = False
        '
        'familia
        '
        Me.familia.HeaderText = "familia"
        Me.familia.Name = "familia"
        Me.familia.ReadOnly = True
        Me.familia.Resizable = System.Windows.Forms.DataGridViewTriState.[True]
        Me.familia.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.NotSortable
        Me.familia.Visible = False
        '
        'Eliminar
        '
        Me.Eliminar.HeaderText = "Eliminar"
        Me.Eliminar.Name = "Eliminar"
        Me.Eliminar.ReadOnly = True
        Me.Eliminar.Text = "Eliminar"
        Me.Eliminar.UseColumnTextForButtonValue = True
        Me.Eliminar.Width = 50
        '
        'PromocionTableAdapter
        '
        Me.PromocionTableAdapter.ClearBeforeFill = True
        '
        'btn_salir
        '
        Me.btn_salir.Image = Global.delevery.My.Resources.Resources._Exit
        Me.btn_salir.Location = New System.Drawing.Point(610, 503)
        Me.btn_salir.Name = "btn_salir"
        Me.btn_salir.Size = New System.Drawing.Size(37, 37)
        Me.btn_salir.TabIndex = 11
        Me.btn_salir.UseVisualStyleBackColor = True
        '
        'btn_grabar
        '
        Me.btn_grabar.Image = Global.delevery.My.Resources.Resources.disk_blue
        Me.btn_grabar.Location = New System.Drawing.Point(487, 503)
        Me.btn_grabar.Name = "btn_grabar"
        Me.btn_grabar.Size = New System.Drawing.Size(37, 37)
        Me.btn_grabar.TabIndex = 10
        Me.btn_grabar.UseVisualStyleBackColor = True
        '
        'Promocion
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(653, 552)
        Me.ControlBox = False
        Me.Controls.Add(Me.btn_salir)
        Me.Controls.Add(Me.btn_grabar)
        Me.Controls.Add(Me.GroupBox3)
        Me.Controls.Add(Me.GroupBox2)
        Me.Controls.Add(Me.GroupBox1)
        Me.Name = "Promocion"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "Promocion"
        Me.GroupBox1.ResumeLayout(False)
        Me.GroupBox1.PerformLayout()
        Me.GroupBox2.ResumeLayout(False)
        Me.GroupBox2.PerformLayout()
        CType(Me.GridProducto, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.PromocionBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.DeliveryDataSet, System.ComponentModel.ISupportInitialize).EndInit()
        Me.GroupBox3.ResumeLayout(False)
        CType(Me.GridPromocion, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents GroupBox1 As System.Windows.Forms.GroupBox
    Friend WithEvents GroupBox2 As System.Windows.Forms.GroupBox
    Friend WithEvents GroupBox3 As System.Windows.Forms.GroupBox
    Friend WithEvents GridProducto As System.Windows.Forms.DataGridView
    Friend WithEvents GridPromocion As System.Windows.Forms.DataGridView
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents uic_precio As System.Windows.Forms.TextBox
    Friend WithEvents uic_Promocion As System.Windows.Forms.TextBox
    Friend WithEvents Chk_productos As System.Windows.Forms.CheckBox
    Friend WithEvents DeliveryDataSet As delevery.deliveryDataSet
    Friend WithEvents PromocionBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents PromocionTableAdapter As delevery.deliveryDataSetTableAdapters.PromocionTableAdapter
    Friend WithEvents Agregar As System.Windows.Forms.DataGridViewButtonColumn
    Friend WithEvents IdproductoDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DescripcionproductoDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents PrecioDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents CodigointernoDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents CodigoDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents CodigoFamiliaDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents FamiliaDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents id_producto As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents descripcion_producto As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents precio As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents codigo_interno As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents codigo As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents codigofamillia As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents familia As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents Eliminar As System.Windows.Forms.DataGridViewButtonColumn
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents uic_CodigoPromocion As System.Windows.Forms.TextBox
    Friend WithEvents btn_salir As System.Windows.Forms.Button
    Friend WithEvents btn_grabar As System.Windows.Forms.Button
    Friend WithEvents btn_buscar As System.Windows.Forms.Button
    Friend WithEvents ToolTip1 As System.Windows.Forms.ToolTip
End Class
