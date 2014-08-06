<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Slider.aspx.cs" Inherits="TuImportas.eShop.PL.Web.administrador.Slider" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headerContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" runat="server">
    <br />
    <div id="divDatosCuenta" class="content_admin validationEngineContainer">
        <div class="underlined push-down-30">
            <h3><span class="light">Administrar</span> Slider</h3>
        </div>
        <p class="push-down-40">
            Aquí podrás modificar los datos de un slider.
        </p>
        <div id="divUsuario" class="control-group" runat="server">
            <label class="control-label" for="txtNombre">Nombre <span class="red-clr bold">*</span></label>
            <div class="controls">
                <asp:TextBox runat="server" ID="txtNombre" class="span4 validate[required]" ClientIDMode="Static"></asp:TextBox>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label" for="txtDescripcion">Descripción <span class="red-clr bold">*</span></label>
            <div class="controls">
                <asp:TextBox runat="server" ID="txtDescripcion" class="span4 validate[required]" ClientIDMode="Static"></asp:TextBox>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label" for="txtBoton">Botón <span class="red-clr bold">*</span></label>
            <div class="controls">
                <asp:TextBox runat="server" ID="txtBoton" class="span4 validate[required]" ClientIDMode="Static"></asp:TextBox>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label" for="txtUrl">Url <span class="red-clr bold">*</span></label>
            <div class="controls">
                <asp:TextBox runat="server" ID="txtUrl" class="span4" ClientIDMode="Static"></asp:TextBox>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label" for="fuFondo">Fondo <span class="red-clr bold">*</span></label>
            <div class="controls">
                <asp:FileUpload runat="server" ID="fuFondo" class="span4 validate[required]" ClientIDMode="Static" />
                <asp:Panel runat="server" ID="pnlImagen1" CssClass="img-no-stretch" ClientIDMode="Static" onclick="AbrirModalImagen(1);" Height="200px" Width="700px"></asp:Panel>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label" for="fuImagen">Imagen <span class="red-clr bold">*</span></label>
            <div class="controls">
                <asp:FileUpload runat="server" ID="fuImagen" class="span4 validate[required]" ClientIDMode="Static" />
                <asp:Panel runat="server" ID="pnlImagen2" CssClass="img-no-stretch" ClientIDMode="Static" onclick="AbrirModalImagen(2);" Height="150px" Width="150px"></asp:Panel>
            </div>
        </div>
        <div class="control-group">
            <div class="controls">
                <asp:Button runat="server" id="btnRegresar" Text="REGRESAR" class="btn btn-dark higher bold" PostBackUrl="~/administrador/Sliders.aspx"/>
                <asp:Button runat="server" id="btnGuardar" Text="GUARDAR" class="btn btn-dark higher bold" OnClick="btnGuardar_Click" OnClientClick="return Guardar()"/>
            </div>
        </div>
    </div>

    <div id="imagenModal" class="modal hide fade validationEngineContainer" tabindex="-1" role="dialog" aria-labelledby="imagenModalLabel" aria-hidden="true">
        <asp:HiddenField runat="server" ID="hdIdDireccion" />
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h3 id="imagenModalLabel"><span class="light">Nueva </span>Imagen</h3>
        </div>
        <div class="modal-body" style="overflow-y:visible;padding:10px 0 0 0">
            <div class="control-group">
                <asp:HiddenField runat="server" ID="hdImagenCodigo" ClientIDMode="Static" />
                <asp:HiddenField runat="server" ID="hdRutaImagen" ClientIDMode="Static" />
                <div class="controls">
                    <asp:FileUpload runat="server" ID="fuNuevaImagen"/>
                </div>
            </div>
            <center>
                <asp:Button Text="GUARDAR" runat="server" ID="btnGuardarImagen" class="btn btn-dark input-block-level bold higher" OnClick="btnGuardarImagen_Click"/>
            </center>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footerContent" runat="server">
    <script>
        function AbrirModalImagen(codigo) {
            $('#hdImagenCodigo').val(codigo);
            $('#hdRutaImagen').val($("#pnlImagen" + codigo).css("background-image"));
            $('#imagenModal').modal('show');
        }

        function Guardar() {
            return $('#divDatosCuenta').validationEngine('validate')
        }
    </script>
</asp:Content>
