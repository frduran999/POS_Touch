<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class GeneraKey
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
        Me.Label7 = New System.Windows.Forms.Label()
        Me.uic_giro = New System.Windows.Forms.TextBox()
        Me.uic_rutEmp = New System.Windows.Forms.TextBox()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.uicLicencia = New System.Windows.Forms.TextBox()
        Me.Label2 = New System.Windows.Forms.Label()
        Me.uic_genera = New System.Windows.Forms.Button()
        Me.GroupBox1.SuspendLayout()
        Me.SuspendLayout()
        '
        'GroupBox1
        '
        Me.GroupBox1.Controls.Add(Me.Label7)
        Me.GroupBox1.Controls.Add(Me.uic_giro)
        Me.GroupBox1.Controls.Add(Me.uic_rutEmp)
        Me.GroupBox1.Controls.Add(Me.Label1)
        Me.GroupBox1.Location = New System.Drawing.Point(6, 0)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Size = New System.Drawing.Size(272, 111)
        Me.GroupBox1.TabIndex = 0
        Me.GroupBox1.TabStop = False
        '
        'Label7
        '
        Me.Label7.AutoSize = True
        Me.Label7.Location = New System.Drawing.Point(97, 58)
        Me.Label7.Name = "Label7"
        Me.Label7.Size = New System.Drawing.Size(29, 13)
        Me.Label7.TabIndex = 12
        Me.Label7.Text = "Giro:"
        '
        'uic_giro
        '
        Me.uic_giro.Location = New System.Drawing.Point(6, 74)
        Me.uic_giro.MaxLength = 80
        Me.uic_giro.Name = "uic_giro"
        Me.uic_giro.Size = New System.Drawing.Size(260, 20)
        Me.uic_giro.TabIndex = 11
        '
        'uic_rutEmp
        '
        Me.uic_rutEmp.Location = New System.Drawing.Point(89, 26)
        Me.uic_rutEmp.Name = "uic_rutEmp"
        Me.uic_rutEmp.Size = New System.Drawing.Size(103, 20)
        Me.uic_rutEmp.TabIndex = 9
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(7, 30)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(77, 13)
        Me.Label1.TabIndex = 10
        Me.Label1.Text = "RUT Empresa:"
        '
        'uicLicencia
        '
        Me.uicLicencia.Location = New System.Drawing.Point(6, 156)
        Me.uicLicencia.MaxLength = 80
        Me.uicLicencia.Name = "uicLicencia"
        Me.uicLicencia.Size = New System.Drawing.Size(266, 20)
        Me.uicLicencia.TabIndex = 12
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Location = New System.Drawing.Point(13, 140)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(47, 13)
        Me.Label2.TabIndex = 13
        Me.Label2.Text = "Licencia"
        '
        'uic_genera
        '
        Me.uic_genera.Location = New System.Drawing.Point(197, 117)
        Me.uic_genera.Name = "uic_genera"
        Me.uic_genera.Size = New System.Drawing.Size(75, 23)
        Me.uic_genera.TabIndex = 14
        Me.uic_genera.Text = "Crea Key"
        Me.uic_genera.UseVisualStyleBackColor = True
        '
        'GeneraKey
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(284, 266)
        Me.Controls.Add(Me.uic_genera)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.uicLicencia)
        Me.Controls.Add(Me.GroupBox1)
        Me.Name = "GeneraKey"
        Me.Text = "GeneraKey"
        Me.GroupBox1.ResumeLayout(False)
        Me.GroupBox1.PerformLayout()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents GroupBox1 As System.Windows.Forms.GroupBox
    Friend WithEvents Label7 As System.Windows.Forms.Label
    Friend WithEvents uic_giro As System.Windows.Forms.TextBox
    Friend WithEvents uic_rutEmp As System.Windows.Forms.TextBox
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents uicLicencia As System.Windows.Forms.TextBox
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents uic_genera As System.Windows.Forms.Button
End Class
