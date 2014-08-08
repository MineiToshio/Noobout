<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Usuario.aspx.cs" Inherits="TuImportas.eShop.PL.Web.administrador.Usuario" EnableEventValidation="false"%>
<asp:Content ID="Content1" ContentPlaceHolderID="headerContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" runat="server">
    <div id="divDatosCuenta" class="content_admin validationEngineContainer">
        <div class="underlined push-down-30">
            <h3><span class="light">Administrar</span> Usuario</h3>
        </div>
        <p class="push-down-40">
            Aquí podrás modificar los datos de un usuario.
        </p>
        <div id="divUsuario" class="control-group" runat="server">
            <label class="control-label" for="txtAccNombre">Usuario<span class="red-clr bold">*</span></label>
            <div class="controls">
                <asp:TextBox runat="server" ID="txtAccUsuario" class="span4 validate[required]" ClientIDMode="Static"></asp:TextBox>
            </div>
        </div>
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
            <label class="control-label" for="txtAccEmail">Rol<span class="red-clr bold">*</span></label>
            <div class="controls">
                <asp:DropDownList runat="server" ID="ddlRol" ClientIDMode="Static">
                    <asp:ListItem Text="Usuario" Value="2"></asp:ListItem>
                    <asp:ListItem Text="Admin" Value="1"></asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        <div id="divContrasena" class="control-group" runat="server">
            <label class="control-label" for="txtAccPassword">Contraseña<span class="red-clr bold">*</span></label>
            <div class="controls">
                <asp:TextBox runat="server" ID="txtAccPassword" class="span4 validate[required]" ClientIDMode="Static" TextMode="Password"></asp:TextBox>
            </div>
        </div>
        <div id="divContrasena2" class="control-group" runat="server">
            <label class="control-label" for="txtAccPassword2">Repetir Contraseña<span class="red-clr bold">*</span></label>
            <div class="controls">
                <asp:TextBox runat="server" ID="txtAccPassword2" class="span4 validate[required]" ClientIDMode="Static" TextMode="Password"></asp:TextBox>
            </div>
        </div>
        <div class="control-group">
            <div class="controls">
                <asp:Button runat="server" id="btnRegresar" Text="REGRESAR" class="btn btn-dark higher bold" PostBackUrl="~/administrador/Usuarios.aspx"/>
                <input id="btnGuardarInfPersonal" type="button" value="GUARDAR" class="btn btn-dark higher bold" onclick="Guardar();" />
                <%--<asp:Button runat="server" ID="btnGuardar" Text="GUARDAR" CssClass="btn btn-primary higher bold" OnClick="btnGuardar_Click"/>--%>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footerContent" runat="server">
    <script>
        var pageUrl = '<%=ResolveUrl("Usuario.aspx")%>';
        var idUsuario = <%=idUsuario%>

        function ActualizarDatos(DTO) {
            $.ajax
            ({
                type: "POST",
                url: pageUrl + "/ActualizarDatos",
                data: JSON.stringify(DTO),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    switch (response.d) {
                        case -1: jRedirect("Lo sentimos, el correo que ha escogido ya se encuentra en uso.", "Actualizar Datos", function (r) { window.location.href = '/administrador/usuarios.aspx' });
                            break;
                        case -2: jRedirect("Ha cambiado su correo. Por favor vuelva a verificar su cuenta.", "Actualizar Datos", function (r) { window.location.href = '/administrador/usuarios.aspx' });
                            break;
                        case -3: jRedirect("Sus datos han sido cambiados satisfactoriamente.", "Actualizar Datos", function (r) { window.location.href = '/administrador/usuarios.aspx' });
                            break;
                    }
                },
                error: function (response) {
                    MostrarError();
                }
            });
        }

        function RegistrarUsuario(DTO) {
            $.ajax
            ({
                type: "POST",
                url: pageUrl + "/RegistrarUsuario",
                data: JSON.stringify(DTO),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    switch (response.d) {
                        case -1: //Usuario_Repetido
                            jAlert("Lo sentimos, el usuario que ha escogido ya se encuentra registrado.", "Usuario Repetido");
                            break;
                        case -2: //Email_Repetido
                            jAlert("Lo sentimos, el email que ha escogido ya se encuentra registrado.", "Email Repetido");
                            break;
                        case -3: //Dni_Repetido
                            jAlert("Lo sentimos, el DNI que ha escogido ya se encuentra registrado.", "DNI Repetido");
                            break;
                        default:
                            jRedirect("Su cuenta ha sido creada satisfactoriamente. Por favor revise su correo para activar su cuenta.", "Cuenta Creada", function (r) { window.location.href = '/administrador/usuarios.aspx' });
                            break;
                    }
                },
                error: function (response) {
                    MostrarError();
                }
            });
        }

        function Guardar()
        {
            if ($("#divDatosCuenta").validationEngine('validate')) {
                var objUsuarioBE = {};

                objUsuarioBE.Nombre = $("#txtAccNombre").val();
                objUsuarioBE.Apellido_Paterno = $("#txtAccApellidoP").val();
                objUsuarioBE.Apellido_Materno = $("#txtAccApellidoM").val();
                objUsuarioBE.Dni = $("#txtAccDNI").val();
                objUsuarioBE.Celular = $("#txtAccCelular").val();
                objUsuarioBE.Telefono = $("#txtAccTelefono").val();
                objUsuarioBE.Email = $("#txtAccEmail").val();
                objUsuarioBE.Id_Rol = $("#ddlRol").val();
                objUsuarioBE.Id_Usuario = idUsuario;
                objUsuarioBE.Usuario = $("#txtAccUsuario").val();
                objUsuarioBE.Password = $("#txtAccPassword").val();

                var DTO = { 'objUsuarioBE': objUsuarioBE };

                if (idUsuario == 0)
                    RegistrarUsuario(DTO)
                else
                    ActualizarDatos(DTO);
            }
        }

        $(document).ready(function () {
            $("#divDatosCuenta").validationEngine({ autoHidePrompt: true });
        });
    </script>
</asp:Content>
