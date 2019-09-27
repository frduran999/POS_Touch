<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Retiro
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
        Me.Label3 = New System.Windows.Forms.Label()
        Me.uic_monto = New System.Windows.Forms.TextBox()
        Me.DataGridView1 = New System.Windows.Forms.DataGridView()
        Me.NroRetiro = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.TipoRetiro = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Monto = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Eliminar = New System.Windows.Forms.DataGridViewButtonColumn()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.uic_banco = New System.Windows.Forms.ComboBox()
        Me.Label4 = New System.Windows.Forms.Label()
        Me.uic_monto_total_retiro = New System.Windows.Forms.TextBox()
        Me.Label2 = New System.Windows.Forms.Label()
        Me.uic_glosa_retiro = New System.Windows.Forms.TextBox()
        Me.btn_aceptar = New System.Windows.Forms.Button()
        Me.btn_grabar = New System.Windows.Forms.Button()
        Me.btn_salir = New System.Windows.Forms.Button()
        CType(Me.DataGridView1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.Location = New System.Drawing.Point(14, 30)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(94, 13)
        Me.Label3.TabIndex = 20
        Me.Label3.Text = "Monto en Efectivo"
        '
        'uic_monto
        '
        Me.uic_monto.Location = New System.Drawing.Point(117, 26)
        Me.uic_monto.MaxLength = 15
        Me.uic_monto.Name = "uic_monto"
        Me.uic_monto.Size = New System.Drawing.Size(155, 20)
        Me.uic_monto.TabIndex = 18
        '
        'DataGridView1
        '
        Me.DataGridView1.AllowUserToAddRows = False
        Me.DataGridView1.AllowUserToDeleteRows = False
        Me.DataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.DataGridView1.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.NroRetiro, Me.TipoRetiro, Me.Monto, Me.Eliminar})
        Me.DataGridView1.Location = New System.Drawing.Point(17, 72)
        Me.DataGridView1.Name = "DataGridView1"
        Me.DataGridView1.ReadOnly = True
        Me.DataGridView1.RowHeadersVisible = False
        Me.DataGridView1.Size = New System.Drawing.Size(355, 198)
        Me.DataGridView1.TabIndex = 21
        '
        'NroRetiro
        '
        Me.NroRetiro.HeaderText = "NroRetiro"
        Me.NroRetiro.Name = "NroRetiro"
        Me.NroRetiro.ReadOnly = True
        Me.NroRetiro.Width = 60
        '
        'TipoRetiro
        '
        Me.TipoRetiro.HeaderText = "TipoRetiro"
        Me.TipoRetiro.Name = "TipoRetiro"
        Me.TipoRetiro.ReadOnly = True
        '
        'Monto
        '
        Me.Monto.HeaderText = "Monto"
        Me.Monto.Name = "Monto"
        Me.Monto.ReadOnly = True
        '
        'Eliminar
        '
        Me.Eliminar.HeaderText = "Eliminar"
        Me.Eliminar.Name = "Eliminar"
        Me.Eliminar.ReadOnly = True
        Me.Eliminar.Text = "Eliminar"
        Me.Eliminar.UseColumnTextForButtonValue = True
        Me.Eliminar.Width = 70
        '
        'Label1
        '
        Me.Label1.Anchor = CType((System.Windows.Forms.AnchorStyles.Bottom Or System.Windows.Forms.AnchorStyles.Left), System.Windows.Forms.AnchorStyles)
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(14, 321)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(38, 13)
        Me.Label1.TabIndex = 27
        Me.Label1.Text = "Banco"
        '
        'uic_banco
        '
        Me.uic_banco.Anchor = CType((System.Windows.Forms.AnchorStyles.Bottom Or System.Windows.Forms.AnchorStyles.Left), System.Windows.Forms.AnchorStyles)
        Me.uic_banco.DisplayMember = "NombreBanco"
        Me.uic_banco.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
        Me.uic_banco.FormattingEnabled = True
        Me.uic_banco.Location = New System.Drawing.Point(104, 313)
        Me.uic_banco.Name = "uic_banco"
        Me.uic_banco.Size = New System.Drawing.Size(203, 21)
        Me.uic_banco.TabIndex = 23
        Me.uic_banco.ValueMember = "Banco"
        '
        'Label4
        '
        Me.Label4.Anchor = CType((System.Windows.Forms.AnchorStyles.Bottom Or System.Windows.Forms.AnchorStyles.Left), System.Windows.Forms.AnchorStyles)
        Me.Label4.AutoSize = True
        Me.Label4.Location = New System.Drawing.Point(14, 291)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(86, 13)
        Me.Label4.TabIndex = 26
        Me.Label4.Text = "Monto total retiro"
        '
        'uic_monto_total_retiro
        '
        Me.uic_monto_total_retiro.Anchor = CType((System.Windows.Forms.AnchorStyles.Bottom Or System.Windows.Forms.AnchorStyles.Left), System.Windows.Forms.AnchorStyles)
        Me.uic_monto_total_retiro.Location = New System.Drawing.Point(104, 287)
        Me.uic_monto_total_retiro.MaxLength = 20
        Me.uic_monto_total_retiro.Name = "uic_monto_total_retiro"
        Me.uic_monto_total_retiro.ReadOnly = True
        Me.uic_monto_total_retiro.Size = New System.Drawing.Size(203, 20)
        Me.uic_monto_total_retiro.TabIndex = 22
        Me.uic_monto_total_retiro.TextAlign = System.Windows.Forms.HorizontalAlignment.Right
        '
        'Label2
        '
        Me.Label2.Anchor = CType((System.Windows.Forms.AnchorStyles.Bottom Or System.Windows.Forms.AnchorStyles.Left), System.Windows.Forms.AnchorStyles)
        Me.Label2.AutoSize = True
        Me.Label2.Location = New System.Drawing.Point(14, 350)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(82, 13)
        Me.Label2.TabIndex = 25
        Me.Label2.Text = "No. Documento"
        '
        'uic_glosa_retiro
        '
        Me.uic_glosa_retiro.Anchor = CType((System.Windows.Forms.AnchorStyles.Bottom Or System.Windows.Forms.AnchorStyles.Left), System.Windows.Forms.AnchorStyles)
        Me.uic_glosa_retiro.Location = New System.Drawing.Point(104, 343)
        Me.uic_glosa_retiro.MaxLength = 50
        Me.uic_glosa_retiro.Name = "uic_glosa_retiro"
        Me.uic_glosa_retiro.Size = New System.Drawing.Size(203, 20)
        Me.uic_glosa_retiro.TabIndex = 24
        Me.uic_glosa_retiro.TextAlign = System.Windows.Forms.HorizontalAlignment.Right
        '
        'btn_aceptar
        '
        Me.btn_aceptar.Anchor = CType((System.Windows.Forms.AnchorStyles.Bottom Or System.Windows.Forms.AnchorStyles.Left), System.Windows.Forms.AnchorStyles)
        Me.btn_aceptar.Image = Global.delevery.My.Resources.Resources.check
        Me.btn_aceptar.Location = New System.Drawing.Point(329, 15)
        Me.btn_aceptar.Name = "btn_aceptar"
        Me.btn_aceptar.Size = New System.Drawing.Size(43, 41)
        Me.btn_aceptar.TabIndex = 28
        Me.btn_aceptar.UseVisualStyleBackColor = True
        '
        'btn_grabar
        '
        Me.btn_grabar.Image = Global.delevery.My.Resources.Resources.disk_blue
        Me.btn_grabar.Location = New System.Drawing.Point(335, 287)
        Me.btn_grabar.Name = "btn_grabar"
        Me.btn_grabar.Size = New System.Drawing.Size(37, 37)
        Me.btn_grabar.TabIndex = 29
        Me.btn_grabar.UseVisualStyleBackColor = True
        '
        'btn_salir
        '
        Me.btn_salir.Image = Global.delevery.My.Resources.Resources._Exit
        Me.btn_salir.Location = New System.Drawing.Point(335, 334)
        Me.btn_salir.Name = "btn_salir"
        Me.btn_salir.Size = New System.Drawing.Size(37, 37)
        Me.btn_salir.TabIndex = 30
        Me.btn_salir.UseVisualStyleBackColor = True
        '
        'Retiro
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(390, 381)
        Me.Controls.Add(Me.btn_salir)
        Me.Controls.Add(Me.btn_grabar)
        Me.Controls.Add(Me.btn_aceptar)
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(Me.uic_banco)
        Me.Controls.Add(Me.Label4)
        Me.Controls.Add(Me.uic_monto_total_retiro)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.uic_glosa_retiro)
        Me.Controls.Add(Me.DataGridView1)
        Me.Controls.Add(Me.Label3)
        Me.Controls.Add(Me.uic_monto)
        Me.Name = "Retiro"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "Retiro Caja"
        CType(Me.DataGridView1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents uic_monto As System.Windows.Forms.TextBox
    Friend WithEvents DataGridView1 As System.Windows.Forms.DataGridView
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents uic_banco As System.Windows.Forms.ComboBox
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents uic_monto_total_retiro As System.Windows.Forms.TextBox
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents uic_glosa_retiro As System.Windows.Forms.TextBox
    Friend WithEvents btn_aceptar As System.Windows.Forms.Button
    Friend WithEvents btn_grabar As System.Windows.Forms.Button
    Friend WithEvents btn_salir As System.Windows.Forms.Button
    Friend WithEvents NroRetiro As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents TipoRetiro As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents Monto As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents Eliminar As System.Windows.Forms.DataGridViewButtonColumn
End Class
