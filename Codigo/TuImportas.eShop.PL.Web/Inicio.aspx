<%@ Page Title="" Language="C#" MasterPageFile="~/eshop.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="TuImportas.eShop.PL.Web.Inicio" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">
    <!--  ==========  -->
    <!--  = Slider Revolution =  -->
    <!--  ==========  -->
    <div class="fullwidthbanner-container">
        <div class="fullwidthbanner">
            <ul id="ulSlider" runat="server"></ul>
            <div class="tp-bannertimer"></div>
        </div>
        <!--  ==========  -->
        <!--  = Nav Arrows =  -->
        <!--  ==========  -->
        <div id="sliderRevLeft"><i class="icon-chevron-left"></i></div>
        <div id="sliderRevRight"><i class="icon-chevron-right"></i></div>
    </div> <!-- /slider revolution -->


    <!--  ==========  -->
    <!--  = Main container =  -->
    <!--  ==========  -->
    <div class="container">
        <div class="row">
            <div class="span12">
                <div class="push-up over-slider blocks-spacer">

                    <!--  ==========  -->
                    <!--  = Three Banners =  -->
                    <!--  ==========  -->
                    <div class="row">
                        <div class="span4">
                            <a class="btn btn-block banner" runat="server" id="lnkBotonInicio1">
                                <asp:Label runat="server" ID="lblBotonInicio1" class="title"></asp:Label>
                                <asp:label runat="server" CssClass="italic" ID="lblBotonInicioDesc1"></asp:label>
                            </a>
                        </div>
                        <div class="span4">
                            <a data-toggle="modal" data-dismiss="modal" class="btn btn-block colored banner" id="lnkBotonInicio2" runat="server">
                                <asp:Label runat="server" ID="lblBotonInicio2" class="title"></asp:Label>
                                <asp:label runat="server" CssClass="italic" ID="lblBotonInicioDesc2"></asp:label>
                            </a>
                        </div>
                        <div class="span4">
                            <a class="btn btn-block banner" runat="server" id="lnkBotonInicio3">
                                <asp:Label runat="server" ID="lblBotonInicio3" class="title"></asp:Label>
                                <asp:label runat="server" CssClass="italic" ID="lblBotonInicioDesc3"></asp:label>
                            </a>
                        </div>
                    </div> <!-- /three banners -->
                </div>
            </div>
        </div>

        <!--  ==========  -->
        <!--  = Featured Items =  -->
        <!--  ==========  -->
        <div class="row featured-items blocks-spacer" id="divDestacados">
            <div class="span12">

                <!--  ==========  -->
                <!--  = Title =  -->
                <!--  ==========  -->
            	<div class="main-titles lined">
            	    <h2 class="title">Productos <span class="light">Destacados</span></h2>
            	    <div class="arrows">
                        <a href="#" class="icon-chevron-left" id="featuredItemsLeft"></a>
                        <a href="#" class="icon-chevron-right" id="featuredItemsRight"></a>
                    </div>
            	</div>
            </div>

            <div class="span12">
                <!--  ==========  -->
                <!--  = Carousel =  -->
                <!--  ==========  -->
                <asp:Panel runat="server" ID="pnlDestacados" CssClass="carouFredSel" data-autoplay="false" data-nav="featuredItems">
                </asp:Panel>
            </div>
        </div>
    </div> <!-- /container -->

    <div class="boxed-area blocks-spacer" id="divNuevos">
        <div class="container">
            <div class="row">
                <div class="span12">
                    <div class="main-titles lined">
                    	<h2 class="title"><span class="light">Nuevos</span> Productos en la Tienda</h2>
                    </div>
                </div>
            </div>
            <asp:Panel runat="server" ID="pnlNuevos" CssClass="row popup-products blocks-spacer"></asp:Panel>
        </div>
    </div>

    <!--  ==========  -->
    <!--  = Most Popular products =  -->
    <!--  ==========  -->
    <div class="most-popular blocks-spacer">
    	<div class="container">
    	    <div class="row">
    	    	<div class="span12">
    	    	    <div class="main-titles lined">
    	                <h2 class="title"><span class="light">Productos</span> Más Vendidos</h2>
    	            </div>
    	    	</div>
    	    </div> <!-- /title -->
            <asp:Panel runat="server" ID="pnlPopulares" CssClass="row popup-products"></asp:Panel>
    	</div>
    </div>

    <div id="formaEnvioModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="formaEnvioModalLabel" aria-hidden="true"">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h3 id="formaEnvioModalLabel"><span class="light">Modos</span> de envío</h3>
        </div>
        <div class="modal-body" style="overflow-y:visible;text-align:center;">
            <img src="/images/envio/servientrega.jpg" style="width:300px;"/>
            <br /><br /><br />
            <img src="/images/envio/smp.gif" style="width:300px;"/>
            <br /><br /><br />
            <img src="/images/envio/olva.png" style="width:300px;"/>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContent" runat="server">
    <script type="text/javascript">
        var pageUrl = '<%=ResolveUrl("Inicio.aspx")%>'

        $(document).ready(function () {
            SeleccionarMenu("liMenuInicio");
        });
    </script>
</asp:Content>