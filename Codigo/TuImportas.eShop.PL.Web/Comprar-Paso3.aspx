<%@ Page Title="" Language="C#" MasterPageFile="~/eshop.Master" AutoEventWireup="true" CodeBehind="Comprar-Paso3.aspx.cs" Inherits="TuImportas.eShop.PL.Web.Comprar_Paso3" EnableEventValidation="false" %>
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
							<a href="javascript:void(0)">Comprar: Método de Pago</a>
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
											<h1><span class="light">Escoger</span> un Método de Pago</h1>
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
									<div class="step active">
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
							<!--  = Payment =  -->
							<!--  ==========  -->
							<center>
							<table id="tablePago" class="validationEngineContainer">
								<thead>
									<tr>
										<th class="negrita" style="padding-bottom:30px;">Forma de Pago</th>
										<th class="negrita" style="padding-bottom:30px;">Recibo</th>
									</tr>
								</thead>
								<tbody>
								<tr>
									<td style="width:45%;" valign="top">
										<div style="width:350px;">
											<%--<span class="btn btn-danger circle pull-left" onclick="SeleccionarPago(1);"><i class="icon-chevron" id="iPagoEfectivo"></i></span>--%>
											<div style="float:left;padding-top:8px;"><input class="validate[required] radio" type="radio" name="pago" id="rbPagoEfectivo" onclick="SeleccionarPago(1);"/></div>
											<div class="shifted-left-45 clearfix" onclick="SeleccionarPago(1);">
												<h3 class="no-margin">
													<span class="light">Pago Efectivo</span> &nbsp; &nbsp; &nbsp; 
													<img src="/images/pago/logopagoefectivo.jpg" alt="Pago Efectivo" style="width:100px;height:40px;" />
												</h3>
												<p class="product-formapago">Compra con PagoEfectivo y paga a través de internet o en cualquier oficina del BCP, BBVA, Scotiabank, en Agencias de Pago de Servicios Western Union y en establecimientos autorizados que tengan el logo de PagoEfectivo y/o FullCarga. <a data-toggle="modal" role="button" href="#pagoEfectivoModal" data-dismiss="modal" data-remote="http://pre.pagoefectivo.pe/CNT/QueEsPagoEfectivo.aspx">&iquest;Qu&eacute; es PagoEfectivo?</a></p>
											</div>
							
											<hr />
							
											<%--<span class="btn btn-danger circle pull-left" onclick="SeleccionarPago(2);"><i class="icon-chevron" id="iPaypal"></i></span>--%>
											<div style="float:left;padding-top:8px;"><input class="validate[required] radio" type="radio" name="pago" id="rbPaypal" onclick="SeleccionarPago(2);"/></div>
											<div class="shifted-left-45 clearfix" onclick="SeleccionarPago(2);">
												<h3 class="no-margin">
													<span class="light">PayPal</span> &nbsp; &nbsp; &nbsp; 
													<img src="/images/pago/paypal_icon.jpg" alt="PayPal"  style="width:100px;height:40px;" />
												</h3>
											</div>
										</div>
									</td>

									<td style="width:45%;" valign="top">
										<div style="width:350px;">
											<%--<span class="btn btn-danger circle pull-left" onclick="SeleccionarRecibo(1);"><i class="icon-chevron" id="iBoleta"></i></span>--%>
											<div style="float:left;padding-top:2px;"><input class="validate[required] radio" type="radio" name="recibo" id="rbBoleta" onclick="SeleccionarRecibo(1);"/></div>
											<div class="shifted-left-45 clearfix" onclick="SeleccionarRecibo(1);" style="height:40px;">
												<h3 class="no-margin">
													<span class="light">Boleta</span>
												</h3>
											</div>
							
											<hr />
							
											<%--<span class="btn btn-danger circle pull-left" onclick="SeleccionarRecibo(2);"><i class="icon-chevron" id="iFactura"></i></span>--%>
											<div style="float:left;padding-top:2px;"><input class="validate[required] radio" type="radio" name="recibo" id="rbFactura" onclick="SeleccionarRecibo(2);"/></div>
											<div class="shifted-left-45 clearfix" onclick="SeleccionarRecibo(2);">
												<h3 class="no-margin">
													<span class="light">Factura</span>
												</h3>
												<div id="divDatosFactura" style="display:none;" class="validationEngineContainer">
													<br />
													<div class="control-group">
														<label class="control-label" for="txtRazonSocial">Razón Social<span class="red-clr bold">*</span></label>
														<div class="controls">
															<asp:TextBox runat="server" ID="txtRazonSocial" class="span4 validate[required]" ClientIDMode="Static"></asp:TextBox>
														</div>
													</div>
													<div class="control-group">
														<label class="control-label" for="txtRuc">RUC<span class="red-clr bold">*</span></label>
														<div class="controls">
															<asp:TextBox runat="server" ID="txtRuc" class="span4 validate[required]" ClientIDMode="Static"></asp:TextBox>
														</div>
													</div>
												</div>
											</div>
										</div>
									</td>
								</tr>
								</tbody>
							</table>
							</center>
							<hr />

							<p class="right-align">
								En el próximo paso vas a revisar y confirmar tu compra &nbsp; &nbsp;
								<a class="btn btn-primary higher bold" onclick="Continuar();">CONTINUAR</a>
							</p>
								
								
						</div>
					</div>
				</section> <!-- /main content -->
			</div>
		</div>
	</div> <!-- /container -->

	<div id="pagoEfectivoModal" class="modal hide fade modal-pefectivo" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3 id="forgotPassModalLabel"><span class="light">¿Qué</span> es pago efectivo?</h3>
		</div>
		<div class="modal-body" style="overflow-y:visible;">
			<p class="justify">PagoEfectivo es una forma fácil y segura de comprar a través de Internet. Es cómodo y efectivo pues no necesita tarjeta de crédito.</p>
			<video controls="controls" poster="https://d1jqbysjvwiv09.cloudfront.net/App_Themes/SPE/ResourcesVideoPortada/video/1.jpg?v=15042014"
				height="200" width="400">
				<!-- Firefox | Chrome -->
				<source src="https://pre.pagoefectivo.pe/App_Themes/SPE/ResourcesVideoPortada/video/1.webm" type='video/webm; codecs="vp8, vorbis"'/>
				<!-- IE9 | iOS -->
				<source src="https://pre.pagoefectivo.pe/App_Themes/SPE/ResourcesVideoPortada/video/1.mp4" type='video/mp4; codecs="avc1.42E01E, mp4a.40.2"'/>
				<!-- Android -->
				<source src="https://pre.pagoefectivo.pe/App_Themes/SPE/ResourcesVideoPortada/video/1.ogv" type='video/ogg; codecs="theora, vorbis"'/>
				<!-- Other -->
				<source src="https://pre.pagoefectivo.pe/App_Themes/SPE/ResourcesVideoPortada/video/1.m4v"/>
			</video>
			<p class="justify">Hacerlo es absolutamente gratis, seguro y no incluye pagos adicionales. Puedes hacer efectivo tu pago en las agencias autorizadas de:</p>
			<table>
				<tr>
					<td class="logo-pefectivo-formapago"><img src="https://pre.pagoefectivo.pe/App_Themes/SPE/img/InfoPagos/bcp-pe.jpg?v=15042014" alt="BCP" width="90" height="30" /></td>
					<td class="pefectivo-formapago">Agencias del BCP, Agentes BCP o por banca por internet BCP.</td>
				</tr>
				<tr>
					<td class="logo-pefectivo-formapago"><img src="https://pre.pagoefectivo.pe/App_Themes/SPE/img/InfoPagos/bbva-pe.jpg?v=15042014" alt="BBVA" width="90" height="30" /></td>
					<td class="pefectivo-formapago">Agencias del BBVA, Agentes Express, Kasnet o por banca por internet del BBVA.</td>
				</tr>
				<tr>
					<td class="logo-pefectivo-formapago"><img src="https://pre.pagoefectivo.pe/App_Themes/SPE/img/InfoPagos/interbank-pe.jpg?v=15042014" alt="Interbank" width="90" height="26" /></td>
					<td class="pefectivo-formapago">Cualquier Agente Interbank, en Tiendas y Money Market de Interbank, Cajeros Global Net y Banca por Internet Interbank.</td>
				</tr>
				<tr>
					<td class="logo-pefectivo-formapago"><img src="https://pre.pagoefectivo.pe/App_Themes/SPE/img/InfoPagos/scotiabank-pe.jpg?v=15042014" alt="Scotiabank" width="90" height="30" /></td>
					<td class="pefectivo-formapago">Agencias de Scotiabank, Cajeros Express o por V&iacute;a Scotia en l&iacute;nea.</td>
				</tr>
				<tr>
					<td class="logo-pefectivo-formapago"><img src="https://pre.pagoefectivo.pe/App_Themes/SPE/img/InfoPagos/western-union.jpg?v=15042014" alt="Western Union" width="90" height="30" /></td>
					<td class="pefectivo-formapago">Cualquier agencia de Pago de Servicio de Western Union a nivel nacional.</td>
				</tr>
				<tr>
					<td class="logo-pefectivo-formapago"><img src="https://pre.pagoefectivo.pe/App_Themes/SPE/img/InfoPagos/fullcarga-pe.jpg?v=15042014" alt="Full Carga" width="90" height="30" /></td>
					<td class="pefectivo-formapago">Cualquier establecimiento autorizado (Bodegas, Farmacias, Cabinas, Locutorios, etc.) con el logo de PagoEfectivo y/o Fullcarga.</td>
				</tr>
			</table>
		</div>
	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContent" runat="server">
	<script type="text/javascript">
		var pageUrl = '<%=ResolveUrl("Comprar-Paso3.aspx")%>'
		var metodoPago = 0;
		var tipoRecibo = 0;

		$(document).ready(function () {
			$('#pnlCarrito').css("display", "none");
			$('#pnlBuscar').css("display", "none");
			GetMetodoPago();
			$("#trDirecciones").validationEngine({ scroll: false, autoHidePrompt: true });
			$("#divDatosFactura").validationEngine({ scroll: false, autoHidePrompt: true });
			SeleccionarMenu("");
		});

		function SeleccionarPago(pago)
		{
			//$("#iPagoEfectivo").attr("class", "icon-chevron");
			//$("#iPaypal").attr("class", "icon-chevron");
			

			switch (pago)
			{
				case 1:
					//$("#iPagoEfectivo").attr("class", "icon-chevron-right");
					$("#rbPagoEfectivo").attr('checked', 'checked');
					metodoPago = 1;
					break;
				case 2:
					//$("#iPaypal").attr("class", "icon-chevron-right");
					$("#rbPaypal").attr('checked', 'checked');
					metodoPago = 2;
					break;
			}
		}

		function SeleccionarRecibo(recibo) {
			//$("#iBoleta").attr("class", "icon-chevron");
			//$("#iFactura").attr("class", "icon-chevron");

			switch (recibo) {
				case 1:
					//$("#iBoleta").attr("class", "icon-chevron-right");
					$("#rbBoleta").attr('checked', 'checked');
					$("#divDatosFactura").css("display", "none");
					tipoRecibo = 1;
					break;
				case 2:
					//$("#iFactura").attr("class", "icon-chevron-right");
					$("#rbFactura").attr('checked', 'checked');
					$("#divDatosFactura").css("display", "");
					tipoRecibo = 2;
					break;
			}
		}

		function GetMetodoPago()
		{
			$.ajax
			({
				type: "POST",
				url: pageUrl + "/GetMetodoPago",
				data: "{'idFormaPago': '" + metodoPago + "'}",
				contentType: "application/json; charset=utf-8",
				dataType: "json",
				success: function (response) {
					if (response.d.Id_Forma_Pago != null) {
						SeleccionarPago(response.d.Id_Forma_Pago)
					}
					if (response.d.Id_Tipo_Recibo != null) {
						SeleccionarRecibo(response.d.Id_Tipo_Recibo)

						if (response.d.Id_Tipo_Recibo == 2)
						{
							$("#txtRazonSocial").val(response.d.Razon_Social);
							$("#txtRuc").val(response.d.Ruc)
						}
					}
				},
				error: function (response) {
					MostrarError();
				}
			});
		}

		function Continuar()
		{
			var pasa = true;

			if (metodoPago == 0) {
				jAlert("Por favor seleccione una forma de pago", "Método Pago");
				pasa = false;
			}
			else if (tipoRecibo == 0) {
				jAlert("Por favor seleccione un tipo de recibo", "Método Pago");
				pasa = false;
			}
			else if (tipoRecibo == 2)
				pasa = $("#divDatosFactura").validationEngine('validate');

			if (pasa) {
				var objCarritoAuxBE = {};

				objCarritoAuxBE.Id_Forma_Pago = metodoPago,
				objCarritoAuxBE.Id_Tipo_Recibo = tipoRecibo,
				objCarritoAuxBE.Razon_Social = $("#txtRazonSocial").val(),
				objCarritoAuxBE.Ruc = $("#txtRuc").val()

				var DTO = { 'objCarritoAuxBE': objCarritoAuxBE };

				$.ajax
				({
					type: "POST",
					url: pageUrl + "/Continuar",
					//data: "{'idFormaPago': '" + metodoPago + "'}",
					data: JSON.stringify(DTO),
					contentType: "application/json; charset=utf-8",
					dataType: "json",
					success: function (response) {
						window.location.replace("/Comprar4");
					},
					error: function (response) {
						MostrarError();
					}
				});
			}
		}
	</script>
</asp:Content>
