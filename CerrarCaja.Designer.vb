<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class CerrarCaja
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
        Me.btnCerrarCaja = New System.Windows.Forms.Button()
        Me.SuspendLayout()
        '
        'btnCerrarCaja
        '
        Me.btnCerrarCaja.Location = New System.Drawing.Point(49, 38)
        Me.btnCerrarCaja.Name = "btnCerrarCaja"
        Me.btnCerrarCaja.Size = New System.Drawing.Size(75, 23)
        Me.btnCerrarCaja.TabIndex = 0
        Me.btnCerrarCaja.Text = "Cerrar Caja"
        Me.btnCerrarCaja.UseVisualStyleBackColor = True
        '
        'CerrarCaja
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(179, 98)
        Me.ControlBox = False
        Me.Controls.Add(Me.btnCerrarCaja)
        Me.Name = "CerrarCaja"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "CerrarCaja"
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents btnCerrarCaja As System.Windows.Forms.Button
End Class
