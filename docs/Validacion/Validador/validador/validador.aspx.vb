Imports System.IO
Imports System.Xml
Imports System.Security.Cryptography
Imports System.Net

Partial Class validador
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim count_warning As Integer = 0
        Dim msj_warning As String = ""
        div_warning.Visible = False
        div_success.Visible = False

        Dim client As WebClient = New WebClient()
        Try
            Dim a As String = client.DownloadString(ConfigurationManager.AppSettings("PE_SERVER") + ConfigurationManager.AppSettings("PE_WSCRYPTA"))
            
        Catch ex As Exception
            div_warning.Visible = True
            count_warning += 1

            Dim ip As String = (System.Net.Dns.GetHostByName(System.Net.Dns.GetHostName)).AddressList.GetValue(0).ToString()

            msj_warning &= "<li>Debe configurar su IP pública (" + ip + ") para tener acceso a los Web Services de Pago Efectivo.</li>"
        End Try

        If count_warning > 0 Then
            spn_count_warning.InnerText = count_warning
            spn_msj_warning.InnerHtml = msj_warning
        Else
            div_success.Visible = True
        End If
    End Sub
End Class