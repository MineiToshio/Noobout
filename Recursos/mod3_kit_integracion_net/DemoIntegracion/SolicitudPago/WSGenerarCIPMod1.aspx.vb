Imports SPE.Api
Imports System.IO
Imports System.Xml
Imports SPE.Api.Proxys

Partial Class WSGenerarCIPMod1
    Inherits System.Web.UI.Page

    Protected Sub btnGenerarCIP_Click(sender As Object, e As System.EventArgs) Handles btnGenerarCIP.Click
        Try
            txtEstado.Text = String.Empty
            txtMensaje.Text = String.Empty
            txtinformacionCIP.Text = String.Empty

            Dim request As New SPE.Api.Proxys.BEWSGenCIPRequestMod1
            Dim pathPublicKeyContraparte As String = System.Configuration.ConfigurationManager.AppSettings("pathPublicKeyContraparte")
            Dim pathPrivateKey As String = System.Configuration.ConfigurationManager.AppSettings("pathPrivateKey")
            Dim CodServicio As String = System.Configuration.ConfigurationManager.AppSettings("cCodServicio")

            txtXml.Text = txtXml.Text.Trim()
            request.CodServ = CodServicio
            request.Xml = txtXml.Text

            PagoEfectivo.PrivatePath = pathPrivateKey
            PagoEfectivo.PublicPathContraparte = pathPublicKeyContraparte

            Dim response As SPE.Api.Proxys.BEWSGenCIPResponseMod1 = PagoEfectivo.GenerarCIPMod1(request)           

            If (response IsNot Nothing) Then
                txtEstado.Text = response.Estado
                txtMensaje.Text = response.Mensaje
                txtinformacionCIP.Text = response.Xml
                If response.Estado <> 1 Then
                    ltrCip.Text += "Codigo: " & response.Estado & "</br>"
                    ltrCip.Text += "Mensaje: " & response.Mensaje & "</br>"
                End If
                Dim xml As New XmlDocument
                xml.InnerXml = response.Xml
                Dim element As XmlElement = xml.SelectSingleNode("ConfirSolPago")
                Dim elementchild As XmlElement = element.SelectSingleNode("CIP")
                Dim elementchildCIP As XmlElement = elementchild.SelectSingleNode("NumeroOrdenPago")
                Dim strCIP As String = elementchildCIP.InnerText
                ltrCip.Text = "CIP: " & strCIP
                Dim elementchildtoken As XmlElement = element.SelectSingleNode("Token")
                Dim UrlRedirect As String = System.Configuration.ConfigurationManager.AppSettings("UrlSPE") & "/GenPagoIF.aspx?Token=" & elementchildtoken.InnerText
                'Response.Redirect(UrlRedirect)
                ltlUrl.Text = ltlUrl.Text & "<iframe src=" & UrlRedirect & "></iframe>"
            Else
                txtinformacionCIP.Text = "No se obtuvo response (servicio del ws esta abajo)..."
            End If
        Catch ex As Exception
            txtinformacionCIP.Text = ex.ToString()
        End Try
    End Sub
    Private Function GenerarRandom() As String
        Dim value As Integer
        Dim randNumber As New Random(DateTime.Now.Millisecond)
        value = randNumber.Next(0, 99999999)
        'txtNroOperacion.Text = value.ToString("D8")
        Return value.ToString("D8")
    End Function

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        txtXml.Text = Replace(txtXml.Text, "[codTransaccion]", GenerarRandom)
    End Sub
End Class
