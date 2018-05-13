<%@ Page Title="" Language="C#" MasterPageFile="~/eshop.Master" AutoEventWireup="true" CodeBehind="Comprar-Paso2.aspx.cs" Inherits="TuImportas.eShop.PL.Web.Comprar_Paso2" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">
	<asp:HiddenField runat="server" id="hdIdOperador" Value="0"/>
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
							<a href="javascript:void(0)">Comprar: Dirección de Envío</a>
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
										<h1><span class="light">Costos</span> &amp; Dirección de Envío</h1>
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
								<div class="step active">
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
						<!--  = Shipping addr form =  -->
						<!--  ==========  -->
						
						<center>
							<br />
							<span class="negrita">Operador Logístico</span>
							<br /><br />
							<table class="table table-items">
								<thead>
									<tr>
										<th></th>
										<th><div class="align-center" style="min-width:170px;">Operador Logístico</div></th>
										<th><div class="align-center" style="min-width:100px;">Costo en Lima</div></th>
										<th><div class="align-center" style="min-width:130px;">Costo en Provincia</div></th>
										<th><div class="align-center" style="min-width:100px;">Tiempo de Entrega</div></th>
									</tr>
								</thead>
								<tbody id="bodyOperadorLogistico" class="validationEngineContainer" runat="server">
								</tbody>
							</table>
							<br />
							Si desea agregar una nueva dirección de envío haga <a href="Cuenta/3">click aquí</a>
							<br />
							<br />
							<table>
								<tr>
									<td class="negrita">Dirección de Envío<br /><br /></td>
									<td width="100px"></td>
									<td class="negrita">Dirección de Facturación<br /><br /></td>
								</tr>
								<tr id="trDirecciones" class="validationEngineContainer">
									<td><asp:DropDownList runat="server" ID="ddlDireccionEnvio" onchange="DatosDireccion(1);" CssClass="validate[required]"></asp:DropDownList></td>
									<td width="100px"></td>
									<td><asp:DropDownList runat="server" ID="ddlDireccionFacturacion" onchange="DatosDireccion(2);" CssClass="validate[required]"></asp:DropDownList></td>
								</tr>
								<tr>
									<td id="trEnvioDepartamento"></td>
									<td width="100px"></td>
									<td id="trFacturacionDepartamento"></td>
								</tr>
								<tr>
									<td id="trEnvioProvincia"></td>
									<td width="100px"></td>
									<td id="trFacturacionProvincia"></td>
								</tr>
								<tr>
									<td id="trEnvioDistrito"></td>
									<td width="100px"></td>
									<td id="trFacturacionDistrito"></td>
								</tr>
								<tr>
									<td id="trEnvioDireccion"></td>
									<td width="100px"></td>
									<td id="trFacturacionDireccion"></td>
								</tr>
								<tr>
									<td id="trEnvioReferencia" style="max-width:220px;"></td>
									<td width="100px"></td>
									<td id="trFacturacionReferencia" style="max-width:220px;"></td>
								</tr>
								<tr>
									<td id="trEnvioPrecio" style="max-width:220px;"></td>
									<td width="100px"></td>
									<td></td>
								</tr>
							</table>
							
						</center>
						
						<hr />
							
						<p class="right-align">
							En el próximo paso escogerás tu método de pago &nbsp; &nbsp;
							<%--<a class="btn btn-primary higher bold" onclick="Continuar();">CONTNUAR</a>--%>
							<asp:LinkButton ID="lnkContinuar" runat="server" CssClass="btn btn-primary higher bold" OnClick="lnkContinuar_Click" Style="display:none;">CONTNUAR</asp:LinkButton>
							<a class="btn btn-primary higher bold" onclick="Continuar();">CONTNUAR</a>
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
		var pageUrl = '<%=ResolveUrl("Comprar-Paso2.aspx")%>'

		$(document).ready(function () {
			$('#pnlCarrito').css("display", "none");
			$('#pnlBuscar').css("display", "none");
			SeleccionarMenu("");

			if ($("#<%=ddlDireccionEnvio.ClientID%>").val() != null && $("#<%=ddlDireccionEnvio.ClientID%>").val() != "-1")
				DatosDireccion(1);
			if ($("#<%=ddlDireccionFacturacion.ClientID%>").val() != null && $("#<%=ddlDireccionFacturacion.ClientID%>").val() != "-1")
				DatosDireccion(2);

		    $("#trDirecciones").validationEngine({ scroll: false, autoHidePrompt: true });
		    $("#<%=bodyOperadorLogistico.ClientID%>").validationEngine({ scroll: false, autoHidePrompt: true });
			
			if ($("#<%=hdIdOperador.ClientID%>").val() != 0) {
			    //$("#check" + $("#<%=hdIdOperador.ClientID%>").val()).attr("class", "icon-chevron-right");
			    $("#rb" + $("#<%=hdIdOperador.ClientID%>").val()).attr('checked', 'checked');
			}
		});

		function Continuar()
		{
			<%--if ($("#<%=hdIdOperador.ClientID%>").val() != 0) {--%>
		    if ($("#trDirecciones").validationEngine('validate') && $("#<%=bodyOperadorLogistico.ClientID%>").validationEngine('validate')) {
					<%= Page.ClientScript.GetPostBackEventReference(lnkContinuar, "") %>
				}
			//}
			//else { jAlert("Por favor seleccione un operador logístico", "Operador Logístico"); }
		}

		function DatosDireccion(direccion)
		{
			var id_direccion;
			var control;

			if (direccion == 1) { //Envio
				id_direccion = $("#<%=ddlDireccionEnvio.ClientID%>").val();
				control = "trEnvio";
			}
			else {
				id_direccion = $("#<%=ddlDireccionFacturacion.ClientID%>").val()
				control = "trFacturacion";
			}

			$.ajax
			({
				type: "POST",
				url: pageUrl + "/DatosDireccion",
				data: "{'idDireccion': '" + id_direccion + "', 'tipoDireccion': '" + direccion + "'}",
				contentType: "application/json; charset=utf-8",
				dataType: "json",
				success: function (response) {
					$("#" + control + "Departamento").text(response.d.Nombre_Departamento);
					$("#" + control + "Provincia").text(response.d.Nombre_Provincia);
					$("#" + control + "Distrito").text(response.d.Nombre_Distrito);
					$("#" + control + "Direccion").text(response.d.Direccion);
					$("#" + control + "Referencia").text(response.d.Referencia);

					//if (direccion == 1) {
					//    $("#" + control + "Precio").text("S/. " + response.d.Precio_Envio);
					//}
				},
				error: function (response) {
					MostrarError();
				}
			});
		}

		function SeleccionarOperador(operador) {
			//$('i[name^=checkOperador]').each(function () {
			//	$(this).attr("class", "icon-chevron");
			//});

			//$("#check" + operador).attr("class", "icon-chevron-right");
			$("#<%=hdIdOperador.ClientID%>").val(operador);
		}
	</script>
</asp:Content>