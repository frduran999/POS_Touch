Imports ProyectoNegocio

Public Class Rpt_ticket
    Private _idventa As Integer
    Public Property idventa As Integer
        Get
            Return _idventa
        End Get
        Set(value As Integer)
            _idventa = value
        End Set
    End Property
    Private Sub Rpt_ticket_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Cargar()
    End Sub
    Private Sub Cargar()
        Me.Cursor = Cursors.WaitCursor
        Try
            Dim rpt As New RptTicket
            Dim data As New deliveryDataSet1
            Dim Neg As New Reporte
            Dim dt As New DataSet

            dt = Neg.Rpt_Ticket(idventa)
            If (dt.Tables(0).Rows.Count > 0) Then
                For Each item As DataRow In dt.Tables(0).Rows
                    Try
                        data.Rpt_Ventas.Rows.Add(item(0), item(1), item(2), item(3), item(4), item(5), item(6), item(7))
                    Catch ex As Exception
                        MsgBox(ex.Message & vbCr & ex.StackTrace)
                    End Try
                Next
                For Each dato As DataRow In dt.Tables(1).Rows
                    data.parametros.Rows.Add(dato(0), dato(1), dato(2), dato(3), dato(4))
                Next
                Try
                    rpt.SetDataSource(data)
                    rpt.PrintOptions.PrinterName = "PDF24"
                    rpt.PrintToPrinter(1, False, 0, 0)

                    rpt.PrintOptions.PrinterName = "PDF24"
                    rpt.PrintToPrinter(1, False, 0, 0)

                    rpt.PrintOptions.PrinterName = "PDF24"
                    rpt.PrintToPrinter(1, False, 0, 0)
                    ' CrystalReportViewer1.ReportSource = rpt
                Catch ex As Exception

                End Try
                
            Else
                Telerik.WinControls.RadMessageBox.Show(Me, "No se encontraron datos", "Alerta")
                Me.Close()
            End If
        Catch ex As Exception
        End Try
        Me.Cursor = Cursors.Default
    End Sub

    Private Sub RadMenuItem1_Click(sender As Object, e As EventArgs) Handles RadMenuItem1.Click
        Me.Close()
    End Sub

    Private Sub RadMenuItem2_Click(sender As Object, e As EventArgs) Handles RadMenuItem2.Click
        Me.WindowState = FormWindowState.Minimized
    End Sub
End Class