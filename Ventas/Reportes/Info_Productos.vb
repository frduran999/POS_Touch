Imports ProyectoNegocio
Imports CrystalDecisions.Shared

Public Class Info_Productos
    Private _fechaini As String
    Private _fechafin As String
    Private _usuario As Integer

    Public Property FechaIni As String
        Get
            Return _fechaini
        End Get
        Set(ByVal value As String)
            _fechaini = value
        End Set
    End Property

    Public Property FechaFin As String
        Get
            Return _fechafin
        End Get
        Set(ByVal value As String)
            _fechafin = value
        End Set
    End Property

    Public Property Usuario As String
        Get
            Return _usuario
        End Get
        Set(ByVal value As String)
            _usuario = value
        End Set
    End Property
    Private Sub Info_Productos_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Cargar()
    End Sub
    Private Sub Cargar()
        Me.Cursor = Cursors.WaitCursor
        Try
            '  Dim Reporte As New RPT_DiasPanne
            Dim Param As New ParameterValues
            Dim myDiscreteValue As New ParameterDiscreteValue
            Dim data As New dts_Ventas
            Dim Neg As New Reporte
            Dim dt As New DataTable
            dt = Neg.RPT_Productos(FechaIni, FechaFin, Usuario)
            If dt.Rows.Count > 0 Then
                For Each item As DataRow In dt.Rows
                    Try
                        'data.RPT_DiasPanne.Rows.Add(item(0), item(1), item(2), item(3), item(4), item(5), item(6))
                    Catch ex As Exception
                    End Try
                Next

                ' Reporte.SetDataSource(data)
                Param.Clear()
                myDiscreteValue.Value = FechaIni.Substring(8, 2) & "-" & FechaIni.Substring(5, 2) & "-" & FechaIni.Substring(0, 4)
                Param.Add(myDiscreteValue)
                'Reporte.DataDefinition.ParameterFields("FechaIni").ApplyCurrentValues(Param)

                Param.Clear()
                myDiscreteValue.Value = FechaFin.Substring(8, 2) & "-" & FechaFin.Substring(5, 2) & "-" & FechaFin.Substring(0, 4)
                Param.Add(myDiscreteValue)
                ' Reporte.DataDefinition.ParameterFields("FechaFin").ApplyCurrentValues(Param)
                '  CrystalReportViewer1.ReportSource = Reporte

            Else
                Telerik.WinControls.RadMessageBox.Show(Me, "No se encontraron datos", "Aviso")
                Me.Close()
            End If
        Catch ex As Exception
        End Try
        Me.Cursor = Cursors.Default
    End Sub
    Private Sub RadMenuItem2_Click(sender As Object, e As EventArgs) Handles RadMenuItem2.Click
        Me.WindowState = FormWindowState.Minimized
    End Sub

    Private Sub RadMenuItem1_Click(sender As Object, e As EventArgs) Handles RadMenuItem1.Click
        Me.Close()
    End Sub
End Class