<%@ Page Title="" Language="C#" MasterPageFile="~/eshop.Master" AutoEventWireup="true" CodeBehind="ComoComprar.aspx.cs" Inherits="TuImportas.eShop.PL.Web.ComoComprar" %>
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
                            <a href="javascript:void(0)">Cómo Comprar</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="push-up top-equal blocks-spacer-last"">
            <div class="row">
                <div class="span12">
                    <div class="title-area">
                        <h1 class="inline"><span class="light">¿Cómo Comprar?</span></h1>
                    </div>
                    <table align="center" class="align-center" border="1">
                        <tr><%--vertical-align:top;--%>
                            <td colspan="6" style="height:40px;">Comprar en <span class="bolder">NOOB OUT</span> es muy sencillo, sigue los siguientes pasos</td>
                        </tr>
                        <tr>
                            <td class="pasos-como-comprar">Paso 1</td>
                            <td class="pasos-como-comprar">Paso 2</td>
                            <td class="pasos-como-comprar">Paso 3</td>
                            <td class="pasos-como-comprar">Paso 4</td>
                            <td class="pasos-como-comprar">Paso 5</td>
                            <td class="pasos-como-comprar">Paso 6</td>
                        </tr>
                        <tr>
                            <td><img src="/images/comocomprar/comocomprar1.jpg"/></td>
                            <td><img src="/images/comocomprar/comocomprar2.jpg"/></td>
                            <td><img src="/images/comocomprar/comocomprar3.jpg"/></td>
                            <td><img src="/images/comocomprar/comocomprar4.jpg"/></td>
                            <td><img src="/images/comocomprar/comocomprar5.jpg"/></td>
                            <td><img src="/images/comocomprar/comocomprar6.jpg"/></td>
                        </tr>
                        <tr>
                            <td>Ingresa a <a href="www.noobout.com">www.noobout.com</a><br /><a href="#loginModal" data-toggle="modal">Inicia Sesión</a> o <a href="#registerModal" data-toggle="modal">Regístrate</a></td>
                            <td>Busca el o los producto(s) de tu preferencia en nuestra página web.</td>
                            <td>Añádelo(s)  a tu carrito de compras haciendo clic en <input type="button" value="AÑADIR A CARRITO" class="btn btn-primary"/> </td>
                            <td>Ingresa la dirección donde deseas que llevemos tu(s) producto(s).</td>
                            <td>Escoge el Método de Pago que más te convenga y dale clic en <input type="button" value="PAGAR" class="btn btn-primary"/></td>
                            <td>Verifica la información y si todo está ok, dale clic en <input type="button" value="CONFIRMAR LA COMPRA" class="btn btn-primary"/></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div> <!-- /container -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContent" runat="server">
    <script type="text/javascript">
        var pageUrl = '<%=ResolveUrl("ComoComprar.aspx")%>'

        $(document).ready(function () {
            SeleccionarMenu("");
        });
    </script> 
</asp:Content>
