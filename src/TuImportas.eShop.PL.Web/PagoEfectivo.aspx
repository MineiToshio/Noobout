<%@ Page Title="" Language="C#" MasterPageFile="~/eshop.Master" AutoEventWireup="true" CodeBehind="PagoEfectivo.aspx.cs" Inherits="TuImportas.eShop.PL.Web.PagoEfectivo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">
    <%--<asp:Literal ID="ltlUrl" runat="server"></asp:Literal>--%>
    <br />
    <div id="iframe" style="width: 1024px; margin: 0 auto;">
            <asp:Literal ID="ltlUrl" runat="server"></asp:Literal>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContent" runat="server">
    <script src="/js/pagoEfectivo.js" type="text/javascript"></script>

    <script>
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

         });
    </script>
</asp:Content>
