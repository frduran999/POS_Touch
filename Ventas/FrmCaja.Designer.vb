<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class FrmCaja
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
        Dim SortDescriptor9 As Telerik.WinControls.Data.SortDescriptor = New Telerik.WinControls.Data.SortDescriptor()
        Dim TableViewDefinition12 As Telerik.WinControls.UI.TableViewDefinition = New Telerik.WinControls.UI.TableViewDefinition()
        Dim TableViewDefinition13 As Telerik.WinControls.UI.TableViewDefinition = New Telerik.WinControls.UI.TableViewDefinition()
        Me.RadGroupBox3 = New Telerik.WinControls.UI.RadGroupBox()
        Me.RadLabel1 = New Telerik.WinControls.UI.RadLabel()
        Me.uic_BuscaVta = New Telerik.WinControls.UI.RadButton()
        Me.uic_BuscaNroTrans = New Telerik.WinControls.UI.RadTextBox()
        Me.RadGroupBox1 = New Telerik.WinControls.UI.RadGroupBox()
        Me.GridVenta = New Telerik.WinControls.UI.RadGridView()
        Me.Panel_keypad = New Telerik.WinControls.UI.RadPanel()
        Me.uic_botonEnter = New System.Windows.Forms.Button()
        Me.uic_botonC = New System.Windows.Forms.Button()
        Me.uic_botonBack = New System.Windows.Forms.Button()
        Me.uic_botonPunto = New System.Windows.Forms.Button()
        Me.uic_boton3 = New System.Windows.Forms.Button()
        Me.uic_boton6 = New System.Windows.Forms.Button()
        Me.uic_boton9 = New System.Windows.Forms.Button()
        Me.uic_botonAsterisco = New System.Windows.Forms.Button()
        Me.uic_boton2 = New System.Windows.Forms.Button()
        Me.uic_boton5 = New System.Windows.Forms.Button()
        Me.uic_boton8 = New System.Windows.Forms.Button()
        Me.uic_boton0 = New System.Windows.Forms.Button()
        Me.uic_boton1 = New System.Windows.Forms.Button()
        Me.uic_boton4 = New System.Windows.Forms.Button()
        Me.uic_boton7 = New System.Windows.Forms.Button()
        Me.Office2010BlackTheme1 = New Telerik.WinControls.Themes.Office2010BlackTheme()
        Me.uic_Reloj = New System.Windows.Forms.Timer(Me.components)
        Me.Panel_cobro = New Telerik.WinControls.UI.RadPanel()
        Me.uic_Total = New System.Windows.Forms.Label()
        Me.Label8 = New System.Windows.Forms.Label()
        Me.uic_botonF6 = New System.Windows.Forms.Button()
        Me.uic_botonF1 = New System.Windows.Forms.Button()
        Me.uic_ValeBotella = New System.Windows.Forms.Button()
        Me.uic_BotonF4 = New System.Windows.Forms.Button()
        Me.uic_salir = New System.Windows.Forms.Button()
        Me.uic_botonF2 = New System.Windows.Forms.Button()
        Me.RadStatusStrip1 = New Telerik.WinControls.UI.RadStatusStrip()
        Me.uic_Nrotransaccion = New Telerik.WinControls.UI.RadLabelElement()
        Me.uic_FechaHora = New Telerik.WinControls.UI.RadLabelElement()
        Me.CommandBarSeparator1 = New Telerik.WinControls.UI.CommandBarSeparator()
        Me.uic_VersionApp = New Telerik.WinControls.UI.RadLabelElement()
        Me.RadGroupBox2 = New Telerik.WinControls.UI.RadGroupBox()
        Me.RadLabel13 = New Telerik.WinControls.UI.RadLabel()
        Me.uic_BuscaArticulo = New Telerik.WinControls.UI.RadButton()
        Me.uic_BuscarProducto = New Telerik.WinControls.UI.RadTextBox()
        Me.GridProductos = New Telerik.WinControls.UI.RadGridView()
        CType(Me.RadGroupBox3, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.RadGroupBox3.SuspendLayout()
        CType(Me.RadLabel1, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.uic_BuscaVta, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.uic_BuscaNroTrans, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.RadGroupBox1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.RadGroupBox1.SuspendLayout()
        CType(Me.GridVenta, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.GridVenta.MasterTemplate, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.Panel_keypad, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.Panel_keypad.SuspendLayout()
        CType(Me.Panel_cobro, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.Panel_cobro.SuspendLayout()
        CType(Me.RadStatusStrip1, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.RadGroupBox2, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.RadGroupBox2.SuspendLayout()
        CType(Me.RadLabel13, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.uic_BuscaArticulo, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.uic_BuscarProducto, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.GridProductos, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.GridProductos.MasterTemplate, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'RadGroupBox3
        '
        Me.RadGroupBox3.AccessibleRole = System.Windows.Forms.AccessibleRole.Grouping
        Me.RadGroupBox3.Anchor = CType(((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
            Or System.Windows.Forms.AnchorStyles.Left), System.Windows.Forms.AnchorStyles)
        Me.RadGroupBox3.Controls.Add(Me.RadLabel1)
        Me.RadGroupBox3.Controls.Add(Me.uic_BuscaVta)
        Me.RadGroupBox3.Controls.Add(Me.uic_BuscaNroTrans)
        Me.RadGroupBox3.HeaderText = ""
        Me.RadGroupBox3.Location = New System.Drawing.Point(7, 4)
        Me.RadGroupBox3.Name = "RadGroupBox3"
        Me.RadGroupBox3.Size = New System.Drawing.Size(501, 63)
        Me.RadGroupBox3.TabIndex = 6
        Me.RadGroupBox3.ThemeName = "Office2010Black"
        '
        'RadLabel1
        '
        Me.RadLabel1.Font = New System.Drawing.Font("Segoe UI", 12.0!, System.Drawing.FontStyle.Bold)
        Me.RadLabel1.Location = New System.Drawing.Point(15, 16)
        Me.RadLabel1.Name = "RadLabel1"
        Me.RadLabel1.Size = New System.Drawing.Size(109, 25)
        Me.RadLabel1.TabIndex = 88
        Me.RadLabel1.Text = "Buscar Venta"
        '
        'uic_BuscaVta
        '
        Me.uic_BuscaVta.Image = Global.delevery.My.Resources.Resources.magnifier
        Me.uic_BuscaVta.Location = New System.Drawing.Point(376, 13)
        Me.uic_BuscaVta.Name = "uic_BuscaVta"
        Me.uic_BuscaVta.Size = New System.Drawing.Size(33, 32)
        Me.uic_BuscaVta.TabIndex = 87
        '
        'uic_BuscaNroTrans
        '
        Me.uic_BuscaNroTrans.Font = New System.Drawing.Font("Segoe UI", 11.0!, System.Drawing.FontStyle.Bold)
        Me.uic_BuscaNroTrans.Location = New System.Drawing.Point(137, 19)
        Me.uic_BuscaNroTrans.Name = "uic_BuscaNroTrans"
        Me.uic_BuscaNroTrans.Size = New System.Drawing.Size(201, 25)
        Me.uic_BuscaNroTrans.TabIndex = 4
        Me.uic_BuscaNroTrans.ThemeName = "ControlDefault"
        '
        'RadGroupBox1
        '
        Me.RadGroupBox1.AccessibleRole = System.Windows.Forms.AccessibleRole.Grouping
        Me.RadGroupBox1.Controls.Add(Me.GridVenta)
        Me.RadGroupBox1.HeaderText = ""
        Me.RadGroupBox1.Location = New System.Drawing.Point(6, 69)
        Me.RadGroupBox1.Name = "RadGroupBox1"
        Me.RadGroupBox1.Size = New System.Drawing.Size(501, 392)
        Me.RadGroupBox1.TabIndex = 8
        Me.RadGroupBox1.ThemeName = "Office2010Black"
        '
        'GridVenta
        '
        Me.GridVenta.Anchor = CType((((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
            Or System.Windows.Forms.AnchorStyles.Left) _
            Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.GridVenta.BackColor = System.Drawing.SystemColors.Control
        Me.GridVenta.Cursor = System.Windows.Forms.Cursors.Default
        Me.GridVenta.Font = New System.Drawing.Font("Segoe UI", 8.25!)
        Me.GridVenta.ForeColor = System.Drawing.SystemColors.ControlText
        Me.GridVenta.ImeMode = System.Windows.Forms.ImeMode.NoControl
        Me.GridVenta.Location = New System.Drawing.Point(5, 9)
        '
        '
        '
        Me.GridVenta.MasterTemplate.AllowAddNewRow = False
        Me.GridVenta.MasterTemplate.AllowColumnReorder = False
        SortDescriptor9.PropertyName = "column1"
        Me.GridVenta.MasterTemplate.SortDescriptors.AddRange(New Telerik.WinControls.Data.SortDescriptor() {SortDescriptor9})
        Me.GridVenta.MasterTemplate.ViewDefinition = TableViewDefinition12
        Me.GridVenta.Name = "GridVenta"
        Me.GridVenta.ReadOnly = True
        Me.GridVenta.RightToLeft = System.Windows.Forms.RightToLeft.No
        Me.GridVenta.ShowGroupPanel = False
        Me.GridVenta.Size = New System.Drawing.Size(491, 378)
        Me.GridVenta.TabIndex = 0
        Me.GridVenta.Text = "RadGridView1"
        Me.GridVenta.ThemeName = "Office2010Black"
        '
        'Panel_keypad
        '
        Me.Panel_keypad.Controls.Add(Me.uic_botonEnter)
        Me.Panel_keypad.Controls.Add(Me.uic_botonC)
        Me.Panel_keypad.Controls.Add(Me.uic_botonBack)
        Me.Panel_keypad.Controls.Add(Me.uic_botonPunto)
        Me.Panel_keypad.Controls.Add(Me.uic_boton3)
        Me.Panel_keypad.Controls.Add(Me.uic_boton6)
        Me.Panel_keypad.Controls.Add(Me.uic_boton9)
        Me.Panel_keypad.Controls.Add(Me.uic_botonAsterisco)
        Me.Panel_keypad.Controls.Add(Me.uic_boton2)
        Me.Panel_keypad.Controls.Add(Me.uic_boton5)
        Me.Panel_keypad.Controls.Add(Me.uic_boton8)
        Me.Panel_keypad.Controls.Add(Me.uic_boton0)
        Me.Panel_keypad.Controls.Add(Me.uic_boton1)
        Me.Panel_keypad.Controls.Add(Me.uic_boton4)
        Me.Panel_keypad.Controls.Add(Me.uic_boton7)
        Me.Panel_keypad.Location = New System.Drawing.Point(517, 317)
        Me.Panel_keypad.Name = "Panel_keypad"
        Me.Panel_keypad.Size = New System.Drawing.Size(345, 224)
        Me.Panel_keypad.TabIndex = 7
        '
        'uic_botonEnter
        '
        Me.uic_botonEnter.BackColor = System.Drawing.Color.FromArgb(CType(CType(128, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer))
        Me.uic_botonEnter.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.uic_botonEnter.Font = New System.Drawing.Font("Microsoft Sans Serif", 11.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.uic_botonEnter.Location = New System.Drawing.Point(241, 115)
        Me.uic_botonEnter.Name = "uic_botonEnter"
        Me.uic_botonEnter.Size = New System.Drawing.Size(60, 87)
        Me.uic_botonEnter.TabIndex = 72
        Me.uic_botonEnter.Text = "Enter"
        Me.uic_botonEnter.UseVisualStyleBackColor = False
        '
        'uic_botonC
        '
        Me.uic_botonC.BackColor = System.Drawing.Color.FromArgb(CType(CType(128, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer))
        Me.uic_botonC.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.uic_botonC.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.uic_botonC.Location = New System.Drawing.Point(241, 69)
        Me.uic_botonC.Name = "uic_botonC"
        Me.uic_botonC.Size = New System.Drawing.Size(60, 40)
        Me.uic_botonC.TabIndex = 71
        Me.uic_botonC.Text = "C"
        Me.uic_botonC.UseVisualStyleBackColor = False
        '
        'uic_botonBack
        '
        Me.uic_botonBack.BackColor = System.Drawing.Color.FromArgb(CType(CType(128, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer))
        Me.uic_botonBack.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.uic_botonBack.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.uic_botonBack.Location = New System.Drawing.Point(241, 23)
        Me.uic_botonBack.Name = "uic_botonBack"
        Me.uic_botonBack.Size = New System.Drawing.Size(60, 40)
        Me.uic_botonBack.TabIndex = 70
        Me.uic_botonBack.Text = "<--"
        Me.uic_botonBack.UseVisualStyleBackColor = False
        '
        'uic_botonPunto
        '
        Me.uic_botonPunto.BackColor = System.Drawing.Color.FromArgb(CType(CType(128, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer))
        Me.uic_botonPunto.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.uic_botonPunto.Font = New System.Drawing.Font("Microsoft Sans Serif", 15.75!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.uic_botonPunto.Location = New System.Drawing.Point(175, 158)
        Me.uic_botonPunto.Name = "uic_botonPunto"
        Me.uic_botonPunto.Size = New System.Drawing.Size(60, 42)
        Me.uic_botonPunto.TabIndex = 60
        Me.uic_botonPunto.Text = "."
        Me.uic_botonPunto.UseVisualStyleBackColor = False
        '
        'uic_boton3
        '
        Me.uic_boton3.BackColor = System.Drawing.Color.FromArgb(CType(CType(128, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer))
        Me.uic_boton3.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.uic_boton3.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.uic_boton3.Location = New System.Drawing.Point(175, 115)
        Me.uic_boton3.Name = "uic_boton3"
        Me.uic_boton3.Size = New System.Drawing.Size(60, 37)
        Me.uic_boton3.TabIndex = 63
        Me.uic_boton3.Text = "3"
        Me.uic_boton3.UseVisualStyleBackColor = False
        '
        'uic_boton6
        '
        Me.uic_boton6.BackColor = System.Drawing.Color.FromArgb(CType(CType(128, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer))
        Me.uic_boton6.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.uic_boton6.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.uic_boton6.Location = New System.Drawing.Point(175, 69)
        Me.uic_boton6.Name = "uic_boton6"
        Me.uic_boton6.Size = New System.Drawing.Size(60, 40)
        Me.uic_boton6.TabIndex = 66
        Me.uic_boton6.Text = "6"
        Me.uic_boton6.UseVisualStyleBackColor = False
        '
        'uic_boton9
        '
        Me.uic_boton9.BackColor = System.Drawing.Color.FromArgb(CType(CType(128, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer))
        Me.uic_boton9.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.uic_boton9.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.uic_boton9.Location = New System.Drawing.Point(175, 23)
        Me.uic_boton9.Name = "uic_boton9"
        Me.uic_boton9.Size = New System.Drawing.Size(60, 40)
        Me.uic_boton9.TabIndex = 69
        Me.uic_boton9.Text = "9"
        Me.uic_boton9.UseVisualStyleBackColor = False
        '
        'uic_botonAsterisco
        '
        Me.uic_botonAsterisco.BackColor = System.Drawing.Color.FromArgb(CType(CType(128, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer))
        Me.uic_botonAsterisco.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.uic_botonAsterisco.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.uic_botonAsterisco.Location = New System.Drawing.Point(109, 158)
        Me.uic_botonAsterisco.Name = "uic_botonAsterisco"
        Me.uic_botonAsterisco.Size = New System.Drawing.Size(60, 42)
        Me.uic_botonAsterisco.TabIndex = 59
        Me.uic_botonAsterisco.Text = "*"
        Me.uic_botonAsterisco.UseVisualStyleBackColor = False
        '
        'uic_boton2
        '
        Me.uic_boton2.BackColor = System.Drawing.Color.FromArgb(CType(CType(128, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer))
        Me.uic_boton2.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.uic_boton2.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.uic_boton2.Location = New System.Drawing.Point(109, 115)
        Me.uic_boton2.Name = "uic_boton2"
        Me.uic_boton2.Size = New System.Drawing.Size(60, 37)
        Me.uic_boton2.TabIndex = 62
        Me.uic_boton2.Text = "2"
        Me.uic_boton2.UseVisualStyleBackColor = False
        '
        'uic_boton5
        '
        Me.uic_boton5.BackColor = System.Drawing.Color.FromArgb(CType(CType(128, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer))
        Me.uic_boton5.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.uic_boton5.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.uic_boton5.Location = New System.Drawing.Point(109, 69)
        Me.uic_boton5.Name = "uic_boton5"
        Me.uic_boton5.Size = New System.Drawing.Size(60, 40)
        Me.uic_boton5.TabIndex = 65
        Me.uic_boton5.Text = "5"
        Me.uic_boton5.UseVisualStyleBackColor = False
        '
        'uic_boton8
        '
        Me.uic_boton8.BackColor = System.Drawing.Color.FromArgb(CType(CType(128, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer))
        Me.uic_boton8.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.uic_boton8.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.uic_boton8.Location = New System.Drawing.Point(109, 23)
        Me.uic_boton8.Name = "uic_boton8"
        Me.uic_boton8.Size = New System.Drawing.Size(60, 40)
        Me.uic_boton8.TabIndex = 68
        Me.uic_boton8.Text = "8"
        Me.uic_boton8.UseVisualStyleBackColor = False
        '
        'uic_boton0
        '
        Me.uic_boton0.BackColor = System.Drawing.Color.FromArgb(CType(CType(128, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer))
        Me.uic_boton0.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.uic_boton0.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.uic_boton0.Location = New System.Drawing.Point(43, 159)
        Me.uic_boton0.Name = "uic_boton0"
        Me.uic_boton0.Size = New System.Drawing.Size(60, 42)
        Me.uic_boton0.TabIndex = 58
        Me.uic_boton0.Text = "0"
        Me.uic_boton0.UseVisualStyleBackColor = False
        '
        'uic_boton1
        '
        Me.uic_boton1.BackColor = System.Drawing.Color.FromArgb(CType(CType(128, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer))
        Me.uic_boton1.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.uic_boton1.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.uic_boton1.Location = New System.Drawing.Point(43, 116)
        Me.uic_boton1.Name = "uic_boton1"
        Me.uic_boton1.Size = New System.Drawing.Size(60, 37)
        Me.uic_boton1.TabIndex = 61
        Me.uic_boton1.Text = "1"
        Me.uic_boton1.UseVisualStyleBackColor = False
        '
        'uic_boton4
        '
        Me.uic_boton4.BackColor = System.Drawing.Color.FromArgb(CType(CType(128, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer))
        Me.uic_boton4.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.uic_boton4.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.uic_boton4.Location = New System.Drawing.Point(43, 70)
        Me.uic_boton4.Name = "uic_boton4"
        Me.uic_boton4.Size = New System.Drawing.Size(60, 40)
        Me.uic_boton4.TabIndex = 64
        Me.uic_boton4.Text = "4"
        Me.uic_boton4.UseVisualStyleBackColor = False
        '
        'uic_boton7
        '
        Me.uic_boton7.BackColor = System.Drawing.Color.FromArgb(CType(CType(128, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer))
        Me.uic_boton7.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.uic_boton7.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.uic_boton7.Location = New System.Drawing.Point(43, 23)
        Me.uic_boton7.Name = "uic_boton7"
        Me.uic_boton7.Size = New System.Drawing.Size(60, 41)
        Me.uic_boton7.TabIndex = 67
        Me.uic_boton7.Text = "7"
        Me.uic_boton7.UseVisualStyleBackColor = False
        '
        'uic_Reloj
        '
        Me.uic_Reloj.Enabled = True
        Me.uic_Reloj.Interval = 1000
        '
        'Panel_cobro
        '
        Me.Panel_cobro.BackColor = System.Drawing.Color.FromArgb(CType(CType(252, Byte), Integer), CType(CType(235, Byte), Integer), CType(CType(217, Byte), Integer))
        Me.Panel_cobro.Controls.Add(Me.uic_Total)
        Me.Panel_cobro.Controls.Add(Me.Label8)
        Me.Panel_cobro.Location = New System.Drawing.Point(10, 465)
        Me.Panel_cobro.Name = "Panel_cobro"
        Me.Panel_cobro.Size = New System.Drawing.Size(497, 75)
        Me.Panel_cobro.TabIndex = 9
        '
        'uic_Total
        '
        Me.uic_Total.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.uic_Total.Font = New System.Drawing.Font("Microsoft Sans Serif", 14.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.uic_Total.ForeColor = System.Drawing.SystemColors.ControlText
        Me.uic_Total.Location = New System.Drawing.Point(332, 21)
        Me.uic_Total.Name = "uic_Total"
        Me.uic_Total.Size = New System.Drawing.Size(116, 26)
        Me.uic_Total.TabIndex = 17
        Me.uic_Total.Text = "0"
        Me.uic_Total.TextAlign = System.Drawing.ContentAlignment.TopRight
        '
        'Label8
        '
        Me.Label8.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.Label8.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label8.ForeColor = System.Drawing.SystemColors.ControlText
        Me.Label8.Location = New System.Drawing.Point(11, 21)
        Me.Label8.Name = "Label8"
        Me.Label8.Size = New System.Drawing.Size(126, 26)
        Me.Label8.TabIndex = 4
        Me.Label8.Text = "Total a pagar"
        '
        'uic_botonF6
        '
        Me.uic_botonF6.Anchor = CType((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.uic_botonF6.BackColor = System.Drawing.Color.Magenta
        Me.uic_botonF6.FlatStyle = System.Windows.Forms.FlatStyle.Popup
        Me.uic_botonF6.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.uic_botonF6.Location = New System.Drawing.Point(868, 396)
        Me.uic_botonF6.Name = "uic_botonF6"
        Me.uic_botonF6.Size = New System.Drawing.Size(92, 35)
        Me.uic_botonF6.TabIndex = 81
        Me.uic_botonF6.Text = "F6"
        Me.uic_botonF6.UseVisualStyleBackColor = False
        '
        'uic_botonF1
        '
        Me.uic_botonF1.Anchor = CType((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.uic_botonF1.BackColor = System.Drawing.Color.LightGreen
        Me.uic_botonF1.FlatStyle = System.Windows.Forms.FlatStyle.Popup
        Me.uic_botonF1.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.uic_botonF1.Location = New System.Drawing.Point(868, 357)
        Me.uic_botonF1.Name = "uic_botonF1"
        Me.uic_botonF1.Size = New System.Drawing.Size(92, 35)
        Me.uic_botonF1.TabIndex = 80
        Me.uic_botonF1.Text = "F1"
        Me.uic_botonF1.TextAlign = System.Drawing.ContentAlignment.TopCenter
        Me.uic_botonF1.UseVisualStyleBackColor = False
        '
        'uic_ValeBotella
        '
        Me.uic_ValeBotella.Anchor = CType((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.uic_ValeBotella.BackColor = System.Drawing.Color.FromArgb(CType(CType(128, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer))
        Me.uic_ValeBotella.FlatStyle = System.Windows.Forms.FlatStyle.Popup
        Me.uic_ValeBotella.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.uic_ValeBotella.Location = New System.Drawing.Point(868, 474)
        Me.uic_ValeBotella.Name = "uic_ValeBotella"
        Me.uic_ValeBotella.Size = New System.Drawing.Size(92, 35)
        Me.uic_ValeBotella.TabIndex = 79
        Me.uic_ValeBotella.Text = "F5 Vale"
        Me.uic_ValeBotella.UseVisualStyleBackColor = False
        '
        'uic_BotonF4
        '
        Me.uic_BotonF4.Anchor = CType((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.uic_BotonF4.BackColor = System.Drawing.Color.FromArgb(CType(CType(128, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer))
        Me.uic_BotonF4.FlatStyle = System.Windows.Forms.FlatStyle.Popup
        Me.uic_BotonF4.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.uic_BotonF4.Location = New System.Drawing.Point(868, 435)
        Me.uic_BotonF4.Name = "uic_BotonF4"
        Me.uic_BotonF4.Size = New System.Drawing.Size(92, 35)
        Me.uic_BotonF4.TabIndex = 78
        Me.uic_BotonF4.Text = "F4"
        Me.uic_BotonF4.UseVisualStyleBackColor = False
        '
        'uic_salir
        '
        Me.uic_salir.Anchor = CType((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.uic_salir.BackColor = System.Drawing.Color.FromArgb(CType(CType(244, Byte), Integer), CType(CType(206, Byte), Integer), CType(CType(212, Byte), Integer))
        Me.uic_salir.FlatStyle = System.Windows.Forms.FlatStyle.Popup
        Me.uic_salir.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.uic_salir.Location = New System.Drawing.Point(868, 513)
        Me.uic_salir.Name = "uic_salir"
        Me.uic_salir.Size = New System.Drawing.Size(92, 26)
        Me.uic_salir.TabIndex = 77
        Me.uic_salir.Text = "SALIR"
        Me.uic_salir.UseCompatibleTextRendering = True
        Me.uic_salir.UseVisualStyleBackColor = False
        '
        'uic_botonF2
        '
        Me.uic_botonF2.Anchor = CType((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.uic_botonF2.BackColor = System.Drawing.Color.Red
        Me.uic_botonF2.FlatStyle = System.Windows.Forms.FlatStyle.Popup
        Me.uic_botonF2.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.uic_botonF2.Location = New System.Drawing.Point(868, 318)
        Me.uic_botonF2.Name = "uic_botonF2"
        Me.uic_botonF2.Size = New System.Drawing.Size(92, 35)
        Me.uic_botonF2.TabIndex = 76
        Me.uic_botonF2.Text = "Efectivo"
        Me.uic_botonF2.UseVisualStyleBackColor = False
        '
        'RadStatusStrip1
        '
        Me.RadStatusStrip1.Items.AddRange(New Telerik.WinControls.RadItem() {Me.uic_Nrotransaccion, Me.uic_FechaHora, Me.CommandBarSeparator1, Me.uic_VersionApp})
        Me.RadStatusStrip1.Location = New System.Drawing.Point(0, 545)
        Me.RadStatusStrip1.Name = "RadStatusStrip1"
        Me.RadStatusStrip1.Size = New System.Drawing.Size(972, 22)
        Me.RadStatusStrip1.TabIndex = 82
        Me.RadStatusStrip1.Text = "RadStatusStrip1"
        Me.RadStatusStrip1.ThemeName = "Office2010Black"
        '
        'uic_Nrotransaccion
        '
        Me.uic_Nrotransaccion.Name = "uic_Nrotransaccion"
        Me.RadStatusStrip1.SetSpring(Me.uic_Nrotransaccion, False)
        Me.uic_Nrotransaccion.Text = "Nro transaccion"
        Me.uic_Nrotransaccion.TextWrap = True
        '
        'uic_FechaHora
        '
        Me.uic_FechaHora.Name = "uic_FechaHora"
        Me.RadStatusStrip1.SetSpring(Me.uic_FechaHora, False)
        Me.uic_FechaHora.Text = "Fecha/Hora"
        Me.uic_FechaHora.TextWrap = True
        '
        'CommandBarSeparator1
        '
        Me.CommandBarSeparator1.DisabledTextRenderingHint = System.Drawing.Text.TextRenderingHint.SystemDefault
        Me.CommandBarSeparator1.Name = "CommandBarSeparator1"
        Me.RadStatusStrip1.SetSpring(Me.CommandBarSeparator1, False)
        Me.CommandBarSeparator1.TextRenderingHint = System.Drawing.Text.TextRenderingHint.SystemDefault
        Me.CommandBarSeparator1.VisibleInOverflowMenu = False
        '
        'uic_VersionApp
        '
        Me.uic_VersionApp.Name = "uic_VersionApp"
        Me.RadStatusStrip1.SetSpring(Me.uic_VersionApp, False)
        Me.uic_VersionApp.Text = "VersionApp"
        Me.uic_VersionApp.TextWrap = True
        '
        'RadGroupBox2
        '
        Me.RadGroupBox2.AccessibleRole = System.Windows.Forms.AccessibleRole.Grouping
        Me.RadGroupBox2.Anchor = CType(((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
            Or System.Windows.Forms.AnchorStyles.Left), System.Windows.Forms.AnchorStyles)
        Me.RadGroupBox2.Controls.Add(Me.RadLabel13)
        Me.RadGroupBox2.Controls.Add(Me.uic_BuscaArticulo)
        Me.RadGroupBox2.Controls.Add(Me.uic_BuscarProducto)
        Me.RadGroupBox2.Controls.Add(Me.GridProductos)
        Me.RadGroupBox2.HeaderText = ""
        Me.RadGroupBox2.Location = New System.Drawing.Point(514, 4)
        Me.RadGroupBox2.Name = "RadGroupBox2"
        Me.RadGroupBox2.Size = New System.Drawing.Size(450, 308)
        Me.RadGroupBox2.TabIndex = 83
        Me.RadGroupBox2.ThemeName = "Office2010Black"
        '
        'RadLabel13
        '
        Me.RadLabel13.AutoSize = False
        Me.RadLabel13.Font = New System.Drawing.Font("Segoe UI", 11.0!, System.Drawing.FontStyle.Bold)
        Me.RadLabel13.Location = New System.Drawing.Point(171, 5)
        Me.RadLabel13.Name = "RadLabel13"
        Me.RadLabel13.Size = New System.Drawing.Size(126, 18)
        Me.RadLabel13.TabIndex = 88
        Me.RadLabel13.Text = "Buscar Articulo"
        '
        'uic_BuscaArticulo
        '
        Me.uic_BuscaArticulo.Image = Global.delevery.My.Resources.Resources.magnifier
        Me.uic_BuscaArticulo.Location = New System.Drawing.Point(352, 15)
        Me.uic_BuscaArticulo.Name = "uic_BuscaArticulo"
        Me.uic_BuscaArticulo.Size = New System.Drawing.Size(33, 32)
        Me.uic_BuscaArticulo.TabIndex = 87
        '
        'uic_BuscarProducto
        '
        Me.uic_BuscarProducto.Location = New System.Drawing.Point(65, 27)
        Me.uic_BuscarProducto.Name = "uic_BuscarProducto"
        Me.uic_BuscarProducto.Size = New System.Drawing.Size(274, 20)
        Me.uic_BuscarProducto.TabIndex = 4
        Me.uic_BuscarProducto.ThemeName = "ControlDefault"
        '
        'GridProductos
        '
        Me.GridProductos.Anchor = CType((((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
            Or System.Windows.Forms.AnchorStyles.Left) _
            Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.GridProductos.Location = New System.Drawing.Point(5, 55)
        '
        '
        '
        Me.GridProductos.MasterTemplate.AllowAddNewRow = False
        Me.GridProductos.MasterTemplate.AllowColumnReorder = False
        Me.GridProductos.MasterTemplate.ViewDefinition = TableViewDefinition13
        Me.GridProductos.Name = "GridProductos"
        Me.GridProductos.ReadOnly = True
        Me.GridProductos.Size = New System.Drawing.Size(437, 245)
        Me.GridProductos.TabIndex = 0
        Me.GridProductos.Text = "RadGridView2"
        Me.GridProductos.ThemeName = "Office2010Black"
        '
        'FrmCaja
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(972, 567)
        Me.ControlBox = False
        Me.Controls.Add(Me.RadGroupBox2)
        Me.Controls.Add(Me.RadStatusStrip1)
        Me.Controls.Add(Me.uic_botonF6)
        Me.Controls.Add(Me.uic_botonF1)
        Me.Controls.Add(Me.uic_ValeBotella)
        Me.Controls.Add(Me.uic_BotonF4)
        Me.Controls.Add(Me.uic_salir)
        Me.Controls.Add(Me.uic_botonF2)
        Me.Controls.Add(Me.Panel_cobro)
        Me.Controls.Add(Me.RadGroupBox3)
        Me.Controls.Add(Me.RadGroupBox1)
        Me.Controls.Add(Me.Panel_keypad)
        Me.Name = "FrmCaja"
        Me.Text = "FrmCaja"
        CType(Me.RadGroupBox3, System.ComponentModel.ISupportInitialize).EndInit()
        Me.RadGroupBox3.ResumeLayout(False)
        Me.RadGroupBox3.PerformLayout()
        CType(Me.RadLabel1, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.uic_BuscaVta, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.uic_BuscaNroTrans, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.RadGroupBox1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.RadGroupBox1.ResumeLayout(False)
        CType(Me.GridVenta.MasterTemplate, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.GridVenta, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.Panel_keypad, System.ComponentModel.ISupportInitialize).EndInit()
        Me.Panel_keypad.ResumeLayout(False)
        CType(Me.Panel_cobro, System.ComponentModel.ISupportInitialize).EndInit()
        Me.Panel_cobro.ResumeLayout(False)
        CType(Me.RadStatusStrip1, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.RadGroupBox2, System.ComponentModel.ISupportInitialize).EndInit()
        Me.RadGroupBox2.ResumeLayout(False)
        Me.RadGroupBox2.PerformLayout()
        CType(Me.RadLabel13, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.uic_BuscaArticulo, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.uic_BuscarProducto, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.GridProductos.MasterTemplate, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.GridProductos, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents RadGroupBox3 As Telerik.WinControls.UI.RadGroupBox
    Friend WithEvents RadLabel1 As Telerik.WinControls.UI.RadLabel
    Friend WithEvents uic_BuscaVta As Telerik.WinControls.UI.RadButton
    Friend WithEvents uic_BuscaNroTrans As Telerik.WinControls.UI.RadTextBox
    Friend WithEvents RadGroupBox1 As Telerik.WinControls.UI.RadGroupBox
    Friend WithEvents GridVenta As Telerik.WinControls.UI.RadGridView
    Friend WithEvents Panel_keypad As Telerik.WinControls.UI.RadPanel
    Friend WithEvents uic_botonEnter As System.Windows.Forms.Button
    Friend WithEvents uic_botonC As System.Windows.Forms.Button
    Friend WithEvents uic_botonBack As System.Windows.Forms.Button
    Friend WithEvents uic_botonPunto As System.Windows.Forms.Button
    Friend WithEvents uic_boton3 As System.Windows.Forms.Button
    Friend WithEvents uic_boton6 As System.Windows.Forms.Button
    Friend WithEvents uic_boton9 As System.Windows.Forms.Button
    Friend WithEvents uic_botonAsterisco As System.Windows.Forms.Button
    Friend WithEvents uic_boton2 As System.Windows.Forms.Button
    Friend WithEvents uic_boton5 As System.Windows.Forms.Button
    Friend WithEvents uic_boton8 As System.Windows.Forms.Button
    Friend WithEvents uic_boton0 As System.Windows.Forms.Button
    Friend WithEvents uic_boton1 As System.Windows.Forms.Button
    Friend WithEvents uic_boton4 As System.Windows.Forms.Button
    Friend WithEvents uic_boton7 As System.Windows.Forms.Button
    Friend WithEvents Office2010BlackTheme1 As Telerik.WinControls.Themes.Office2010BlackTheme
    Friend WithEvents uic_Reloj As System.Windows.Forms.Timer
    Friend WithEvents Panel_cobro As Telerik.WinControls.UI.RadPanel
    Friend WithEvents uic_Total As System.Windows.Forms.Label
    Friend WithEvents Label8 As System.Windows.Forms.Label
    Friend WithEvents uic_botonF6 As System.Windows.Forms.Button
    Friend WithEvents uic_botonF1 As System.Windows.Forms.Button
    Friend WithEvents uic_ValeBotella As System.Windows.Forms.Button
    Friend WithEvents uic_BotonF4 As System.Windows.Forms.Button
    Friend WithEvents uic_salir As System.Windows.Forms.Button
    Friend WithEvents uic_botonF2 As System.Windows.Forms.Button
    Friend WithEvents RadStatusStrip1 As Telerik.WinControls.UI.RadStatusStrip
    Friend WithEvents uic_Nrotransaccion As Telerik.WinControls.UI.RadLabelElement
    Friend WithEvents uic_FechaHora As Telerik.WinControls.UI.RadLabelElement
    Friend WithEvents CommandBarSeparator1 As Telerik.WinControls.UI.CommandBarSeparator
    Friend WithEvents uic_VersionApp As Telerik.WinControls.UI.RadLabelElement
    Friend WithEvents RadGroupBox2 As Telerik.WinControls.UI.RadGroupBox
    Friend WithEvents RadLabel13 As Telerik.WinControls.UI.RadLabel
    Friend WithEvents uic_BuscaArticulo As Telerik.WinControls.UI.RadButton
    Friend WithEvents uic_BuscarProducto As Telerik.WinControls.UI.RadTextBox
    Friend WithEvents GridProductos As Telerik.WinControls.UI.RadGridView
End Class
