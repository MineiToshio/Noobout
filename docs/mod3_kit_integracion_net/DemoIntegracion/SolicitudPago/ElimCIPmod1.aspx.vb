Imports System.Configuration.ConfigurationManager
Imports SPE.Api

Partial Class ElimCIPmod1
    Inherits System.Web.UI.Page

    Protected Sub btnEliminarCIP_Click(sender As Object, e As EventArgs) Handles btnEliminarCIP.Click

        Dim request As New SPE.Api.Proxys.BEWSElimCIPRequestMod1
        Dim response As New SPE.Api.Proxys.BEWSElimCIPResponseMod1

        Dim pathPublicKeyContraparte As String = System.Configuration.ConfigurationManager.AppSettings("pathPublicKeyContraparte")
        Dim pathPrivateKey As String = System.Configuration.ConfigurationManager.AppSettings("pathPrivateKey")
        Dim CodServicio As String = System.Configuration.ConfigurationManager.AppSettings("cCodServicio")

        request.CodServ = CodServicio
        request.CIP = txtCIP.Text
        PagoEfectivo.PublicPathContraparte = pathPublicKeyContraparte
        PagoEfectivo.PrivatePath = pathPrivateKey

        response = PagoEfectivo.EliminarCIPMod1(request)

        If (response IsNot Nothing) Then
            txtEstado.Text = response.Estado
            txtMensaje.Text = response.Mensaje
        End If

    End Sub

End Class
