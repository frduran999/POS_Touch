﻿Imports ProyectoService
Public Class Reporte
    Public Function Rpt_StockCritico() As DataTable
        Dim dt As New DataTable
        Dim b As New ReporteService
        dt = b.Rpt_StockCritico
        Return dt
    End Function
    Public Function ReporteProducto() As DataTable
        Dim dt As New DataTable
        Dim b As New ReporteService
        dt = b.ReporteProducto
        Return dt
    End Function

    Public Function RptVentasDiarias(ByVal FechaIni As String, ByVal FechaFin As String) As DataTable
        Dim dt As New DataTable
        Dim b As New ReporteService
        dt = b.RptVentasDiarias(FechaIni, FechaFin)
        Return dt
    End Function
    Public Function Rpt_Ticket(idventa As Integer) As DataSet
        Dim dt As New DataSet
        Dim b As New ReporteService
        dt = b.Rpt_Ticket(idventa)
        Return dt
    End Function
    Public Function Rpt_Boleta(idventa As Integer) As DataSet
        Dim dt As New DataSet
        Dim b As New ReporteService
        dt = b.Rpt_Boleta(idventa)
        Return dt
    End Function
    Public Function Rpt_CierreCaja(ByVal IdUsuario As Integer, ByVal IdCaja As Integer) As DataSet
        Dim dt As New DataSet
        Dim b As New ReporteService
        dt = b.Rpt_CierreCaja(IdUsuario, IdCaja)
        Return dt
    End Function
    Public Function GetImpresoraTicket() As String
        Dim dt As String = ""
        Dim b As New ReporteService
        dt = b.GetImpresoraTicket
        Return dt
    End Function
    Public Function GetImpresoraBoleta() As String
        Dim dt As String = ""
        Dim b As New ReporteService
        dt = b.GetImpresoraBoleta
        Return dt
    End Function
    Public Function Rpt_TicketFamilia(ByVal idventa As Integer) As DataTable
        Dim dt As New DataTable
        Dim b As New ReporteService
        dt = b.Rpt_TicketFamilia(idventa)
        Return dt
    End Function
    Public Function RPT_Productos(ByVal FechaIni As String, ByVal FechaFin As String, ByVal usuario As String) As DataTable
        Dim dt As New DataTable
        Dim b As New ReporteService
        dt = b.RPT_Productos(FechaIni, FechaFin, usuario)
        Return dt
    End Function
    Public Function RPT_Ventas_X_Usuario(ByVal FechaIni As String, ByVal FechaFin As String, ByVal usuario As String) As DataTable
        Dim dt As New DataTable
        Dim b As New ReporteService
        dt = b.RPT_Ventas_X_Usuario(FechaIni, FechaFin, usuario)
        Return dt
    End Function
End Class
