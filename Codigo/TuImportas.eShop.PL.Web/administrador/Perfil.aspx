<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Perfil.aspx.cs" Inherits="TuImportas.eShop.PL.Web.administrador.Perfil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headerContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" runat="server">
	<br />
	<div id="divDatosCuenta" class="content_admin validationEngineContainer">
		<div class="underlined push-down-30">
			<h3><span class="light">Administrar</span> Mi Usuario</h3>
		</div>
		<p class="push-down-40">
			Aquí podrás modificar tus datos.
		</p>
		<div class="control-group">
			<label class="control-label" for="txtAccNombre">Nombre<span class="red-clr bold">*</span></label>
			<div class="controls">
				<asp:TextBox runat="server" ID="txtAccNombre" class="span4 validate[required]" ClientIDMode="Static"></asp:TextBox>
				<asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtAccNombre" Enabled="false" ValidationGroup="vgGuardar">
					<span style="color:red">* Llenar el campo</span>
				</asp:RequiredFieldValidator>
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
				<asp:TextBox runat="server" ID="txtAccDNI" class="span4 validate[required]" ClientIDMode="Static"></asp:TextBox>
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
				<%--<asp:Button runat="server" ID="btnGuardar" Text="GUARDAR" CssClass="btn btn-primary higher bold" OnClick="btnGuardar_Click"/>--%>
			</div>
		</div>
	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footerContent" runat="server">
	<script>
		var pageUrl = '<%=ResolveUrl("Perfil.aspx")%>';

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

		$(document).ready(function () {
			$("#divDatosCuenta").validationEngine({ autoHidePrompt: true });
		});
	</script>
</asp:Content>
