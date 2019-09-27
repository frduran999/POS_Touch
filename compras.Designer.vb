<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class compras
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
        Me.DateTimePicker1 = New System.Windows.Forms.DateTimePicker()
        Me.cbo_tipoDoc = New System.Windows.Forms.ComboBox()
        Me.TipodocBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.Tipo_doc_DataSet = New delevery.tipo_doc_DataSet()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.Label2 = New System.Windows.Forms.Label()
        Me.Tipo_docTableAdapter = New delevery.tipo_doc_DataSetTableAdapters.tipo_docTableAdapter()
        Me.Label3 = New System.Windows.Forms.Label()
        Me.txt_folio = New System.Windows.Forms.TextBox()
        Me.DataGridView1 = New System.Windows.Forms.DataGridView()
        Me.txt_rut = New System.Windows.Forms.TextBox()
        Me.Label4 = New System.Windows.Forms.Label()
        Me.Label5 = New System.Windows.Forms.Label()
        Me.Label6 = New System.Windows.Forms.Label()
        Me.Label7 = New System.Windows.Forms.Label()
        Me.btn_agregar = New System.Windows.Forms.Button()
        Me.uic_codigo = New System.Windows.Forms.TextBox()
        Me.uic_descripcion = New System.Windows.Forms.TextBox()
        Me.uic_cantidad = New System.Windows.Forms.TextBox()
        Me.uic_neto = New System.Windows.Forms.TextBox()
        Me.uic_precio = New System.Windows.Forms.TextBox()
        Me.Label8 = New System.Windows.Forms.Label()
        Me.uic_total = New System.Windows.Forms.TextBox()
        Me.uic_IVA = New System.Windows.Forms.TextBox()
        Me.Label9 = New System.Windows.Forms.Label()
        Me.Label10 = New System.Windows.Forms.Label()
        Me.Label11 = New System.Windows.Forms.Label()
        Me.uic_grabar = New System.Windows.Forms.Button()
        Me.uic_salir = New System.Windows.Forms.Button()
        Me.codigo = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.descripcion = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.cantidad = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.precio = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.total = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.eliminar = New System.Windows.Forms.DataGridViewButtonColumn()
        CType(Me.TipodocBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.Tipo_doc_DataSet, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.DataGridView1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'DateTimePicker1
        '
        Me.DateTimePicker1.Format = System.Windows.Forms.DateTimePickerFormat.[Short]
        Me.DateTimePicker1.Location = New System.Drawing.Point(157, 50)
        Me.DateTimePicker1.Name = "DateTimePicker1"
        Me.DateTimePicker1.Size = New System.Drawing.Size(111, 20)
        Me.DateTimePicker1.TabIndex = 3
        '
        'cbo_tipoDoc
        '
        Me.cbo_tipoDoc.DataSource = Me.TipodocBindingSource
        Me.cbo_tipoDoc.DisplayMember = "documento"
        Me.cbo_tipoDoc.FormattingEnabled = True
        Me.cbo_tipoDoc.Location = New System.Drawing.Point(157, 19)
        Me.cbo_tipoDoc.Name = "cbo_tipoDoc"
        Me.cbo_tipoDoc.Size = New System.Drawing.Size(187, 21)
        Me.cbo_tipoDoc.TabIndex = 1
        Me.cbo_tipoDoc.ValueMember = "id_doc"
        '
        'TipodocBindingSource
        '
        Me.TipodocBindingSource.DataMember = "tipo_doc"
        Me.TipodocBindingSource.DataSource = Me.Tipo_doc_DataSet
        '
        'Tipo_doc_DataSet
        '
        Me.Tipo_doc_DataSet.DataSetName = "tipo_doc_DataSet"
        Me.Tipo_doc_DataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        '
        'Label1
        '
        Me.Label1.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
        Me.Label1.Location = New System.Drawing.Point(51, 19)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(100, 23)
        Me.Label1.TabIndex = 111
        Me.Label1.Text = "Tipo documento"
        Me.Label1.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        '
        'Label2
        '
        Me.Label2.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
        Me.Label2.Location = New System.Drawing.Point(51, 49)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(100, 23)
        Me.Label2.TabIndex = 112
        Me.Label2.Text = "Fecha Documento"
        Me.Label2.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        '
        'Tipo_docTableAdapter
        '
        Me.Tipo_docTableAdapter.ClearBeforeFill = True
        '
        'Label3
        '
        Me.Label3.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
        Me.Label3.Location = New System.Drawing.Point(350, 20)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(56, 23)
        Me.Label3.TabIndex = 4
        Me.Label3.Text = "Folio"
        Me.Label3.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        '
        'txt_folio
        '
        Me.txt_folio.Location = New System.Drawing.Point(412, 20)
        Me.txt_folio.MaxLength = 12
        Me.txt_folio.Name = "txt_folio"
        Me.txt_folio.Size = New System.Drawing.Size(82, 20)
        Me.txt_folio.TabIndex = 2
        '
        'DataGridView1
        '
        Me.DataGridView1.AllowUserToAddRows = False
        Me.DataGridView1.AllowUserToDeleteRows = False
        Me.DataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.DataGridView1.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.codigo, Me.descripcion, Me.cantidad, Me.precio, Me.total, Me.eliminar})
        Me.DataGridView1.Location = New System.Drawing.Point(15, 141)
        Me.DataGridView1.Name = "DataGridView1"
        Me.DataGridView1.ReadOnly = True
        Me.DataGridView1.Size = New System.Drawing.Size(567, 256)
        Me.DataGridView1.TabIndex = 119
        '
        'txt_rut
        '
        Me.txt_rut.Location = New System.Drawing.Point(412, 52)
        Me.txt_rut.MaxLength = 10
        Me.txt_rut.Name = "txt_rut"
        Me.txt_rut.Size = New System.Drawing.Size(82, 20)
        Me.txt_rut.TabIndex = 4
        '
        'Label4
        '
        Me.Label4.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
        Me.Label4.Location = New System.Drawing.Point(350, 54)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(54, 18)
        Me.Label4.TabIndex = 8
        Me.Label4.Text = "R.U.T."
        '
        'Label5
        '
        Me.Label5.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
        Me.Label5.Location = New System.Drawing.Point(51, 89)
        Me.Label5.Name = "Label5"
        Me.Label5.Size = New System.Drawing.Size(98, 23)
        Me.Label5.TabIndex = 113
        Me.Label5.Text = "Codigo"
        '
        'Label6
        '
        Me.Label6.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
        Me.Label6.Location = New System.Drawing.Point(155, 89)
        Me.Label6.Name = "Label6"
        Me.Label6.Size = New System.Drawing.Size(210, 23)
        Me.Label6.TabIndex = 114
        Me.Label6.Text = "Descripcion"
        '
        'Label7
        '
        Me.Label7.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
        Me.Label7.Location = New System.Drawing.Point(373, 89)
        Me.Label7.Name = "Label7"
        Me.Label7.Size = New System.Drawing.Size(44, 23)
        Me.Label7.TabIndex = 115
        Me.Label7.Text = "Cantidad"
        '
        'btn_agregar
        '
        Me.btn_agregar.Location = New System.Drawing.Point(483, 112)
        Me.btn_agregar.Name = "btn_agregar"
        Me.btn_agregar.Size = New System.Drawing.Size(75, 23)
        Me.btn_agregar.TabIndex = 9
        Me.btn_agregar.Text = "Agregar"
        Me.btn_agregar.UseVisualStyleBackColor = True
        '
        'uic_codigo
        '
        Me.uic_codigo.Location = New System.Drawing.Point(51, 115)
        Me.uic_codigo.Name = "uic_codigo"
        Me.uic_codigo.Size = New System.Drawing.Size(98, 20)
        Me.uic_codigo.TabIndex = 5
        '
        'uic_descripcion
        '
        Me.uic_descripcion.Location = New System.Drawing.Point(155, 115)
        Me.uic_descripcion.Name = "uic_descripcion"
        Me.uic_descripcion.Size = New System.Drawing.Size(210, 20)
        Me.uic_descripcion.TabIndex = 6
        '
        'uic_cantidad
        '
        Me.uic_cantidad.Location = New System.Drawing.Point(373, 116)
        Me.uic_cantidad.Name = "uic_cantidad"
        Me.uic_cantidad.Size = New System.Drawing.Size(44, 20)
        Me.uic_cantidad.TabIndex = 7
        '
        'uic_neto
        '
        Me.uic_neto.Enabled = False
        Me.uic_neto.Location = New System.Drawing.Point(423, 403)
        Me.uic_neto.Name = "uic_neto"
        Me.uic_neto.Size = New System.Drawing.Size(100, 20)
        Me.uic_neto.TabIndex = 16
        Me.uic_neto.TextAlign = System.Windows.Forms.HorizontalAlignment.Right
        '
        'uic_precio
        '
        Me.uic_precio.Location = New System.Drawing.Point(423, 115)
        Me.uic_precio.Name = "uic_precio"
        Me.uic_precio.Size = New System.Drawing.Size(44, 20)
        Me.uic_precio.TabIndex = 8
        '
        'Label8
        '
        Me.Label8.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
        Me.Label8.Location = New System.Drawing.Point(423, 89)
        Me.Label8.Name = "Label8"
        Me.Label8.Size = New System.Drawing.Size(44, 23)
        Me.Label8.TabIndex = 116
        Me.Label8.Text = "Precio"
        '
        'uic_total
        '
        Me.uic_total.Enabled = False
        Me.uic_total.Location = New System.Drawing.Point(423, 465)
        Me.uic_total.Name = "uic_total"
        Me.uic_total.Size = New System.Drawing.Size(100, 20)
        Me.uic_total.TabIndex = 19
        Me.uic_total.TextAlign = System.Windows.Forms.HorizontalAlignment.Right
        '
        'uic_IVA
        '
        Me.uic_IVA.Enabled = False
        Me.uic_IVA.Location = New System.Drawing.Point(423, 437)
        Me.uic_IVA.Name = "uic_IVA"
        Me.uic_IVA.Size = New System.Drawing.Size(100, 20)
        Me.uic_IVA.TabIndex = 20
        Me.uic_IVA.TextAlign = System.Windows.Forms.HorizontalAlignment.Right
        '
        'Label9
        '
        Me.Label9.AutoSize = True
        Me.Label9.Location = New System.Drawing.Point(370, 436)
        Me.Label9.Name = "Label9"
        Me.Label9.Size = New System.Drawing.Size(30, 13)
        Me.Label9.TabIndex = 21
        Me.Label9.Text = "I.V.A"
        '
        'Label10
        '
        Me.Label10.AutoSize = True
        Me.Label10.Location = New System.Drawing.Point(370, 406)
        Me.Label10.Name = "Label10"
        Me.Label10.Size = New System.Drawing.Size(30, 13)
        Me.Label10.TabIndex = 22
        Me.Label10.Text = "Neto"
        '
        'Label11
        '
        Me.Label11.AutoSize = True
        Me.Label11.Location = New System.Drawing.Point(370, 468)
        Me.Label11.Name = "Label11"
        Me.Label11.Size = New System.Drawing.Size(31, 13)
        Me.Label11.TabIndex = 23
        Me.Label11.Text = "Total"
        '
        'uic_grabar
        '
        Me.uic_grabar.Image = Global.delevery.My.Resources.Resources.disk_blue
        Me.uic_grabar.Location = New System.Drawing.Point(167, 426)
        Me.uic_grabar.Name = "uic_grabar"
        Me.uic_grabar.Size = New System.Drawing.Size(37, 41)
        Me.uic_grabar.TabIndex = 120
        Me.uic_grabar.UseVisualStyleBackColor = True
        '
        'uic_salir
        '
        Me.uic_salir.Image = Global.delevery.My.Resources.Resources._Exit
        Me.uic_salir.Location = New System.Drawing.Point(210, 426)
        Me.uic_salir.Name = "uic_salir"
        Me.uic_salir.Size = New System.Drawing.Size(37, 41)
        Me.uic_salir.TabIndex = 121
        Me.uic_salir.UseVisualStyleBackColor = True
        '
        'codigo
        '
        Me.codigo.HeaderText = "Codigo"
        Me.codigo.Name = "codigo"
        Me.codigo.ReadOnly = True
        '
        'descripcion
        '
        Me.descripcion.HeaderText = "Descripcion"
        Me.descripcion.Name = "descripcion"
        Me.descripcion.ReadOnly = True
        Me.descripcion.Width = 222
        '
        'cantidad
        '
        Me.cantidad.HeaderText = "Cantidad"
        Me.cantidad.Name = "cantidad"
        Me.cantidad.ReadOnly = True
        Me.cantidad.Width = 50
        '
        'precio
        '
        Me.precio.HeaderText = "Precio"
        Me.precio.Name = "precio"
        Me.precio.ReadOnly = True
        Me.precio.Width = 50
        '
        'total
        '
        Me.total.HeaderText = "Total"
        Me.total.Name = "total"
        Me.total.ReadOnly = True
        Me.total.Width = 50
        '
        'eliminar
        '
        Me.eliminar.HeaderText = "Eliminar"
        Me.eliminar.Name = "eliminar"
        Me.eliminar.ReadOnly = True
        Me.eliminar.Text = "Eliminar"
        Me.eliminar.UseColumnTextForButtonValue = True
        Me.eliminar.Width = 50
        '
        'compras
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(588, 494)
        Me.Controls.Add(Me.uic_salir)
        Me.Controls.Add(Me.uic_grabar)
        Me.Controls.Add(Me.Label11)
        Me.Controls.Add(Me.Label10)
        Me.Controls.Add(Me.Label9)
        Me.Controls.Add(Me.uic_IVA)
        Me.Controls.Add(Me.uic_total)
        Me.Controls.Add(Me.Label8)
        Me.Controls.Add(Me.uic_precio)
        Me.Controls.Add(Me.uic_neto)
        Me.Controls.Add(Me.uic_cantidad)
        Me.Controls.Add(Me.uic_descripcion)
        Me.Controls.Add(Me.uic_codigo)
        Me.Controls.Add(Me.btn_agregar)
        Me.Controls.Add(Me.Label7)
        Me.Controls.Add(Me.Label6)
        Me.Controls.Add(Me.Label5)
        Me.Controls.Add(Me.Label4)
        Me.Controls.Add(Me.txt_rut)
        Me.Controls.Add(Me.DataGridView1)
        Me.Controls.Add(Me.txt_folio)
        Me.Controls.Add(Me.Label3)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(Me.cbo_tipoDoc)
        Me.Controls.Add(Me.DateTimePicker1)
        Me.Name = "compras"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "compras"
        CType(Me.TipodocBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.Tipo_doc_DataSet, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.DataGridView1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents DateTimePicker1 As System.Windows.Forms.DateTimePicker
    Friend WithEvents cbo_tipoDoc As System.Windows.Forms.ComboBox
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents Tipo_doc_DataSet As delevery.tipo_doc_DataSet
    Friend WithEvents TipodocBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents Tipo_docTableAdapter As delevery.tipo_doc_DataSetTableAdapters.tipo_docTableAdapter
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents txt_folio As System.Windows.Forms.TextBox
    Friend WithEvents DataGridView1 As System.Windows.Forms.DataGridView
    Friend WithEvents txt_rut As System.Windows.Forms.TextBox
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents Label5 As System.Windows.Forms.Label
    Friend WithEvents Label6 As System.Windows.Forms.Label
    Friend WithEvents Label7 As System.Windows.Forms.Label
    Friend WithEvents btn_agregar As System.Windows.Forms.Button
    Friend WithEvents uic_codigo As System.Windows.Forms.TextBox
    Friend WithEvents uic_descripcion As System.Windows.Forms.TextBox
    Friend WithEvents uic_cantidad As System.Windows.Forms.TextBox
    Friend WithEvents uic_neto As System.Windows.Forms.TextBox
    Friend WithEvents uic_precio As System.Windows.Forms.TextBox
    Friend WithEvents Label8 As System.Windows.Forms.Label
    Friend WithEvents uic_total As System.Windows.Forms.TextBox
    Friend WithEvents uic_IVA As System.Windows.Forms.TextBox
    Friend WithEvents Label9 As System.Windows.Forms.Label
    Friend WithEvents Label10 As System.Windows.Forms.Label
    Friend WithEvents Label11 As System.Windows.Forms.Label
    Friend WithEvents uic_grabar As System.Windows.Forms.Button
    Friend WithEvents uic_salir As System.Windows.Forms.Button
    Friend WithEvents codigo As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents descripcion As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents cantidad As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents precio As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents total As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents eliminar As System.Windows.Forms.DataGridViewButtonColumn
End Class
