Imports System.Configuration

Public Class FrmCaja

    Private Sub FrmCaja_KeyDown(sender As Object, e As KeyEventArgs) Handles Me.KeyDown
        Select Case e.KeyValue
            Case Keys.F1
                uic_botonF1_Click(Nothing, Nothing)
            Case Keys.F2
                uic_botonF2_Click(Nothing, Nothing)
            Case Keys.F4
                uic_BotonF4_Click(Nothing, Nothing)
            Case Keys.F5
                uic_ValeBotella_Click(Nothing, Nothing)
            Case Keys.F6
                uic_botonF6_Click(Nothing, Nothing)
        End Select
    End Sub

    Private Sub FrmCaja_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Me.uic_botonF1.Text = "F1" & vbCrLf & "Tarjeta"
        Me.uic_botonF2.Text = "F2" & vbCrLf & "Efectivo"

        Me.uic_BotonF4.Text = "F4" & vbCrLf & "Adm Caja"
        Me.uic_ValeBotella.Text = "F5" & vbCrLf & "Vale Env."
        Me.uic_botonF6.Text = "F6" & vbCrLf & "Oferta"

        Me.uic_VersionApp.Text = "APP: " & System.Reflection.Assembly.GetExecutingAssembly.GetName.Version.Major & "." & System.Reflection.Assembly.GetExecutingAssembly.GetName.Version.Minor & "." & System.Reflection.Assembly.GetExecutingAssembly.GetName.Version.Build

        Dim bmp As System.Drawing.Bitmap = System.Drawing.Image.FromFile(ConfigurationManager.AppSettings("logo").ToString(), True)
        Dim ico As System.Drawing.Icon = System.Drawing.Icon.FromHandle(bmp.GetHicon())
        Me.Icon = ico
    End Sub

    Private Sub uic_botonF2_Click(sender As Object, e As EventArgs) Handles uic_botonF2.Click

    End Sub

    Private Sub uic_botonF1_Click(sender As Object, e As EventArgs) Handles uic_botonF1.Click

    End Sub

    Private Sub uic_botonF6_Click(sender As Object, e As EventArgs) Handles uic_botonF6.Click

    End Sub

    Private Sub uic_BotonF4_Click(sender As Object, e As EventArgs) Handles uic_BotonF4.Click

    End Sub

    Private Sub uic_ValeBotella_Click(sender As Object, e As EventArgs) Handles uic_ValeBotella.Click

    End Sub
End Class