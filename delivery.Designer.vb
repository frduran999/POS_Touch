<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class delivery
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
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(delivery))
        Me.ToolStrip1 = New System.Windows.Forms.ToolStrip()
        Me.ToolStripButton1 = New System.Windows.Forms.ToolStripButton()
        Me.ToolStripButton6 = New System.Windows.Forms.ToolStripButton()
        Me.ToolStripButton2 = New System.Windows.Forms.ToolStripDropDownButton()
        Me.DIARIOToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.COMPRASDIARIOToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.ToolStripButton3 = New System.Windows.Forms.ToolStripButton()
        Me.ToolStripButton4 = New System.Windows.Forms.ToolStripButton()
        Me.ToolStripDropDownButton1 = New System.Windows.Forms.ToolStripDropDownButton()
        Me.XxToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.FamiliaProductosToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.PromocionesToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.RetiroCajaToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.ToolStripButton5 = New System.Windows.Forms.ToolStripButton()
        Me.StatusStrip1 = New System.Windows.Forms.StatusStrip()
        Me.uic_versionApp = New System.Windows.Forms.ToolStripStatusLabel()
<<<<<<< HEAD
        Me.InformacionTicketToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
=======
        Me.ImpresorasToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
>>>>>>> rodrigo
        Me.ToolStrip1.SuspendLayout()
        Me.StatusStrip1.SuspendLayout()
        Me.SuspendLayout()
        '
        'ToolStrip1
        '
        Me.ToolStrip1.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.ToolStripButton1, Me.ToolStripButton6, Me.ToolStripButton2, Me.ToolStripButton3, Me.ToolStripButton4, Me.ToolStripDropDownButton1, Me.ToolStripButton5})
        Me.ToolStrip1.Location = New System.Drawing.Point(0, 0)
        Me.ToolStrip1.Name = "ToolStrip1"
        Me.ToolStrip1.Size = New System.Drawing.Size(506, 70)
        Me.ToolStrip1.TabIndex = 0
        Me.ToolStrip1.Text = "ToolStrip1"
        '
        'ToolStripButton1
        '
        Me.ToolStripButton1.Image = Global.delevery.My.Resources.Resources.note_add
        Me.ToolStripButton1.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None
        Me.ToolStripButton1.ImageTransparentColor = System.Drawing.Color.Magenta
        Me.ToolStripButton1.Name = "ToolStripButton1"
        Me.ToolStripButton1.Size = New System.Drawing.Size(52, 67)
        Me.ToolStripButton1.Text = "Venta"
        Me.ToolStripButton1.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText
        '
        'ToolStripButton6
        '
        Me.ToolStripButton6.Image = Global.delevery.My.Resources.Resources.address_book2
        Me.ToolStripButton6.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None
        Me.ToolStripButton6.ImageTransparentColor = System.Drawing.Color.Magenta
        Me.ToolStripButton6.Name = "ToolStripButton6"
        Me.ToolStripButton6.Size = New System.Drawing.Size(59, 67)
        Me.ToolStripButton6.Text = "Compras"
        Me.ToolStripButton6.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText
        Me.ToolStripButton6.Visible = False
        '
        'ToolStripButton2
        '
        Me.ToolStripButton2.DropDownItems.AddRange(New System.Windows.Forms.ToolStripItem() {Me.DIARIOToolStripMenuItem, Me.COMPRASDIARIOToolStripMenuItem})
        Me.ToolStripButton2.Image = Global.delevery.My.Resources.Resources.book_blue
        Me.ToolStripButton2.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None
        Me.ToolStripButton2.ImageTransparentColor = System.Drawing.Color.Magenta
        Me.ToolStripButton2.Name = "ToolStripButton2"
        Me.ToolStripButton2.Size = New System.Drawing.Size(66, 67)
        Me.ToolStripButton2.Text = "Reportes"
        Me.ToolStripButton2.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText
        '
        'DIARIOToolStripMenuItem
        '
        Me.DIARIOToolStripMenuItem.Name = "DIARIOToolStripMenuItem"
        Me.DIARIOToolStripMenuItem.Size = New System.Drawing.Size(171, 22)
        Me.DIARIOToolStripMenuItem.Text = "VENTAS DIARIO"
        '
        'COMPRASDIARIOToolStripMenuItem
        '
        Me.COMPRASDIARIOToolStripMenuItem.Name = "COMPRASDIARIOToolStripMenuItem"
        Me.COMPRASDIARIOToolStripMenuItem.Size = New System.Drawing.Size(171, 22)
        Me.COMPRASDIARIOToolStripMenuItem.Text = "COMPRAS DIARIO"
        Me.COMPRASDIARIOToolStripMenuItem.Visible = False
        '
        'ToolStripButton3
        '
        Me.ToolStripButton3.Image = Global.delevery.My.Resources.Resources.users2
        Me.ToolStripButton3.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None
        Me.ToolStripButton3.ImageTransparentColor = System.Drawing.Color.Magenta
        Me.ToolStripButton3.Name = "ToolStripButton3"
        Me.ToolStripButton3.Size = New System.Drawing.Size(56, 67)
        Me.ToolStripButton3.Text = "Usuarios"
        Me.ToolStripButton3.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText
        '
        'ToolStripButton4
        '
        Me.ToolStripButton4.Image = Global.delevery.My.Resources.Resources.product2
        Me.ToolStripButton4.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None
        Me.ToolStripButton4.ImageTransparentColor = System.Drawing.Color.Magenta
        Me.ToolStripButton4.Name = "ToolStripButton4"
        Me.ToolStripButton4.Size = New System.Drawing.Size(65, 67)
        Me.ToolStripButton4.Text = "Productos"
        Me.ToolStripButton4.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText
        '
        'ToolStripDropDownButton1
        '
<<<<<<< HEAD
        Me.ToolStripDropDownButton1.DropDownItems.AddRange(New System.Windows.Forms.ToolStripItem() {Me.XxToolStripMenuItem, Me.FamiliaProductosToolStripMenuItem, Me.PromocionesToolStripMenuItem, Me.RetiroCajaToolStripMenuItem, Me.InformacionTicketToolStripMenuItem})
=======
        Me.ToolStripDropDownButton1.DropDownItems.AddRange(New System.Windows.Forms.ToolStripItem() {Me.XxToolStripMenuItem, Me.FamiliaProductosToolStripMenuItem, Me.PromocionesToolStripMenuItem, Me.ParametrosToolStripMenuItem, Me.RetiroCajaToolStripMenuItem, Me.ImpresorasToolStripMenuItem})
>>>>>>> rodrigo
        Me.ToolStripDropDownButton1.Image = Global.delevery.My.Resources.Resources.gear
        Me.ToolStripDropDownButton1.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None
        Me.ToolStripDropDownButton1.ImageTransparentColor = System.Drawing.Color.Magenta
        Me.ToolStripDropDownButton1.Name = "ToolStripDropDownButton1"
        Me.ToolStripDropDownButton1.Size = New System.Drawing.Size(96, 67)
        Me.ToolStripDropDownButton1.Text = "Mantenedores"
        Me.ToolStripDropDownButton1.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText
        '
        'XxToolStripMenuItem
        '
        Me.XxToolStripMenuItem.Name = "XxToolStripMenuItem"
        Me.XxToolStripMenuItem.Size = New System.Drawing.Size(174, 22)
        Me.XxToolStripMenuItem.Text = "Forma Pago"
        '
        'FamiliaProductosToolStripMenuItem
        '
        Me.FamiliaProductosToolStripMenuItem.Name = "FamiliaProductosToolStripMenuItem"
        Me.FamiliaProductosToolStripMenuItem.Size = New System.Drawing.Size(174, 22)
        Me.FamiliaProductosToolStripMenuItem.Text = "Familia Productos"
        '
        'PromocionesToolStripMenuItem
        '
        Me.PromocionesToolStripMenuItem.Name = "PromocionesToolStripMenuItem"
        Me.PromocionesToolStripMenuItem.Size = New System.Drawing.Size(174, 22)
        Me.PromocionesToolStripMenuItem.Text = "Promociones"
        '
        'RetiroCajaToolStripMenuItem
        '
        Me.RetiroCajaToolStripMenuItem.Name = "RetiroCajaToolStripMenuItem"
        Me.RetiroCajaToolStripMenuItem.Size = New System.Drawing.Size(174, 22)
        Me.RetiroCajaToolStripMenuItem.Text = "Retiro Caja"
        '
        'ToolStripButton5
        '
        Me.ToolStripButton5.Image = Global.delevery.My.Resources.Resources.export1
        Me.ToolStripButton5.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None
        Me.ToolStripButton5.ImageTransparentColor = System.Drawing.Color.Magenta
        Me.ToolStripButton5.Name = "ToolStripButton5"
        Me.ToolStripButton5.Size = New System.Drawing.Size(52, 67)
        Me.ToolStripButton5.Text = "Salir"
        Me.ToolStripButton5.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText
        '
        'StatusStrip1
        '
        Me.StatusStrip1.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.uic_versionApp})
        Me.StatusStrip1.Location = New System.Drawing.Point(0, 334)
        Me.StatusStrip1.Name = "StatusStrip1"
        Me.StatusStrip1.Size = New System.Drawing.Size(506, 22)
        Me.StatusStrip1.TabIndex = 2
        Me.StatusStrip1.Text = "StatusStrip1"
        '
        'uic_versionApp
        '
        Me.uic_versionApp.BackColor = System.Drawing.SystemColors.Control
        Me.uic_versionApp.Name = "uic_versionApp"
        Me.uic_versionApp.Size = New System.Drawing.Size(0, 17)
        '
<<<<<<< HEAD
        'InformacionTicketToolStripMenuItem
        '
        Me.InformacionTicketToolStripMenuItem.Name = "InformacionTicketToolStripMenuItem"
        Me.InformacionTicketToolStripMenuItem.Size = New System.Drawing.Size(174, 22)
        Me.InformacionTicketToolStripMenuItem.Text = "Informacion Ticket"
=======
        'ImpresorasToolStripMenuItem
        '
        Me.ImpresorasToolStripMenuItem.Name = "ImpresorasToolStripMenuItem"
        Me.ImpresorasToolStripMenuItem.Size = New System.Drawing.Size(169, 22)
        Me.ImpresorasToolStripMenuItem.Text = "Impresoras"
>>>>>>> rodrigo
        '
        'delivery
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackColor = System.Drawing.Color.SteelBlue
        Me.ClientSize = New System.Drawing.Size(506, 356)
        Me.Controls.Add(Me.StatusStrip1)
        Me.Controls.Add(Me.ToolStrip1)
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.Name = "delivery"
        Me.ShowIcon = False
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "menu"
        Me.ToolStrip1.ResumeLayout(False)
        Me.ToolStrip1.PerformLayout()
        Me.StatusStrip1.ResumeLayout(False)
        Me.StatusStrip1.PerformLayout()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents ToolStrip1 As System.Windows.Forms.ToolStrip
    Friend WithEvents ToolStripButton1 As System.Windows.Forms.ToolStripButton
    Friend WithEvents ToolStripButton3 As System.Windows.Forms.ToolStripButton
    Friend WithEvents ToolStripButton4 As System.Windows.Forms.ToolStripButton
    Friend WithEvents ToolStripButton5 As System.Windows.Forms.ToolStripButton
    Friend WithEvents ToolStripDropDownButton1 As System.Windows.Forms.ToolStripDropDownButton
    Friend WithEvents XxToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ToolStripButton2 As System.Windows.Forms.ToolStripDropDownButton
    Friend WithEvents DIARIOToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ToolStripButton6 As System.Windows.Forms.ToolStripButton
    Friend WithEvents COMPRASDIARIOToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents FamiliaProductosToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents PromocionesToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents StatusStrip1 As System.Windows.Forms.StatusStrip
    Friend WithEvents uic_versionApp As System.Windows.Forms.ToolStripStatusLabel
    Friend WithEvents RetiroCajaToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
<<<<<<< HEAD
    Friend WithEvents InformacionTicketToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
=======
    Friend WithEvents ImpresorasToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
>>>>>>> rodrigo
End Class
