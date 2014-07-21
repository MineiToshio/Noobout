<%@ Page Title="" Language="C#" MasterPageFile="~/eshop.Master" AutoEventWireup="true" CodeBehind="Comprar-Paso4.aspx.cs" Inherits="TuImportas.eShop.PL.Web.Comprar_Paso4" EnableEventValidation="false" %>
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
                            <a href="javascript:void(0)">Comprar: Confirmar Compra</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="push-up blocks-spacer">
            <div class="row">
                <section class="span12">
                    <div class="row">
                    	<div class="span10 offset1">
                    		<header>
                    		    <div class="row">
                    		    	<div class="span2">
                    		    		<a href="index.html"><img src="images/logo-bw.png" alt="Webmarket Logo" width="48" height="48" /></a>
                    		    	</div>
                    		    	<div class="span6">
                    		    	    <div class="center-align">
                    		    	        <h1><span class="light">Confirmar</span> &amp; Pagar</h1>
                    		    	    </div>
                    		    	</div>
                    		    	<div class="span2">
                    		    	    <div class="right-align">
                    		    	    	<img src="images/buttons/security.jpg" alt="Security Sign" width="92" height="65" />
                    		    	    </div>
                    		    	</div>
                    		    </div>
                    		</header>
                    		
                    		<!--  ==========  -->
							<!--  = Steps =  -->
							<!--  ==========  -->
                    		<div class="checkout-steps">
                    		    <div class="clearfix">
                    		        <div class="step done">
                    		    	    <div class="step-badge"><i class="icon-ok"></i></div>
                    		    	    <a href="/Comprar">Carrito de Compras</a>
                    		        </div>
                    		        <div class="step done">
                    		    	    <div class="step-badge"><i class="icon-ok"></i></div>
                    		    	    <a href="/Comprar2">Dirección de Envío</a>
                    		        </div>
                    		        <div class="step done">
                                        <div class="step-badge"><i class="icon-ok"></i></div>
                                        <a href="/Comprar3">Método de Pago</a>
                                    </div>
                    		        <div class="step active">
                    		    	    <div class="step-badge">4</div>
                    		    	    Confirmar Compra
                    		        </div>
                    		    </div>
                    	    </div> <!-- /steps -->
                    		
                    		<!--  ==========  -->
							<!--  = Selected Items =  -->
							<!--  ==========  -->
							<table class="table table-items">
							    <thead>
							    	<tr>
							    		<th colspan="2"><div class="align-center">Ítem</div></th>
                                        <th><div class="align-center">Color</div></th>
							    		<th><div class="align-center">Cantidad</div></th>
							    		<th><div class="align-center">Precio</div></th>
							    	</tr>
							    </thead>
                                <tbody id="bodyCarrito" runat="server">
							        <tr>
							        	<td colspan="3" rowspan="3">
							        	    <div class="alert alert-info">
                                                <%--<button data-dismiss="alert" class="close" type="button">×</button>--%>
                                                Los costos de envío son calculados en base a la dirección. <a href="#">Más Información</a>
                                            </div>
							        	</td>
                                        <td class="stronger">Subtotal:</td>
							        	<td class="stronger"><div class="align-center">S/. <asp:Label runat="server" ID="lblFinalSubTotal"></asp:Label></div></td>
							        </tr>
							        <tr>
							        	<td class="stronger">Envío:</td>
							        	<td class="stronger"><div class="align-center">S/. <asp:Label runat="server" ID="lblFinalEnvio"></asp:Label></div></td>
							        </tr>
                                    <tr>
							        	<td class="stronger">Total:</td>
							        	<td class="stronger"><div class="size-16 align-center">S/. <asp:Label runat="server" ID="lblFinalTotal"></asp:Label></div></td>
							        </tr>
							    </tbody>
							</table>
							
							<p class="right-align">
							    <%--<a href="/Inicio" class="btn btn-primary higher bold">CONFIRMAR &amp; PAGAR</a>--%>
                                <asp:LinkButton runat="server" ID="lnkContinuar" CssClass="btn btn-primary higher bold" OnClick="lnkContinuar_Click">CONFIRMAR &amp; PAGAR</asp:LinkButton>
							</p>
                    	</div>
                    </div>
                </section> <!-- /main content -->
            </div>
        </div>
    </div> <!-- /container -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContent" runat="server">
    <script type="text/javascript">
        var pageUrl = '<%=ResolveUrl("Comprar-Paso4.aspx")%>'

        $(document).ready(function () {
            $('#pnlCarrito').css("display", "none");
            $('#pnlBuscar').css("display", "none");
            SeleccionarMenu("");
        });
    </script>
</asp:Content>
