<%@ Page Title="" Language="C#" MasterPageFile="~/eshop.Master" AutoEventWireup="true" CodeBehind="Comprar-Paso1.aspx.cs" Inherits="TuImportas.eShop.PL.Web.Comprar_Paso1" EnableEventValidation="false" %>
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
							<a href="javascript:void(0)">Comprar: Carrito de Compras</a>
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
				
				<%--<div class="checkout-container">--%>
					<div class="row">
						<div class="span10 offset1">
							
							<!--  ==========  -->
							<!--  = Header =  -->
							<!--  ==========  -->
							<header>
								<div class="row">
									<div class="span2">
										<a href="index.html"><img src="images/logo-bw.png" alt="Webmarket Logo" width="48" height="48" /></a>
									</div>
									<div class="span6">
										<div class="center-align">
											<h1><span class="light">Revise</span> Su Carrito De Compras</h1>
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
									<div class="step active">
										<div class="step-badge">1</div>
										Carrito de Compras
									</div>
									<div class="step">
										<div class="step-badge">2</div>
										Dirección de Envío
									</div>
									<div class="step">
										<div class="step-badge">3</div>
										Método de Pago
									</div>
									<div class="step">
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
										<%--<th><div class="align-center">Color</div></th>--%>
										<th><div class="align-center">Cantidad</div></th>
										<th><div class="align-center">Precio</div></th>
										<th><div class="align-center">Total</div></th>
									</tr>
								</thead>
								<tbody id="bodyCarrito" runat="server" class="validationEngineContainer">
									<%--<tr>
										<td colspan="2" rowspan="2">
											<div class="alert alert-info">
												<button data-dismiss="alert" class="close" type="button">×</button>
												Shipping costs are calculated based on location. <a href="#">More information</a>
											</div>
										</td>
										<td class="stronger">Shipping:</td>
										<td class="stronger"><div class="align-right">$4.99</div></td>
									</tr>--%>
									<tr id="trSubTotal" runat="server">
										<td colspan="3">
											<%--<div class="alert alert-info">
												<button data-dismiss="alert" class="close" type="button">×</button>
												Shipping costs are calculated based on location. <a href="#">More information</a>
											</div>--%>
										</td>
										<td class="stronger">Subtotal:</td>
										<td class="stronger"><div class="size-16 align-center">S/. <asp:Label runat="server" ID="lblShopSubtotalCarrito"></asp:Label></div></td>
									</tr>
								</tbody>
							</table>
							
							<%--<hr />--%>
							
							<p class="right-align" id="pContinuar" runat="server">
								En el próximo paso escogerás la dirección de envío &nbsp; &nbsp;
								<a class="btn btn-primary higher bold" onclick="Continuar();">CONTINUAR</a>
							</p>
						</div>
					</div>
				<%--</div>--%>
				
				
			</section> <!-- /main content -->
		
		</div>
		</div>
	</div> <!-- /container -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContent" runat="server">
	<script type="text/javascript">
		var pageUrl = '<%=ResolveUrl("Comprar-Paso1.aspx")%>'

		$(document).ready(function () {
			$('#pnlCarrito').css("display", "none");
			$('#pnlBuscar').css("display", "none");
			$("#<%=bodyCarrito.ClientID%>").validationEngine({ scroll: false, autoHidePrompt: true });
			SeleccionarMenu("");
		});

	    function RemoverShopCarrito(idProducto, idAtributos)
		{
			$.ajax
			({
				type: "POST",
				url: pageUrl + "/QuitarCarrito",
				data: "{'id_producto': '" + idProducto + "', 'idAtributos': '" + idAtributos + "'}",
				contentType: "application/json; charset=utf-8",
				dataType: "json",
				success: function (response) {
				    $("#trItemCarrito" + idProducto + "_" + idAtributos).remove();
					$("#<%=lblShopSubtotalCarrito.ClientID%>").text(parseFloat($("#<%=lblShopSubtotalCarrito.ClientID%>").text()) - parseFloat(response.d));

					if ($("#<%=lblShopSubtotalCarrito.ClientID%>").text() == "0")
					{
						$("#<%=bodyCarrito.ClientID%>").append("<tr><td class=\"qty\" colspan=\"5\"><br/>SU CARRITO DE COMPRAS SE ENCUENTRA VACÍO<br/></td></tr>");
						$("#<%=trSubTotal.ClientID%>").css("display", "none");
						$("#<%=pContinuar.ClientID%>").css("display", "none");
					}
				},
				error: function (response) {
					MostrarError();
				}
			});
		}

		function CalcularSubtotal()
		{
			var subtotal = 0.00;
			

			$('input[name^=inputCantidad]').each(function () {
			    var id = $(this).attr('id').replace("inputCantidad", "");
			    var productoTotal = $('#inputCantidad' + id).val() * $('#spanPrecio' + id).text();

			    $("#spanTotal" + id).text(parseFloat(productoTotal).toFixed(2))
			    subtotal += productoTotal;
			});

			$("#<%=lblShopSubtotalCarrito.ClientID%>").text(parseFloat(subtotal).toFixed(2));
		}

		function Continuar()
		{
			if ($("#<%=bodyCarrito.ClientID%>").validationEngine('validate')) {
				var lstColor = "";
				var lstCantidad = "";

				$('input[name^=inputCantidad]').each(function () {
					var id = $(this).attr('id').replace("inputCantidad", "");
					//lstColor += id + "," + $('#ddlColor' + id).val() + "," + $('#ddlColor' + id + ' option:selected').text() + "|";
					lstCantidad += id + "," + $('#inputCantidad' + id).val() + "|";
				});

				$.ajax
				({
					type: "POST",
					url: pageUrl + "/Continuar",
					data: "{'lstCantidad': '" + lstCantidad + "'}",
					contentType: "application/json; charset=utf-8",
					dataType: "json",
					success: function (response) {
						if (response.d == 1) {
							window.location.replace("/Comprar2");
						}
						else
							jAlert("Lo sentimos, no hay productos para comprar.", "Comprar Producto");
					},
					error: function (response) {
						MostrarError();
					}
				});
			}
		}
	</script>
</asp:Content>
