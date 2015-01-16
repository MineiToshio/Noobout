Imports System.Xml
Imports SPE.Api

Partial Class urlNotificacion
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        'tramaEncriptada = request.getParameter("data");

        If Not Page.IsPostBack Then

            Dim postvariable As String
            If Request.HttpMethod() = "POST" Then
                postvariable = Request.Params("data")
            Else
                Exit Sub
            End If

            Dim getvariable As String = Request.QueryString("data")
            PagoEfectivo.PublicPathContraparte = System.Configuration.ConfigurationManager.AppSettings("pathPublicKeyContraparte")
            PagoEfectivo.PrivatePath = System.Configuration.ConfigurationManager.AppSettings("pathPrivateKey")


            postvariable = PagoEfectivo.DesenciptarTexto(postvariable)

            Dim estado As Integer
            Dim CodTrans As String
            CodTrans = ""
            estado = 0

            Dim nlSolpago As New XmlDocument
            nlSolpago.InnerXml = postvariable

            Dim nlSolpago2 As XmlElement = nlSolpago.SelectSingleNode("ConfirSolPago")

            Dim nlCodTrans As XmlElement = nlSolpago2.SelectSingleNode("CodTrans")
            Dim valueId As String = nlCodTrans.InnerText
            CodTrans = valueId

            Dim nlEstado As XmlElement = nlSolpago2.SelectSingleNode("Estado")
            Dim valueEstado As String = nlEstado.InnerText
            estado = valueEstado

            Select Case estado           
				Case 592 '//El banco extorno la transaccion - debe regresar a pendiente de pago
                    '//ExtornarTransaccion()			
                Case 593 '//Se realizo el pago de la transacción
                    '//PagarTransaccion()                
                Case 595 '//Expiró la transacción despues de generada como CIP
                    '//ExpirarTransaccion()
            End Select

        End If

    End Sub

End Class
