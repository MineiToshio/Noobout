<%@ Page Title="" Language="C#" MasterPageFile="~/eshop.Master" AutoEventWireup="true" CodeBehind="Activar.aspx.cs" Inherits="TuImportas.eShop.PL.Web.Activar" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">
    <div class="container">
        <br /><br /><br /><br /><br /><br /><br /><br /><br />
        <center>
            <asp:Label runat="server" ID="lblMensaje" style="font-size:20pt;"></asp:Label>
            <br /><br />
            <a id="lnkA" class="btn more btn-primary" href="/Inicio">Ir a Inicio</a>
        </center>
        <br /><br /><br /><br /><br /><br /><br /><br /><br />
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContent" runat="server">
    <script type="text/javascript">
        var pageUrl = '<%=ResolveUrl("Activar.aspx")%>'

        $(document).ready(function () {
            SeleccionarMenu("");
        });
    </script> 
</asp:Content>
