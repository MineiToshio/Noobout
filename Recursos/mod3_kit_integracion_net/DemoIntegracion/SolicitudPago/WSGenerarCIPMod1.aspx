<%@ Page Language="VB" AutoEventWireup="false" CodeFile="WSGenerarCIPMod1.aspx.vb"
    Inherits="WSGenerarCIPMod1" ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="colorbox/colorbox.css" rel="stylesheet" type="text/css" />
    <link href="Styles/estilos.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="Scripts/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="Scripts/pagoEfectivo.js"></script>
    <script type="text/javascript" src="colorbox/jquery.colorbox-min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            listaInformacion = {};
            var urlBasePE = '<%= System.Configuration.ConfigurationManager.AppSettings.Get("urlSPE") + "/INFO/" %>';
            infoPE();
            function infoPE() {
                var cCodServicio = '<%= System.Configuration.ConfigurationManager.AppSettings.Get("cCodServicio")  %>';
                var cCodMoneda = '<%= System.Configuration.ConfigurationManager.AppSettings.Get("cCodMoneda") %>';
               // console.log(cCodServicio + ' ' + cCodMoneda)
                cargarInfoPago({ url: urlBasePE, elementTarget: $('#infoPago'), codigo: cCodServicio });
                var urlPe = '<%= System.Configuration.ConfigurationManager.AppSettings.Get("urlSPE") + "/CNT/" %>' + "QueEsPagoEfectivo.aspx?cod=" + cCodServicio + "&mon=" + cCodMoneda;
                $(".iframe").colorbox({ iframe: true, width: "642", height: "715", href: urlPe });
                return false;
            };

            $("#mostrarTr").click(function () {
                $("#tabs").children('div').fadeOut('slow',
                function () {
                    $("#datosWS").fadeIn('slow');
                });

                $("#ocultarTr").show();
                $("#mostrarTr").hide();
                $("#ocultarRes").hide();
                $("#mostrarRes").show();
            });
            $("#ocultarTr").click(function () {
                $("#datosWS").fadeOut('slow');
                $("#ocultarTr").hide();
                $("#mostrarTr").show();
            });




            $("#mostrarRes").click(function () {
                $("#tabs").children('div').fadeOut('slow');
                $("#result").fadeIn('slow');

                $("#ocultarRes").show();
                $("#mostrarRes").hide();
                $("#ocultarTr").hide();
                $("#mostrarTr").show();
            });
            $("#ocultarRes").click(function () {
                $("#result").fadeOut('slow');
                $("#ocultarRes").hide();
                $("#mostrarRes").show();
            });


            $("#btnGenerarCIP").click(function () {                
                cargarInfoBancos({ elementTarget: $("#bancos"), moneda: $('#txtMoneda').val() })
                //$("#bancos").fadeIn();
                $("#iframe").fadeIn();
            });
        });
    </script>
    <style type="text/css">
        iframe
        {	
            border: 1px solid #ccc;
            width: 960px;
            height: 1317px;
        }
        #datosWS
        {
            background: white;
            display: none;
            margin: 0 auto;
            margin-left: 10px;
        }
        #result
        {
            background: white;
            margin: 0 auto;
            margin-left: 10px;
            display: none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    
    <div id="infoExample" style="overflow: hidden;font-size: 13px;">    
        <br />
        <span style="margin: 0px 0px 0px 10px; display: block;">1) Prueba Generar CIP Modalidad 1 desde WS</span>
        <br />
        <div class="pe_detail">
            <h3>
                Detalle de compra <a class="pe_inline_mdl cboxElement" href="#mira-tus-avisos"></a>
            </h3>
            <div class="pe_content">
                <ul>
                    <li>Detalle del producto</li>
                    <li>comentarios adicionales</li>
                </ul>
                <p class="pe_total">
                    Total: <span>S/. <span id="pe_s-total">22.00</span></span></p>
                <p class="pe_obs">
                    El precio incluye IGV. La compra, en la fecha indicada, est&aacute; sujeta al pago
                    antes de la fecha de cierre.</p>
            </div>
        </div>
        <div class="pe_payment">
            <h3>
                M&eacute;todo de pago</h3>
            <div class="pe_option_pago">
                <input type="radio" style="float: left;" value="2" name="metodopago" checked="checked"
                    id="form-validation-field-1" />
                <div style="float: left; width: 100px;">
                    <img width="74" height="38" src="images/pago-efectivo.jpg" /></div>
                <div style="float: left; text-align: justify; width: 400px;">
                    <span id="infoPago">Compra con PagoEfectivo y paga a trav&eacute;s de internet o en
                        cualquier oficina del BCP, BBVA, Scotiabank, en Agencias de Pago de Servicios Western
                        Union y en establecimientosautorizados que tengan el logo de PagoEfectivo y/o FullCarga.</span><span
                            style="font-size: 10px;"> <br />
                            <a class="iframe" href="http://pre.pagoefectivo.pe/CNT/QueEsPagoEfectivo.aspx"
                                style="color: #006999; text-decoration: none;">&iquest;Qu&eacute; es PagoEfectivo?</a></span>
                </div>
                <div class="clear">
                </div>
                <br />
                <div class="pe_total">
                    <asp:Button ID="btnGenerarCIP" runat="server" Text="Pagar" />
                </div>
            </div>
        </div>
        <div style="overflow: hidden; width:980px;">
            <a id="mostrarTr" style="color: #006999; text-decoration: none; margin-left: 10px;" href="#">Mostrar Trama</a>
            <a id="ocultarTr" href="#" style="color: #006999; text-decoration: none; display: none;; margin-left: 10px;">Ocultar Trama</a>
            <a id="mostrarRes" style="color: #006999; text-decoration: none; margin-left: 10px;" href="#">Mostrar Resultado</a>
            <a id="ocultarRes" href="#" style="color: #006999; text-decoration: none; display: none;; margin-left: 10px;">Ocultar Resultado</a>
        </div>
        <asp:UpdatePanel ID="upd" runat="server">
            <ContentTemplate>
                 
                <div>
                    <div id="tabs">
                        <div id="datosWS">
                            <table>
                                <tr>
                                    <td>
                                        Xml:
                                    </td>
                                    <td style="width: 506px">
                                        <asp:TextBox ID="txtXml" TextMode="MultiLine" runat="server" Height="520px" Width="771px">
<?xml version="1.0" encoding="UTF-8"?>
<SolPago>
  <IdMoneda>1</IdMoneda>
  <Total>22.00</Total>
  <MetodosPago>1,2</MetodosPago>
  <CodServicio>PRU</CodServicio>
  <Codtransaccion>[codTransaccion]</Codtransaccion>
  <EmailComercio>admin@kotear.pe</EmailComercio>
  <FechaAExpirar>31/12/2016 17:00:00</FechaAExpirar>
  <UsuarioId>001</UsuarioId>
  <DataAdicional />
  <UsuarioNombre>Victor</UsuarioNombre>
  <UsuarioApellidos>Avila</UsuarioApellidos>
  <UsuarioLocalidad>LIMA</UsuarioLocalidad>
  <UsuarioProvincia>LIMA</UsuarioProvincia>
  <UsuarioPais>PERU</UsuarioPais>
  <UsuarioAlias>Victor</UsuarioAlias>
  <UsuarioTipoDoc>1</UsuarioTipoDoc>
  <UsuarioNumeroDoc>1</UsuarioNumeroDoc>
  <UsuarioEmail>alex.castillo@perucomsultores.pe</UsuarioEmail>
  <ConceptoPago>Orden [codTransaccion] en Demo</ConceptoPago>
  <Detalles>
    <Detalle>      
      <ConceptoPago>Orden [codTransaccion] en Demo</ConceptoPago>
      <Importe>22.00</Importe>     
    </Detalle>    
  </Detalles>  
</SolPago>
                                        </asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div id="result">
                            <table style="width: 60%;">
                                <tr>
                                    <td>
                                        Estado:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtEstado" runat="server" Style="width: 100%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Mensaje:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtMensaje" runat="server" TextMode="MultiLine" Height="70px" Style="width: 100%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        XML:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtinformacionCIP" runat="server" TextMode="MultiLine" Height="520px"
                                            Width="100%"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnGenerarCIP" EventName="Click" />
            </Triggers>
        </asp:UpdatePanel>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div style="margin-left: 10px;margin-top: 10px; ">
                    <asp:Literal ID="ltrCip" Text="&nbsp" runat="server" />
                </div>
                <div id="iframe" style="width: 1024px; margin: 0 auto;">
                     <asp:Literal ID="ltlUrl" runat="server"></asp:Literal>
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnGenerarCIP" EventName="Click" />
            </Triggers>
        </asp:UpdatePanel>       
        <div id="bancos" style="width: 95%; overflow: hidden; display: none; margin-left: 10px;">
        </div>
    </div>

    </form>
</body>
</html>
