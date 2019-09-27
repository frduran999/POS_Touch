<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class AbrirCaja
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
        Me.GroupBox1 = New System.Windows.Forms.GroupBox()
        Me.Label2 = New System.Windows.Forms.Label()
        Me.uic_glosa = New System.Windows.Forms.TextBox()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.uic_monto = New System.Windows.Forms.TextBox()
        Me.uic_cancelar = New System.Windows.Forms.Button()
        Me.uic_aceptar = New System.Windows.Forms.Button()
        Me.GroupBox1.SuspendLayout()
        Me.SuspendLayout()
        '
        'GroupBox1
        '
        Me.GroupBox1.Controls.Add(Me.Label2)
        Me.GroupBox1.Controls.Add(Me.uic_glosa)
        Me.GroupBox1.Controls.Add(Me.Label1)
        Me.GroupBox1.Controls.Add(Me.uic_monto)
        Me.GroupBox1.Location = New System.Drawing.Point(12, 9)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Size = New System.Drawing.Size(260, 88)
        Me.GroupBox1.TabIndex = 5
        Me.GroupBox1.TabStop = False
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Location = New System.Drawing.Point(6, 51)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(34, 13)
        Me.Label2.TabIndex = 9
        Me.Label2.Text = "Glosa"
        '
        'uic_glosa
        '
        Me.uic_glosa.Location = New System.Drawing.Point(99, 51)
        Me.uic_glosa.MaxLength = 300
        Me.uic_glosa.Name = "uic_glosa"
        Me.uic_glosa.Size = New System.Drawing.Size(155, 20)
        Me.uic_glosa.TabIndex = 1
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(6, 21)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(78, 13)
        Me.Label1.TabIndex = 7
        Me.Label1.Text = "Monto efectivo"
        '
        'uic_monto
        '
        Me.uic_monto.Location = New System.Drawing.Point(98, 18)
        Me.uic_monto.MaxLength = 20
        Me.uic_monto.Name = "uic_monto"
        Me.uic_monto.Size = New System.Drawing.Size(155, 20)
        Me.uic_monto.TabIndex = 0
        '
        'uic_cancelar
        '
        Me.uic_cancelar.BackColor = System.Drawing.Color.FromArgb(CType(CType(244, Byte), Integer), CType(CType(206, Byte), Integer), CType(CType(212, Byte), Integer))
        Me.uic_cancelar.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.uic_cancelar.Location = New System.Drawing.Point(188, 113)
        Me.uic_cancelar.Name = "uic_cancelar"
        Me.uic_cancelar.Size = New System.Drawing.Size(69, 36)
        Me.uic_cancelar.TabIndex = 7
        Me.uic_cancelar.Text = "Cancelar"
        Me.uic_cancelar.UseVisualStyleBackColor = False
        '
        'uic_aceptar
        '
        Me.uic_aceptar.BackColor = System.Drawing.Color.FromArgb(CType(CType(128, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer))
        Me.uic_aceptar.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.uic_aceptar.Location = New System.Drawing.Point(28, 113)
        Me.uic_aceptar.Name = "uic_aceptar"
        Me.uic_aceptar.Size = New System.Drawing.Size(75, 36)
        Me.uic_aceptar.TabIndex = 6
        Me.uic_aceptar.Text = "Aceptar"
        Me.uic_aceptar.UseVisualStyleBackColor = False
        '
        'AbrirCaja
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(284, 158)
        Me.Controls.Add(Me.GroupBox1)
        Me.Controls.Add(Me.uic_cancelar)
        Me.Controls.Add(Me.uic_aceptar)
        Me.Name = "AbrirCaja"
        Me.Text = "AbrirCaja"
        Me.GroupBox1.ResumeLayout(False)
        Me.GroupBox1.PerformLayout()
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents GroupBox1 As System.Windows.Forms.GroupBox
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents uic_glosa As System.Windows.Forms.TextBox
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents uic_monto As System.Windows.Forms.TextBox
    Friend WithEvents uic_cancelar As System.Windows.Forms.Button
    Friend WithEvents uic_aceptar As System.Windows.Forms.Button
End Class
