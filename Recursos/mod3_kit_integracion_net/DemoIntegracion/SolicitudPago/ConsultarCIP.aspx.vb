Imports SPE.Api

Partial Class ConsultarCIP
    Inherits System.Web.UI.Page

    Protected Sub btnEjecutar_Click(sender As Object, e As EventArgs) Handles btnEjecutar.Click

        Dim request As New SPE.Api.Proxys.BEWSConsultarCIPRequestMod1
        Dim response As New SPE.Api.Proxys.BEWSConsultarCIPResponseMod1

        Dim pathPublicKeyContraparte As String = System.Configuration.ConfigurationManager.AppSettings("pathPublicKeyContraparte")
        Dim pathPrivateKey As String = System.Configuration.ConfigurationManager.AppSettings("pathPrivateKey")
        Dim CodServicio As String = System.Configuration.ConfigurationManager.AppSettings("cCodServicio")

        request.CodServ = CodServicio
        request.CIPS = txtCIPs.Text.Trim.Split(",")(0).ToString()
        PagoEfectivo.PrivatePath = pathPrivateKey
        PagoEfectivo.PublicPathContraparte = pathPublicKeyContraparte

        response = PagoEfectivo.ConsultarCIPsMod1(request)

        If response IsNot Nothing Then
            txtResultado.Text = response.XML
        Else
            txtResultado.Text = ""
        End If
        txtEstado.Text = response.Estado
        txtMensaje.Text = response.Mensaje
    End Sub

End Class
