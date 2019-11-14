Imports ProyectoNegocio

Public Class CierreCaja
    Private _idUsuario As Integer
    Private _idcaja As Integer

    Public Property IdUsuario As Integer
        Get
            Return _idUsuario
        End Get
        Set(value As Integer)
            _idUsuario = value
        End Set
    End Property

    Public Property IdCaja As Integer
        Get
            Return _idcaja
        End Get
        Set(value As Integer)
            _idcaja = value
        End Set
    End Property
    Private Sub CierreCaja_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Cargar()
    End Sub
    Private Sub Cargar()
        Me.Cursor = Cursors.WaitCursor
        Try
            Dim rpt As New Rpt_CierreCaja
            Dim data As New dts_Caja
            Dim Neg As New Reporte
            Dim dt As New DataSet

            dt = Neg.Rpt_CierreCaja(IdUsuario, IdCaja)
            'dt = Neg.Rpt_CierreCaja(2, 19)
            If (dt.Tables(0).Rows.Count > 0) Then

                For Each Item As DataRow In dt.Tables(0).Rows
                    Try
                        data.caja.Rows.Add(Item(0), Item(1), Item(2), Item(3), Item(4), Item(5), Item(6))
                    Catch ex As Exception
                    End Try
                Next

                If (dt.Tables(1).Rows.Count > 0) Then
                    For Each item As DataRow In dt.Tables(1).Rows
                        Try
                            data.cabecera.Rows.Add(item(0), item(1), item(2), item(3), item(4), item(5), item(6))
                        Catch ex As Exception
                        End Try
                    Next

                End If

                If (dt.Tables(2).Rows.Count > 0) Then
                    For Each item As DataRow In dt.Tables(2).Rows
                        Try
                            data.retirocaja.Rows.Add(item(0), item(1), item(2), item(3), item(4))
                        Catch ex As Exception
                        End Try
                    Next
                End If

            rpt.SetDataSource(data)
            CrystalReportViewer1.ReportSource = rpt

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