<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Form1
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
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(Form1))
        Dim DataGridViewCellStyle3 As System.Windows.Forms.DataGridViewCellStyle = New System.Windows.Forms.DataGridViewCellStyle()
        Me.FlowLayoutPanel1 = New System.Windows.Forms.FlowLayoutPanel()
        Me.ImageList1 = New System.Windows.Forms.ImageList(Me.components)
        Me.DataGridView1 = New System.Windows.Forms.DataGridView()
        Me.codigo = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.cantidad = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Column2 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.precio = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Column3 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Eliminar = New System.Windows.Forms.DataGridViewButtonColumn()
        Me.txt_vuelto = New System.Windows.Forms.TextBox()
        Me.txt_efectivo = New System.Windows.Forms.TextBox()
        Me.txt_Total = New System.Windows.Forms.TextBox()
        Me.cbo_formapago = New System.Windows.Forms.ComboBox()
        Me.FormapagoBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.FormaPago_dateset = New delevery.formaPago_dateset()
        Me.Label2 = New System.Windows.Forms.Label()
        Me.Label3 = New System.Windows.Forms.Label()
        Me.Label4 = New System.Windows.Forms.Label()
        Me.Label5 = New System.Windows.Forms.Label()
        Me.btn_aceptar = New System.Windows.Forms.Button()
        Me.btn_salir = New System.Windows.Forms.Button()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.txt_cantidad = New System.Windows.Forms.TextBox()
        Me.Forma_pagoTableAdapter = New delevery.formaPago_datesetTableAdapters.forma_pagoTableAdapter()
        Me.FlowLayoutFamilia = New System.Windows.Forms.FlowLayoutPanel()
        Me.StatusStrip1 = New System.Windows.Forms.StatusStrip()
        Me.uicEstado = New System.Windows.Forms.ToolStripStatusLabel()
        Me.uic_FechaHora = New System.Windows.Forms.ToolStripStatusLabel()
        Me.uic_reloj = New System.Windows.Forms.Timer(Me.components)
        Me.GrBillete = New System.Windows.Forms.GroupBox()
        Me.uic_veinteluka = New System.Windows.Forms.Button()
        Me.uic_diezluka = New System.Windows.Forms.Button()
        Me.uic_cincoluka = New System.Windows.Forms.Button()
        Me.uic_dosluka = New System.Windows.Forms.Button()
        Me.uic_luka = New System.Windows.Forms.Button()
        Me.ToolTip1 = New System.Windows.Forms.ToolTip(Me.components)
        Me.btn_limpiar = New System.Windows.Forms.Button()
        Me.uic_limpiaEfectivo = New System.Windows.Forms.Button()
        CType(Me.DataGridView1, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.FormapagoBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.FormaPago_dateset, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.StatusStrip1.SuspendLayout()
        Me.GrBillete.SuspendLayout()
        Me.SuspendLayout()
        '
        'FlowLayoutPanel1
        '
        Me.FlowLayoutPanel1.Anchor = CType((((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
            Or System.Windows.Forms.AnchorStyles.Left) _
            Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.FlowLayoutPanel1.AutoScroll = True
        Me.FlowLayoutPanel1.BackColor = System.Drawing.Color.FromArgb(CType(CType(252, Byte), Integer), CType(CType(235, Byte), Integer), CType(CType(217, Byte), Integer))
        Me.FlowLayoutPanel1.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
        Me.FlowLayoutPanel1.Location = New System.Drawing.Point(461, 235)
        Me.FlowLayoutPanel1.Name = "FlowLayoutPanel1"
        Me.FlowLayoutPanel1.Size = New System.Drawing.Size(425, 348)
        Me.FlowLayoutPanel1.TabIndex = 0
        '
        'ImageList1
        '
        Me.ImageList1.ImageStream = CType(resources.GetObject("ImageList1.ImageStream"), System.Windows.Forms.ImageListStreamer)
        Me.ImageList1.TransparentColor = System.Drawing.Color.Transparent
        Me.ImageList1.Images.SetKeyName(0, "zoom_out.png")
        Me.ImageList1.Images.SetKeyName(1, "about.png")
        Me.ImageList1.Images.SetKeyName(2, "add.png")
        Me.ImageList1.Images.SetKeyName(3, "add2.png")
        Me.ImageList1.Images.SetKeyName(4, "address_book.png")
        Me.ImageList1.Images.SetKeyName(5, "alarmclock_pause.png")
        Me.ImageList1.Images.SetKeyName(6, "application_certificate.png")
        Me.ImageList1.Images.SetKeyName(7, "application_connection.png")
        Me.ImageList1.Images.SetKeyName(8, "application_enterprise_new.png")
        Me.ImageList1.Images.SetKeyName(9, "application_enterprise_run.png")
        Me.ImageList1.Images.SetKeyName(10, "application_enterprise_stop.png")
        Me.ImageList1.Images.SetKeyName(11, "application_enterprise_view.png")
        Me.ImageList1.Images.SetKeyName(12, "application_error.png")
        Me.ImageList1.Images.SetKeyName(13, "application_server.png")
        Me.ImageList1.Images.SetKeyName(14, "application_stop.png")
        Me.ImageList1.Images.SetKeyName(15, "box_tall.png")
        Me.ImageList1.Images.SetKeyName(16, "box_software.png")
        Me.ImageList1.Images.SetKeyName(17, "branch_element.png")
        Me.ImageList1.Images.SetKeyName(18, "bookmark_delete.png")
        Me.ImageList1.Images.SetKeyName(19, "bullet_ball_glass_red.png")
        Me.ImageList1.Images.SetKeyName(20, "briefcase_document.png")
        Me.ImageList1.Images.SetKeyName(21, "bullet_square_green.png")
        Me.ImageList1.Images.SetKeyName(22, "calculator.png")
        Me.ImageList1.Images.SetKeyName(23, "application.png")
        Me.ImageList1.Images.SetKeyName(24, "application_add.png")
        Me.ImageList1.Images.SetKeyName(25, "application_certificate.png")
        Me.ImageList1.Images.SetKeyName(26, "application_connection.png")
        Me.ImageList1.Images.SetKeyName(27, "application_enterprise.png")
        Me.ImageList1.Images.SetKeyName(28, "application_enterprise_new.png")
        Me.ImageList1.Images.SetKeyName(29, "application_enterprise_run.png")
        Me.ImageList1.Images.SetKeyName(30, "application_enterprise_stop.png")
        Me.ImageList1.Images.SetKeyName(31, "address_book3.png")
        Me.ImageList1.Images.SetKeyName(32, "address_book3.png")
        Me.ImageList1.Images.SetKeyName(33, "address_book3.png")
        Me.ImageList1.Images.SetKeyName(34, "alarmclock_stop.png")
        Me.ImageList1.Images.SetKeyName(35, "alarmclock_stop.png")
        Me.ImageList1.Images.SetKeyName(36, "alarmclock_stop.png")
        Me.ImageList1.Images.SetKeyName(37, "alarmclock_stop.png")
        Me.ImageList1.Images.SetKeyName(38, "alarmclock_stop.png")
        Me.ImageList1.Images.SetKeyName(39, "alarmclock_stop.png")
        Me.ImageList1.Images.SetKeyName(40, "alarmclock_stop.png")
        Me.ImageList1.Images.SetKeyName(41, "alarmclock_stop.png")
        Me.ImageList1.Images.SetKeyName(42, "angel.png")
        Me.ImageList1.Images.SetKeyName(43, "application_connection.png")
        Me.ImageList1.Images.SetKeyName(44, "alarmclock_stop.png")
        Me.ImageList1.Images.SetKeyName(45, "alarmclock_stop.png")
        Me.ImageList1.Images.SetKeyName(46, "alarmclock_stop.png")
        Me.ImageList1.Images.SetKeyName(47, "alarmclock_stop.png")
        Me.ImageList1.Images.SetKeyName(48, "alarmclock_stop.png")
        Me.ImageList1.Images.SetKeyName(49, "alarmclock_stop.png")
        Me.ImageList1.Images.SetKeyName(50, "alarmclock_stop.png")
        Me.ImageList1.Images.SetKeyName(51, "alarmclock_stop.png")
        Me.ImageList1.Images.SetKeyName(52, "alarmclock_stop.png")
        Me.ImageList1.Images.SetKeyName(53, "alarmclock_stop.png")
        Me.ImageList1.Images.SetKeyName(54, "alarmclock_stop.png")
        '
        'DataGridView1
        '
        Me.DataGridView1.AllowUserToAddRows = False
        Me.DataGridView1.AllowUserToDeleteRows = False
        DataGridViewCellStyle3.BackColor = System.Drawing.Color.FromArgb(CType(CType(192, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer))
        Me.DataGridView1.AlternatingRowsDefaultCellStyle = DataGridViewCellStyle3
        Me.DataGridView1.Anchor = CType(((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
            Or System.Windows.Forms.AnchorStyles.Left), System.Windows.Forms.AnchorStyles)
        Me.DataGridView1.BackgroundColor = System.Drawing.Color.FromArgb(CType(CType(136, Byte), Integer), CType(CType(198, Byte), Integer), CType(CType(220, Byte), Integer))
        Me.DataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.DataGridView1.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.codigo, Me.cantidad, Me.Column2, Me.precio, Me.Column3, Me.Eliminar})
        Me.DataGridView1.Location = New System.Drawing.Point(18, 12)
        Me.DataGridView1.Name = "DataGridView1"
        Me.DataGridView1.ReadOnly = True
        Me.DataGridView1.RowHeadersVisible = False
        Me.DataGridView1.Size = New System.Drawing.Size(437, 368)
        Me.DataGridView1.TabIndex = 0
        '
        'codigo
        '
        Me.codigo.HeaderText = "codigo"
        Me.codigo.Name = "codigo"
        Me.codigo.ReadOnly = True
        Me.codigo.Visible = False
        Me.codigo.Width = 50
        '
        'cantidad
        '
        Me.cantidad.HeaderText = "Cant."
        Me.cantidad.Name = "cantidad"
        Me.cantidad.ReadOnly = True
        Me.cantidad.Width = 50
        '
        'Column2
        '
        Me.Column2.HeaderText = "Descripcion"
        Me.Column2.Name = "Column2"
        Me.Column2.ReadOnly = True
        Me.Column2.Width = 190
        '
        'precio
        '
        Me.precio.HeaderText = "Precio"
        Me.precio.Name = "precio"
        Me.precio.ReadOnly = True
        Me.precio.Width = 70
        '
        'Column3
        '
        Me.Column3.HeaderText = "Valor"
        Me.Column3.Name = "Column3"
        Me.Column3.ReadOnly = True
        Me.Column3.Width = 70
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
        'txt_vuelto
        '
        Me.txt_vuelto.Anchor = CType((System.Windows.Forms.AnchorStyles.Bottom Or System.Windows.Forms.AnchorStyles.Left), System.Windows.Forms.AnchorStyles)
        Me.txt_vuelto.Enabled = False
        Me.txt_vuelto.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txt_vuelto.Location = New System.Drawing.Point(351, 447)
        Me.txt_vuelto.Name = "txt_vuelto"
        Me.txt_vuelto.Size = New System.Drawing.Size(100, 21)
        Me.txt_vuelto.TabIndex = 6
        Me.txt_vuelto.TextAlign = System.Windows.Forms.HorizontalAlignment.Right
        '
        'txt_efectivo
        '
        Me.txt_efectivo.Anchor = CType((System.Windows.Forms.AnchorStyles.Bottom Or System.Windows.Forms.AnchorStyles.Left), System.Windows.Forms.AnchorStyles)
        Me.txt_efectivo.Enabled = False
        Me.txt_efectivo.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txt_efectivo.Location = New System.Drawing.Point(351, 417)
        Me.txt_efectivo.Name = "txt_efectivo"
        Me.txt_efectivo.Size = New System.Drawing.Size(100, 21)
        Me.txt_efectivo.TabIndex = 7
        Me.txt_efectivo.TextAlign = System.Windows.Forms.HorizontalAlignment.Right
        '
        'txt_Total
        '
        Me.txt_Total.Anchor = CType((System.Windows.Forms.AnchorStyles.Bottom Or System.Windows.Forms.AnchorStyles.Left), System.Windows.Forms.AnchorStyles)
        Me.txt_Total.Enabled = False
        Me.txt_Total.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.txt_Total.Location = New System.Drawing.Point(351, 387)
        Me.txt_Total.Name = "txt_Total"
        Me.txt_Total.Size = New System.Drawing.Size(100, 21)
        Me.txt_Total.TabIndex = 8
        Me.txt_Total.TextAlign = System.Windows.Forms.HorizontalAlignment.Right
        '
        'cbo_formapago
        '
        Me.cbo_formapago.Anchor = CType((System.Windows.Forms.AnchorStyles.Bottom Or System.Windows.Forms.AnchorStyles.Left), System.Windows.Forms.AnchorStyles)
        Me.cbo_formapago.DataSource = Me.FormapagoBindingSource
        Me.cbo_formapago.DisplayMember = "formapago"
        Me.cbo_formapago.FormattingEnabled = True
        Me.cbo_formapago.Location = New System.Drawing.Point(260, 501)
        Me.cbo_formapago.Name = "cbo_formapago"
        Me.cbo_formapago.Size = New System.Drawing.Size(189, 21)
        Me.cbo_formapago.TabIndex = 9
        Me.cbo_formapago.ValueMember = "id"
        '
        'FormapagoBindingSource
        '
        Me.FormapagoBindingSource.DataMember = "forma_pago"
        Me.FormapagoBindingSource.DataSource = Me.FormaPago_dateset
        '
        'FormaPago_dateset
        '
        Me.FormaPago_dateset.DataSetName = "formaPago_dateset"
        Me.FormaPago_dateset.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        '
        'Label2
        '
        Me.Label2.Anchor = CType((System.Windows.Forms.AnchorStyles.Bottom Or System.Windows.Forms.AnchorStyles.Left), System.Windows.Forms.AnchorStyles)
        Me.Label2.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
        Me.Label2.Font = New System.Drawing.Font("Microsoft Sans Serif", 10.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label2.Location = New System.Drawing.Point(260, 475)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(189, 23)
        Me.Label2.TabIndex = 11
        Me.Label2.Text = "Forma de Pago"
        Me.Label2.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        '
        'Label3
        '
        Me.Label3.Anchor = CType((System.Windows.Forms.AnchorStyles.Bottom Or System.Windows.Forms.AnchorStyles.Left), System.Windows.Forms.AnchorStyles)
        Me.Label3.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
        Me.Label3.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label3.Location = New System.Drawing.Point(258, 387)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(87, 23)
        Me.Label3.TabIndex = 12
        Me.Label3.Text = "Total"
        Me.Label3.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        '
        'Label4
        '
        Me.Label4.Anchor = CType((System.Windows.Forms.AnchorStyles.Bottom Or System.Windows.Forms.AnchorStyles.Left), System.Windows.Forms.AnchorStyles)
        Me.Label4.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
        Me.Label4.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label4.Location = New System.Drawing.Point(258, 417)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(87, 23)
        Me.Label4.TabIndex = 13
        Me.Label4.Text = "Cancelado"
        Me.Label4.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        '
        'Label5
        '
        Me.Label5.Anchor = CType((System.Windows.Forms.AnchorStyles.Bottom Or System.Windows.Forms.AnchorStyles.Left), System.Windows.Forms.AnchorStyles)
        Me.Label5.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
        Me.Label5.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label5.Location = New System.Drawing.Point(258, 447)
        Me.Label5.Name = "Label5"
        Me.Label5.Size = New System.Drawing.Size(87, 23)
        Me.Label5.TabIndex = 14
        Me.Label5.Text = "Vuelto"
        Me.Label5.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        '
        'btn_aceptar
        '
        Me.btn_aceptar.Anchor = CType((System.Windows.Forms.AnchorStyles.Bottom Or System.Windows.Forms.AnchorStyles.Left), System.Windows.Forms.AnchorStyles)
        Me.btn_aceptar.Image = Global.delevery.My.Resources.Resources.check
        Me.btn_aceptar.Location = New System.Drawing.Point(370, 528)
        Me.btn_aceptar.Name = "btn_aceptar"
        Me.btn_aceptar.Size = New System.Drawing.Size(43, 41)
        Me.btn_aceptar.TabIndex = 15
        Me.btn_aceptar.UseVisualStyleBackColor = True
        '
        'btn_salir
        '
        Me.btn_salir.Anchor = CType((System.Windows.Forms.AnchorStyles.Bottom Or System.Windows.Forms.AnchorStyles.Left), System.Windows.Forms.AnchorStyles)
        Me.btn_salir.Image = Global.delevery.My.Resources.Resources._Exit
        Me.btn_salir.Location = New System.Drawing.Point(258, 529)
        Me.btn_salir.Name = "btn_salir"
        Me.btn_salir.Size = New System.Drawing.Size(34, 41)
        Me.btn_salir.TabIndex = 1
        Me.ToolTip1.SetToolTip(Me.btn_salir, "Salir")
        Me.btn_salir.UseVisualStyleBackColor = True
        '
        'Label1
        '
        Me.Label1.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D
        Me.Label1.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label1.Location = New System.Drawing.Point(461, 208)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(73, 23)
        Me.Label1.TabIndex = 16
        Me.Label1.Text = "CANTIDAD"
        Me.Label1.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        '
        'txt_cantidad
        '
        Me.txt_cantidad.Location = New System.Drawing.Point(540, 208)
        Me.txt_cantidad.Name = "txt_cantidad"
        Me.txt_cantidad.Size = New System.Drawing.Size(100, 20)
        Me.txt_cantidad.TabIndex = 17
        '
        'Forma_pagoTableAdapter
        '
        Me.Forma_pagoTableAdapter.ClearBeforeFill = True
        '
        'FlowLayoutFamilia
        '
        Me.FlowLayoutFamilia.Anchor = CType(((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Left) _
            Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.FlowLayoutFamilia.AutoScroll = True
        Me.FlowLayoutFamilia.BackColor = System.Drawing.Color.FromArgb(CType(CType(192, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(192, Byte), Integer))
        Me.FlowLayoutFamilia.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.FlowLayoutFamilia.Location = New System.Drawing.Point(461, 12)
        Me.FlowLayoutFamilia.Name = "FlowLayoutFamilia"
        Me.FlowLayoutFamilia.Size = New System.Drawing.Size(425, 182)
        Me.FlowLayoutFamilia.TabIndex = 21
        '
        'StatusStrip1
        '
        Me.StatusStrip1.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.uicEstado, Me.uic_FechaHora})
        Me.StatusStrip1.Location = New System.Drawing.Point(0, 573)
        Me.StatusStrip1.Name = "StatusStrip1"
        Me.StatusStrip1.Size = New System.Drawing.Size(898, 22)
        Me.StatusStrip1.TabIndex = 22
        Me.StatusStrip1.Text = "StatusStrip1"
        '
        'uicEstado
        '
        Me.uicEstado.Name = "uicEstado"
        Me.uicEstado.Size = New System.Drawing.Size(69, 17)
        Me.uicEstado.Text = "Fecha/Hora"
        '
        'uic_FechaHora
        '
        Me.uic_FechaHora.Name = "uic_FechaHora"
        Me.uic_FechaHora.Size = New System.Drawing.Size(0, 17)
        '
        'uic_reloj
        '
        Me.uic_reloj.Enabled = True
        Me.uic_reloj.Interval = 1000
        '
        'GrBillete
        '
        Me.GrBillete.Anchor = CType((System.Windows.Forms.AnchorStyles.Bottom Or System.Windows.Forms.AnchorStyles.Left), System.Windows.Forms.AnchorStyles)
        Me.GrBillete.Controls.Add(Me.uic_limpiaEfectivo)
        Me.GrBillete.Controls.Add(Me.uic_veinteluka)
        Me.GrBillete.Controls.Add(Me.uic_diezluka)
        Me.GrBillete.Controls.Add(Me.uic_cincoluka)
        Me.GrBillete.Controls.Add(Me.uic_dosluka)
        Me.GrBillete.Controls.Add(Me.uic_luka)
        Me.GrBillete.Location = New System.Drawing.Point(18, 382)
        Me.GrBillete.Name = "GrBillete"
        Me.GrBillete.Size = New System.Drawing.Size(234, 190)
        Me.GrBillete.TabIndex = 23
        Me.GrBillete.TabStop = False
        Me.GrBillete.Visible = False
        '
        'uic_veinteluka
        '
        Me.uic_veinteluka.Image = Global.delevery.My.Resources.Resources._20_lukas
        Me.uic_veinteluka.Location = New System.Drawing.Point(74, 130)
        Me.uic_veinteluka.Name = "uic_veinteluka"
        Me.uic_veinteluka.Size = New System.Drawing.Size(84, 47)
        Me.uic_veinteluka.TabIndex = 4
        Me.uic_veinteluka.UseVisualStyleBackColor = True
        '
        'uic_diezluka
        '
        Me.uic_diezluka.Image = Global.delevery.My.Resources.Resources._10_luka
        Me.uic_diezluka.Location = New System.Drawing.Point(120, 72)
        Me.uic_diezluka.Name = "uic_diezluka"
        Me.uic_diezluka.Size = New System.Drawing.Size(84, 53)
        Me.uic_diezluka.TabIndex = 3
        Me.uic_diezluka.UseVisualStyleBackColor = True
        '
        'uic_cincoluka
        '
        Me.uic_cincoluka.Image = Global.delevery.My.Resources.Resources._5_lukas
        Me.uic_cincoluka.Location = New System.Drawing.Point(30, 72)
        Me.uic_cincoluka.Name = "uic_cincoluka"
        Me.uic_cincoluka.Size = New System.Drawing.Size(84, 53)
        Me.uic_cincoluka.TabIndex = 2
        Me.uic_cincoluka.UseVisualStyleBackColor = True
        '
        'uic_dosluka
        '
        Me.uic_dosluka.Image = Global.delevery.My.Resources.Resources._2_lukas
        Me.uic_dosluka.Location = New System.Drawing.Point(120, 13)
        Me.uic_dosluka.Name = "uic_dosluka"
        Me.uic_dosluka.Size = New System.Drawing.Size(84, 53)
        Me.uic_dosluka.TabIndex = 1
        Me.uic_dosluka.UseVisualStyleBackColor = True
        '
        'uic_luka
        '
        Me.uic_luka.Image = Global.delevery.My.Resources.Resources.luka3
        Me.uic_luka.Location = New System.Drawing.Point(30, 13)
        Me.uic_luka.Name = "uic_luka"
        Me.uic_luka.Size = New System.Drawing.Size(84, 53)
        Me.uic_luka.TabIndex = 0
        Me.uic_luka.UseVisualStyleBackColor = True
        '
        'btn_limpiar
        '
        Me.btn_limpiar.Anchor = CType((System.Windows.Forms.AnchorStyles.Bottom Or System.Windows.Forms.AnchorStyles.Left), System.Windows.Forms.AnchorStyles)
        Me.btn_limpiar.Image = Global.delevery.My.Resources.Resources.Refresh1
        Me.btn_limpiar.Location = New System.Drawing.Point(297, 529)
        Me.btn_limpiar.Name = "btn_limpiar"
        Me.btn_limpiar.Size = New System.Drawing.Size(34, 41)
        Me.btn_limpiar.TabIndex = 24
        Me.btn_limpiar.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText
        Me.ToolTip1.SetToolTip(Me.btn_limpiar, "Limpia pantalla")
        Me.btn_limpiar.UseVisualStyleBackColor = True
        '
        'uic_limpiaEfectivo
        '
        Me.uic_limpiaEfectivo.Anchor = CType((System.Windows.Forms.AnchorStyles.Bottom Or System.Windows.Forms.AnchorStyles.Left), System.Windows.Forms.AnchorStyles)
        Me.uic_limpiaEfectivo.Image = Global.delevery.My.Resources.Resources.Refresh1
        Me.uic_limpiaEfectivo.Location = New System.Drawing.Point(167, 131)
        Me.uic_limpiaEfectivo.Name = "uic_limpiaEfectivo"
        Me.uic_limpiaEfectivo.Size = New System.Drawing.Size(35, 41)
        Me.uic_limpiaEfectivo.TabIndex = 25
        Me.uic_limpiaEfectivo.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText
        Me.ToolTip1.SetToolTip(Me.uic_limpiaEfectivo, "Limpia Valor Efectivo")
        Me.uic_limpiaEfectivo.UseVisualStyleBackColor = True
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(898, 595)
        Me.Controls.Add(Me.btn_limpiar)
        Me.Controls.Add(Me.GrBillete)
        Me.Controls.Add(Me.StatusStrip1)
        Me.Controls.Add(Me.FlowLayoutFamilia)
        Me.Controls.Add(Me.txt_cantidad)
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(Me.btn_aceptar)
        Me.Controls.Add(Me.Label5)
        Me.Controls.Add(Me.Label4)
        Me.Controls.Add(Me.Label3)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.cbo_formapago)
        Me.Controls.Add(Me.txt_Total)
        Me.Controls.Add(Me.txt_efectivo)
        Me.Controls.Add(Me.txt_vuelto)
        Me.Controls.Add(Me.DataGridView1)
        Me.Controls.Add(Me.btn_salir)
        Me.Controls.Add(Me.FlowLayoutPanel1)
        Me.Name = "Form1"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "Form1"
        Me.WindowState = System.Windows.Forms.FormWindowState.Maximized
        CType(Me.DataGridView1, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.FormapagoBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.FormaPago_dateset, System.ComponentModel.ISupportInitialize).EndInit()
        Me.StatusStrip1.ResumeLayout(False)
        Me.StatusStrip1.PerformLayout()
        Me.GrBillete.ResumeLayout(False)
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents FlowLayoutPanel1 As System.Windows.Forms.FlowLayoutPanel
    Friend WithEvents ImageList1 As System.Windows.Forms.ImageList
    Friend WithEvents btn_salir As System.Windows.Forms.Button
    Friend WithEvents DataGridView1 As System.Windows.Forms.DataGridView
    Friend WithEvents txt_vuelto As System.Windows.Forms.TextBox
    Friend WithEvents txt_efectivo As System.Windows.Forms.TextBox
    Friend WithEvents txt_Total As System.Windows.Forms.TextBox
    Friend WithEvents cbo_formapago As System.Windows.Forms.ComboBox
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents Label5 As System.Windows.Forms.Label
    Friend WithEvents btn_aceptar As System.Windows.Forms.Button
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents txt_cantidad As System.Windows.Forms.TextBox
    Friend WithEvents FormaPago_dateset As delevery.formaPago_dateset
    Friend WithEvents FormapagoBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents Forma_pagoTableAdapter As delevery.formaPago_datesetTableAdapters.forma_pagoTableAdapter
    Friend WithEvents FlowLayoutFamilia As System.Windows.Forms.FlowLayoutPanel
    Friend WithEvents codigo As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents cantidad As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents Column2 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents precio As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents Column3 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents Eliminar As System.Windows.Forms.DataGridViewButtonColumn
    Friend WithEvents StatusStrip1 As System.Windows.Forms.StatusStrip
    Friend WithEvents uicEstado As System.Windows.Forms.ToolStripStatusLabel
    Friend WithEvents uic_FechaHora As System.Windows.Forms.ToolStripStatusLabel
    Friend WithEvents uic_reloj As System.Windows.Forms.Timer
    Friend WithEvents GrBillete As System.Windows.Forms.GroupBox
    Friend WithEvents uic_luka As System.Windows.Forms.Button
    Friend WithEvents uic_diezluka As System.Windows.Forms.Button
    Friend WithEvents uic_cincoluka As System.Windows.Forms.Button
    Friend WithEvents uic_dosluka As System.Windows.Forms.Button
    Friend WithEvents uic_veinteluka As System.Windows.Forms.Button
    Friend WithEvents ToolTip1 As System.Windows.Forms.ToolTip
    Friend WithEvents btn_limpiar As System.Windows.Forms.Button
    Friend WithEvents uic_limpiaEfectivo As System.Windows.Forms.Button

End Class
