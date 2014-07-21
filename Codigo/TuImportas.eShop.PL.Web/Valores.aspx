<%@ Page Title="" Language="C#" MasterPageFile="~/eshop.Master" AutoEventWireup="true" CodeBehind="Valores.aspx.cs" Inherits="TuImportas.eShop.PL.Web.Valores" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">
    <div class="darker-stripe">
        <div class="container">
            <div class="row">
                <div class="span12">
                    <ul class="breadcrumb">
                        <li>
                            <a href="/Inicio">Noobout</a>
                        </li>
                        <li><span class="icon-chevron-right"></span></li>
                        <li>
                            <a href="javascript:void(0)">Valores</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="push-up top-equal blocks-spacer-last"">
            <div class="row">
                <div class="span12 center-align">
                    <div class="span3 bloque-nosotros">
                        <img src="/images/quienes_somos.png"/>
                    </div>
                    <div class="span6 justify bloque-nosotros">
                        <div class="title-area align-center">
                            <h1 class="inline"><span class="light">Valores</span></h1>
                        </div>
                        <ul class="texto-nosotros">
                            <li>Honestidad</li>
                            <li>Responsabilidad</li>
                            <li>Calidad</li>
                            <li>Comunicación</li>
                            <li>Puntualidad</li>
                            <li>Seguridad</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- /container -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContent" runat="server">
    <script type="text/javascript">
        var pageUrl = '<%=ResolveUrl("Valores.aspx")%>'

        $(document).ready(function () {
            SeleccionarMenu("liMenuNosotros");
        });
    </script> 
</asp:Content>
