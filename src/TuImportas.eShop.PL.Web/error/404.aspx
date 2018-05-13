<%@ Page Title="" Language="C#" MasterPageFile="~/eshop.Master" AutoEventWireup="true" CodeBehind="404.aspx.cs" Inherits="TuImportas.eShop.PL.Web.error._404" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">
    <!--  ==========  -->
    <!--  = Breadcrumbs =  -->
    <!--  ==========  -->
    <div class="darker-stripe">
        <div class="container">
            <div class="row">
                <div class="span12">
                    <ul class="breadcrumb">
                        <li>
                            <a href="index.html">Webmarket</a>
                        </li>
                        <li><span class="icon-chevron-right"></span></li>
                        <li>
                            <a href="404.html">404 Error</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="push-up blocks-spacer">
            <div class="row">
                
                <!--  ==========  -->
                <!--  = Main content =  -->
                <!--  ==========  -->
                <section class="span12">
                    
                    <p class="container-404">
                        <img src="/images/404.png" alt="404 Error" width="394" height="161" />
                    </p>
                	
                	<hr />
                	
                	<p class="center-align size-16">
                	    ¡Parece que algo salió mal! La página que estás buscando no se encuentra disponible. 
                	</p>
                	<p class="center-align size-16 push-down-50">
                	    Puedes ir al <a href="/inicio">inicio</a> o buscar algo: 
                	</p>
                	
                	<div class="row">
                	    <div class="span4 offset4">
                	        <div class="sidebar-item widget_search">
                                <div class="form">
                                    <input type="text" placeholder="Buscar productos..." name="s" class="input-block-level" id="appendedInputButton" onkeyup="BuscarPress404()">
                                    <button class="boton_buscar" onclick="BuscarProducto404()" style="top:5px;">
                                        <i class="icon-search"></i>
                                    </button>
                                </div>
                            </div>
                	    </div>
                	</div>
                	
                </section> <!-- /main content -->
            </div>
        </div>
    </div> <!-- /container -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContent" runat="server">
    <script>
        function BuscarProducto404() {
            if ($("#appendedInputButton").val() != "")
                window.location.replace("/Buscar/" + $("#appendedInputButton").val());
        }

        function BuscarPress404()
        {
            if (event.keyCode == 13) {
                BuscarProducto404();
            }
        }
    </script>
</asp:Content>
