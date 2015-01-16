<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Producto.aspx.cs" Inherits="TuImportas.eShop.PL.Web.administrador.Producto" ValidateRequest="false" EnableEventValidation="false"%>
<asp:Content ID="Content1" ContentPlaceHolderID="headerContent" runat="server">
    <link href="/stylesheets/flipswitch.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" runat="server">
    <div id="divProducto" class="content_admin validationEngineContainer">
        <div class="underlined push-down-30">
            <h3><span class="light">Administrar</span> Producto</h3>
        </div>
        <ul runat="server" id="myTab2" class="nav nav-tabs nav-tabs-style-2" style="margin-left:20px;">
            <li runat="server" class="active" id="liInformacion" ClientIDMode="Static">
                <a href="#tabInformacion" data-toggle="tab">Información</a>
            </li>
            <li runat="server" id="liMedia" ClientIDMode="Static">
                <a href="#tabMedia" data-toggle="tab">Media</a>
            </li>
            <li runat="server" id="liAtributos" ClientIDMode="Static">
                <a href="#tabAtributos" data-toggle="tab">Atributos</a>
            </li>
        </ul>
        <div class="tab-content" style="margin-top:11px;">
            <div class="fade in tab-pane active validationEngineContainer" id="tabInformacion" runat="server" ClientIDMode="Static">
                <div class="control-group">
                    <label class="control-label" for="txtNombre">Nombre<span class="red-clr bold"> *</span></label>
                    <div class="controls">
                        <asp:TextBox runat="server" ID="txtNombre" class="span4 validate[required]" ClientIDMode="Static"></asp:TextBox>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="txtPrecio">Precio<span class="red-clr bold"> *</span></label>
                    <div class="controls">
                        <asp:TextBox runat="server" ID="txtPrecio" class="span4 positive validate[required]" ClientIDMode="Static"></asp:TextBox>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="chkDestacado">Producto Destacado</label>
                    <div class="controls">
                        <%--<asp:CheckBox runat="server" ID="chkDestacado" ClientIDMode="Static" />--%>
                        <div class="onoffswitch">
                            <%--<asp:CheckBox runat="server" ID="chkDestacado" ClientIDMode="Static" name="onoffswitch" class="onoffswitch-checkbox" Checked/>--%>
                            <input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox" id="chkDestacado" checked runat="server" ClientIDMode="Static">
                            <label class="onoffswitch-label" for="chkDestacado">
                                <span class="onoffswitch-inner"></span>
                                <span class="onoffswitch-switch"></span>
                            </label>
                        </div>

                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="txtDescripcionCorta">Descripción Corta<span class="red-clr bold"> *</span></label>
                    <div class="controls">
                        <asp:TextBox runat="server" ID="txtDescripcionCorta" class="span4 validate[required]" ClientIDMode="Static" TextMode="MultiLine"></asp:TextBox>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="txtDescripcion">Descripción<span class="red-clr bold"> *</span></label>
                    <div class="controls">
                        <asp:TextBox runat="server" ID="txtDescripcion" class="span4 validate[required]" ClientIDMode="Static" TextMode="MultiLine"></asp:TextBox>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="fuImagen1">Categorias<span class="red-clr bold"> *</span></label>
                    <div class="controls">
                        <table>
                            <tr>
                                <td rowspan="2">
                                    <asp:ListBox runat="server" ID="lbCategoriaPartida"></asp:ListBox>
                                </td>
                                <td><input value=">" id="btnCategoriaDerecha" type="button" class="btn btn-dark right-categoria"/></td>
                                <td rowspan="2">
                                    <asp:ListBox runat="server" ID="lbCategoriaDestino" CssClass="validate[required]" ClientIDMode="Static"></asp:ListBox>
                                </td>
                            </tr>
                            <tr>
                                <td><input value="<" id="btnCategoriaIzquierda" type="button" class="btn btn-dark left-categoria"/></td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="txtDetalle">Detalle<span class="red-clr bold"> *</span></label>
                    <div class="controls">
                        <asp:TextBox runat="server" ID="txtDetalle" class="span4 validate[required]" ClientIDMode="Static" TextMode="MultiLine"></asp:TextBox>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="txtCaracteristicaTecnica">Característica Técnica<span class="red-clr bold"> *</span></label>
                    <div class="controls">
                        <asp:TextBox runat="server" ID="txtCaracteristicaTecnica" class="span4 validate[required]" ClientIDMode="Static" TextMode="MultiLine"></asp:TextBox>
                    </div>
                </div>
                
            </div>
            <div class="fade tab-pane validationEngineContainer" id="tabMedia" runat="server" ClientIDMode="Static">
                <div class="control-group">
                    <label class="control-label" for="txtYoutube">Youtube<span class="red-clr bold"> *</span></label>
                    <div class="controls">
                        <asp:TextBox runat="server" ID="txtYoutube" class="span4 validate[required]" ClientIDMode="Static"></asp:TextBox>
                    </div>
                </div>
                <asp:Panel runat="server" ID="pnlImagenInsertar">
                    <div class="control-group">
                        <label class="control-label" for="fuImagen1">Imagen Principal<span class="red-clr bold"> *</span></label>
                        <div class="controls">
                            <asp:FileUpload runat="server" ID="fuImagen1" class="span4 validate[required]" ClientIDMode="Static" />
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="fuImagen1">Imagen 2</label>
                        <div class="controls">
                            <asp:FileUpload runat="server" ID="fuImagen2" class="span4" ClientIDMode="Static" />
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="fuImagen1">Imagen 3</label>
                        <div class="controls">
                            <asp:FileUpload runat="server" ID="fuImagen3" class="span4" ClientIDMode="Static" />
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="fuImagen1">Imagen 4</label>
                        <div class="controls">
                            <asp:FileUpload runat="server" ID="fuImagen4" class="span4" ClientIDMode="Static" />
                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel runat="server" ID="pnlImagenActualizar">
                    <table>
                        <tr>
                            <td style="vertical-align:top;">
                                <div class="control-group">
                                    <label class="control-label" for="imgProducto1">Imagen Principal<span class="red-clr bold"> *</span></label>
                                    <div class="controls">
                                        <%--<asp:Image runat="server" ID="imgProducto1" class="span4 validate[required]" ClientIDMode="Static" ImageUrl="~/images/no-image.png" Width="150px" Height="150px"/>--%>
                                        <asp:Panel runat="server" ID="pnlImagen1" CssClass="img-admin-product" ClientIDMode="Static" onclick="AbrirModalImagen(1);"></asp:Panel>
                                    </div>
                                </div>
                            </td>
                            <td style="width:50px;"></td>
                            <td style="vertical-align:top;">
                                <div class="control-group">
                                    <label class="control-label" for="pnlImagen2">Imagen 2<span class="red-clr bold"> *</span></label>
                                    <div class="controls">
                                        <%--<asp:Image runat="server" ID="imgProducto2" class="span4 validate[required]" ClientIDMode="Static" ImageUrl="~/images/no-image.png" Width="150px" Height="150px" />--%>
                                        <asp:Panel runat="server" ID="pnlImagen2" CssClass="img-admin-product" ClientIDMode="Static" onclick="AbrirModalImagen(2);"></asp:Panel>
                                        <asp:LinkButton runat="server" ID="lnkEliminarImagen2" Text="Eliminar" OnClick="lnkEliminarImagen2_Click"></asp:LinkButton>
                                    </div>
                                </div>
                            </td>
                            <td style="width:50px;"></td>
                            <td style="vertical-align:top;">
                                <div class="control-group">
                                    <label class="control-label" for="pnlImagen3">Imagen 3<span class="red-clr bold"> *</span></label>
                                    <div class="controls">
                                        <asp:Panel runat="server" ID="pnlImagen3" CssClass="img-admin-product" ClientIDMode="Static" onclick="AbrirModalImagen(3);"></asp:Panel>
                                        <asp:LinkButton runat="server" ID="lnkEliminarImagen3" Text="Eliminar" OnClick="lnkEliminarImagen3_Click"></asp:LinkButton>
                                    </div>
                                </div>
                            </td>
                            <td style="width:50px;"></td>
                            <td style="vertical-align:top;">
                                <div class="control-group">
                                    <label class="control-label" for="pnlImagen4">Imagen 4<span class="red-clr bold"> *</span></label>
                                    <div class="controls">
                                        <asp:Panel runat="server" ID="pnlImagen4" CssClass="img-admin-product" ClientIDMode="Static" onclick="AbrirModalImagen(4);"></asp:Panel>
                                        <asp:LinkButton runat="server" ID="lnkEliminarImagen4" Text="Eliminar" OnClick="lnkEliminarImagen4_Click"></asp:LinkButton>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </div>
            <div class="fade tab-pane" id="tabAtributos" runat="server" ClientIDMode="Static">
                <asp:ScriptManager runat="server" ID="sm"></asp:ScriptManager>
                <asp:UpdatePanel runat="server" id="upAtributos">
                    <ContentTemplate>
                        <asp:DropDownList runat="server" ID="ddlAtributo"></asp:DropDownList> <asp:LinkButton ID="lnkAgregarAtributo" runat="server" Text="Agregar" OnClick="lnkAgregarAtributo_Click" OnClientClick="AgregarCategoria();"></asp:LinkButton>
                        <asp:Panel runat="server" ID="pnlAtributos"></asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
                
            </div>
        </div>
        <br />
        <div class="control-group">
            <div class="controls">
                <asp:Button runat="server" id="btnGuardar" Text="GUARDAR" class="btn btn-dark higher bold" OnClick="btnGuardar_Click" />
                <asp:Button runat="server" id="btnRegresar" Text="REGRESAR" class="btn btn-dark higher bold" PostBackUrl="~/administrador/Productos.aspx"/>
                <%--<input type="button" value="GUARDAR2" onclick="$('#divProducto').validationEngine('validate')" class="btn btn-primary higher bold"/>--%>
            </div>
        </div>
        <%--<table>
            <tr>
                <td>
                    
                </td>
                <td width="200px"></td>
                <td>
                    <div class="control-group">
                        <label class="control-label" for="fuImagen1">Colores<span class="red-clr bold"> *</span></label>
                        <div class="controls">
                            <table>
                                <tr>
                                    <td rowspan="2">
                                        <asp:ListBox runat="server" ID="lbColorPartida"></asp:ListBox>
                                    </td>
                                    <td><input value=">" id="btnColorDerecha" type="button" class="right"/></td>
                                    <td rowspan="2">
                                        <asp:ListBox runat="server" ID="lbColorDestino" CssClass="validate[required]" ClientIDMode="Static"></asp:ListBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td><input value="<" id="btnColorIzquierda" type="button" class="left"/></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    
                </td>
            </tr>
        </table>--%>
        <br /><br /><br /><br />
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
    <script type="text/javascript" src="/js/ckeditor/ckeditor.js"></script>
    <script type="text/javascript" src="/js/ckeditor/adapters/jquery.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#txtDetalle').ckeditor();
            $('#txtCaracteristicaTecnica').ckeditor();
            $("#divProducto").validationEngine({ scroll: false, autoHidePrompt: true });
            $("#tabInformacion").validationEngine({ scroll: false, autoHidePrompt: true });
            $("#tabMedia").validationEngine({ scroll: false, autoHidePrompt: true });
        });

        $(function () {
            //$(".left").bind("click", function () {
            //    var options = $("[id*=lbColorDestino] option:selected");
            //    for (var i = 0; i < options.length; i++) {
            //        var opt = $(options[i]).clone();
            //        $(options[i]).remove();
            //        $("[id*=lbColorPartida]").append(opt);
            //    }
            //    //$("#lbColorDestino option:first").attr("selected", "selected");
            //});
            //$(".right").bind("click", function () {
            //    var options = $("[id*=lbColorPartida] option:selected");
            //    for (var i = 0; i < options.length; i++) {
            //        var opt = $(options[i]).clone();
            //        $(options[i]).remove();
            //        $("[id*=lbColorDestino]").append(opt);
            //    }
            //    //$("#lbColorDestino option:first").attr("selected", "selected");
            //});

            $(".left-categoria").bind("click", function () {
                var options = $("[id*=lbCategoriaDestino] option:selected");
                for (var i = 0; i < options.length; i++) {
                    var opt = $(options[i]).clone();
                    $(options[i]).remove();
                    $("[id*=lbCategoriaPartida]").append(opt);
                }
                //$("#lbCategoriaDestino option:first").attr("selected", "selected");
            });
            $(".right-categoria").bind("click", function () {
                var options = $("[id*=lbCategoriaPartida] option:selected");
                for (var i = 0; i < options.length; i++) {
                    var opt = $(options[i]).clone();
                    $(options[i]).remove();
                    $("[id*=lbCategoriaDestino]").append(opt);
                }
                //$("#lbCategoriaDestino option:first").attr("selected", "selected");
            });
        });

        $(function () {
            $("[id*=btnGuardar]").bind("click", function () {
                //$("[id*=lbColorDestino] option").attr("selected", "selected");
                //$("[id*=lbColorPartida] option").attr("selected", "selected");
                $("[id*=lbCategoriaPartida] option").attr("selected", "selected");
                $("[id*=lbCategoriaDestino] option").attr("selected", "selected");
            });
        });

        function AbrirModalImagen(codigo)
        {
            $('#hdImagenCodigo').val(codigo);
            $('#hdRutaImagen').val($("#pnlImagen" + codigo).css("background-image"));
            $('#imagenModal').modal('show');
        }

        //function AgregarCategoria()
        //{
        //    CKEDITOR.instances.txtDetalle.updateElement();
        //    CKEDITOR.instances.txtCaracteristicaTecnica.updateElement();
        //}

        function Guardar()
        {
            $("#lbCategoriaDestino option:first").attr("selected", "selected");
            $("#lbColorDestino option:first").attr("selected", "selected");
            CKEDITOR.instances.txtDetalle.updateElement();
            CKEDITOR.instances.txtCaracteristicaTecnica.updateElement();
            $('#txtDetalle').toggle();
            $('#txtCaracteristicaTecnica').toggle();
            
            var validado1 = false;
            var validado2 = false;

            MostrarTab(1)
            validado1 = $('#tabInformacion').validationEngine('validate');
            if (validado1)
            {
                MostrarTab(2);
                validado2 = $('#tabMedia').validationEngine('validate');
            }
            
            $('#txtDetalle').toggle();
            $('#txtCaracteristicaTecnica').toggle();

            var validado = $('#divProducto').validationEngine('validate');

            if (validado)
                return true;
            else
                return false;
        }

        function MostrarTab(tab)
        {
            $("#tabInformacion").removeClass('active');
            $("#tabInformacion").removeClass('in');
            $("#tabMedia").removeClass('active');
            $("#tabMedia").removeClass('in');
            $("#tabAtributos").removeClass('active');
            $("#tabAtributos").removeClass('in');
            $("#liInformacion").removeClass('active');
            $("#liMedia").removeClass('active');
            $("#liAtributos").removeClass('active');

            switch (tab)
            {
                case 1: $("#tabInformacion").addClass('active in'); $("#liInformacion").addClass('active'); break;
                case 2: $("#tabMedia").addClass('active in'); $("#liMedia").addClass('active'); break;
                case 3: $("#tabAtributos").addClass('active in'); $("#liAtributos").addClass('active'); break;
            }
        }
    </script>
</asp:Content>
