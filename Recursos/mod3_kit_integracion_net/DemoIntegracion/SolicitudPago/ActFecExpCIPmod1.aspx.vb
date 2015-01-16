
Imports System.Configuration.ConfigurationManager
Imports SPE.Api

Partial Class ActFecExpCIPmod1
    Inherits System.Web.UI.Page

    Protected Sub btnActualizarCIP_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnActualizarCIP.Click

        Dim request As New SPE.Api.Proxys.BEWSActualizaCIPRequestMod1
        Dim rsp As New SPE.Api.Proxys.BEWSActualizaCIPResponseMod1

        Dim pathPublicKeyContraparte As String = System.Configuration.ConfigurationManager.AppSettings("pathPublicKeyContraparte")
        Dim pathPrivateKey As String = System.Configuration.ConfigurationManager.AppSettings("pathPrivateKey")
        Dim CodServicio As String = System.Configuration.ConfigurationManager.AppSettings("cCodServicio")

        request.CodServ = CodServicio
        request.CIP = txtCIP.Text
        request.FechaExpira = txtFechaExpiracion.Text
        PagoEfectivo.PublicPathContraparte = pathPublicKeyContraparte
        PagoEfectivo.PrivatePath = pathPrivateKey

        Try
            rsp = PagoEfectivo.ActualizarCIPMod1(request)
            If (response IsNot Nothing) Then
                txtEstado.Text = rsp.Estado
                txtMensaje.Text = rsp.Mensaje
            End If
        Catch ex As Exception
            txtMensaje.Text = ex.Message
            Response.Write(ex.Message)
        End Try

    End Sub

End Class
