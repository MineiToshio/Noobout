<%@ Page Title="" Language="C#" MasterPageFile="~/eshop.Master" AutoEventWireup="true" CodeBehind="RecuperarPass.aspx.cs" Inherits="TuImportas.eShop.PL.Web.RecuperarPass" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">
    <asp:HiddenField runat="server" ID="hdUsuario" />
    <asp:HiddenField runat="server" ID="hdTokenRecuperar" />

    <div id="divContrasena" class="validationEngineContainer" style="padding:20px;" onkeypress="EnterGuardar();">
        <div class="underlined push-down-20">
            <h3><span class="light">Cambiar</span> Contraseña</h3>
        </div>
        <p class="push-down-40">
            Aquí podrás modificar la contraseña de tu cuenta
        </p>
        <div class="control-group">
            <label class="control-label" for="txtContrasenaNueva">Nueva Contraseña<span class="red-clr bold">*</span></label>
            <div class="controls">
                <input ID="txtContrasenaNueva" class="span4 validate[required]" type="password" />
            </div>
        </div>
        <div class="control-group">
            <label class="control-label" for="txtContrasenaRepertir">Repetir Contraseña<span class="red-clr bold">*</span></label>
            <div class="controls">
                <input ID="txtContrasenaRepertir" class="span4 validate[required,equals[txtContrasenaNueva]]" type="Password" />
            </div>
        </div>
        <div class="control-group">
            <div class="controls">
                <input id="btnGuardarContrasena" type="button" value="GUARDAR" class="btn btn-primary higher bold" onclick="CambiarContrasena();" />
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterContent" runat="server">
    <script type="text/javascript">
        var pageUrl = '<%=ResolveUrl("RecuperarPass.aspx")%>'

        $(document).ready(function () {
            $("#divContrasena").validationEngine({ scroll: false, autoHidePrompt: true });
            SeleccionarMenu("");
        });

        function CambiarContrasena()
        {
            if ($('#divContrasena').validationEngine('validate')) {
                var objUsuarioBE = {};

                objUsuarioBE.Usuario = $("#<%=hdUsuario.ClientID%>").val(),
                objUsuarioBE.Token_Recuperacion = $("#<%=hdTokenRecuperar.ClientID%>").val(),
                objUsuarioBE.Password = $("#txtContrasenaNueva").val()

                var DTO = { 'objUsuarioBE': objUsuarioBE };

                $.ajax
                ({
                    type: "POST",
                    url: pageUrl + "/Guardar",
                    data: JSON.stringify(DTO),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        jRedirect('Su contraseña se ha modificado satisfactoriamente.', 'Recuperar Contraseña', function (r) { window.location.href = '/inicio'; });
                    },
                    error: function (response) {
                        MostrarError();
                    }
                });
            }
        }

        function EnterGuardar() {
            if (event.keyCode == '13') {
                $("#btnGuardarContrasena").click();
                event.preventDefault();
            }
        }
    </script>
</asp:Content>
