<%@ Page Title="" Language="C#" MasterPageFile="~/eshop.Master" AutoEventWireup="true" CodeBehind="Cuenta.aspx.cs" Inherits="TuImportas.eShop.PL.Web.Cuenta" EnableEventValidation="false" %>
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
							<a href="javascript:void(0);">Mi Cuenta</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="push-up blocks-spacer">
			<div class="row">
				<aside class="span3">
					<div class="sidebar-item">

						<div>
							<h3><span class="light">Mi</span> Cuenta</h3>
						</div>

						<div class="row">
							<div class="span3">
								<div class="widget">
									<ul class="nav nav-pills nav-stacked">
										<li id="liInfCuenta" class="active" runat="server" ClientIDMode="Static"><a href="javascript:void(0);" onclick="SeleccionarMenuCuenta(1);">Información de Cuenta <i class="icon-caret-right pull-right"></i></a></li>
										<li id="liContrasena" runat="server" ClientIDMode="Static"><a href="javascript:void(0);" onclick="SeleccionarMenuCuenta(2);">Contraseña <i class="icon-caret-right pull-right"></i></a></li>
										<li id="liDirecciones" runat="server" ClientIDMode="Static"><a href="javascript:void(0);" onclick="SeleccionarMenuCuenta(3);">Direcciones <i class="icon-caret-right pull-right"></i></a></li>
										<li id="liOrdenes" runat="server" ClientIDMode="Static"><a href="javascript:void(0);" onclick="SeleccionarMenuCuenta(4);">Mis Pedidos <i class="icon-caret-right pull-right"></i></a></li>
										<li id="liFavoritos" runat="server" ClientIDMode="Static"><a href="javascript:void(0);" onclick="SeleccionarMenuCuenta(5);">Mis Favoritos <i class="icon-caret-right pull-right"></i></a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</aside>
				
				<asp:Panel ID="pnlFavoritos" runat="server" class="span9" ClientIDMode="Static" style="display:none;">
					<div class="underlined push-down-20">
						<h3><span class="light">Mis</span> Favoritos</h3>
					</div>
					<table class="table table-items push-down-50">
						<thead>
							<tr>
								<th colspan="2"><div class="align-center">Ítem</div></th>
								<th><div class="align-center">Precio</div></th>
							</tr>
						</thead>
						<tbody id="bodyFavoritos" runat="server">
						</tbody>
					</table>
				</asp:Panel>

				<asp:Panel ID="pnlOrdenes" runat="server" class="span9" ClientIDMode="Static" style="display:none;">
					<div class="underlined push-down-20">
						<h3><span class="light">Mis</span> Pedidos</h3>
					</div>
					<table class="table table-items push-down-50">
						<thead>
							<tr>
								<th><div class="align-center">Pedido N°</div></th>
								<th><div class="align-center">Fecha</div></th>
								<th><div class="align-center">Estado</div></th>
								<th><div class="align-center">Monto</div></th>
								<th><div class="align-center"></div></th>
							</tr>
						</thead>
						<tbody id="bodyOrdenes" runat="server">
						</tbody>
					</table>
				</asp:Panel>

				<asp:Panel ID="pnlContrasena" runat="server" class="span9" ClientIDMode="Static" style="display:none;">
					<div id="divContrasena" class="validationEngineContainer">
						<div class="underlined push-down-20">
							<h3><span class="light">Cambiar</span> Contraseña</h3>
						</div>
						<p class="push-down-40">
							Aquí podrás modificar la contraseña de tu cuenta
						</p>
						<div class="control-group">
							<label class="control-label" for="txtContrasenaActual">Contraseña Actual<span class="red-clr bold">*</span></label>
							<div class="controls">
								<asp:TextBox runat="server" ID="txtContrasenaActual" class="span4 validate[required]" ClientIDMode="Static" TextMode="Password"></asp:TextBox>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="txtContrasenaNueva">Nueva Contraseña<span class="red-clr bold">*</span></label>
							<div class="controls">
								<asp:TextBox runat="server" ID="txtContrasenaNueva" class="span4 validate[required]" ClientIDMode="Static" TextMode="Password"></asp:TextBox>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="txtContrasenaRepertir">Repetir Contraseña<span class="red-clr bold">*</span></label>
							<div class="controls">
								<asp:TextBox runat="server" ID="txtContrasenaRepertir" class="span4 validate[required,equals[txtContrasenaNueva]]" ClientIDMode="Static" TextMode="Password"></asp:TextBox>
							</div>
						</div>
						<div class="control-group">
							<div class="controls">
								<input id="btnGuardarContrasena" type="button" value="GUARDAR" class="btn btn-primary higher bold" onclick="CambiarContrasena();" />
							</div>
						</div>
					</div>
				</asp:Panel>

				<asp:Panel ID="pnlDireccion" runat="server" class="span9" ClientIDMode="Static" style="display:none;">
					<div class="underlined push-down-20">
						<h3><span class="light">Mis</span> Direcciones</h3>
					</div>
					<%--<input id="btnNuevaDireccion" type="button" value="NUEVA DIRECCIÓN" class="btn btn-primary higher bold" />--%>
					<a id="btnNuevaDireccion" class="btn btn-primary higher bold" href="#direccionModal" role="button" data-toggle="modal" onclick="LimpiarDireccion();">Agregar Dirección</a>
					<br /><br />
					<table class="table table-items push-down-50">
						<thead>
							<tr>
								<th><div class="align-center" style="min-width:110px;">Nombre</div></th>
								<th><div class="align-center" style="min-width:100px;">Departamento</div></th>
								<th><div class="align-center" style="min-width:100px;">Provincia</div></th>
								<th><div class="align-center" style="min-width:100px;">Distrito</div></th>
								<th><div class="align-center">Dirección</div></th>
								<%--<th><div class="align-center">Referencia</div></th>--%>
							</tr>
						</thead>
						<tbody id="bodyDirecciones" runat="server">
						</tbody>
					</table>
				</asp:Panel>

				<asp:Panel ID="pnlInfCuenta" runat="server" class="span9" ClientIDMode="Static" style="display:none;">
					<div id="divDatosCuenta" class="validationEngineContainer">
					<div class="underlined push-down-20">
						<h3><span class="light">Información</span> de Cuenta</h3>
					</div>
					<p class="push-down-40">
						Aquí podrás ver y modificar la información de tu cuenta.
					</p>
					<div class="control-group">
						<label class="control-label" for="txtAccNombre">Nombre<span class="red-clr bold">*</span></label>
						<div class="controls">
							<asp:TextBox runat="server" ID="txtAccNombre" class="span4 validate[required]" ClientIDMode="Static"></asp:TextBox>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="txtAccApellidoP">Apellido Paterno<span class="red-clr bold">*</span></label>
						<div class="controls">
							<asp:TextBox runat="server" ID="txtAccApellidoP" class="span4 validate[required]" ClientIDMode="Static"></asp:TextBox>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="txtAccApellidoM">Apellido Materno</label>
						<div class="controls">
							<asp:TextBox runat="server" ID="txtAccApellidoM" class="span4" ClientIDMode="Static"></asp:TextBox>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="txtAccDNI">DNI<span class="red-clr bold">*</span></label>
						<div class="controls">
							<asp:TextBox runat="server" ID="txtAccDNI" class="span4 validate[required]" ClientIDMode="Static" ReadOnly="true"></asp:TextBox>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="txtAccCelular">Celular</label>
						<div class="controls">
							<asp:TextBox runat="server" ID="txtAccCelular" class="span4" ClientIDMode="Static"></asp:TextBox>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="txtAccTelefono">Teléfono</label>
						<div class="controls">
							<asp:TextBox runat="server" ID="txtAccTelefono" class="span4" ClientIDMode="Static"></asp:TextBox>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="txtAccEmail">Email<span class="red-clr bold">*</span></label>
						<div class="controls">
							<asp:TextBox runat="server" ID="txtAccEmail" class="span4 validate[required,custom[email]]" ClientIDMode="Static"></asp:TextBox>
						</div>
					</div>
					<div class="control-group">
						<div class="controls">
							<input id="btnGuardarInfPersonal" type="button" value="GUARDAR" class="btn btn-primary higher bold" onclick="ActualizarDatos();" />
						</div>
					</div>
						</div>
				</asp:Panel>
			</div>
		</div>
	</div> <!-- /container -->

	<div id="direccionModal" class="modal hide fade validationEngineContainer" tabindex="-1" role="dialog" aria-labelledby="direccionModalLabel" aria-hidden="true">
		<asp:HiddenField runat="server" ID="hdIdDireccion" />
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3 id="direccionModalLabel"><span class="light">Datos de </span>Dirección</h3>
		</div>
		<div class="modal-body" style="overflow-y:visible;">
			<div class="control-group">
				<label class="control-label hidden shown-ie8" for="txtDireccionNombre">Nombre</label>
				<div class="controls">
					<asp:TextBox runat="server" ID="txtDireccionNombre" CssClass="input-block-level validate[required]" placeholder="Nombre de la dirección" Width="220px"></asp:TextBox>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label hidden shown-ie8" for="inputPassword">Departamento</label>
				<div class="controls">
					<asp:DropDownList runat="server" ID="ddlDepartamento" CssClass="span2 validate[required]" Width="220px" onchange="GetProvincia();"></asp:DropDownList>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label hidden shown-ie8" for="inputPassword">Provincia</label>
				<div class="controls">
					<asp:DropDownList runat="server" ID="ddlProvincia" CssClass="span2 validate[required]" Width="220px" onchange="GetDistrito();">
						<asp:ListItem Text="Provincia" Value="-1" style="display:none;" disabled Selected></asp:ListItem>
					</asp:DropDownList>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label hidden shown-ie8" for="inputPassword">Distrito</label>
				<div class="controls">
					<asp:DropDownList runat="server" ID="ddlDistrito" CssClass="span2 validate[required]" Width="220px">
						<asp:ListItem Text="Distrito" Value="-1" style="display:none;" disabled Selected></asp:ListItem>
					</asp:DropDownList>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label hidden shown-ie8" for="inputPassword">Dirección</label>
				<div class="controls">
					<asp:TextBox runat="server" ID="txtDireccion" CssClass="input-block-level validate[required]" placeholder="Dirección" TextMode="MultiLine" Width="220px" Height="56px"></asp:TextBox>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label hidden shown-ie8" for="inputPassword">Referencia</label>
				<div class="controls">
					<asp:TextBox runat="server" ID="txtReferencia" CssClass="input-block-level validate[required]" placeholder="Referencia" TextMode="MultiLine" Width="220px" Height="56px"></asp:TextBox>
				</div>
			</div>
			<center><input type="button" ID="btnGuardarDireccion" class="btn btn-primary input-block-level bold higher" value="GUARDAR" onclick="GuardarDireccion();"/></center>
		</div>
	</div>

	<div id="ordenModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="ordenModalLabel" aria-hidden="true" style="width:900px;left: 27%;">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3 id="ordenModalLabel"><span class="light">Datos de </span>Orden</h3>
		</div>
		<div class="modal-body">
			<center>
				<table>
					<tr>
						<td class="negrita">Pedido N°:</td>
						<td id="tdPedido" style="padding-left:10px;"></td>
						<td width="100px"></td>
						<td class="negrita">Fecha de Compra:</td>
						<td id="tdFechaCompra" style="padding-left:10px;"></td>
					</tr>
					<tr>
						<td class="negrita">Forma de Pago:</td>
						<td id="tdFormaPago" style="padding-left:10px;"></td>
						<td width="100px"></td>
						<td class="negrita">Tipo Recibo:</td>
						<td id="tdTipoRecibo" style="padding-left:10px;"></td>
					</tr>
					<tr id="trTipoRecibo">
						<td class="negrita">RUC:</td>
						<td id="tdRuc" style="padding-left:10px;"></td>
						<td width="100px"></td>
						<td class="negrita">Razón Social:</td>
						<td id="tdRazonSocial" style="padding-left:10px;"></td>
					</tr>
				</table>
				<br /><br />
				<table class="table table-items">
					<thead>
						<tr>
							<th><div class="align-center">Ítem</div></th>
							<th><div class="align-center">Color</div></th>
							<th><div class="align-center">Cantidad</div></th>
							<th><div class="align-center">Precio</div></th>
							<th><div class="align-center">Importe</div></th>
						</tr>
					</thead>
					<tbody id="bodyCarrito" runat="server">
						<tr>
							<td colspan="3" rowspan="3">
								<table>
									<tr>
										<td class="negrita" style="border:0;text-align:left">Dirección<br />Envío:</td>
										<td id="tdDirEnvio" style="border:0;padding-left:10px;"></td>
									</tr>
									<tr>
										<td class="negrita" style="border:0;text-align:left">Dirección<br />Facturación:</td>
										<td id="tdDirFacturacion" style="border:0;padding-left:10px;"></td>
									</tr>
								</table>
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

				<br /><br />


			</center>
		</div>
	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContent" runat="server">
	<script type="text/javascript">
		var pageUrl = '<%=ResolveUrl("Cuenta.aspx")%>'

		function SeleccionarMenuCuenta(menu)
		{
			$("#liInfCuenta").removeClass("active");
			$("#liContrasena").removeClass("active");
			$("#liDirecciones").removeClass("active");
			$("#liOrdenes").removeClass("active");
			$("#liFavoritos").removeClass("active");

			$("#pnlInfCuenta").css("display", "none");
			$("#pnlFavoritos").css("display", "none");
			$("#pnlContrasena").css("display", "none");
			$("#pnlDireccion").css("display", "none");
			$("#pnlOrdenes").css("display", "none");

			switch(menu)
			{
				case 1:
					$("#liInfCuenta").addClass("active");
					$("#pnlInfCuenta").css("display", "");
					LlenarDatos();
					break;
				case 2:
					$("#liContrasena").addClass("active");
					$("#pnlContrasena").css("display", "");
					LimpiarPassword();
					break;
				case 3:
					$("#liDirecciones").addClass("active");
					$("#pnlDireccion").css("display", "");
					break;
				case 4:
					$("#liOrdenes").addClass("active");
					$("#pnlOrdenes").css("display", "");
					break;
				case 5:
					$("#liFavoritos").addClass("active");
					$("#pnlFavoritos").css("display", "");
					break;
			}
		}

		function CambiarContrasena() {
			if ($("#divContrasena").validationEngine('validate')) {
				$.ajax
				({
					type: "POST",
					url: pageUrl + "/CambiarContrasena",
					data: "{'contrasenaAntigua': '" + $('#txtContrasenaActual').val() + "', 'contrasenaNueva': '" + $('#txtContrasenaNueva').val() + "'}",
					contentType: "application/json; charset=utf-8",
					dataType: "json",
					success: function (response) {
						if (response.d == "-1")
							jAlert("Lo sentimos, su contraseña actual es incorrecta.", "Contraseña Inválida");
						else
							jAlert("Su contraseña ha sido cambiada satisfactoraimente.", "Cambio de Contraseña");

						LimpiarPassword();
					},
					error: function (response) {
						MostrarError();
					}
				});
			}
		}

		function ActualizarDatos() {

			if ($("#divDatosCuenta").validationEngine('validate')) {
				var objUsuarioBE = {};

				objUsuarioBE.Nombre = $("#txtAccNombre").val();
				objUsuarioBE.Apellido_Paterno = $("#txtAccApellidoP").val();
				objUsuarioBE.Apellido_Materno = $("#txtAccApellidoM").val();
				objUsuarioBE.Dni = $("#txtAccDNI").val();
				objUsuarioBE.Celular = $("#txtAccCelular").val();
				objUsuarioBE.Telefono = $("#txtAccTelefono").val();
				objUsuarioBE.Email = $("#txtAccEmail").val();

				var DTO = { 'objUsuarioBE': objUsuarioBE };

				$.ajax
				({
					type: "POST",
					url: pageUrl + "/ActualizarDatos",
					data: JSON.stringify(DTO),
					contentType: "application/json; charset=utf-8",
					dataType: "json",
					success: function (response) {
						switch (response.d) {
							case -1: jAlert("Lo sentimos, el correo que ha escogido ya se encuentra en uso.", "Actualizar Datos");
								break;
							case -2: jAlert("Ha cambiado su correo. Por favor vuelva a verificar su cuenta.", "Actualizar Datos");
								break;
							case -3: jAlert("Sus datos han sido cambiados satisfactoriamente.", "Actualizar Datos");
								break;
						}
					},
					error: function (response) {
						MostrarError();
					}
				});
			}
		}

		function LimpiarPassword()
		{
			$('#txtContrasenaActual').val("");
			$('#txtContrasenaNueva').val("");
			$('#txtContrasenaRepertir').val("");
		}

		function LimpiarDireccion()
		{
			$('#<%=txtDireccionNombre.ClientID%>').val("");
			$('#<%=txtDireccion.ClientID%>').val("");
			$('#<%=txtReferencia.ClientID%>').val("");
			$('#<%=ddlProvincia.ClientID%>').empty().append('<option value="-1" style="display:none;" disabled selected>Provincia</option>');
			$('#<%=ddlDistrito.ClientID%>').empty().append('<option value="-1" style="display:none;" disabled selected>Distrito</option>');
			$('#<%=ddlDepartamento.ClientID%>').val("-1");
			$('#<%=hdIdDireccion.ClientID%>').val("0");
		}

		function GuardarDireccion()
		{
			if ($("#direccionModal").validationEngine('validate')) {
				var aux = $("#<%=hdIdDireccion.ClientID%>").val();

				var objDireccionBE = {};

				objDireccionBE.Nombre = $("#<%=txtDireccionNombre.ClientID%>").val();
				objDireccionBE.Direccion = $("#<%=txtDireccion.ClientID%>").val();
				objDireccionBE.Referencia = $("#<%=txtReferencia.ClientID%>").val();
				objDireccionBE.Id_Provincia = $("#<%=ddlProvincia.ClientID%>").val();
				objDireccionBE.Id_Distrito = $("#<%=ddlDistrito.ClientID%>").val();
				objDireccionBE.Id_Departamento = $("#<%=ddlDepartamento.ClientID%>").val();
				objDireccionBE.Nombre_Departamento = $("#<%=ddlDepartamento.ClientID%>").children(':selected').text();
				objDireccionBE.Nombre_Provincia = $("#<%=ddlProvincia.ClientID%>").children(':selected').text();
				objDireccionBE.Nombre_Distrito = $("#<%=ddlDistrito.ClientID%>").children(':selected').text();
				objDireccionBE.Id_Direccion = $("#<%=hdIdDireccion.ClientID%>").val();

				var DTO = { 'objDireccionBE': objDireccionBE };

				if (aux == 0)
					NuevaDireccion(DTO);
				else
					ActualizarDireccion(DTO);
			}
		}

		function ActualizarDireccion(DTO)
		{
			$.ajax
			({
				type: "POST",
				url: pageUrl + "/ActualizarDireccion",
				data: JSON.stringify(DTO),
				contentType: "application/json; charset=utf-8",
				dataType: "json",
				success: function (response) {
					if (response.d == -1)
						jAlert("Lo sentimos, usted ya tiene una dirección con ese nombre.", "Actualizar Dirección");
					else {
						
						$("#tdDireccionNombre" + DTO.objDireccionBE.Id_Direccion).html('<a href=\"#\" onclick=\"VerDireccion(' + DTO.objDireccionBE.Id_Direccion + ')\">' + DTO.objDireccionBE.Nombre + '</a> <a title=\"Remove Item\" class=\"icon-remover\" href=\"#\" onclick=\"RemoverDireccion(' + DTO.objDireccionBE.Id_Direccion + ')\"></a>');
						$("#tdDireccionDpto" + DTO.objDireccionBE.Id_Direccion).text(DTO.objDireccionBE.Nombre_Departamento);
						$("#tdDireccionProv" + DTO.objDireccionBE.Id_Direccion).text(DTO.objDireccionBE.Nombre_Provincia);
						$("#tdDireccionDist" + DTO.objDireccionBE.Id_Direccion).text(DTO.objDireccionBE.Nombre_Distrito);
						$("#tdDireccionDir" + DTO.objDireccionBE.Id_Direccion).text(DTO.objDireccionBE.Direccion);

						$('#direccionModal').modal('hide')
						jAlert("Se ha actualizado la dirección satisfactoriamente.", "Actualizar Dirección");
					}
				},
				error: function (response) {
					MostrarError();
				}
			});
		}

		function NuevaDireccion(DTO)
		{
			$.ajax
			({
				type: "POST",
				url: pageUrl + "/GuardarDireccion",
				data: JSON.stringify(DTO),
				contentType: "application/json; charset=utf-8",
				dataType: "json",
				success: function (response) {
					if (response.d == "")
						jAlert("Lo sentimos, usted ya tiene una dirección con ese nombre.", "Nueva Dirección");
					else {
						$("#trSinDir").remove();
						$("#<%=bodyDirecciones.ClientID%>").append(response.d);
						$('#direccionModal').modal('hide')
						jAlert("Se ha ingresado la dirección satisfactoriamente.", "Nueva Dirección");
					}
				},
				error: function (response) {
					MostrarError();
				}
			});
		}

		function LlenarDatos()
		{
			$.ajax
			({
				type: "POST",
				url: pageUrl + "/TraerDatosUsuario",
				contentType: "application/json; charset=utf-8",
				dataType: "json",
				success: function (response) {
					 $("#txtAccNombre").val(response.d.Nombre);
					 $("#txtAccApellidoP").val(response.d.Apellido_Paterno);
					 $("#txtAccApellidoM").val(response.d.Apellido_Materno);
					 $("#txtAccDNI").val(response.d.Dni);
					 $("#txtAccCelular").val(response.d.Celular);
					 $("#txtAccTelefono").val(response.d.Telefono);
					 $("#txtAccEmail").val(response.d.Email);
				},
				error: function (response) {
					MostrarError();
				}
			});
		}

		function RemoverFavorito(idProducto)
		{
			jConfirm('¿Está seguro que desea eliminar el item de su lista de favoritos?', 'Eliminar Favoritos', function(r) {
				if (r) {
					$.ajax
					({
						type: "POST",
						url: pageUrl + "/RemoverFavorito",
						data: "{'id_producto': '" + idProducto + "'}",
						contentType: "application/json; charset=utf-8",
						dataType: "json",
						success: function (response) {
							$("#trItemWish" + idProducto).remove();
						},
						error: function (response) {
							MostrarError();
						}
					});
				}
			});
		}

		function RemoverDireccion(idDireccion) {
			jConfirm('¿Está seguro que desea eliminar esta dirección?', 'Eliminar Dirección', function(r) {
				if (r) {
					$.ajax
					({
						type: "POST",
						url: pageUrl + "/RemoverDireccion",
						data: "{'idDireccion': '" + idDireccion + "'}",
						contentType: "application/json; charset=utf-8",
						dataType: "json",
						success: function (response) {
							$("#trItemDireccion" + idDireccion).remove();
						},
						error: function (response) {
							MostrarError();
						}
					});
				}
			});
		}

		function VerDireccion(idDireccion)
		{
			$.ajax
			({
				type: "POST",
				url: pageUrl + "/VerDireccion",
				data: "{'idDireccion': '" + idDireccion + "'}",
				contentType: "application/json; charset=utf-8",
				dataType: "json",
				success: function (response) {
					$("#<%=txtDireccionNombre.ClientID%>").val(response.d.Nombre);
					$("#<%=txtDireccion.ClientID%>").val(response.d.Direccion);
					$("#<%=txtReferencia.ClientID%>").val(response.d.Referencia);
					$("#<%=ddlDepartamento.ClientID%>").val(response.d.Id_Departamento);
					$.when(GetProvincia()).done(function () {
						$("#<%=ddlProvincia.ClientID%>").val(response.d.Id_Provincia);

						$.when(GetDistrito()).done(function () {
							$("#<%=ddlDistrito.ClientID%>").val(response.d.Id_Distrito);
						});
					});
					
					$('#<%=hdIdDireccion.ClientID%>').val(response.d.Id_Direccion);

					$('#direccionModal').modal('show');
				},
				error: function (response) {
					MostrarError();
				}
			});
		}

		function GetProvincia()
		{
			return $.ajax
			({
				type: "POST",
				url: pageUrl + "/GetProvincia",
				data: "{'codDpto': '" + $('#<%=ddlDepartamento.ClientID%>').val() + "'}",
				contentType: "application/json; charset=utf-8",
				dataType: "json",
				success: function (response) {
					PopulateControl(response.d, $('#<%=ddlProvincia.ClientID%>'), 'Provincia')
					GetDistrito();
				},
				error: function (response) {
					MostrarError();
				}
			});
		}

		function GetDistrito() {
			return $.ajax
			({
				type: "POST",
				url: pageUrl + "/GetDistrito",
				data: "{'codDpto': '" + $('#<%=ddlDepartamento.ClientID%>').val() + "', 'codProv': '" + $('#<%=ddlProvincia.ClientID%>').val() + "'}",
				contentType: "application/json; charset=utf-8",
				dataType: "json",
				success: function (response) {
					PopulateControl(response.d, $('#<%=ddlDistrito.ClientID%>'), 'Distrito')
				},
				error: function (response) {
					MostrarError();
				}
			});
			}

		function PopulateControl(list, control, placeholder) {
			if (list.length > 0) {
				control.removeAttr("disabled");
				control.empty().append('<option value="-1" style="display:none;" disabled selected>' + placeholder + '</option>');
				$.each(list, function () {
					control.append($("<option></option>").val(this['Value']).html(this['Text']));
				});
			}
			else {
				control.empty().append('<option value="-1" style="display:none;" disabled selected>' + placeholder + '</option>');
			}
		}

		function VerOrden(idOrden) {
			$.ajax
			({
				type: "POST",
				url: pageUrl + "/VerOrden",
				data: "{'idOrden': '" + idOrden + "'}",
				contentType: "application/json; charset=utf-8",
				dataType: "json",
				success: function (response) {
					$('#tdPedido').text(response.d.Id_Pedido);
					$('#tdFechaCompra').text(response.d.Fecha_Texto);
					$('#tdFormaPago').text(response.d.Nombre_Forma_Pago);
					$('#tdTipoRecibo').text(response.d.Nombre_Tipo_Recibo);
					
					if (response.d.Id_Tipo_Recibo == 1)
						$("#trTipoRecibo").css("display", "none");
					else
					{
						$("#trTipoRecibo").css("display", "");
						$('#tdRuc').text(response.d.Ruc);
						$('#tdRazonSocial').text(response.d.Razon_Social);
					}

					$("tr[name^='itemProducto']").remove();
					$("#<%=bodyCarrito.ClientID %>").prepend(response.d.Productos_Texto);

					$("#<%=lblFinalEnvio.ClientID%>").text(response.d.Precio_Envio)
					$("#<%=lblFinalSubTotal.ClientID%>").text(response.d.Subtotal)
					$("#<%=lblFinalTotal.ClientID%>").text(response.d.Total)

					$('#tdDirEnvio').text(response.d.Direccion_Envio_Texto);
					$('#tdDirFacturacion').text(response.d.Direccion_Facturacion_Texto);
					$('#ordenModal').modal('show');
				},
				error: function (response) {
					MostrarError();
				}
			});
		}

		$(document).ready(function () {
			$("#divDatosCuenta").validationEngine({ scroll: false, autoHidePrompt: true });
			$("#divContrasena").validationEngine({ scroll: false, autoHidePrompt: true });
			$("#direccionModal").validationEngine({ scroll: false, autoHidePrompt: true });
			SeleccionarMenu("");
		});
	</script>
</asp:Content>
