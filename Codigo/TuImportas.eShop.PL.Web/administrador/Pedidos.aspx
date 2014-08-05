<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Pedidos.aspx.cs" Inherits="TuImportas.eShop.PL.Web.administrador.Pedidos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headerContent" runat="server">
	<link rel="stylesheet" href="/stylesheets/metallic.css" type="text/css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" runat="server">
	<asp:HiddenField runat="server" ID="hdIdPedidoSel"/>
	<br />
	<div class="content_admin">
		<div class="underlined push-down-30">
			<h3><span class="light">Administrar</span> Pedidos</h3>
		</div>
		<center>
			<table>
				<tr>
					<td>
						<label class="control-label" for="txtPedidoFechaInicioBuscar">Fecha de Compra Inicio:</label>
						<asp:TextBox runat="server" ID="txtPedidoFechaInicioBuscar" CssClass="datepicker" style="cursor:pointer;"></asp:TextBox>
					</td>
					<td width="50px"></td>
					<td>
						<label class="control-label" for="txtPedidoFechaFinBuscar">Fecha de Compra Fin:</label>
						<asp:TextBox runat="server" ID="txtPedidoFechaFinBuscar" CssClass="datepicker"></asp:TextBox>
					</td>
					<td width="50px"></td>
					<td>
						<label class="control-label" for="txtPedidoUsuarioBuscar">Usuario:</label>
						<asp:TextBox runat="server" ID="txtPedidoUsuarioBuscar"></asp:TextBox>
					</td>
					<td width="50px"></td>
					<td>
						<label class="control-label" for="ddlPedidoEstadoBuscar">Estado:</label>
						<asp:DropDownList runat="server" ID="ddlPedidoEstadoBuscar" Width="100px">
							<asp:ListItem Value="-1">Todos</asp:ListItem>
							<asp:ListItem Value="1">Pedido</asp:ListItem>
							<asp:ListItem Value="2">Pagado</asp:ListItem>
							<asp:ListItem Value="3">Expirado</asp:ListItem>
							<asp:ListItem Value="4">Entregado</asp:ListItem>
						</asp:DropDownList>
					</td>
				</tr>
				<tr>
					<td colspan="7" align="right"><asp:Button runat="server" ID="btnBuscar" Text="Buscar" CssClass="btn btn-primary higher bold" OnClick="btnBuscar_Click"/></td>
				</tr>
			</table>
			<asp:GridView ID="gvPedidos" runat="server"
				AutoGenerateColumns="False"
				DataKeyNames="Id_Pedido"
				CssClass="gridview"
				PagerStyle-CssClass="pgr"
				AlternatingRowStyle-CssClass="alt"
				ShowHeader="true" OnRowCommand="gvPedidos_RowCommand"
				AllowPaging="true" PageSize="15" OnPageIndexChanging="gvPedidos_PageIndexChanging" AllowSorting="true" OnSorting="gvPedidos_Sorting">
				<EmptyDataTemplate>
					<center><asp:Label ID="lMensajes" runat="server" Font-Size="9pt" ForeColor="#00639E" Text="[No se encontraron pedidos]"></asp:Label></center>
				</EmptyDataTemplate>
				<Columns>
					<asp:BoundField DataField="Id_Pedido" HeaderText="Pedido N°" ItemStyle-HorizontalAlign="Center" SortExpression="Id_Pedido"/>
					<asp:BoundField DataField="Fecha_Compra" HeaderText="Fecha" ItemStyle-HorizontalAlign="Center" SortExpression="Fecha_Compra"/>
					<asp:BoundField DataField="Nombre_Forma_Pago" HeaderText="Forma de Pago" ItemStyle-HorizontalAlign="Center" SortExpression="Nombre_Forma_Pago"/>
					<asp:BoundField DataField="Total" HeaderText="Monto (S/.)" ItemStyle-HorizontalAlign="Center" SortExpression="Total"/>
					<asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Usuario" SortExpression="Nombre_Usuario">
						<ItemTemplate>
							<a href="#" onclick="VerUsuario(<%#Eval("Id_Usuario")%>)"><%#Eval("Nombre_Usuario")%></a>
						</ItemTemplate>
					</asp:TemplateField>
					<%--<asp:BoundField DataField="Nombre_Estado" HeaderText="Estado" ItemStyle-HorizontalAlign="Center"/>--%>
					<asp:TemplateField HeaderText="Estado" ItemStyle-HorizontalAlign="Center" SortExpression="Estado">
						<ItemTemplate>
							<a href="#" onclick="CambiarEstado(<%#Eval("Id_Pedido")%>,<%#Eval("estado")%>)"><%#Eval("Nombre_Estado")%></a>
						</ItemTemplate>
					</asp:TemplateField>
					<asp:TemplateField ItemStyle-HorizontalAlign="Center">
						<ItemTemplate>
							<a href="#" onclick="VerPedido(<%#Eval("Id_Pedido")%>)">Ver</a>
						</ItemTemplate>
					</asp:TemplateField>
				</Columns>
			</asp:GridView>
		</center>
	</div>

	<div id="estadoModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="estadoModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3 id="estadoModalLabel"><span class="light">Cambiar</span> Estado</h3>
		</div>
		<div class="modal-body" style="overflow-y:visible;padding:0;">
			<%--<div class="control-group">--%>
				<%--<label class="control-label hidden shown-ie8" for="inputEmailRegister">Estado</label>
				<div class="controls">
					<input type="email" class="input-block-level validate[required,custom[email]]" id="inputEmailRegister" placeholder="Email">
				</div>--%>
				<br />Esta opción cambia el estado de un pedido a entregado. <br /><br />CUIDADO: Esta opción es irreversible.<br /><br />
			<%--</div>--%>
			<center><asp:Button runat="server" ID="btnCambiarEstado" Text="ENTREGADO" CssClass="btn btn-primary input-block-level bold higher" OnClick="btnCambiarEstado_Click"/></center><br />
		</div>
	</div>

	<div id="usuarioModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="usuarioModal" aria-hidden="true" style="width:400px;left:47%;">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3 id="usuarioModalLabel"><span class="light">Datos del</span> Usuario</h3>
		</div>
		<div class="modal-body" style="overflow-y:visible;">
			<table style="font-size:11pt;" align="center">
				<tr>
					<td class="negrita">Usuario:</td>
					<td id="tdUsuario" style="padding-left:10px;"></td>
				</tr>
				<tr>
					<td class="negrita">Nombre:</td>
					<td id="tdUsuarioNombre" style="padding-left:10px;"></td>
				</tr>
				<tr>
					<td class="negrita">DNI:</td>
					<td id="tdUsuarioDni" style="padding-left:10px;"></td>
				</tr>
				<tr>
					<td class="negrita">Teléfono:</td>
					<td id="tdUsuarioTelefono" style="padding-left:10px;"></td>
				</tr>
				<tr>
					<td class="negrita">Celular:</td>
					<td id="tdUsuarioCelular" style="padding-left:10px;"></td>
				</tr>
				<tr>
					<td class="negrita">EMail:</td>
					<td id="tdUsuarioEMail" style="padding-left:10px;"></td>
				</tr>
				<tr>
					<td class="negrita">Activo:</td>
					<td id="tdUsuarioActivo" style="padding-left:10px;"></td>
				</tr>
			</table>
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
<asp:Content ID="Content3" ContentPlaceHolderID="footerContent" runat="server">
	<script src="/js/zebra_datepicker.js" type="text/javascript"></script>
	<script>
		var pageUrl = '<%=ResolveUrl("Pedidos.aspx")%>'

		function CambiarEstado(idPedido, estado)
		{
			if (estado == 2) {
				$("#<%=hdIdPedidoSel.ClientID%>").val(idPedido);
				$('#estadoModal').modal('show');
			}
			else
				jAlert("Lo sentimos, solo se puede cambiar el estado a ENTREGADO a un pedido en estado PAGADO", "Cambiar Estado");
		}

		function VerUsuario(idUsuario)
		{
			$.ajax
			({
				type: "POST",
				url: pageUrl + "/VerUsuario",
				data: "{'idUsuario': '" + idUsuario + "'}",
				contentType: "application/json; charset=utf-8",
				dataType: "json",
				success: function (response) {
					$('#tdUsuario').text(response.d.Usuario);
					$('#tdUsuarioNombre').text(response.d.Nombre_Completo);
					$('#tdUsuarioDni').text(response.d.Dni);
					if (response.d.Telefono == null)
						$('#tdUsuarioTelefono').text('-');
					else
						$('#tdUsuarioTelefono').text(response.d.Telefono);
					if (response.d.Celular == null)
						$('#tdUsuarioCelular').text('-');
					else
						$('#tdUsuarioCelular').text(response.d.Celular);
					$('#tdUsuarioEMail').text(response.d.Email);
					$('#tdUsuarioActivo').text(response.d.Activo);

					$('#usuarioModal').modal('show');
				},
				error: function (response) {
					MostrarError();
				}
			});
			
		}

		function VerPedido(idOrden) {
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
					else {
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

		$(function () {
			//$(".datepicker").datepicker({ dateFormat: 'dd/mm/yy' });
		    $('.datepicker').Zebra_DatePicker({ format: 'd/m/Y' });
		});
	</script>
</asp:Content>
