<%@ Page Title="" Language="C#" MasterPageFile="~/eshop.Master" AutoEventWireup="true" CodeBehind="Nosotros.aspx.cs" Inherits="TuImportas.eShop.PL.Web.Nosotros" %>
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
                            <a href="javascript:void(0)">¿Quienes somos?</a>
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
                            <h1 class="inline"><span class="light">¿Quiénes somos?</span></h1>
                        </div>
                        <p>NOOB OUT es una marca peruana que nace con la idea de satisfacer las necesidades de los aficionados a los videojuegos o GAMERS peruanos y de América Latina.</p>
                        <p>Podrás adquirir nuestros diversos y novedosos productos de temática gaming a través de nuestra tienda on-line www.noobout.com, solo has tu pedido y nosotros nos encargaremos de llevarlo hasta el lugar que nos indiques.</p>
                        <p>Para mayor información visita nuestra sección de <a href="/Faq">Preguntas Frecuentes</a> o escríbenos a <a href="/Contacto">Contáctanos</a>.</p>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- /container -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContent" runat="server">
    <script type="text/javascript">
        var pageUrl = '<%=ResolveUrl("Nosotros.aspx")%>'

        $(document).ready(function () {
            SeleccionarMenu("liMenuNosotros");
        });
    </script> 
</asp:Content>
