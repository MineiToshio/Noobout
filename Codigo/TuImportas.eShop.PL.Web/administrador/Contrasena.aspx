<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Contrasena.aspx.cs" Inherits="TuImportas.eShop.PL.Web.administrador.Contrasena" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headerContent" runat="server">
    <title>Admin Cambiar Contraseña</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" runat="server">
    <br />
    <div id="divContrasena" class="validationEngineContainer content_admin">
        <div class="underlined push-down-30">
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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footerContent" runat="server">
    <script type="text/javascript">
        var pageUrl = '<%=ResolveUrl("Contrasena.aspx")%>';

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
                            top_noty('error', 'Lo sentimos, su contraseña actual es incorrecta.');
                        else
                            top_noty('information', 'Su contraseña ha sido cambiada satisfactoraimente.');

                        LimpiarPassword();
                    },
                    error: function (response) {
                        MostrarError();
                    }
                });
            }
        }

        function LimpiarPassword() {
            $('#txtContrasenaActual').val("");
            $('#txtContrasenaNueva').val("");
            $('#txtContrasenaRepertir').val("");
        }

        $(document).ready(function () {
            $("#divContrasena").validationEngine({ scroll: false, autoHidePrompt: true });
        });
    </script>
</asp:Content>
