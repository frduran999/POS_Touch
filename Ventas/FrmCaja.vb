Imports System.Configuration
Imports ProyectoNegocio

Public Class FrmCaja

    Private _IdCajero As Integer

    Public Property IdCajero As String
        Get
            Return _IdCajero
        End Get
        Set(ByVal value As String)
            _IdCajero = value
        End Set
    End Property



    Private Sub FrmCaja_KeyDown(sender As Object, e As KeyEventArgs) Handles Me.KeyDown
        Select Case e.KeyValue
            Case Keys.F1
                uic_botonF2_Click(Nothing, Nothing)
            Case Keys.F2
                uic_botonF1_Click(Nothing, Nothing)
            Case Keys.F3
                uic_BotonF4_Click(Nothing, Nothing)
            Case Keys.F4
                btn_aceptar_Click(Nothing, Nothing)
        End Select
    End Sub

    Private Sub FrmCaja_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Me.uic_botonF1.Text = "F2" & vbCrLf & "Tarjeta"
        Me.uic_botonF2.Text = "F1" & vbCrLf & "Efectivo"
        Me.uic_BotonF4.Text = "F3" & vbCrLf & "Adm Caja"
        Me.uic_VersionApp.Text = "APP: " & System.Reflection.Assembly.GetExecutingAssembly.GetName.Version.Major & "." & System.Reflection.Assembly.GetExecutingAssembly.GetName.Version.Minor & "." & System.Reflection.Assembly.GetExecutingAssembly.GetName.Version.Build
    End Sub

    Private Sub uic_botonF2_Click(sender As Object, e As EventArgs) Handles uic_botonF2.Click
        Dim IdPago As Integer = 1
        Dim TipoPago = "Efectivo"
        txt_efectivo.Enabled = True
        Me.txt_efectivo.Text = ""
        Me.txt_efectivo.Focus()
        Me.txt_vuelto.Text = Val(Me.txt_efectivo.Text) - Val(Me.txt_Total.Text)
    End Sub

    Private Sub txt_efectivo_KeyPress(ByVal sender As Object, ByVal e As System.Windows.Forms.KeyPressEventArgs) Handles txt_efectivo.KeyPress
        Dim valida As String = "0123456789" & Convert.ToChar(8)
        If (valida.Contains("" + e.KeyChar)) Then
            e.Handled = False
        Else
            e.Handled = True
        End If
        If e.KeyChar = ChrW(Keys.Enter) Then
            e.Handled = True
            SendKeys.Send("{TAB}")
            Me.txt_vuelto.Text = Val(Me.txt_efectivo.Text) - Val(Me.txt_Total.Text)
        End If

    End Sub

    Private Sub uic_botonF1_Click(sender As Object, e As EventArgs) Handles uic_botonF1.Click
        Dim IdPago As Integer = 2
        Dim TipoPago = "Tarjeta"
        Me.txt_efectivo.Enabled = False
        Me.txt_efectivo.Text = Me.txt_Total.Text
        Me.txt_vuelto.Text = "0"
    End Sub

    Private Sub uic_botonF6_Click(sender As Object, e As EventArgs)

    End Sub

    Private Sub uic_BotonF4_Click(sender As Object, e As EventArgs) Handles uic_BotonF4.Click
        Dim frmCaja As New AdminCaja
        frmCaja.ShowDialog()
    End Sub

    Private Sub uic_ValeBotella_Click(sender As Object, e As EventArgs)

    End Sub

    Private Sub btn_salir_Click(sender As Object, e As EventArgs) Handles btn_salir.Click
        Me.Hide()
    End Sub

    Private Sub btn_aceptar_Click(sender As Object, e As EventArgs) Handles btn_aceptar.Click

    End Sub

    Private Sub uic_BuscaVta_Click(sender As Object, e As EventArgs) Handles uic_BuscaVta.Click
        Dim dt As New DataTable
        Dim IdTicket As Integer = 0
        Dim precio As Integer = 0
        Dim codigo_item As String = ""
        Dim cantidad As Integer = 0
        Dim articulo As String = ""
        Dim Total As Integer = 0
        Dim neg As New VentaCaja
        IdTicket = Me.IdTicket.Text

        dt = neg.GetVentaTicket(IdTicket)
        If dt.Rows.Count > 0 Then
            For Each valor As DataRow In dt.Rows
                precio = Val(valor("precio"))
                codigo_item = valor("id_producto")
                cantidad = valor("cantidad")
                articulo = valor("descripcion")
                Total = valor("total")
                Me.DataGridView1.Rows.Add(codigo_item.Trim, cantidad, articulo.Trim, precio, Total)
            Next
        Else
            Me.DataGridView1.DataSource = Nothing
        End If
        calculo_total_venta()
        
    End Sub

    Private Sub txt_efectivo_TextChanged(sender As Object, e As EventArgs) Handles txt_efectivo.TextChanged
        Me.txt_vuelto.Text = Val(Me.txt_efectivo.Text) - Val(Me.txt_Total.Text)
    End Sub

    Private Sub DataGridView1_CellContentClick(sender As Object, e As DataGridViewCellEventArgs) Handles DataGridView1.CellContentClick
        Try
            If DataGridView1.RowCount > 0 Then
                If DataGridView1.Columns(e.ColumnIndex).Name = "Eliminar" Then
                    DataGridView1.Rows.RemoveAt(e.RowIndex)
                    calculo_total_venta()
                End If
            End If
        Catch ex As Exception

        End Try
    End Sub

    Private Sub calculo_total_venta()
        Dim total As Integer
        For i As Integer = 0 To Me.DataGridView1.Rows.Count - 1
            total += Me.DataGridView1.Rows(i).Cells(4).Value
        Next
        Me.txt_Total.Text = total
    End Sub
End Class