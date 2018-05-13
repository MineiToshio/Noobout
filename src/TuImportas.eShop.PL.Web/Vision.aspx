<%@ Page Title="" Language="C#" MasterPageFile="~/eshop.Master" AutoEventWireup="true" CodeBehind="Vision.aspx.cs" Inherits="TuImportas.eShop.PL.Web.Vision" %>
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
                            <a href="javascript:void(0)">Visión</a>
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
                            <h1 class="inline"><span class="light">Visión</span></h1>
                        </div>
                        <p class="texto-nosotros">Ser la empresa líder en comercio electrónico de productos de temática gaming en el mercado peruano y de América Latina, innovado constantemente el proceso de compra on-line y utilizando los métodos de pago y envío más eficaces, confiables y seguros.</p>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- /container -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContent" runat="server">
    <script type="text/javascript">
        var pageUrl = '<%=ResolveUrl("Vision.aspx")%>'

        $(document).ready(function () {
            SeleccionarMenu("liMenuNosotros");
        });
    </script> 
</asp:Content>
